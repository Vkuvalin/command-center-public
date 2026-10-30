[CmdletBinding()]
param(
    [switch] $Guard,
    [ValidateSet('VerifySource', 'Create', 'Initialize', 'UpdateAll', 'ListRoots', 'AddRoot', 'RemoveRoot', 'GuardInstall', 'GuardStatus', 'GuardRemove', 'Help')]
    [string] $Action,
    [string] $Root,
    [string] $ProjectPath,
    [string] $Name,
    [switch] $SkipGitHubPublication
)

$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false
try { [Console]::OutputEncoding = New-Object System.Text.UTF8Encoding($false) } catch { }

$script:Source = [IO.Path]::GetFullPath((Join-Path (Split-Path -Parent $PSCommandPath) '..'))
$script:RegistryPath = Join-Path $script:Source 'config/distribution.local.json'
$script:GuardLogPath = Join-Path $script:Source 'config/guard.local.log'
$script:ArtifactNames = @('tasks', 'stage_briefs', 'reports', 'plans', 'diff')
$script:AgentsBegin = '<!-- BEGIN MANAGED REPO WORKFLOW CORE -->'
$script:AgentsEnd = '<!-- END MANAGED REPO WORKFLOW CORE -->'
$script:AgentsIntro = '<!-- Shared repo-local bootstrap/routing contract. Centrally synchronized; project-specific rules belong outside this block. -->'
$script:TemplateBegin = '# BEGIN PROJECT GITIGNORE TEMPLATE'
$script:TemplateEnd = '# END PROJECT GITIGNORE TEMPLATE'
$script:IgnoreBegin = '# BEGIN MANAGED UNIVERSAL IGNORE RULES'
$script:IgnoreEnd = '# END MANAGED UNIVERSAL IGNORE RULES'

if (-not ('CommandCenterWin32Paths' -as [type])) {
    Add-Type -TypeDefinition @'
using System;
using System.Text;
using System.ComponentModel;
using System.Runtime.InteropServices;
using Microsoft.Win32.SafeHandles;
public static class CommandCenterWin32Paths {
    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern SafeFileHandle CreateFile(string path, uint access, uint share,
        IntPtr security, uint disposition, uint flags, IntPtr templateFile);
    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    private static extern uint GetFinalPathNameByHandle(SafeFileHandle handle, StringBuilder path,
        uint length, uint flags);
    [DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true, EntryPoint = "CreateDirectoryW")]
    private static extern bool CreateDirectoryNative(string path, IntPtr security);
    public static string ResolveDirectory(string path) {
        using (var handle = CreateFile(path, 0, 7, IntPtr.Zero, 3, 0x02000000, IntPtr.Zero)) {
            if (handle.IsInvalid) throw new Win32Exception(Marshal.GetLastWin32Error());
            var buffer = new StringBuilder(32768);
            uint length = GetFinalPathNameByHandle(handle, buffer, (uint)buffer.Capacity, 0);
            if (length == 0 || length >= buffer.Capacity) throw new Win32Exception(Marshal.GetLastWin32Error());
            string result = buffer.ToString();
            if (result.StartsWith(@"\\?\UNC\", StringComparison.OrdinalIgnoreCase)) return @"\\" + result.Substring(8);
            if (result.StartsWith(@"\\?\", StringComparison.OrdinalIgnoreCase)) return result.Substring(4);
            return result;
        }
    }
    public static void CreateNewDirectory(string path) {
        if (!CreateDirectoryNative(path, IntPtr.Zero)) throw new Win32Exception(Marshal.GetLastWin32Error());
    }
}
'@
}

function Invoke-Tool {
    param([string] $Executable, [string[]] $Arguments)
    $priorErrorPreference = $ErrorActionPreference
    try {
        # Windows PowerShell 5.1 wraps native stderr as ErrorRecord. A harmless Git
        # warning must not throw before the native exit code can be inspected.
        $ErrorActionPreference = 'Continue'
        $output = & $Executable @Arguments 2>&1
        $code = $LASTEXITCODE
    } finally { $ErrorActionPreference = $priorErrorPreference }
    return [pscustomobject]@{ Code = $code; Text = (@($output) | ForEach-Object { [string] $_ }) -join "`n" }
}

function Invoke-Git {
    param([string] $Repository, [string[]] $Arguments)
    return Invoke-Tool 'git' (@('-C', $Repository) + $Arguments)
}

function Require-Git {
    param([string] $Repository, [string[]] $Arguments, [string] $Purpose)
    $result = Invoke-Git $Repository $Arguments
    if ($result.Code -ne 0) { throw "$Purpose`: $($result.Text.Trim())" }
    return $result.Text
}

function Normalize-ExistingDirectory {
    param([string] $Path)
    if ([string]::IsNullOrWhiteSpace($Path) -or -not [IO.Path]::IsPathRooted($Path)) {
        throw "Ожидается абсолютный путь к каталогу: $Path"
    }
    if (-not (Test-Path -LiteralPath $Path -PathType Container)) { throw "Каталог не существует: $Path" }
    $full = [IO.Path]::GetFullPath([CommandCenterWin32Paths]::ResolveDirectory($Path))
    $root = [IO.Path]::GetPathRoot($full)
    if (-not [string]::Equals($full, $root, [StringComparison]::OrdinalIgnoreCase)) {
        $full = $full.TrimEnd([char]'\', [char]'/')
    }
    return $full
}

function Normalize-StoredPath {
    param([string] $Path)
    if (-not [IO.Path]::IsPathRooted($Path)) { throw "Ожидается абсолютный путь: $Path" }
    $full = if ([IO.Directory]::Exists($Path)) {
        [IO.Path]::GetFullPath([CommandCenterWin32Paths]::ResolveDirectory($Path))
    } else { [IO.Path]::GetFullPath($Path) }
    if (Same-Path $full ([IO.Path]::GetPathRoot($full))) { return $full }
    return $full.TrimEnd([char]'\', [char]'/')
}

function Same-Path {
    param([string] $Left, [string] $Right)
    return [string]::Equals($Left, $Right, [StringComparison]::OrdinalIgnoreCase)
}

function Is-ImmediateChild {
    param([string] $Child, [string] $Parent)
    return Same-Path ([IO.Path]::GetDirectoryName($Child)) $Parent
}

function Assert-ProjectRootContainer {
    param([string] $Path)
    $sourcePrefix = $script:Source.TrimEnd([char]'\', [char]'/') + [IO.Path]::DirectorySeparatorChar
    if ((Same-Path $Path $script:Source) -or
        $Path.StartsWith($sourcePrefix, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Папка проектов не может быть источником Command Center или его потомком: $Path"
    }
    if (-not [IO.Directory]::Exists($Path)) { return } # Stale roots remain reportable.
    $probeEnvironment = @('LC_ALL', 'GIT_CEILING_DIRECTORIES', 'GIT_DISCOVERY_ACROSS_FILESYSTEM',
        'GIT_DIR', 'GIT_WORK_TREE', 'GIT_COMMON_DIR')
    $priorEnvironment = @{}
    foreach ($name in $probeEnvironment) {
        $priorEnvironment[$name] = [Environment]::GetEnvironmentVariable($name, 'Process')
    }
    try {
        foreach ($name in @('GIT_CEILING_DIRECTORIES', 'GIT_DIR', 'GIT_WORK_TREE', 'GIT_COMMON_DIR')) {
            Remove-Item -Path ("Env:" + $name) -ErrorAction SilentlyContinue
        }
        [Environment]::SetEnvironmentVariable('GIT_DISCOVERY_ACROSS_FILESYSTEM', '1', 'Process')
        [Environment]::SetEnvironmentVariable('LC_ALL', 'C', 'Process')
        $probe = Invoke-Git $Path @('rev-parse', '--is-inside-work-tree', '--is-bare-repository', '--is-inside-git-dir')
    } finally {
        foreach ($name in $probeEnvironment) {
            if ($null -eq $priorEnvironment[$name]) {
                Remove-Item -Path ("Env:" + $name) -ErrorAction SilentlyContinue
            } else {
                [Environment]::SetEnvironmentVariable($name, $priorEnvironment[$name], 'Process')
            }
        }
    }
    if ($probe.Code -ne 0) {
        if ($probe.Text -match '(?i)not a git repository') { return }
        throw "Не удалось доказать, что папка проектов находится вне рабочего дерева Git: ${Path}: $($probe.Text.Trim())"
    }
    $flags = @($probe.Text.Trim() -split '\r?\n' | Where-Object { $_ -ne '' })
    if ($flags.Count -ne 3 -or @($flags | Where-Object { $_ -notin @('true', 'false') }).Count -gt 0) {
        throw "Не удалось интерпретировать проверку рабочего дерева Git для папки проектов: $Path"
    }
    if (@($flags | Where-Object { $_ -eq 'true' }).Count -gt 0) {
        throw "Папка проектов является репозиторием Git или находится внутри него: $Path"
    }
    throw "Не удалось доказать, что папка проектов находится вне рабочего дерева Git: $Path"
}

function Assert-SafeTargetPath {
    param([string] $Project, [string] $Relative)
    $parts = $Relative.Replace('\', '/').Split('/')
    if ([IO.Path]::IsPathRooted($Relative) -or $parts.Count -eq 0 -or
        @($parts | Where-Object { $_ -eq '' -or $_ -eq '.' -or $_ -eq '..' }).Count -ne 0) {
        throw "Небезопасный канонический относительный путь: $Relative"
    }
    $full = [IO.Path]::GetFullPath((Join-Path $Project ($parts -join [IO.Path]::DirectorySeparatorChar)))
    $prefix = $Project.TrimEnd([char]'\', [char]'/') + [IO.Path]::DirectorySeparatorChar
    if (-not $full.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) { throw "Путь выходит за границы проекта: $Relative" }
    $cursor = $full
    while ($cursor.Length -ge $Project.Length) {
        if (Test-Path -LiteralPath $cursor) {
            $item = Get-Item -LiteralPath $cursor -Force
            if (($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) {
                throw "Точка повторной обработки в управляемом пути запрещена: $cursor"
            }
        }
        if (Same-Path $cursor $Project) { break }
        $cursor = [IO.Path]::GetDirectoryName($cursor)
    }
    return $full
}

function Read-Utf8 {
    param([string] $Path)
    return [IO.File]::ReadAllText($Path, [Text.Encoding]::UTF8)
}

function Write-BytesAtomic {
    param([string] $Path, [byte[]] $Bytes)
    $parent = [IO.Path]::GetDirectoryName($Path)
    if (-not [IO.Directory]::Exists($parent)) { [void] [IO.Directory]::CreateDirectory($parent) }
    $temporary = Join-Path $parent ('.command-center-' + [guid]::NewGuid().ToString('N') + '.tmp')
    $backup = Join-Path $parent ('.command-center-' + [guid]::NewGuid().ToString('N') + '.bak')
    try {
        [IO.File]::WriteAllBytes($temporary, $Bytes)
        if ([IO.File]::Exists($Path)) { [IO.File]::Replace($temporary, $Path, $backup) }
        else { [IO.File]::Move($temporary, $Path) }
    } finally {
        if ([IO.File]::Exists($temporary)) { [IO.File]::Delete($temporary) }
        if ([IO.File]::Exists($backup)) { [IO.File]::Delete($backup) }
    }
}

function Write-Utf8Atomic {
    param([string] $Path, [string] $Content)
    Write-BytesAtomic $Path ([Text.UTF8Encoding]::new($false).GetBytes($Content))
}

function Get-Sha256 {
    param([string] $Path)
    $stream = [IO.File]::OpenRead($Path)
    $sha = [Security.Cryptography.SHA256]::Create()
    try { return [BitConverter]::ToString($sha.ComputeHash($stream)).Replace('-', '') }
    finally { $sha.Dispose(); $stream.Dispose() }
}

function Split-GitNull {
    param([string] $Text)
    if ([string]::IsNullOrEmpty($Text)) { return @() }
    return @($Text.Split([char]0, [StringSplitOptions]::RemoveEmptyEntries) |
        Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
}

function Get-ExactLineMatches {
    param([string] $Content, [string] $Line)
    $pattern = '(?m)^' + [regex]::Escape($Line) + '\r?(?:\n|$)'
    return @([regex]::Matches($Content, $pattern))
}

function Get-ManagedAgentsBlock {
    param([string] $Content)
    $begins = @(Get-ExactLineMatches $Content $script:AgentsBegin)
    $ends = @(Get-ExactLineMatches $Content $script:AgentsEnd)
    if ($begins.Count -ne 1 -or $ends.Count -ne 1 -or $begins[0].Index -ge $ends[0].Index) {
        throw 'Управляемые маркеры AGENTS должны встречаться ровно один раз в правильном порядке.'
    }
    return [pscustomobject]@{
        Start = $begins[0].Index
        End = $ends[0].Index + $ends[0].Length
        Text = $Content.Substring($begins[0].Index, $ends[0].Index + $ends[0].Length - $begins[0].Index)
    }
}

function Get-ProjectGitignoreTemplate {
    param([string] $Content)
    $lines = @($Content -split "`n" | ForEach-Object { $_.TrimEnd([char]13) })
    $beginIndexes = @(); $endIndexes = @()
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -eq $script:TemplateBegin) { $beginIndexes += $i }
        if ($lines[$i] -eq $script:TemplateEnd) { $endIndexes += $i }
    }
    if ($beginIndexes.Count -ne 1 -or $endIndexes.Count -ne 1 -or $beginIndexes[0] -ge $endIndexes[0]) {
        throw 'Маркеры шаблона .gitignore должны встречаться ровно один раз в правильном порядке.'
    }
    $payload = New-Object 'System.Collections.Generic.List[string]'
    for ($i = $beginIndexes[0] + 1; $i -lt $endIndexes[0]; $i++) {
        if ($lines[$i] -eq '#') { $payload.Add('') }
        elseif ($lines[$i].StartsWith('# ')) { $payload.Add($lines[$i].Substring(2)) }
        else { throw "В шаблоне .gitignore незакомментированная или некорректная строка $($i + 1)." }
    }
    $required = @('.env', '.env.*', '!.env.example', '.idea/', 'docs/codex/', '.agents/', '.codex/', 'AGENTS.md')
    foreach ($rule in $required) {
        if (@($payload | Where-Object { $_ -ceq $rule }).Count -ne 1) {
            throw "Шаблон .gitignore должен содержать ровно одно '$rule' правило."
        }
    }
    return @($payload.ToArray())
}

function New-EmptyRegistry {
    return [pscustomobject]@{
        schema_version = 1; project_roots = @(); managed_projects = @()
        guard_task_id = ''; guard_task_source = ''
    }
}

function Read-Registry {
    if (-not [IO.File]::Exists($script:RegistryPath)) { return New-EmptyRegistry }
    try { $data = Read-Utf8 $script:RegistryPath | ConvertFrom-Json }
    catch { throw "В реестре некорректный JSON: $($_.Exception.Message)" }
    if ($null -eq $data -or $data.schema_version -ne 1 -or
        $null -eq $data.project_roots -or $null -eq $data.managed_projects) {
        throw 'Схема реестра должна содержать schema_version 1, project_roots и managed_projects.'
    }
    if ($data.project_roots -isnot [array] -or $data.managed_projects -isnot [array]) {
        throw 'Поля реестра project_roots и managed_projects должны быть массивами JSON.'
    }
    $guardId = ''; $guardSource = ''
    if ($null -ne $data.PSObject.Properties['guard_task_id']) {
        if ($data.guard_task_id -isnot [string] -or
            ($data.guard_task_id -ne '' -and $data.guard_task_id -notmatch '^[0-9a-fA-F]{32}$')) {
            throw 'Некорректный guard_task_id в реестре.'
        }
        $guardId = $data.guard_task_id
    }
    if ($null -ne $data.PSObject.Properties['guard_task_source']) {
        if ($data.guard_task_source -isnot [string] -or
            ($data.guard_task_source -ne '' -and -not [IO.Path]::IsPathRooted($data.guard_task_source))) {
            throw 'Некорректный guard_task_source в реестре.'
        }
        $guardSource = $data.guard_task_source
    }
    if (($guardId -eq '') -ne ($guardSource -eq '')) { throw 'В реестре не полностью задан владелец задания автозащиты.' }
    $roots = New-Object 'System.Collections.Generic.List[string]'
    $projects = New-Object 'System.Collections.Generic.List[string]'
    foreach ($value in @($data.project_roots)) {
        if ($value -isnot [string] -or -not [IO.Path]::IsPathRooted($value)) { throw 'В реестре некорректная папка проектов.' }
        $path = Normalize-StoredPath $value
        Assert-ProjectRootContainer $path
        if (-not @($roots | Where-Object { Same-Path $_ $path }).Count) { $roots.Add($path) }
    }
    foreach ($value in @($data.managed_projects)) {
        if ($value -isnot [string] -or -not [IO.Path]::IsPathRooted($value)) { throw 'В реестре некорректный управляемый проект.' }
        $path = Normalize-StoredPath $value
        if (Same-Path $path $script:Source) { throw 'Репозиторий источника нельзя зарегистрировать как управляемый проект.' }
        if (-not @($projects | Where-Object { Same-Path $_ $path }).Count) { $projects.Add($path) }
    }
    return [pscustomobject]@{
        schema_version = 1; project_roots = @($roots.ToArray()); managed_projects = @($projects.ToArray())
        guard_task_id = $guardId; guard_task_source = $guardSource
    }
}

function Save-Registry {
    param($Registry)
    $json = $Registry | ConvertTo-Json -Depth 5
    Write-Utf8Atomic $script:RegistryPath ($json + "`n")
}

function Get-CanonicalPaths {
    $result = Invoke-Git $script:Source @('ls-files', '-z', '--', '.agents/', '.codex/', 'docs/codex/reasoning/')
    if ($result.Code -ne 0) { throw "Не удалось перечислить канонические файлы источника, учитываемые в Git: $($result.Text.Trim())" }
    return @(Split-GitNull $result.Text)
}

function Check-SourceIgnoreProbe {
    param([string] $Relative, [bool] $MustBeIgnored, $Errors)
    $result = Invoke-Git $script:Source @('check-ignore', '-q', '--no-index', '--', $Relative)
    $expected = if ($MustBeIgnored) { 0 } else { 1 }
    if ($result.Code -eq $expected) {
        if ($MustBeIgnored) {
            $detail = Invoke-Git $script:Source @('check-ignore', '-v', '--no-index', '--', $Relative)
            if ($detail.Code -ne 0 -or $detail.Text -notmatch '^\.gitignore:[0-9]+:[^\t\r\n]*\t') {
                $Errors.Add("Нарушены правила игнорирования источника: $Relative должен игнорироваться через .gitignore источника; " +
                    "совпавшее правило: $($detail.Text.Trim()).")
            }
        }
        return
    }
    if ($result.Code -in @(0, 1)) {
        $requirement = if ($MustBeIgnored) { 'должен игнорироваться' } else { 'должен оставаться доступным для учёта в Git' }
        $Errors.Add("Нарушены правила игнорирования источника: $Relative $requirement.")
    } else {
        $Errors.Add("Не удалось проверить правила игнорирования источника для ${Relative}: код $($result.Code); $($result.Text.Trim())")
    }
}

function Get-SourceAssessment {
    $errors = New-Object 'System.Collections.Generic.List[string]'
    $warnings = New-Object 'System.Collections.Generic.List[string]'
    $canonical = @(); $agentsText = ''; $agentsBlock = $null; $template = @()
    $gitRoot = Invoke-Git $script:Source @('rev-parse', '--show-toplevel')
    if ($gitRoot.Code -ne 0) { $errors.Add("Некорректный Git источника: $($gitRoot.Text.Trim())") }
    elseif (-not (Same-Path (Normalize-ExistingDirectory $gitRoot.Text.Trim()) $script:Source)) {
        $errors.Add('Запущенный скрипт находится вне корня репозитория источника.')
    }
    $head = Invoke-Git $script:Source @('rev-parse', 'HEAD')
    if ($head.Code -ne 0) { $errors.Add('У источника нет корректного коммита HEAD.') }
    $branch = Invoke-Git $script:Source @('branch', '--show-current')
    if ($branch.Code -ne 0) { $errors.Add('Не удалось прочитать ветку источника.') }
    foreach ($relative in @('AGENTS.md', '.gitignore', 'Command-Center.bat', 'scripts/command-center.ps1')) {
        $path = Join-Path $script:Source $relative
        if (-not [IO.File]::Exists($path)) { $errors.Add("Обязательный файл источника отсутствует: $relative"); continue }
        $tracked = Invoke-Git $script:Source @('ls-files', '-z', '--', $relative)
        if ($tracked.Code -ne 0 -or -not @((Split-GitNull $tracked.Text) | Where-Object { $_ -ceq $relative }).Count) {
            $errors.Add("Обязательный файл источника не учитывается в Git: $relative")
        }
    }
    foreach ($relative in @('.agents', '.codex', 'docs/codex/reasoning')) {
        if (-not [IO.Directory]::Exists((Join-Path $script:Source $relative))) { $errors.Add("Обязательный каталог источника отсутствует: $relative") }
    }
    try {
        $canonical = @(Get-CanonicalPaths)
        foreach ($prefix in @('.agents/', '.codex/', 'docs/codex/reasoning/')) {
            if (-not @($canonical | Where-Object { $_.StartsWith($prefix, [StringComparison]::Ordinal) }).Count) {
                $errors.Add("Нет канонических файлов, учитываемых в Git, в $prefix")
            }
        }
        foreach ($relative in $canonical) {
            $path = Join-Path $script:Source $relative
            if (-not [IO.File]::Exists($path)) { $errors.Add("Канонический файл, учитываемый в Git, отсутствует: $relative") }
            elseif (((Get-Item -LiteralPath $path -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) {
                $errors.Add("Канонический путь источника является точкой повторной обработки: $relative")
            }
        }
    } catch { $errors.Add($_.Exception.Message) }
    try {
        $agentsText = Read-Utf8 (Join-Path $script:Source 'AGENTS.md')
        $agentsBlock = Get-ManagedAgentsBlock $agentsText
    } catch { $errors.Add("Некорректный AGENTS источника: $($_.Exception.Message)") }
    try { $template = @(Get-ProjectGitignoreTemplate (Read-Utf8 (Join-Path $script:Source '.gitignore'))) }
    catch { $errors.Add("Некорректный шаблон .gitignore источника: $($_.Exception.Message)") }
    foreach ($relative in @('config/distribution.local.json', 'config/guard.local.log')) {
        Check-SourceIgnoreProbe $relative $true $errors
    }
    foreach ($name in $script:ArtifactNames) {
        Check-SourceIgnoreProbe "docs/codex/$name/__command_center_ignore_probe__.md" $true $errors
        Check-SourceIgnoreProbe "docs/codex/$name/__command_center_ignore_probe__.txt" $true $errors
        Check-SourceIgnoreProbe "docs/codex/$name/__command_center_ignore_probe__/nested.bin" $true $errors
        Check-SourceIgnoreProbe "docs/codex/$name/.gitkeep" $false $errors
    }
    Check-SourceIgnoreProbe 'docs/codex/reasoning/__command_center_ignore_probe__.md' $false $errors
    Check-SourceIgnoreProbe 'docs/codex/reasoning/__command_center_ignore_probe__.txt' $false $errors
    Check-SourceIgnoreProbe 'docs/codex/reasoning/__command_center_ignore_probe__/nested.bin' $false $errors
    foreach ($relative in @($canonical | Where-Object { $_.StartsWith('docs/codex/reasoning/', [StringComparison]::Ordinal) })) {
        Check-SourceIgnoreProbe $relative $false $errors
    }
    foreach ($name in $script:ArtifactNames) {
        $dir = Join-Path $script:Source ("docs/codex/$name")
        if (-not [IO.Directory]::Exists($dir) -or -not [IO.File]::Exists((Join-Path $dir '.gitkeep'))) {
            $errors.Add("Отсутствует каталог артефактов источника или .gitkeep: docs/codex/$name")
            continue
        }
        foreach ($file in @(Get-ChildItem -LiteralPath $dir -File -Recurse -Force)) {
            if ($file.Name -ne '.gitkeep') { $warnings.Add("Временный артефакт источника: $($file.FullName)") }
        }
    }
    Check-SourceIgnoreProbe '.idea/__command_center_ignore_probe__.xml' $true $errors
    $trackedIdea = Invoke-Git $script:Source @('ls-files', '-z', '--', '.idea/')
    if ($trackedIdea.Code -ne 0) { $errors.Add("Не удалось проверить учёт .idea в Git: $($trackedIdea.Text.Trim())") }
    elseif ($trackedIdea.Text.Length -gt 0) { $errors.Add('Нарушение приватности источника: файлы .idea учитываются в Git.') }
    $relevant = Invoke-Git $script:Source @('status', '--porcelain=v1', '-z', '--untracked-files=all', '--', '.agents/', '.codex/', 'docs/codex/reasoning/', 'AGENTS.md', '.gitignore', 'scripts/command-center.ps1', 'Command-Center.bat')
    if ($relevant.Code -ne 0) { $errors.Add("Статус источника недоступен: $($relevant.Text.Trim())") }
    elseif ($relevant.Text.Length -gt 0) {
        $details = (Split-GitNull $relevant.Text) -join '; '
        $errors.Add("Файлы дистрибуции источника подготовлены к коммиту, изменены или не учитываются в Git: $details")
    }
    $allStatus = Invoke-Git $script:Source @('status', '--porcelain=v1', '-z', '--untracked-files=all')
    if ($allStatus.Code -eq 0 -and $allStatus.Text.Length -gt 0) {
        $warnings.Add("В источнике есть изменения или файлы, не учитываемые в Git: $((Split-GitNull $allStatus.Text) -join '; ')")
    }
    try { [void] (Read-Registry) } catch { $errors.Add($_.Exception.Message) }
    return [pscustomobject]@{
        Ready = ($errors.Count -eq 0); Errors = @($errors.ToArray()); Warnings = @($warnings.ToArray())
        Canonical = @($canonical); AgentsText = $agentsText; AgentsBlock = $agentsBlock; Template = @($template)
        Branch = $branch.Text.Trim(); Head = $head.Text.Trim()
    }
}

function Show-SourceAssessment {
    param($Assessment)
    Write-Output "ИСТОЧНИК: $script:Source"
    Write-Output "HEAD: $($Assessment.Head)  ВЕТКА: $($Assessment.Branch)"
    Write-Output "ГОТОВНОСТЬ: $(if ($Assessment.Ready) { 'ГОТОВ' } else { 'ЗАБЛОКИРОВАН' })"
    foreach ($issue in $Assessment.Errors) { Write-Output "ОШИБКА — $issue" }
    foreach ($issue in $Assessment.Warnings) { Write-Output "ПРИМЕЧАНИЕ — $issue" }
}

function Require-ReadySource {
    $assessment = Get-SourceAssessment
    if (-not $assessment.Ready) {
        Show-SourceAssessment $assessment | ForEach-Object { Write-Host $_ }
        throw 'Источник не готов к дистрибуции; запись в проекты не выполнялась.'
    }
    return $assessment
}

function Assert-GitProject {
    param([string] $Project)
    $root = Invoke-Git $Project @('rev-parse', '--show-toplevel')
    if ($root.Code -ne 0) { throw "Не является рабочим репозиторием Git: $Project" }
    if (-not (Same-Path (Normalize-ExistingDirectory $root.Text.Trim()) $Project)) {
        throw "Проект находится внутри другого репозитория Git, а не в его корне: $Project"
    }
    if (Same-Path $Project $script:Source) { throw 'Репозиторий источника нельзя использовать как целевой проект.' }
}

function Get-DiscoveredProjects {
    param($Registry)
    $found = New-Object 'System.Collections.Generic.List[string]'
    foreach ($root in @($Registry.project_roots)) {
        if (-not [IO.Directory]::Exists($root)) { Write-Host "НЕДОСТУПНАЯ ПАПКА — $root"; continue }
        foreach ($directory in @(Get-ChildItem -LiteralPath $root -Directory -Force)) {
            try {
                $path = Normalize-ExistingDirectory $directory.FullName
                if (Same-Path $path $script:Source) { Write-Host "ПРОПУЩЕНО — ИСТОЧНИК: $path"; continue }
                if (-not (Is-ImmediateChild $path $root)) {
                    Write-Host "ПРОПУЩЕНО — ПУТЬ ВНЕ ПАПКИ ПРОЕКТОВ: $($directory.FullName) -> $path"
                    continue
                }
                $gitRoot = Invoke-Git $path @('rev-parse', '--show-toplevel')
                if ($gitRoot.Code -eq 0 -and (Same-Path (Normalize-ExistingDirectory $gitRoot.Text.Trim()) $path)) {
                    if (-not @($found | Where-Object { Same-Path $_ $path }).Count) { $found.Add($path) }
                }
            } catch { Write-Host "ПРОПУЩЕНО — $($directory.FullName): $($_.Exception.Message)" }
        }
    }
    return @($found.ToArray())
}

function Assert-ConfiguredProject {
    param([string] $Project, $Registry)
    if (Same-Path $Project $script:Source) { throw 'Репозиторий источника нельзя зарегистрировать как целевой проект.' }
    if (-not @($Registry.project_roots | Where-Object { Is-ImmediateChild $Project $_ }).Count) {
        throw "Проект должен находиться непосредственно в настроенной папке проектов: $Project"
    }
    Assert-GitProject $Project
}

function Add-ManagedProject {
    param($Registry, [string] $Project)
    if (-not @($Registry.managed_projects | Where-Object { Same-Path $_ $Project }).Count) {
        $Registry.managed_projects = @($Registry.managed_projects) + @($Project)
        Save-Registry $Registry
    }
}

function Throw-AgentsOwnershipError {
    param([string] $Reason)
    $exception = New-Object System.InvalidOperationException $Reason
    $exception.Data['CommandCenter.AgentsOwnership'] = $true
    throw $exception
}

function Get-AgentsContentForProject {
    param([string] $Project, $SourceAssessment, [bool] $AllowMissingCore, [string] $CreationName)
    $target = Assert-SafeTargetPath $Project 'AGENTS.md'
    if (-not [IO.File]::Exists($target)) {
        $projectName = if ($CreationName -ne '') { $CreationName } else { [IO.Path]::GetFileName($Project) }
        return $SourceAssessment.AgentsText.Replace('`название проекта`', ('`' + $projectName + '`'))
    }
    $content = Read-Utf8 $target
    $begins = @(Get-ExactLineMatches $content $script:AgentsBegin)
    $ends = @(Get-ExactLineMatches $content $script:AgentsEnd)
    $rawBeginCount = [regex]::Matches($content, [regex]::Escape($script:AgentsBegin)).Count
    $rawEndCount = [regex]::Matches($content, [regex]::Escape($script:AgentsEnd)).Count
    if ($begins.Count -gt 1 -or $ends.Count -gt 1 -or
        $rawBeginCount -ne $begins.Count -or $rawEndCount -ne $ends.Count) {
        Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (некорректные управляемые маркеры).'
    }
    if ($begins.Count -eq 1 -and $ends.Count -eq 1) {
        try { $old = Get-ManagedAgentsBlock $content }
        catch { Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; порядок управляемых маркеров нарушен.' }
        return $content.Substring(0, $old.Start) + $SourceAssessment.AgentsBlock.Text + $content.Substring($old.End)
    }
    $orphanMarker = ($begins.Count + $ends.Count -eq 1)
    if (($orphanMarker -and -not $AllowMissingCore) -or
        ($rawBeginCount -eq 0 -and $content.Contains('BEGIN MANAGED REPO WORKFLOW CORE')) -or
        ($rawEndCount -eq 0 -and $content.Contains('END MANAGED REPO WORKFLOW CORE'))) {
        Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (некорректные управляемые маркеры).'
    }
    $section3 = @([regex]::Matches($content, '(?m)^## 3\. Context Loading Rules[ \t]*\r?$'))
    $section4 = @([regex]::Matches($content, '(?m)^## 4\. Agentic Workflow[ \t]*\r?$'))
    if ($orphanMarker) {
        $headers = @([regex]::Matches($content, '(?m)^## ([0-9]+)\.[^\r\n]*\r?$'))
        $number3 = @($headers | Where-Object { $_.Groups[1].Value -eq '3' })
        $number4 = @($headers | Where-Object { $_.Groups[1].Value -eq '4' })
        if ($section3.Count -ne 1 -or $section4.Count -ne 1 -or
            $number3.Count -ne 1 -or $number4.Count -ne 1 -or
            $section3[0].Index -ge $section4[0].Index) {
            Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (владелец одиночного маркера не доказан).'
        }
        $after3 = @($headers | Where-Object { $_.Index -gt $section3[0].Index } | Select-Object -First 1)
        $next = @($headers | Where-Object { $_.Index -gt $section4[0].Index } | Select-Object -First 1)
        if ($after3.Count -ne 1 -or $after3[0].Index -ne $section4[0].Index -or
            $next.Count -ne 1 -or [int] $next[0].Groups[1].Value -le 4) {
            Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (граница раздела с одиночным маркером не доказана).'
        }
        $intro = @(Get-ExactLineMatches $content $script:AgentsIntro)
        if ($intro.Count -ne 1 -or $intro[0].Index + $intro[0].Length -gt $section3[0].Index -or
            $content.Substring($intro[0].Index + $intro[0].Length,
                $section3[0].Index - $intro[0].Index - $intro[0].Length) -notmatch '^\s*$') {
            Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (управляемое введение не доказано).'
        }
        $coreEnd = if ($ends.Count -eq 1) { $ends[0].Index } else { $next[0].Index }
        if ($coreEnd -le $section4[0].Index) {
            Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (граница управляемого блока не доказана).'
        }
        $coreCandidate = $content.Substring($section3[0].Index, $coreEnd - $section3[0].Index)
        $signatures = @('Agentic Workflow Map', 'Sequential bootstrap flow:',
            '.agents/skills/reasoning-patterns/SKILL.md', 'docs/codex/tasks/')
        if (@($signatures | Where-Object { $coreCandidate.Contains($_) }).Count -lt 3 -or
            -not $coreCandidate.Contains('AGENTS.md')) {
            Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (сигнатура управляемого блока не доказана).'
        }
        $sourceBlock = $SourceAssessment.AgentsBlock.Text
        $sourceEnd = @(Get-ExactLineMatches $sourceBlock $script:AgentsEnd)[0]
        $sourceLines = @($sourceBlock.Substring(0, $sourceEnd.Index) -split '\r?\n' |
            Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
        $terminalLine = $sourceLines[$sourceLines.Count - 1]
        $sourceTerminal = @(Get-ExactLineMatches $sourceBlock $terminalLine |
            Where-Object { $_.Index -lt $sourceEnd.Index })
        $terminal = @(Get-ExactLineMatches $content $terminalLine |
            Where-Object { $_.Index -gt $section4[0].Index -and $_.Index -lt $next[0].Index })
        if ($sourceTerminal.Count -ne 1 -or $terminal.Count -ne 1) {
            Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (конечная граница не доказана).'
        }
        $sourceCoreGap = $sourceBlock.Substring($sourceTerminal[0].Index + $sourceTerminal[0].Length,
            $sourceEnd.Index - $sourceTerminal[0].Index - $sourceTerminal[0].Length)
        $targetNewline = if ($content.Contains("`r`n")) { "`r`n" } else { "`n" }
        $sourceCoreGap = $sourceCoreGap.Replace("`r`n", "`n").Replace("`n", $targetNewline)
        $terminalEnd = $terminal[0].Index + $terminal[0].Length
        if ($begins.Count -eq 1) {
            $beginEnd = $begins[0].Index + $begins[0].Length
            if ($beginEnd -gt $intro[0].Index -or
                $content.Substring($beginEnd, $intro[0].Index - $beginEnd) -notmatch '^\s*$') {
                Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (граница BEGIN не доказана).'
            }
            $gap = $content.Substring($terminalEnd, $next[0].Index - $terminalEnd)
            if (-not $gap.StartsWith($sourceCoreGap, [StringComparison]::Ordinal)) {
                Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (граница END не доказана).'
            }
            return $content.Substring(0, $begins[0].Index) + $SourceAssessment.AgentsBlock.Text +
                $content.Substring($terminalEnd + $sourceCoreGap.Length)
        }
        $endEnd = $ends[0].Index + $ends[0].Length
        if ($ends[0].Index -le $section4[0].Index -or $endEnd -gt $next[0].Index) {
            Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (маркер END расположен неверно).'
        }
        if ($ends[0].Index -lt $terminalEnd -or
            $content.Substring($terminalEnd, $ends[0].Index - $terminalEnd) -cne $sourceCoreGap) {
            Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (маркер END расположен неверно).'
        }
        return $content.Substring(0, $intro[0].Index) + $SourceAssessment.AgentsBlock.Text +
            $content.Substring($endEnd)
    }
    if ($section3.Count -eq 1 -and $section4.Count -eq 1 -and $section3[0].Index -lt $section4[0].Index) {
        $headers = @([regex]::Matches($content, '(?m)^## ([0-9]+)\.[^\r\n]*\r?$'))
        $number3 = @($headers | Where-Object { $_.Groups[1].Value -eq '3' })
        $number4 = @($headers | Where-Object { $_.Groups[1].Value -eq '4' })
        $after3 = @($headers | Where-Object { $_.Index -gt $section3[0].Index } | Select-Object -First 1)
        $next = @($headers | Where-Object { $_.Index -gt $section4[0].Index } | Select-Object -First 1)
        if ($next.Count -eq 1 -and [int] $next[0].Groups[1].Value -le 4) { $next = @() }
        $signatures = @('Agentic Workflow Map', 'Sequential bootstrap flow:',
            '.agents/skills/reasoning-patterns/SKILL.md', 'docs/codex/tasks/')
        $legacyCore = if ($next.Count -eq 1) {
            $content.Substring($section3[0].Index, $next[0].Index - $section3[0].Index)
        } else { '' }
        $signatureCount = @($signatures | Where-Object { $legacyCore.Contains($_) }).Count
        if ($number3.Count -eq 1 -and $number4.Count -eq 1 -and
            $after3.Count -eq 1 -and $after3[0].Index -eq $section4[0].Index -and
            $next.Count -eq 1 -and $signatureCount -ge 3 -and $legacyCore.Contains('AGENTS.md')) {
            $legacyStart = $section3[0].Index
            $intro = @(Get-ExactLineMatches $content $script:AgentsIntro)
            if ($intro.Count -gt 1) {
                Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (введение старого формата продублировано).'
            }
            if ($intro.Count -eq 1) {
                if ($intro[0].Index + $intro[0].Length -gt $legacyStart -or
                    $content.Substring($intro[0].Index + $intro[0].Length,
                        $legacyStart - $intro[0].Index - $intro[0].Length) -notmatch '^\s*$') {
                    Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (введение старого формата расположено неверно).'
                }
                $legacyStart = $intro[0].Index
            }
            $legacySuffixStart = $next[0].Index
            $sourceBlock = $SourceAssessment.AgentsBlock.Text
            $sourceEnd = @(Get-ExactLineMatches $sourceBlock $script:AgentsEnd)[0]
            $sourceLines = @($sourceBlock.Substring(0, $sourceEnd.Index) -split '\r?\n' |
                Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
            $terminalLine = $sourceLines[$sourceLines.Count - 1]
            $sourceTerminal = @(Get-ExactLineMatches $sourceBlock $terminalLine |
                Where-Object { $_.Index -lt $sourceEnd.Index })
            $targetTerminal = @(Get-ExactLineMatches $content $terminalLine |
                Where-Object { $_.Index -gt $section4[0].Index -and $_.Index -lt $next[0].Index })
            if ($sourceTerminal.Count -eq 1 -and $targetTerminal.Count -eq 1) {
                $sourceCoreGap = $sourceBlock.Substring($sourceTerminal[0].Index + $sourceTerminal[0].Length,
                    $sourceEnd.Index - $sourceTerminal[0].Index - $sourceTerminal[0].Length)
                $targetNewline = if ($content.Contains("`r`n")) { "`r`n" } else { "`n" }
                $sourceCoreGap = $sourceCoreGap.Replace("`r`n", "`n").Replace("`n", $targetNewline)
                $terminalEnd = $targetTerminal[0].Index + $targetTerminal[0].Length
                $gap = $content.Substring($terminalEnd, $next[0].Index - $terminalEnd)
                if (-not $gap.StartsWith($sourceCoreGap, [StringComparison]::Ordinal)) {
                    Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (legacy граница END не доказана).'
                }
                $legacySuffixStart = $terminalEnd + $sourceCoreGap.Length
            }
            return $content.Substring(0, $legacyStart) + $SourceAssessment.AgentsBlock.Text +
                $content.Substring($legacySuffixStart)
        }
        Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление (владелец старого формата не доказан).'
    }
    if ($AllowMissingCore -and $section3.Count -eq 0 -and $section4.Count -eq 0) {
        $section2 = @([regex]::Matches($content, '(?m)^## 2\. Current Project State[ \t]*\r?$'))
        $section5 = @([regex]::Matches($content, '(?m)^## 5\. Non-Negotiable Architecture Rules[ \t]*\r?$'))
        if ($section2.Count -eq 1 -and $section5.Count -eq 1 -and
            $section2[0].Index -lt $section5[0].Index -and
            $content.StartsWith('# AGENTS.md') -and $content.Contains('## 1. Purpose')) {
            $between = $content.Substring($section2[0].Index, $section5[0].Index - $section2[0].Index)
            if (@([regex]::Matches($between, '(?m)^## [0-9]+\.')).Count -eq 1) {
                return $content.Substring(0, $section5[0].Index) + $SourceAssessment.AgentsBlock.Text +
                    $content.Substring($section5[0].Index)
            }
        }
    }
    Throw-AgentsOwnershipError 'Структура AGENTS неоднозначна; требуется ручное исправление.'
}

function Get-TargetGitignoreContent {
    param([string] $Project, $Template)
    $path = Assert-SafeTargetPath $Project '.gitignore'
    $existing = if ([IO.File]::Exists($path)) { Read-Utf8 $path } else { '' }
    $newline = if ($existing.Contains("`r`n")) { "`r`n" } else { "`n" }
    $lines = @($existing -split '\r?\n')
    $beginIndexes = @(); $endIndexes = @()
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -eq $script:IgnoreBegin) { $beginIndexes += $i }
        if ($lines[$i] -eq $script:IgnoreEnd) { $endIndexes += $i }
    }
    if ($beginIndexes.Count -ne $endIndexes.Count -or $beginIndexes.Count -gt 1 -or
        ($beginIndexes.Count -eq 1 -and $beginIndexes[0] -ge $endIndexes[0]) -or
        ($beginIndexes.Count -eq 0 -and ($existing.Contains('BEGIN MANAGED UNIVERSAL IGNORE RULES') -or
            $existing.Contains('END MANAGED UNIVERSAL IGNORE RULES')))) {
        throw 'Маркеры управляемого блока .gitignore проекта неоднозначны; требуется ручное исправление.'
    }
    $canonicalRules = New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal)
    foreach ($line in @($Template)) {
        if ($line -ne '' -and -not $line.StartsWith('#')) { [void] $canonicalRules.Add($line.Trim()) }
    }
    $outside = New-Object 'System.Collections.Generic.List[string]'
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($beginIndexes.Count -eq 1 -and $i -ge $beginIndexes[0] -and $i -le $endIndexes[0]) { continue }
        if ($lines[$i] -ne '' -and -not $lines[$i].StartsWith('#') -and $canonicalRules.Contains($lines[$i].Trim())) { continue }
        $outside.Add($lines[$i])
    }
    while ($outside.Count -gt 0 -and $outside[$outside.Count - 1] -eq '') { $outside.RemoveAt($outside.Count - 1) }
    $block = @(
        $script:IgnoreBegin,
        '# Centrally synchronized universal privacy/safety rules.',
        '# Do not add stack-specific or project-specific patterns to this block.',
        ''
    ) + @($Template) + @('', $script:IgnoreEnd)
    if ($outside.Count -gt 0) { return (($outside.ToArray() + @('') + $block) -join $newline) + $newline }
    return ($block -join $newline) + $newline
}

function Ensure-ArtifactSentinels {
    param([string] $Project)
    $changed = New-Object 'System.Collections.Generic.List[string]'
    foreach ($name in $script:ArtifactNames) {
        $relative = "docs/codex/$name/.gitkeep"
        $path = Assert-SafeTargetPath $Project $relative
        if (-not [IO.File]::Exists($path)) {
            Write-BytesAtomic $path ([byte[]] @())
            $changed.Add($relative)
        }
    }
    return @($changed.ToArray())
}

function Sync-CanonicalFiles {
    param([string] $Project, $SourceAssessment)
    $changed = New-Object 'System.Collections.Generic.List[string]'
    foreach ($relative in @($SourceAssessment.Canonical)) {
        $sourcePath = Join-Path $script:Source $relative
        $targetPath = Assert-SafeTargetPath $Project $relative
        if (-not [IO.File]::Exists($targetPath) -or (Get-Sha256 $sourcePath) -ne (Get-Sha256 $targetPath)) {
            Write-BytesAtomic $targetPath ([IO.File]::ReadAllBytes($sourcePath))
            $changed.Add($relative)
        }
    }
    return @($changed.ToArray())
}

function Test-TargetPrivacy {
    param([string] $Project)
    foreach ($relative in @('.env', '.env.private', '.idea/workspace.xml',
        'docs/codex/reasoning/probe.md', '.agents/probe', '.codex/probe', 'AGENTS.md')) {
        $result = Invoke-Git $Project @('check-ignore', '-q', '--no-index', '--', $relative)
        if ($result.Code -ne 0) { throw "Правило приватности не действует для $relative в $Project" }
    }
    $example = Invoke-Git $Project @('check-ignore', '-q', '--no-index', '--', '.env.example')
    if ($example.Code -eq 0) { throw ".env.example должен оставаться доступным для учёта в Git: $Project" }
}

function Get-TrackedPrivacyPaths {
    param([string] $Project, $SourceAssessment)
    $result = Invoke-Git $Project @('ls-files', '-z', '--', 'AGENTS.md', '.agents/', '.codex/', 'docs/codex/')
    if ($result.Code -ne 0) { throw "Не удалось проверить приватные пути проекта, учитываемые в Git: $($result.Text.Trim())" }
    $known = New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::OrdinalIgnoreCase)
    [void] $known.Add('AGENTS.md')
    foreach ($relative in @($SourceAssessment.Canonical)) { [void] $known.Add($relative) }
    foreach ($name in $script:ArtifactNames) { [void] $known.Add("docs/codex/$name/.gitkeep") }
    $proven = New-Object 'System.Collections.Generic.List[string]'
    $unknown = New-Object 'System.Collections.Generic.List[string]'
    foreach ($relative in @(Split-GitNull $result.Text)) {
        if ($known.Contains($relative)) { $proven.Add($relative) }
        else { $unknown.Add($relative) }
    }
    return [pscustomobject]@{ Proven = @($proven.ToArray()); Unknown = @($unknown.ToArray()) }
}

function Untrack-ProvenPrivacyPaths {
    param([string] $Project, $SourceAssessment)
    $paths = Get-TrackedPrivacyPaths $Project $SourceAssessment
    $untracked = New-Object 'System.Collections.Generic.List[string]'
    $blocked = New-Object 'System.Collections.Generic.List[string]'
    foreach ($relative in @($paths.Proven)) {
        $staged = Invoke-Git $Project @('--literal-pathspecs', 'diff', '--cached', '--quiet', '--', $relative)
        if ($staged.Code -eq 1) { $blocked.Add($relative); continue }
        if ($staged.Code -ne 0) { throw "Не удалось проверить подготовленные к коммиту изменения для $relative`: $($staged.Text.Trim())" }
        [void] (Require-Git $Project @('--literal-pathspecs', 'rm', '--cached', '--', $relative) "Не удалось прекратить учёт в Git $relative")
        $untracked.Add($relative)
    }
    return [pscustomobject]@{
        Untracked = @($untracked.ToArray()); Blocked = @($blocked.ToArray()); Unknown = @($paths.Unknown)
        StillTracked = @()
    }
}

function Get-PushPreflight {
    param([string] $Project)
    $head = Invoke-Git $Project @('rev-parse', 'HEAD')
    if ($head.Code -ne 0) { return [pscustomobject]@{ Allowed = $false; Reason = 'Отсутствует исходный HEAD или отслеживаемая ветка.' } }
    $branch = Invoke-Git $Project @('branch', '--show-current')
    if ($branch.Code -ne 0 -or [string]::IsNullOrWhiteSpace($branch.Text)) {
        return [pscustomobject]@{ Allowed = $false; Reason = 'Ветка отсоединена или недоступна для чтения.' }
    }
    $branchName = $branch.Text.Trim()
    $remote = Invoke-Git $Project @('config', '--get', "branch.$branchName.remote")
    $merge = Invoke-Git $Project @('config', '--get', "branch.$branchName.merge")
    if ($remote.Code -ne 0 -or $merge.Code -ne 0 -or $remote.Text.Trim() -eq '.' -or
        [string]::IsNullOrWhiteSpace($remote.Text) -or [string]::IsNullOrWhiteSpace($merge.Text)) {
        return [pscustomobject]@{ Allowed = $false; Reason = 'Нет подходящего удалённого репозитория или отслеживаемой ветки.' }
    }
    $remoteName = $remote.Text.Trim(); $mergeRef = $merge.Text.Trim()
    if (-not $mergeRef.StartsWith('refs/heads/', [StringComparison]::Ordinal)) {
        return [pscustomobject]@{ Allowed = $false; Reason = 'Отслеживаемый путь не является веткой.' }
    }
    $oldPrompt = $env:GIT_TERMINAL_PROMPT; $oldGcm = $env:GCM_INTERACTIVE
    try {
        $env:GIT_TERMINAL_PROMPT = '0'; $env:GCM_INTERACTIVE = 'never'
        $remoteHead = Invoke-Git $Project @('ls-remote', '--exit-code', $remoteName, $mergeRef)
    } finally { $env:GIT_TERMINAL_PROMPT = $oldPrompt; $env:GCM_INTERACTIVE = $oldGcm }
    if ($remoteHead.Code -ne 0) {
        return [pscustomobject]@{ Allowed = $false; Reason = "Не удалось проверить удалённую ветку: $($remoteHead.Text.Trim())" }
    }
    $lines = @($remoteHead.Text.Trim() -split "`n" | Where-Object { $_ -ne '' })
    if ($lines.Count -ne 1) { return [pscustomobject]@{ Allowed = $false; Reason = 'Ответ удалённой ветки неоднозначен.' } }
    $fields = $lines[0] -split "`t"
    if ($fields.Count -ne 2 -or $fields[1] -cne $mergeRef -or $fields[0] -cne $head.Text.Trim()) {
        return [pscustomobject]@{ Allowed = $false; Reason = 'До обновления локальная и удалённая ветки различались.' }
    }
    return [pscustomobject]@{
        Allowed = $true; Reason = ''; Remote = $remoteName; MergeRef = $mergeRef; BeforeSha = $head.Text.Trim()
    }
}

function Assert-GitIdentity {
    param([string] $Project)
    [void] (Require-Git $Project @('var', 'GIT_AUTHOR_IDENT') 'Данные автора Git недоступны')
    [void] (Require-Git $Project @('var', 'GIT_COMMITTER_IDENT') 'Данные коммитера Git недоступны')
}

function Commit-UpdaterOwnedChanges {
    param([string] $Project, [string[]] $PrivatePaths)
    Assert-GitIdentity $Project
    $temporaryIndex = Join-Path ([IO.Path]::GetTempPath()) ('command-center-index-' + [guid]::NewGuid().ToString('N'))
    $previousIndex = $env:GIT_INDEX_FILE
    $committed = $false
    $sha = ''
    $finalizeErrors = New-Object 'System.Collections.Generic.List[string]'
    try {
        $env:GIT_INDEX_FILE = $temporaryIndex
        $head = Invoke-Git $Project @('rev-parse', 'HEAD')
        if ($head.Code -eq 0) { [void] (Require-Git $Project @('read-tree', 'HEAD') 'Не удалось подготовить изолированный индекс Git') }
        else { [void] (Require-Git $Project @('read-tree', '--empty') 'Не удалось подготовить пустой индекс Git') }
        [void] (Require-Git $Project @('--literal-pathspecs', 'add', '--', '.gitignore') 'Не удалось подготовить .gitignore к коммиту в изолированном индексе')
        foreach ($relative in $PrivatePaths) {
            [void] (Require-Git $Project @('--literal-pathspecs', 'rm', '--cached', '--', $relative) "Не удалось подготовить прекращение учёта приватного пути $relative")
        }
        $diff = Invoke-Git $Project @('diff', '--cached', '--name-status', '-z')
        if ($diff.Code -ne 0) { throw "Не удалось проверить изолированный индекс Git: $($diff.Text.Trim())" }
        $fields = @(Split-GitNull $diff.Text)
        $allowed = New-Object 'System.Collections.Generic.HashSet[string]' ([StringComparer]::Ordinal)
        [void] $allowed.Add('.gitignore')
        foreach ($relative in $PrivatePaths) { [void] $allowed.Add($relative) }
        if (($fields.Count % 2) -ne 0) { throw 'Некорректный diff изолированного индекса Git.' }
        for ($i = 0; $i -lt $fields.Count; $i += 2) {
            if (-not $allowed.Contains($fields[$i + 1]) -or
                ($fields[$i + 1] -eq '.gitignore' -and $fields[$i] -notin @('A', 'M')) -or
                ($fields[$i + 1] -ne '.gitignore' -and $fields[$i] -ne 'D')) {
                throw "В изолированном индексе Git есть изменение вне границ владения обновлением: $($fields[$i]) $($fields[$i + 1])"
            }
        }
        if ($fields.Count -gt 0) {
            $treeSha = (Require-Git $Project @('write-tree') 'Не удалось записать дерево Git с изменениями обновления').Trim()
            $commitArgs = @('commit-tree', $treeSha, '-m', 'chore: synchronize Command Center infrastructure')
            if ($head.Code -eq 0) { $commitArgs += @('-p', $head.Text.Trim()) }
            $sha = (Require-Git $Project $commitArgs 'Не удалось создать коммит с изменениями обновления').Trim()
            $expected = if ($head.Code -eq 0) { $head.Text.Trim() } else { '0000000000000000000000000000000000000000' }
            [void] (Require-Git $Project @('update-ref', 'HEAD', $sha, $expected) 'Не удалось переключить HEAD проекта на коммит обновления')
            $committed = $true
        }
    } finally {
        $env:GIT_INDEX_FILE = $previousIndex
        if ($committed) {
            $resetArgs = @('--literal-pathspecs', 'reset', '-q', '--', '.gitignore') + @($PrivatePaths)
            try { [void] (Require-Git $Project $resetArgs 'Не удалось согласовать записи обновления в исходном индексе Git') }
            catch { $finalizeErrors.Add($_.Exception.Message) }
        }
        foreach ($path in @($temporaryIndex, ($temporaryIndex + '.lock'))) {
            if ([IO.File]::Exists($path)) {
                try { [IO.File]::Delete($path) }
                catch { $finalizeErrors.Add("Не удалось удалить временный индекс ${path}: $($_.Exception.Message)") }
            }
        }
    }
    return [pscustomobject]@{ Sha = $sha; FinalizeError = ($finalizeErrors -join '; ') }
}

function Push-UpdaterCommit {
    param([string] $Project, $Preflight, [string] $CommitSha)
    if (-not $Preflight.Allowed) { return "ПРОПУЩЕНО — $($Preflight.Reason)" }
    $current = (Require-Git $Project @('rev-parse', 'HEAD') 'Не удалось проверить локальный HEAD перед отправкой').Trim()
    if ($current -cne $CommitSha) { return 'ПРОПУЩЕНО — локальный HEAD изменился после коммита обновления.' }
    $oldPrompt = $env:GIT_TERMINAL_PROMPT; $oldGcm = $env:GCM_INTERACTIVE
    try {
        $env:GIT_TERMINAL_PROMPT = '0'; $env:GCM_INTERACTIVE = 'never'
        $remoteBefore = Invoke-Git $Project @('ls-remote', '--exit-code', $Preflight.Remote, $Preflight.MergeRef)
        if ($remoteBefore.Code -ne 0) { return "ПРОПУЩЕНО — повторная проверка удалённой ветки не удалась: $($remoteBefore.Text.Trim())" }
        $fields = ($remoteBefore.Text.Trim() -split "`t")
        if ($fields.Count -ne 2 -or $fields[0] -cne $Preflight.BeforeSha -or $fields[1] -cne $Preflight.MergeRef) {
            return 'ПРОПУЩЕНО — удалённая ветка изменилась после предварительной проверки.'
        }
        $push = Invoke-Git $Project @('push', $Preflight.Remote, "HEAD:$($Preflight.MergeRef)")
        if ($push.Code -ne 0) { return "ОШИБКА — локальный коммит сохранён; отправка: $($push.Text.Trim())" }
        $remoteAfter = Invoke-Git $Project @('ls-remote', '--exit-code', $Preflight.Remote, $Preflight.MergeRef)
        if ($remoteAfter.Code -ne 0) { return 'НЕ ПОДТВЕРЖДЕНО — отправка успешна, но получить удалённый SHA не удалось.' }
        $afterFields = ($remoteAfter.Text.Trim() -split "`t")
        if ($afterFields.Count -ne 2 -or $afterFields[0] -cne $CommitSha) {
            return 'НЕ ПОДТВЕРЖДЕНО — удалённый SHA отличается от коммита обновления.'
        }
        return "УСПЕШНО — удалённый SHA $CommitSha"
    } finally { $env:GIT_TERMINAL_PROMPT = $oldPrompt; $env:GCM_INTERACTIVE = $oldGcm }
}

function Sync-Project {
    param([string] $Project, $SourceAssessment, [bool] $GuardMode, [bool] $CreateMode, [bool] $Registered, [string] $CreationName,
        [bool] $ReplaceAgents = $false)
    Assert-GitProject $Project
    # Compute ownership-sensitive results before the first target write.
    if ($ReplaceAgents -and ($GuardMode -or $CreateMode)) { throw 'Замена AGENTS недоступна в этом режиме.' }
    $agentsContent = if ($ReplaceAgents) {
        $SourceAssessment.AgentsText.Replace('`название проекта`', ('`' + [IO.Path]::GetFileName($Project) + '`'))
    } else { Get-AgentsContentForProject $Project $SourceAssessment $Registered $CreationName }
    $ignoreContent = Get-TargetGitignoreContent $Project $SourceAssessment.Template
    foreach ($relative in @($SourceAssessment.Canonical) + @('AGENTS.md', '.gitignore')) {
        [void] (Assert-SafeTargetPath $Project $relative)
    }
    $ignorePath = Assert-SafeTargetPath $Project '.gitignore'
    $agentsPath = Assert-SafeTargetPath $Project 'AGENTS.md'
    $ignoreWasDirty = (Invoke-Git $Project @('status', '--porcelain=v1', '-z', '--untracked-files=all', '--', '.gitignore')).Text.Length -gt 0
    $pushPreflight = if (-not $GuardMode -and -not $CreateMode -and -not $ignoreWasDirty) {
        Get-PushPreflight $Project
    } else { [pscustomobject]@{ Allowed = $false; Reason = 'Автокоммит обновления не выполняется.' } }
    $changed = New-Object 'System.Collections.Generic.List[string]'
    foreach ($relative in @(Sync-CanonicalFiles $Project $SourceAssessment)) { $changed.Add($relative) }
    foreach ($relative in @(Ensure-ArtifactSentinels $Project)) { $changed.Add($relative) }
    if (-not [IO.File]::Exists($agentsPath) -or (Read-Utf8 $agentsPath) -cne $agentsContent) {
        Write-Utf8Atomic $agentsPath $agentsContent
        $changed.Add('AGENTS.md')
    }
    if (-not [IO.File]::Exists($ignorePath) -or (Read-Utf8 $ignorePath) -cne $ignoreContent) {
        Write-Utf8Atomic $ignorePath $ignoreContent
        $changed.Add('.gitignore')
    }
    $privacy = if ($GuardMode -or $CreateMode) {
        $tracked = Get-TrackedPrivacyPaths $Project $SourceAssessment
        [pscustomobject]@{ Untracked = @(); Blocked = @(); Unknown = @($tracked.Unknown); StillTracked = @($tracked.Proven) }
    } else {
        Untrack-ProvenPrivacyPaths $Project $SourceAssessment
    }
    foreach ($relative in @($SourceAssessment.Canonical)) {
        if ((Get-Sha256 (Join-Path $script:Source $relative)) -ne (Get-Sha256 (Join-Path $Project $relative))) {
            throw "Итоговая проверка канонического пути не пройдена $relative"
        }
    }
    $postAgents = Get-ManagedAgentsBlock (Read-Utf8 $agentsPath)
    if ($postAgents.Text -cne $SourceAssessment.AgentsBlock.Text) { throw 'Итоговая проверка управляемого блока AGENTS не пройдена.' }
    if ((Read-Utf8 $ignorePath) -cne $ignoreContent) { throw 'Итоговая проверка .gitignore проекта не пройдена.' }
    Test-TargetPrivacy $Project
    $commitSha = ''; $commitOutcome = 'НЕТ'; $pushOutcome = 'НЕТ'; $commitFinalized = $true
    if (-not $GuardMode -and -not $CreateMode) {
        if ($ignoreWasDirty) { $commitOutcome = 'НУЖЕН РУЧНОЙ КОММИТ — .gitignore был изменён до обновления.' }
        elseif (@($privacy.Blocked).Count -gt 0) { $commitOutcome = 'НУЖЕН РУЧНОЙ КОММИТ — доказанный приватный путь имел подготовленные к коммиту изменения.' }
        elseif (@($changed | Where-Object { $_ -eq '.gitignore' }).Count -gt 0 -or @($privacy.Untracked).Count -gt 0) {
            try {
                $commitResult = Commit-UpdaterOwnedChanges $Project @($privacy.Untracked)
                $commitSha = $commitResult.Sha
                if ($commitResult.FinalizeError -ne '') {
                    $commitFinalized = $false
                    if ($commitSha -ne '') {
                        $commitOutcome = "НУЖНА РУЧНАЯ ПРОВЕРКА ИНДЕКСА — коммит обновления $commitSha существует; $($commitResult.FinalizeError)"
                    } else {
                        $commitOutcome = "НУЖНА РУЧНАЯ ОЧИСТКА ВРЕМЕННОГО ИНДЕКСА — коммит обновления не создан; $($commitResult.FinalizeError)"
                    }
                }
                elseif ($commitSha -ne '') { $commitOutcome = "КОММИТ СОЗДАН — $commitSha" }
            } catch { $commitOutcome = "НУЖЕН РУЧНОЙ КОММИТ — $($_.Exception.Message)" }
        }
        if ($commitSha -ne '' -and $commitFinalized) { $pushOutcome = Push-UpdaterCommit $Project $pushPreflight $commitSha }
        elseif ($commitSha -ne '') { $pushOutcome = 'ПРОПУЩЕНО — коммит обновления существует, но завершение работы с индексом требует проверки.' }
        elseif ($pushPreflight.Allowed) { $pushOutcome = 'ПРОПУЩЕНО — коммит обновления не создан.' }
        else { $pushOutcome = "ПРОПУЩЕНО — $($pushPreflight.Reason)" }
    }
    return [pscustomobject]@{
        Path = $Project; Changed = @($changed.ToArray()); Privacy = $privacy
        Commit = $commitOutcome; Push = $pushOutcome; Guard = $GuardMode
    }
}

function Show-ProjectResult {
    param($Result)
    $state = if (@($Result.Changed).Count -eq 0 -and @($Result.Privacy.Untracked).Count -eq 0) { 'АКТУАЛЕН' } else { 'ОБНОВЛЁН' }
    Write-Output "$state — $($Result.Path)"
    if (@($Result.Changed).Count) { Write-Output "  изменено управляемых путей: $(@($Result.Changed).Count)" }
    if (@($Result.Privacy.Untracked).Count) {
        Write-Output "  приватные пути исключены только из индекса: $(@($Result.Privacy.Untracked) -join ', ')"
        Write-Output '  ПРИМЕЧАНИЕ — В истории Git могут оставаться опубликованные приватные файлы; переписывание истории выходит за рамки этой задачи.'
    }
    if (@($Result.Privacy.StillTracked).Count) { Write-Output "  ПРИМЕЧАНИЕ — Автозащита обнаружила системные пути, учитываемые в Git: $(@($Result.Privacy.StillTracked) -join ', ')" }
    if (@($Result.Privacy.Blocked).Count) { Write-Output "  НУЖНО РУЧНОЕ РЕШЕНИЕ — подготовленные приватные пути сохранены: $(@($Result.Privacy.Blocked) -join ', ')" }
    if (@($Result.Privacy.Unknown).Count) { Write-Output "  НУЖНО РУЧНОЕ РЕШЕНИЕ — неизвестные приватные файлы, учитываемые в Git, сохранены: $(@($Result.Privacy.Unknown) -join ', ')" }
    if (-not $Result.Guard) { Write-Output "  коммит: $($Result.Commit)"; Write-Output "  отправка: $($Result.Push)" }
}

function Assert-ProjectName {
    param([string] $ProjectName)
    if ([string]::IsNullOrWhiteSpace($ProjectName) -or $ProjectName -in @('.', '..') -or
        $ProjectName -match '[<>:"/\\|?*\x00-\x1F]' -or
        $ProjectName -match '[. ]$' -or
        $ProjectName -match '^(CON|PRN|AUX|NUL|COM[1-9]|LPT[1-9])(\..*)?$') {
        throw "Недопустимое имя каталога проекта Windows: $ProjectName"
    }
}

function Select-Root {
    param($Registry, [bool] $Interactive = $false)
    if (@($Registry.project_roots).Count -eq 0) { throw 'Папки проектов не настроены. Используйте управление папками проектов или -Action AddRoot.' }
    if ($Interactive) {
        $number = Read-UiSelection 'Выберите папку проектов' @($Registry.project_roots)
        return $Registry.project_roots[$number - 1]
    }
    for ($i = 0; $i -lt @($Registry.project_roots).Count; $i++) {
        Write-Host "[$($i + 1)] $($Registry.project_roots[$i])"
    }
    $choice = Read-Host 'Выберите номер папки проектов'
    $number = 0
    if (-not [int]::TryParse($choice, [ref] $number) -or $number -lt 1 -or $number -gt @($Registry.project_roots).Count) {
        throw 'Неверный выбор папки проектов.'
    }
    return $Registry.project_roots[$number - 1]
}

function Select-Project {
    param($Registry, [bool] $Interactive = $false)
    if (@($Registry.project_roots).Count -eq 0) { throw 'Папки проектов не настроены. Сначала откройте управление папками проектов.' }
    $candidates = @(Get-DiscoveredProjects $Registry | Where-Object {
        $candidate = $_
        -not @($Registry.managed_projects | Where-Object { Same-Path $_ $candidate }).Count
    })
    if ($Interactive) {
        if ($candidates.Count -eq 0) {
            Write-UiStatus 'Нет проектов, ожидающих инициализации.' 'Info'
            Wait-UiBack
            Stop-UiFlow
        }
        $number = Read-UiSelection 'Выберите проект' $candidates
        return $candidates[$number - 1]
    }
    if ($candidates.Count -eq 0) { throw 'В настроенных папках не найдены непосредственно вложенные проекты Git.' }
    for ($i = 0; $i -lt $candidates.Count; $i++) { Write-Host "[$($i + 1)] $($candidates[$i])" }
    $choice = Read-Host 'Выберите номер проекта'
    $number = 0
    if (-not [int]::TryParse($choice, [ref] $number) -or $number -lt 1 -or $number -gt $candidates.Count) {
        throw 'Неверный выбор проекта.'
    }
    return $candidates[$number - 1]
}

function Add-ProjectRoot {
    param([string] $RequestedRoot)
    $registry = Read-Registry
    $path = Normalize-ExistingDirectory $RequestedRoot
    Assert-ProjectRootContainer $path
    if (@($registry.project_roots | Where-Object { Same-Path $_ $path }).Count) { throw "Папка проектов уже настроена: $path" }
    $registry.project_roots = @($registry.project_roots) + @($path)
    Save-Registry $registry
    Write-Output "ПАПКА ДОБАВЛЕНА — $path"
}

function Remove-ProjectRoot {
    param([string] $RequestedRoot)
    $registry = Read-Registry
    $path = if (Test-Path -LiteralPath $RequestedRoot -PathType Container) {
        Normalize-ExistingDirectory $RequestedRoot
    } else { Normalize-StoredPath $RequestedRoot }
    if (-not @($registry.project_roots | Where-Object { Same-Path $_ $path }).Count) { throw "Папка проектов не настроена: $path" }
    if (@($registry.managed_projects | Where-Object { Is-ImmediateChild $_ $path }).Count) {
        throw "Папка содержит зарегистрированные проекты, в том числе устаревшие пути: $path"
    }
    $registry.project_roots = @($registry.project_roots | Where-Object { -not (Same-Path $_ $path) })
    Save-Registry $registry
    Write-Output "ПАПКА УДАЛЕНА ИЗ НАСТРОЕК — $path"
}

function Show-Roots {
    $registry = Read-Registry
    if (@($registry.project_roots).Count -eq 0) { Write-Output 'Папки проектов не настроены.'; return }
    foreach ($path in @($registry.project_roots)) { Write-Output "ПАПКА — $path" }
}

function Ask-ExplicitChoice {
    param([string] $Question, [string[]] $Choices, [bool] $Interactive = $false)
    if ($Interactive) { return Read-UiSelection $Question $Choices }
    while ($true) {
        Write-Host $Question
        for ($i = 0; $i -lt $Choices.Count; $i++) { Write-Host "[$($i + 1)] $($Choices[$i])" }
        $answer = Read-Host 'Выберите номер'
        $number = 0
        if ([int]::TryParse($answer, [ref] $number) -and $number -ge 1 -and $number -le $Choices.Count) {
            return $number
        }
        Write-Host 'Выберите один из указанных вариантов; варианта по умолчанию нет.'
    }
}

function Publish-NewProjectToGitHub {
    param([string] $Project, [bool] $Interactive = $false)
    $choice = Ask-ExplicitChoice 'Создать репозиторий GitHub сейчас?' @('Да', 'Нет') $Interactive
    if ($choice -eq 2) { Write-Output 'ПУБЛИКАЦИЯ GITHUB: ПРОПУЩЕНА ПОЛЬЗОВАТЕЛЕМ'; return }
    try {
        if (-not (Get-Command gh -ErrorAction SilentlyContinue)) { throw 'GitHub CLI (gh) не установлен.' }
        $auth = Invoke-Tool 'gh' @('auth', 'status')
        if ($auth.Code -ne 0) { throw "Авторизация GitHub CLI не удалась: $($auth.Text.Trim())" }
        $account = Invoke-Tool 'gh' @('api', 'user', '--jq', '.login')
        if ($account.Code -ne 0 -or [string]::IsNullOrWhiteSpace($account.Text)) { throw 'Не удалось определить авторизованный аккаунт GitHub.' }
        $owner = $account.Text.Trim()
        Write-Host "Определён аккаунт GitHub: $owner"
        $visibility = Ask-ExplicitChoice 'Видимость репозитория?' @('Публичный', 'Приватный') $Interactive
        $visibilityArg = if ($visibility -eq 1) { '--public' } else { '--private' }
        $repoName = [IO.Path]::GetFileName($Project)
        Write-Host "Аккаунт/репозиторий: $owner/$repoName"
        Write-Host "Видимость: $(if ($visibility -eq 1) { 'Публичный' } else { 'Приватный' })"
        Write-Host "Локальный путь: $Project"
        $confirm = Ask-ExplicitChoice 'Подтвердить создание репозитория GitHub и отправку?' @('Создать и отправить', 'Отмена') $Interactive
        if ($confirm -eq 2) {
            if ($Interactive) { Stop-UiFlow }
            Write-Output 'ПУБЛИКАЦИЯ GITHUB: ОТМЕНЕНА ПОЛЬЗОВАТЕЛЕМ'; return
        }
        $existingOrigin = Invoke-Git $Project @('remote', 'get-url', 'origin')
        if ($existingOrigin.Code -eq 0) { throw 'У локального репозитория уже есть удалённый репозиторий origin.' }
        $creation = Invoke-Tool 'gh' @('repo', 'create', "$owner/$repoName", $visibilityArg,
            '--source', $Project, '--remote', 'origin', '--push')
        if ($creation.Code -ne 0) { throw "Создание или отправка GitHub не удались: $($creation.Text.Trim())" }
        $localSha = (Require-Git $Project @('rev-parse', 'HEAD') 'Не удалось проверить локальный SHA публикации GitHub').Trim()
        $remote = Invoke-Git $Project @('ls-remote', '--exit-code', 'origin', 'refs/heads/main')
        if ($remote.Code -ne 0 -or -not $remote.Text.StartsWith($localSha + "`t")) {
            throw 'Публикация GitHub успешна, но проверка совпадения локального и удалённого SHA не пройдена.'
        }
        Write-Output "ПУБЛИКАЦИЯ GITHUB: УСПЕШНО — $owner/$repoName, SHA $localSha"
    } catch {
        if ($_.Exception.Data.Contains('CommandCenter.UiBack')) { throw }
        Write-Output "ПУБЛИКАЦИЯ GITHUB: ОШИБКА / НЕ ЗАВЕРШЕНА — $($_.Exception.Message)"
    }
}

function Create-NewProject {
    param([string] $RequestedRoot, [string] $ProjectName, [bool] $SkipPublication, [bool] $Interactive = $false)
    $assessment = Require-ReadySource
    $registry = Read-Registry
    if (@($registry.project_roots).Count -eq 0) { throw 'Папки проектов не настроены. Сначала откройте управление папками проектов.' }
    $rootPath = if ([string]::IsNullOrWhiteSpace($RequestedRoot)) { Select-Root $registry $Interactive } else {
        Normalize-ExistingDirectory $RequestedRoot
    }
    if (-not @($registry.project_roots | Where-Object { Same-Path $_ $rootPath }).Count) { throw "Папка проектов не настроена: $rootPath" }
    if ([string]::IsNullOrWhiteSpace($ProjectName)) {
        if ($Interactive) {
            while ($true) {
                $ProjectName = Read-UiInput 'Имя каталога нового проекта'
                try {
                    Assert-ProjectName $ProjectName
                    if (Test-Path -LiteralPath (Join-Path $rootPath $ProjectName)) { throw 'Целевой путь уже существует; выберите другое имя.' }
                    break
                } catch { Write-UiStatus $_.Exception.Message 'Warning' }
            }
        } else { $ProjectName = Read-Host 'Имя каталога нового проекта' }
    }
    Assert-ProjectName $ProjectName
    $target = [IO.Path]::GetFullPath((Join-Path $rootPath $ProjectName))
    if (-not (Is-ImmediateChild $target $rootPath) -or (Same-Path $target $script:Source)) { throw 'Небезопасный путь нового проекта.' }
    if (Test-Path -LiteralPath $target) { throw "Целевой путь уже существует; файлы не изменены: $target" }
    $staging = [IO.Path]::GetFullPath((Join-Path $rootPath ('.command-center-create-' + [guid]::NewGuid().ToString('N'))))
    if (-not (Is-ImmediateChild $staging $rootPath) -or (Same-Path $staging $script:Source)) {
        throw 'Небезопасный промежуточный каталог.'
    }
    $stagingOwned = $false; $targetOwned = $false; $localSuccess = $false
    $ownerId = [guid]::NewGuid().ToString('N')
    try {
        [CommandCenterWin32Paths]::CreateNewDirectory($staging)
        $stagingOwned = $true
        [void] (Require-Git $staging @('init', '-b', 'main') 'Инициализация Git не удалась')
        $ownerMarker = Join-Path $staging '.git/command-center-create-owner'
        [IO.File]::WriteAllText($ownerMarker, $ownerId, [Text.Encoding]::ASCII)
        Assert-GitIdentity $staging
        $result = Sync-Project $staging $assessment $false $true $false $ProjectName
        Test-TargetPrivacy $staging
        [void] (Require-Git $staging @('--literal-pathspecs', 'add', '--', '.gitignore') 'Не удалось подготовить исходный .gitignore к коммиту')
        $staged = @(Split-GitNull (Require-Git $staging @('diff', '--cached', '--name-only', '-z') 'Не удалось проверить исходный коммит'))
        if ($staged.Count -ne 1 -or $staged[0] -cne '.gitignore') { throw 'В исходный коммит попали бы неожиданные пути.' }
        [void] (Require-Git $staging @('commit', '-m', 'chore: initialize project repository') 'Исходный локальный коммит не удался')
        if ((Require-Git $staging @('branch', '--show-current') 'Не удалось проверить новую ветку').Trim() -cne 'main') {
            throw 'Новый репозиторий не на ветке main.'
        }
        $tracked = @(Split-GitNull (Require-Git $staging @('ls-files', '-z') 'Не удалось проверить пути, учитываемые в Git'))
        if ($tracked.Count -ne 1 -or $tracked[0] -cne '.gitignore') { throw 'Приватная инфраструктура попала в учёт Git нового проекта.' }
        if (Test-Path -LiteralPath $target) { throw "Целевой путь появился во время создания; его файлы не изменены: $target" }
        [IO.Directory]::Move($staging, $target)
        $stagingOwned = $false; $targetOwned = $true
        Add-ManagedProject $registry $target
        $localSuccess = $true
        try { [IO.File]::Delete((Join-Path $target '.git/command-center-create-owner')) }
        catch { Write-Output "ПРИМЕЧАНИЕ — не удалось удалить приватный маркер создания Git: $($_.Exception.Message)" }
        $result.Path = $target
        Write-Output "ЛОКАЛЬНЫЙ ПРОЕКТ: УСПЕШНО — $target"
        Show-ProjectResult $result
    } finally {
        if (-not $localSuccess -and $stagingOwned) {
            $checkedStaging = Normalize-ExistingDirectory $staging
            if (-not (Is-ImmediateChild $checkedStaging $rootPath) -or (Same-Path $checkedStaging $script:Source)) {
                throw "Промежуточный каталог отката вышел за границы папки проектов: $checkedStaging"
            }
            Remove-Item -LiteralPath $checkedStaging -Recurse -Force
        }
        if (-not $localSuccess -and $targetOwned) {
            $checkedTarget = Normalize-ExistingDirectory $target
            $marker = Join-Path $checkedTarget '.git/command-center-create-owner'
            if (-not (Is-ImmediateChild $checkedTarget $rootPath) -or (Same-Path $checkedTarget $script:Source) -or
                -not [IO.File]::Exists($marker) -or [IO.File]::ReadAllText($marker, [Text.Encoding]::ASCII) -cne $ownerId) {
                throw "Не удалось доказать владение целевым каталогом для отката: $target"
            }
            Remove-Item -LiteralPath $checkedTarget -Recurse -Force
        }
    }
    if ($SkipPublication) { Write-Output 'ПУБЛИКАЦИЯ GITHUB: ЯВНО ПРОПУЩЕНА' }
    else { Publish-NewProjectToGitHub $target $Interactive }
}

function Initialize-Project {
    param([string] $RequestedPath, [bool] $Interactive = $false)
    $assessment = Require-ReadySource
    $registry = Read-Registry
    if (@($registry.project_roots).Count -eq 0) { throw 'Папки проектов не настроены. Сначала откройте управление папками проектов.' }
    $project = if ([string]::IsNullOrWhiteSpace($RequestedPath)) { Select-Project $registry $Interactive } else {
        Normalize-ExistingDirectory $RequestedPath
    }
    Assert-ConfiguredProject $project $registry
    $registered = @($registry.managed_projects | Where-Object { Same-Path $_ $project }).Count -gt 0
    if ($registered) { throw 'Проект уже управляется Command Center. Используйте «Обновить все проекты» или автопроверку (Guard).' }
    $replaceAgents = $false
    if ($Interactive) {
        try { [void] (Get-AgentsContentForProject $project $assessment $registered '') }
        catch {
            if (-not $_.Exception.Data.Contains('CommandCenter.AgentsOwnership')) { throw }
            Write-Host 'Существующий AGENTS.md нельзя безопасно перенести автоматически.'
            Write-Host 'AGENTS.md — главный маршрутизатор репозитория; инициализации нужен совместимый текущий шаблон.'
            Write-Host 'Автоматическая перезапись без вашего разрешения запрещена.'
            Write-Host "Проект: $project"
            if ((Ask-ExplicitChoice 'Выберите действие' @('Полностью заменить AGENTS.md текущим шаблоном', 'Отмена') $true) -ne 1) {
                Stop-UiFlow
            }
            if ((Ask-ExplicitChoice "Существующий AGENTS.md будет полностью перезаписан.`nПродолжить?" @('Да, заменить', 'Нет') $true) -ne 1) {
                Stop-UiFlow
            }
            $replaceAgents = $true
        }
    }
    $result = Sync-Project $project $assessment $false $false $registered '' $replaceAgents
    Add-ManagedProject $registry $project
    Show-ProjectResult $result
    Write-Output "ПРОЕКТ ЗАРЕГИСТРИРОВАН — $project"
}

function Update-AllProjects {
    param([bool] $GuardMode)
    $assessment = Require-ReadySource
    $registry = Read-Registry
    if (@($registry.project_roots).Count -eq 0) { throw 'Папки проектов не настроены. Сначала откройте управление папками проектов.' }
    $discovered = @(Get-DiscoveredProjects $registry)
    $failed = 0; $updated = 0; $current = 0
    foreach ($project in $discovered) {
        if (-not @($registry.managed_projects | Where-Object { Same-Path $_ $project }).Count) {
            Write-Output "ПРОПУЩЕНО — НЕ ИНИЦИАЛИЗИРОВАН: $project"
            continue
        }
        try {
            $result = Sync-Project $project $assessment $GuardMode $false $true ''
            Show-ProjectResult $result
            if (@($result.Changed).Count -eq 0 -and @($result.Privacy.Untracked).Count -eq 0) { $current++ }
            else { $updated++ }
        } catch { $failed++; Write-Output "ОШИБКА — $project`: $($_.Exception.Message)" }
    }
    foreach ($project in @($registry.managed_projects)) {
        if (-not @($discovered | Where-Object { Same-Path $_ $project }).Count) {
            $failed++; Write-Output "УСТАРЕВШАЯ ЗАПИСЬ ПРОЕКТА — $project"
            Write-Output '  Устаревшие записи можно очистить через «Управляемые проекты».'
        }
    }
    Write-Output "ИТОГ — обновлено=$updated актуально=$current ошибок=$failed"
    if ($GuardMode) { Write-GuardLog "обновлено=$updated актуально=$current ошибок=$failed" }
    if ($failed -gt 0) { throw "$failed управляемых проектов с ошибками; остальные проекты обработаны." }
}

function Write-GuardLog {
    param([string] $Summary)
    $line = ([DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ssZ') + ' ' + $Summary)
    $old = if ([IO.File]::Exists($script:GuardLogPath)) { Read-Utf8 $script:GuardLogPath } else { '' }
    $lines = @($old -split '\r?\n' | Where-Object { $_ -ne '' }) + @($line)
    if ($lines.Count -gt 200) { $lines = @($lines | Select-Object -Last 200) }
    $text = ($lines -join "`n") + "`n"
    while ([Text.Encoding]::UTF8.GetByteCount($text) -gt 65536 -and $lines.Count -gt 1) {
        $lines = @($lines | Select-Object -Skip 1)
        $text = ($lines -join "`n") + "`n"
    }
    Write-Utf8Atomic $script:GuardLogPath $text
}

function Get-GuardTaskName {
    param($Registry)
    if ($Registry.guard_task_id -eq '') { return '' }
    return 'CommandCenterGuard-' + $Registry.guard_task_id.ToLowerInvariant()
}

function Assert-GuardTaskOwnership {
    param($Registry, [string] $TaskName)
    $definition = Invoke-Tool 'schtasks.exe' @('/Query', '/TN', $TaskName, '/XML')
    if ($definition.Code -ne 0) { throw "Не удалось проверить определение задания автозащиты: $($definition.Text.Trim())" }
    try { [xml] $taskXml = $definition.Text }
    catch { throw "Некорректное определение задания автозащиты: $($_.Exception.Message)" }
    $exec = $taskXml.SelectSingleNode("//*[local-name()='Actions']/*[local-name()='Exec']")
    if ($null -eq $exec -or $Registry.guard_task_source -eq '') {
        throw "Не удалось проверить владельца задания: $TaskName"
    }
    $commandNode = $exec.SelectSingleNode("*[local-name()='Command']")
    $argsNode = $exec.SelectSingleNode("*[local-name()='Arguments']")
    $expected = '-NoProfile -ExecutionPolicy Bypass -File "' + $Registry.guard_task_source + '" -Guard'
    if ($null -eq $commandNode -or $null -eq $argsNode -or
        ([IO.Path]::GetFileName($commandNode.InnerText.Trim('"')) -notin @('pwsh.exe', 'powershell.exe')) -or
        $argsNode.InnerText -cne $expected) {
        throw "Действие задания не соответствует владельцу автозащиты этого реестра: $TaskName"
    }
}

function Invoke-GuardScheduler {
    param([string] $Operation)
    if (-not (Get-Command schtasks.exe -ErrorAction SilentlyContinue)) { throw 'Команда планировщика Windows schtasks.exe недоступна.' }
    $registry = Read-Registry
    $service = Invoke-Tool 'schtasks.exe' @('/Query', '/FO', 'LIST')
    if ($service.Code -ne 0) { throw "Планировщик Windows недоступен: $($service.Text.Trim())" }
    if ($Operation -eq 'Install' -and $registry.guard_task_id -eq '') {
        $registry.guard_task_id = [guid]::NewGuid().ToString('N')
        $registry.guard_task_source = Join-Path $script:Source 'scripts/command-center.ps1'
        Save-Registry $registry
    }
    $taskName = Get-GuardTaskName $registry
    if ($taskName -eq '') { Write-Output 'АВТОПРОВЕРКА НЕ УСТАНОВЛЕНА — в локальном реестре нет идентификатора задания'; return }
    if ($Operation -eq 'Status') {
        $query = Invoke-Tool 'schtasks.exe' @('/Query', '/TN', $taskName, '/FO', 'LIST')
        if ($query.Code -eq 0) {
            Assert-GuardTaskOwnership $registry $taskName
            Write-Output "АВТОПРОВЕРКА УСТАНОВЛЕНА — $taskName"
            if (-not (Same-Path $registry.guard_task_source (Join-Path $script:Source 'scripts/command-center.ps1'))) {
                Write-Output 'ПРИМЕЧАНИЕ — Задание ссылается на прежний путь источника; удалите и установите его заново.'
            }
            Write-Output $query.Text
        }
        else { Write-Output "АВТОПРОВЕРКА НЕ УСТАНОВЛЕНА — $taskName" }
        return
    }
    if ($Operation -eq 'Remove') {
        $query = Invoke-Tool 'schtasks.exe' @('/Query', '/TN', $taskName)
        if ($query.Code -ne 0) { Write-Output "АВТОПРОВЕРКА НЕ УСТАНОВЛЕНА — $taskName"; return }
        Assert-GuardTaskOwnership $registry $taskName
        $delete = Invoke-Tool 'schtasks.exe' @('/Delete', '/TN', $taskName, '/F')
        if ($delete.Code -ne 0) { throw "Не удалось удалить задание автозащиты: $($delete.Text.Trim())" }
        Write-Output "АВТОПРОВЕРКА УДАЛЕНА — $taskName"
        return
    }
    # A scheduled task must use an engine that remains available outside the
    # interactive Codex session; Windows PowerShell is the system default.
    $powerShell = Get-Command powershell.exe -ErrorAction SilentlyContinue
    if (-not $powerShell) { $powerShell = Get-Command pwsh.exe -ErrorAction SilentlyContinue }
    if (-not $powerShell) { throw 'Нет исполняемого файла PowerShell для задания автозащиты.' }
    $existing = Invoke-Tool 'schtasks.exe' @('/Query', '/TN', $taskName)
    if ($existing.Code -eq 0) { throw "Задание автозащиты уже существует; явно удалите его перед переустановкой: $taskName" }
    $scriptPath = Join-Path $script:Source 'scripts/command-center.ps1'
    if (-not (Same-Path $registry.guard_task_source $scriptPath)) {
        $registry.guard_task_source = $scriptPath
        Save-Registry $registry
    }
    if (-not (Get-Command New-ScheduledTaskAction -ErrorAction SilentlyContinue) -or
        -not (Get-Command New-ScheduledTaskTrigger -ErrorAction SilentlyContinue) -or
        -not (Get-Command Register-ScheduledTask -ErrorAction SilentlyContinue)) {
        throw 'Командлеты Windows ScheduledTasks недоступны.'
    }
    try {
        $taskArguments = '-NoProfile -ExecutionPolicy Bypass -File "' + $scriptPath + '" -Guard'
        $action = New-ScheduledTaskAction -Execute $powerShell.Source -Argument $taskArguments
        $trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1) -RepetitionInterval (New-TimeSpan -Minutes 30)
        [void] (Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Description 'Восстанавливает инфраструктуру зарегистрированных проектов Command Center каждые 30 минут.' -ErrorAction Stop)
    } catch { throw "Не удалось установить задание автозащиты: $($_.Exception.Message)" }
    Write-Output "АВТОПРОВЕРКА УСТАНОВЛЕНА — $taskName (каждые 30 минут)"
}

function Write-UiLine {
    param([string] $Text = '', [string] $Color = 'Gray')
    try { Write-Host $Text -ForegroundColor $Color }
    catch { Write-Host $Text }
}

function Show-UiScreen {
    param([string] $Title, [string] $Status = '')
    $width = 72; $unicode = $false
    try {
        if (-not [Console]::IsOutputRedirected) {
            Clear-Host
            $width = [Math]::Max(40, [Math]::Min(96, [Console]::WindowWidth))
            $unicode = [Console]::OutputEncoding.CodePage -eq 65001
        }
    } catch { }
    $script:UiWidth = $width
    $separator = if ($unicode) { '─' } else { '-' }
    $top = if ($unicode) { '┌' + ($separator * ($width - 2)) + '┐' } else { '+' + ($separator * ($width - 2)) + '+' }
    $bottom = if ($unicode) { '└' + ($separator * ($width - 2)) + '┘' } else { '+' + ($separator * ($width - 2)) + '+' }
    Write-UiLine $top 'DarkCyan'
    Write-UiLine ("  " + $Title) 'Cyan'
    Write-UiLine $bottom 'DarkCyan'
    Write-UiLine
    if ($Status -ne '') { Write-UiStatus $Status 'Warning'; Write-UiLine }
}

function Write-UiSection {
    param([string] $Title)
    Write-UiLine
    Write-UiLine ("  " + $Title) 'Cyan'
}

function Write-UiStatus {
    param([string] $Text, [ValidateSet('Success', 'Warning', 'Error', 'Info')] [string] $Severity = 'Info')
    $colors = @{ Success = 'Green'; Warning = 'Yellow'; Error = 'Red'; Info = 'Gray' }
    Write-UiLine $Text $colors[$Severity]
}

function Stop-UiFlow {
    # A tagged cancellation unwinds only to the nearest interactive screen owner.
    $error = New-Object System.OperationCanceledException 'Возврат в предыдущее меню.'
    $error.Data['CommandCenter.UiBack'] = $true
    throw $error
}

function Read-UiInput {
    param([string] $Prompt)
    Write-UiLine '[0] Назад / Отмена' 'DarkCyan'
    $answer = (Read-Host $Prompt).Trim()
    if ($answer -ceq '0') { Stop-UiFlow }
    return $answer
}

function Read-UiSelection {
    param([string] $Prompt, [string[]] $Choices)
    Write-UiSection $Prompt
    for ($i = 0; $i -lt $Choices.Count; $i++) { Write-UiLine "[$($i + 1)] $($Choices[$i])" }
    while ($true) {
        $answer = Read-UiInput 'Выберите номер'
        $number = 0
        if ([int]::TryParse($answer, [ref] $number) -and $number -ge 1 -and $number -le $Choices.Count) { return $number }
        Write-UiStatus 'Неверный выбор. Выберите указанный номер или 0 для возврата.' 'Warning'
    }
}

function Wait-UiBack {
    Write-UiLine
    Write-UiLine '[0] Назад' 'DarkCyan'
    while ((Read-Host 'Выберите действие').Trim() -cne '0') {
        Write-UiLine 'Неверный выбор. Для возврата введите 0.' 'Yellow'
    }
}

function Invoke-UiOperation {
    param([string] $Title, [scriptblock] $Operation, [bool] $RetryOnError = $false, [string] $NextAction = '')
    $status = ''
    while ($true) {
        Show-UiScreen $Title $status
        try {
            & $Operation | ForEach-Object {
                $line = [string] $_
                $severity = if ($line -match '^ОШИБКА') { 'Error' }
                    elseif ($line -match '^(ПРИМЕЧАНИЕ|УСТАРЕВШАЯ|ПРОПУЩЕНО)') { 'Warning' }
                    elseif ($line -match 'УСПЕШНО|^ПАПКА ДОБАВЛЕНА|^ПРОЕКТ ЗАРЕГИСТРИРОВАН') { 'Success' }
                    else { 'Info' }
                Write-UiStatus $line $severity
            }
            if ($NextAction -ne '') { [void] (Read-UiSelection 'Дальше' @($NextAction)); continue }
        } catch {
            if ($_.Exception.Data.Contains('CommandCenter.UiBack')) { return }
            $status = "ОШИБКА — $($_.Exception.Message)"
            Write-UiStatus $status 'Error'
            if ($RetryOnError) {
                try { [void] (Read-UiSelection 'Дальше' @('Повторить')) }
                catch {
                    if ($_.Exception.Data.Contains('CommandCenter.UiBack')) { return }
                    throw
                }
                continue
            }
        }
        Wait-UiBack
        return
    }
}

function Read-InteractivePath {
    param([string] $Prompt)
    $path = Read-UiInput $Prompt
    if ($path.Length -ge 2 -and
        (($path[0] -eq '"' -and $path[$path.Length - 1] -eq '"') -or
         ($path[0] -eq "'" -and $path[$path.Length - 1] -eq "'"))) {
        $path = $path.Substring(1, $path.Length - 2)
    }
    if ($path -match '["'']' -or [string]::IsNullOrWhiteSpace($path) -or
        -not [IO.Path]::IsPathRooted($path) -or $path -notmatch '^(?:[A-Za-z]:[\\/]|\\\\[^\\/]+[\\/][^\\/]+)') {
        throw 'Нужен абсолютный путь без вложенных или непарных кавычек.'
    }
    return [IO.Path]::GetFullPath($path)
}

function Add-RootInteractive {
    $path = Read-InteractivePath 'Абсолютный путь к папке проектов'
    if (-not (Test-Path -LiteralPath $path)) {
        if ((Ask-ExplicitChoice "Каталог не существует: $path" @('Создать каталог и добавить', 'Отмена') $true) -ne 1) {
            Stop-UiFlow
        }
        # The same invariant is checked again after creation and resolution.
        Assert-ProjectRootContainer $path
        [void] [IO.Directory]::CreateDirectory($path)
    }
    Add-ProjectRoot $path
}

function Remove-RootInteractive {
    $registry = Read-Registry
    $roots = @($registry.project_roots)
    if ($roots.Count -eq 0) { Write-Output 'Папки проектов не настроены.'; return }
    $number = Read-UiSelection 'Выберите настроенную папку проектов' $roots
    $path = $roots[$number - 1]
    $path = Normalize-StoredPath $path
    Remove-ProjectRoot $path
    if ([IO.Directory]::Exists($path) -and @(Get-ChildItem -LiteralPath $path -Force).Count -eq 0) {
        if ((Ask-ExplicitChoice "Папка пуста. Удалить её с диска?`n$path" @('Да', 'Нет') $true) -eq 1) {
            # Re-resolve and refuse replacement/reparse paths before deleting.
            $current = Normalize-ExistingDirectory $path
            if (-not (Same-Path $path $current)) { throw 'Путь папки изменился; удаление запрещено.' }
            Assert-ProjectRootContainer $current
            if (@(Get-ChildItem -LiteralPath $current -Force).Count -ne 0) {
                throw 'Папка больше не пуста; удаление запрещено.'
            }
            # Non-recursive API also refuses a directory populated after the check.
            [IO.Directory]::Delete($current, $false)
            Write-Output "ПУСТАЯ ПАПКА УДАЛЕНА — $current"
        }
    }
}

function Manage-RootsInteractive {
    $status = ''
    while ($true) {
        Show-UiScreen 'УПРАВЛЕНИЕ ПАПКАМИ ПРОЕКТОВ' $status
        Write-UiLine '[1] Показать папки'
        Write-UiLine '[2] Добавить папку'
        Write-UiLine '[3] Удалить папку из настроек'
        Write-UiLine '[0] Назад' 'DarkCyan'
        $status = ''
        switch ((Read-Host 'Выберите действие').Trim()) {
            '1' { Invoke-UiOperation 'ПАПКИ ПРОЕКТОВ' { Show-Roots } }
            '2' { Invoke-UiOperation 'ДОБАВИТЬ ПАПКУ' { Add-RootInteractive } $true 'Добавить ещё' }
            '3' { Invoke-UiOperation 'УДАЛИТЬ ПАПКУ ИЗ НАСТРОЕК' { Remove-RootInteractive } $true }
            '0' { return }
            default { $status = 'Неверный выбор.' }
        }
    }
}

function Get-ManagedProjectStates {
    param($Registry)
    $discovered = @(Get-DiscoveredProjects $Registry)
    foreach ($path in @($Registry.managed_projects)) {
        [pscustomobject]@{ Path = $path; Stale = (-not @($discovered | Where-Object { Same-Path $_ $path }).Count) }
    }
}

function Show-ManagedProjects {
    $states = @(Get-ManagedProjectStates (Read-Registry))
    if ($states.Count -eq 0) { Write-Output 'Управляемых проектов нет.'; return }
    foreach ($entry in $states) {
        $state = if ($entry.Stale) { 'УСТАРЕЛ — путь отсутствует или проект недоступен в настроенных папках' } else { 'В ПОРЯДКЕ' }
        Write-Output "$state — $($entry.Path)"
    }
}

function Show-ManagedProjectsInteractive {
    $status = ''
    while ($true) {
        Show-UiScreen 'СПИСОК УПРАВЛЯЕМЫХ ПРОЕКТОВ' $status
        try {
            $states = @(Get-ManagedProjectStates (Read-Registry))
            if ($states.Count -eq 0) {
                Write-UiStatus 'Управляемых проектов нет.'
                Wait-UiBack
                return
            }
            foreach ($entry in $states) {
                $label = if ($entry.Stale) { 'УСТАРЕЛ' } else { 'В ПОРЯДКЕ' }
                $severity = if ($entry.Stale) { 'Warning' } else { 'Success' }
                Write-UiStatus "$label — $($entry.Path)" $severity
            }
            $staleCount = @($states | Where-Object { $_.Stale }).Count
            $choices = @('Отключить проект от управления')
            if ($staleCount -gt 0) { $choices += "Очистить устаревшие записи ($staleCount)" }
            $choice = Read-UiSelection 'Действия с проектами' $choices
            if ($choice -eq 1) {
                Invoke-UiOperation 'ОТКЛЮЧИТЬ ПРОЕКТ' { Unmanage-ProjectInteractive } $true
            } else {
                Invoke-UiOperation 'ОЧИСТИТЬ УСТАРЕВШИЕ ЗАПИСИ' { Clear-StaleProjectsInteractive }
            }
            $status = ''
        } catch {
            if ($_.Exception.Data.Contains('CommandCenter.UiBack')) { return }
            Write-UiStatus "ОШИБКА — $($_.Exception.Message)" 'Error'
            Wait-UiBack
            return
        }
    }
}

function Unmanage-ProjectInteractive {
    $registry = Read-Registry
    $projects = @($registry.managed_projects)
    if ($projects.Count -eq 0) { Write-Output 'Управляемых проектов нет.'; return }
    $number = Read-UiSelection 'Выберите проект' $projects
    $selected = $projects[$number - 1]
    Write-UiLine 'Операция удалит только регистрацию Command Center. Репозиторий и все его файлы сохранятся.'
    if ((Ask-ExplicitChoice "Отключить проект от управления?`n$selected" @('Да, отключить', 'Отмена') $true) -ne 1) {
        Stop-UiFlow
    }
    $registry = Read-Registry
    $registry.managed_projects = @($registry.managed_projects | Where-Object { -not (Same-Path $_ $selected) })
    Save-Registry $registry
    Write-Output "ПРОЕКТ ОТКЛЮЧЁН ОТ УПРАВЛЕНИЯ — $selected"
}

function Clear-StaleProjectsInteractive {
    $registry = Read-Registry
    $stale = @(Get-ManagedProjectStates $registry | Where-Object { $_.Stale } | ForEach-Object { $_.Path })
    if ($stale.Count -eq 0) { Write-Output 'Устаревших записей нет.'; return }
    Write-UiLine 'Будут удалены только следующие записи реестра:'
    foreach ($path in $stale) { Write-UiLine "  $path" }
    if ((Ask-ExplicitChoice 'Очистить эти записи? Файлы проектов останутся на диске.' @('Да, очистить', 'Отмена') $true) -ne 1) {
        Stop-UiFlow
    }
    $registry = Read-Registry
    $stillStale = @(Get-ManagedProjectStates $registry | Where-Object { $_.Stale } | ForEach-Object { $_.Path })
    $confirmed = @($stale | Where-Object { $candidate = $_; @($stillStale | Where-Object { Same-Path $_ $candidate }).Count })
    $registry.managed_projects = @($registry.managed_projects | Where-Object {
        $candidate = $_; -not @($confirmed | Where-Object { Same-Path $_ $candidate }).Count
    })
    Save-Registry $registry
    Write-Output "УСТАРЕВШИЕ ЗАПИСИ УДАЛЕНЫ — $($confirmed.Count)"
}

function Manage-ProjectsInteractive {
    $status = ''
    while ($true) {
        Show-UiScreen 'УПРАВЛЯЕМЫЕ ПРОЕКТЫ' $status
        Write-UiLine '[1] Показать проекты'
        Write-UiLine '[2] Отключить проект от управления'
        Write-UiLine '[3] Очистить устаревшие записи'
        Write-UiLine '[0] Назад' 'DarkCyan'
        $status = ''
        switch ((Read-Host 'Выберите действие').Trim()) {
            '1' { Show-ManagedProjectsInteractive }
            '2' { Invoke-UiOperation 'ОТКЛЮЧИТЬ ПРОЕКТ' { Unmanage-ProjectInteractive } $true }
            '3' { Invoke-UiOperation 'ОЧИСТИТЬ УСТАРЕВШИЕ ЗАПИСИ' { Clear-StaleProjectsInteractive } }
            '0' { return }
            default { $status = 'Неверный выбор.' }
        }
    }
}

function Manage-GuardInteractive {
    $status = ''
    while ($true) {
        Show-UiScreen 'АВТОЗАЩИТА' $status
        Write-UiLine '[1] Проверить управляемые проекты сейчас'
        Write-UiLine '[2] Включить проверку каждые 30 минут'
        Write-UiLine '[3] Показать статус'
        Write-UiLine '[4] Отключить автопроверку'
        Write-UiLine '[0] Назад' 'DarkCyan'
        $status = ''
        switch ((Read-Host 'Выберите действие').Trim()) {
            '1' { Invoke-UiOperation 'ПРОВЕРИТЬ УПРАВЛЯЕМЫЕ ПРОЕКТЫ СЕЙЧАС' {
                Write-Output 'Проверка выполняется без коммита и отправки (commit/push).'
                Update-AllProjects $true
            } }
            '2' { Invoke-UiOperation 'ВКЛЮЧИТЬ АВТОПРОВЕРКУ' { Invoke-GuardScheduler 'Install' } }
            '3' { Invoke-UiOperation 'СТАТУС АВТОПРОВЕРКИ' { Invoke-GuardScheduler 'Status' } }
            '4' { Invoke-UiOperation 'ОТКЛЮЧИТЬ АВТОПРОВЕРКУ' { Invoke-GuardScheduler 'Remove' } }
            '0' { return }
            default { $status = 'Неверный выбор.' }
        }
    }
}

function Show-InteractiveMenu {
    param([string] $Status = '')
    Show-UiScreen 'COMMAND CENTER' $Status
    Write-UiLine "Источник: $script:Source" 'DarkGray'
    Write-UiLine
    Write-UiSection 'ПРОЕКТЫ'
    Write-UiLine '[1] Создать новый проект'
    Write-UiLine '[2] Инициализировать проект'
    Write-UiLine '[3] Обновить все проекты'
    Write-UiLine
    Write-UiSection 'COMMAND CENTER'
    Write-UiLine '[4] Проверить Command Center'
    Write-UiLine '[5] Автозащита'
    Write-UiLine
    Write-UiSection 'НАСТРОЙКИ'
    Write-UiLine '[6] Управление папками проектов'
    Write-UiLine '[7] Управляемые проекты'
    Write-UiLine
    Write-UiLine '[0] Выход' 'DarkCyan'
}

function Run-Interactive {
    $status = ''
    while ($true) {
        Show-InteractiveMenu $status
        $status = ''
        switch ((Read-Host 'Выберите действие').Trim()) {
            '1' { Invoke-UiOperation 'СОЗДАТЬ ПРОЕКТ' { Create-NewProject '' '' $false $true } $true }
            '2' { Invoke-UiOperation 'ИНИЦИАЛИЗИРОВАТЬ ПРОЕКТ' { Initialize-Project '' $true } $true }
            '3' { Invoke-UiOperation 'ОБНОВИТЬ ВСЕ ПРОЕКТЫ' { Update-AllProjects $false } }
            '4' { Invoke-UiOperation 'ПРОВЕРКА COMMAND CENTER' { Show-SourceAssessment (Get-SourceAssessment) } }
            '5' { Manage-GuardInteractive }
            '6' { Manage-RootsInteractive }
            '7' { Manage-ProjectsInteractive }
            '0' { return }
            default { $status = 'Неверный выбор.' }
        }
    }
}

$script:Source = Normalize-ExistingDirectory $script:Source
$script:RegistryPath = Join-Path $script:Source 'config/distribution.local.json'
$script:GuardLogPath = Join-Path $script:Source 'config/guard.local.log'

try {
    if ($Guard -and $Action) { throw 'Используйте -Guard или -Action, но не вместе.' }
    if ($Guard) { Update-AllProjects $true }
    elseif ($Action) {
        switch ($Action) {
            'VerifySource' { Show-SourceAssessment (Get-SourceAssessment) }
            'Create' { Create-NewProject $Root $Name $SkipGitHubPublication.IsPresent }
            'Initialize' { Initialize-Project $ProjectPath }
            'UpdateAll' { Update-AllProjects $false }
            'ListRoots' { Show-Roots }
            'AddRoot' { Add-ProjectRoot $Root }
            'RemoveRoot' { Remove-ProjectRoot $Root }
            'GuardInstall' { Invoke-GuardScheduler 'Install' }
            'GuardStatus' { Invoke-GuardScheduler 'Status' }
            'GuardRemove' { Invoke-GuardScheduler 'Remove' }
            'Help' {
                Write-Output 'Интерактивный режим: запуск без параметров.'
                Write-Output '-Action AddRoot/RemoveRoot -Root <абсолютный путь>'
                Write-Output '-Action Create -Root <настроенная папка> -Name <имя> [-SkipGitHubPublication]'
                Write-Output '-Action Initialize -ProjectPath <непосредственно вложенный репозиторий Git>'
                Write-Output '-Action UpdateAll | VerifySource | ListRoots | GuardInstall | GuardStatus | GuardRemove'
                Write-Output '-Guard восстанавливает зарегистрированные проекты без участия пользователя, коммита и отправки.'
            }
        }
    } else { Run-Interactive }
} catch {
    Write-Error "ОШИБКА — $($_.Exception.Message)"
    exit 1
}
