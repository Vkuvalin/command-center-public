# Ops Center → Codex Protocol

Этот документ описывает рабочую схему работы **пользователя + ChatGPT** как Command Center для постановки задач локальному Codex.

Файл предназначен для загрузки в новый чат с ChatGPT, чтобы быстро восстановить общий подход:

* как обсуждать задачу;
* как выбирать intent / route hint / expected artifact;
* как выбирать TS-A / TS-B, создавать OPS Task и передавать его фиксированным Launch Prompt;
* как просить audit, code review, test-writing, reports, ExecPlans или subagents;
* как читать результат Codex;
* как не дублировать repo-side guardrails вручную.

Это **не source of truth проекта** и не замена `AGENTS.md`.

---

## 1. Назначение

Цель протокола — помочь ChatGPT работать с пользователем как **Command Center** для Codex:

```text
Пользователь + ChatGPT
  ↓ обсуждают цель, ограничения, риски, expected artifact

ChatGPT
  ↓ собирает точную задачу для Codex

Codex
  ↓ исполняет локально в repo по AGENTS.md и workflow-файлам

Результат Codex
  ↓ возвращается в Command Center для проверки и следующего решения
```

**Для длинной работы в Command Center обсуждение может вестись через `Stage_Plan_Protocol.md`.**

При architecture-sensitive работе Command Center использует `Architecture_Reasoning_Guide.md` как reasoning companion для определения масштаба решения, связанных decision areas и supporting lenses. Guide не является repo-side authority, не задаёт workflow и не принимает архитектурное решение.

OPS protocol начинается там, где нужно сформулировать задачу Codex, выбрать intent / route hint / expected artifact и проверить результат.

Главная идея:

* Command Center определяет и утверждает цель, scope и expected artifact. OPS Task передаёт approved execution contract Codex; для TS-B полная task-specific specification находится в referenced Stage Brief.
* Codex исполняет локально.
* Repo-side workflow files задают guardrails, routes, skills, agents, reports и ExecPlans.
* Решения остаются за Command Center.
* После любой write-задачи Codex фактические изменения передаются в Command Center через `Repo change handoff` до Review и Commit.

---

## 2. Что этот файл НЕ делает

OPS protocol не должен:

* заменять `AGENTS.md`;
* быть repo-side authority для Codex;
* дублировать все project guardrails;
* пересказывать полностью L0–L5, skills, `.agents/PLANS.md`, subagent `.toml` files или `report-writing`;
* превращаться в библиотеку жёстких prompt templates;
* утверждать implementation без approval;
* быть source of truth для проекта.

Если persistent rule нужно часто повторять, оно должно жить в своём repo-side owner-файле, а не копироваться в каждый prompt.

---

## 3. Роли

### 3.1. Пользователь

Пользователь отвечает за:

* цель;
* приоритет;
* допущения;
* бизнес/продуктовое решение;
* архитектурное approval;
* выбор, продолжать ли после findings/report;
* принятие или отклонение результата Codex.

### 3.2. ChatGPT

ChatGPT в Command Center помогает:

* понять задачу;
* при architecture-sensitive работе использовать `Architecture_Reasoning_Guide.md` как когнитивный индекс и учитывать текущее состояние `Architecture` из Stage Plan;
* разложить её на безопасный scope;
* выбрать intent и route hint;
* определить expected artifact;
* решить, нужен ли audit, code review, test-writing, report, ExecPlan, implementation, docs-update или subagent dispatch;
* применить Task Shape Router, создать OPS Task и при TS-B сначала Stage Brief;
* передать Codex фиксированный Launch Prompt с exact OPS Task path;
* проверить ответ Codex;
* после write-задачи определить режим `Repo change handoff` и вернуть пользователю точные copy-paste PowerShell-команды с фактическим scope, уникальным именем diff-artifact и необходимыми проверками;
* повторять `Repo change handoff → Review` после каждого Fix-loop и формировать финальный staged handoff после repo-affecting closure changes;
* подготовить точный follow-up, если Codex ошибся или что-то упустил.

ChatGPT не должен фантазировать о текущем состоянии repo, если файлы, diffs, reports или ответы Codex не предоставлены.

### 3.3. Codex

Codex работает локально в repo.

Codex должен:

* читать `AGENTS.md`;
* читать OPS Task после `AGENTS.md` как initial task envelope для задачи, переданной через OPS flow;
* использовать локальные workflow-файлы, если задача их вызывает;
* inspect repo before acting;
* держать diff focused;
* запускать validation по смыслу задачи;
* явно объяснять skipped validation;
* останавливаться при выходе за scope, approval gates или forbidden zones.

Codex не должен выполнять staging, unstaging, Commit или push без явной инструкции Command Center.

Summary Codex не является достаточным evidence фактических изменений: для write-задач Review опирается на `Repo change handoff`.

Codex может выбирать локальную тактику внутри approved scope.

---

## 4. Repo-side архитектура, которую должен понимать ChatGPT

Command Center не обязан знать каждую деталь repo-side файлов, но должен понимать их роли.

```text
Fixed Launch Prompt with exact OPS Task path
  ↓
AGENTS.md
  ↓
required initial OPS Task envelope: docs/codex/tasks/<task>.md
  ↓
reasoning-patterns, if route selection is triggered
  ↓
provisional route choice and selected exact route file path resolved by reasoning-patterns
  ↓
selected route file
  ↓
Stage Brief only when referenced by a brief-backed OPS Task
  ↓
route confirmation / reroute / stop on conflict
  ↓
applicable skills / PLANS / report-writing, if triggered by the external prompt, initial task envelope, route, or downstream artifacts, unless a skill defines a direct-task exception
  ↓
project docs/code, only as needed
  ↓
subagents, only if materially useful and allowed
  ↓
execution / validation / final handoff
```

This is a sequential bootstrap flow, not a parallel reading list. Direct repo-local tasks outside this OPS flow retain applicable direct-task exceptions from `AGENTS.md` and skills.
ChatGPT should not ask Codex to guess route file names.

If a task uses a route hint, Codex should resolve the exact route file path through `reasoning-patterns`.

### 4.1. Layer ownership

| Layer                                        | Что означает для ChatGPT                                                                                                                                      |
|----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `AGENTS.md`                                  | Главный project router + guardrails для Codex.                                                                                                                |
| `docs/codex/tasks/`                          | Required initial OPS Task envelopes for tasks transferred through this OPS flow.                                                                                  |
| `.agents/skills/reasoning-patterns/SKILL.md` | Выбор L0–L5 route и exact route file path resolution.                                                                                                         |
| `docs/codex/reasoning/<exact route file>.md` | Route-specific tactics after route path resolution.                                                                                                           |
| `.agents/skills/*/SKILL.md`                  | Reusable task procedures.                                                                                                                                     |
| `.codex/agents/*.toml`                       | Repo-local subagent role instructions: read-only auditors by default; explicitly declared write-limited agents may write only within their declared boundary. |
| `.agents/PLANS.md`                           | ExecPlan lifecycle для substantial implementation.                                                                                                            |
| `docs/codex/reports/`                        | Preserved analysis artifacts, not source of truth.                                                                                                            |
| `docs/codex/diff/`                           | Temporary ignored and untracked diff-artifacts для `Repo change handoff`; evidence for Review, not source of truth or approval.                               |
| `report-writing` skill                       | Формат и границы preserved reports.                                                                                                                           |
| `subagent-routing` skill                     | Dispatch approved read-only auditors and explicitly approved write-limited review agents.                                                                     |
| `docs/codex/stage_briefs/`                   | Full approved task-specific specification for TS-B; downstream only when its OPS Task references it.                                                          |
| `docs/codex/plans/`                          | Concrete ExecPlan artifacts.                                                                                                                                  |

`Architecture_Reasoning_Guide.md` является внешним Command Center companion и не входит в repo-side sequential bootstrap flow, если только он явно не referenced в задаче.

`docs/codex/diff/` также не является bootstrap layer, task envelope, Stage Brief, report или ExecPlan.

OPS должен зеркалить эту архитектуру для ChatGPT, но не подменять её.

---

## 5. Route glossary для Command Center

Route hint — это рекомендация, а не приказ.

Codex может downgrade/escalate route после inspection, если это безопаснее или точнее.

Базовая формула:

```text
Use the lightest sufficient route.
```

| Route                   | Когда использовать как hint                                     |
| ----------------------- | --------------------------------------------------------------- |
| `L0 Direct`             | Простая локальная low-risk задача.                              |
| `L1 Micro-plan`         | Маленькая задача на несколько понятных шагов.                   |
| `L2 Plan Iterations`    | Многошаговая implementation внутри approved scope.              |
| `L3 Independent Checks` | Audit, review, risk inspection, independent findings.           |
| `L4 Route Exploration`  | Архитектурное сравнение маршрутов до implementation.            |
| `L5 Deep Branching`     | Explicitly approved prototypes, deep branching, parallel paths. |

ChatGPT должен знать эти термины, чтобы ставить Codex понятные задачи.

Детали маршрутов живут в repo-side L-файлах.

---

## 6. Как ChatGPT собирает задачу Codex

OPS не задаёт один жёсткий task template для всех случаев.

ChatGPT собирает OPS Task из:

1. стабильного набора обязательных полей;
2. желательных полей, которые добавляются по смыслу;
3. task-specific constraints и context, необходимых именно для текущей задачи.

Любая задача, передаваемая Codex через OPS flow, получает OPS Task file:

```text
docs/codex/tasks/<task>.md
```

Перед сборкой задачи выбирается её форма:

**TS-A — Standalone OPS Task**

Используется, когда task-specific specification компактна, contract стабилен и отдельный Stage Brief не даёт достаточной preserved value.

OPS Task содержит:

```text
compact task specification
+
execution envelope
```

**TS-B — Brief-backed OPS Task**

Используется, когда нужно отдельно сохранить подробную approved specification: значимые решения, architecture / ownership constraints, крупный или многосоставной scope, substantial / resumable work или другой контекст, который не следует сжимать в execution envelope.

В этом случае:

```text
Stage Brief
= full approved task-specific specification

OPS Task
= execution envelope + exact Stage Brief reference
```

Task Shape Router выбирается по смыслу и preserved value отдельного Stage Brief, а не по количеству строк или файлов.

Command Center / пользователь может явно потребовать TS-B независимо от автоматического выбора.

Task shape — discriminator способа упаковки task-specific specification, а не новый workflow layer и не замена L0–L5 routing.

### Authoring order и loading order

Artifacts формируются в порядке:

Decision
→ Task Shape Router
→ Stage Brief, if TS-B
→ OPS Task
→ placement / verification
→ Fixed Launch Prompt

Codex читает их по sequential bootstrap flow:

Fixed Launch Prompt
→ AGENTS.md
→ OPS Task
→ route selection
→ selected route file
→ Stage Brief, if TS-B

Stage Brief создаётся раньше OPS Task, но читается позже неё и выбранного route file. Это намеренное разделение authoring и execution loading.

### 6.1. Обязательные поля

Почти каждая OPS Task должна содержать:

```text
Task shape:
<standalone / brief-backed>

Use AGENTS.md.

Workflow activation:
Follow the repository sequential bootstrap flow.
Treat this OPS Task as the initial task envelope read after AGENTS.md and before route selection.
If route selection is triggered, resolve the exact route file through `.agents/skills/reasoning-patterns/SKILL.md`; do not guess route file names.
For `brief-backed`, read the referenced Stage Brief after the selected route file and before project docs/code inspection.
If this OPS Task conflicts with AGENTS.md, applicable workflow files, or the referenced Stage Brief, stop and report the conflict before continuing.

Task:
<что именно нужно сделать; краткая самостоятельная формулировка результата задачи>

Intent:
<audit / code-review / test-writing / implementation / docs-update / route-analysis / report-only / other>

Scope:
<что разрешено читать или менять; exact files / layers, если они уже известны>

Expected artifact:
<chat answer / file report / audit findings / route comparison / implementation diff / docs update / code review verdict / Batched Code Review Report / test changes / ExecPlan / другой явно названный результат>

Constraints / out of scope:
<что нельзя делать, менять, расширять или решать в рамках этой задачи>

Validation / evidence:
<что проверить или запустить; какое evidence должно подтвердить результат; что допустимо пропустить и как объяснить skipped validation>

Stop / escalation:
<при каких новых фактах, конфликтах, scope changes или approval needs Codex должен остановиться и вернуть evidence вместо самостоятельного решения>

Final response:
<что именно Codex должен вернуть в чат после выполнения>
```

Для `brief-backed` задачи дополнительно обязательно указывается:

```text
Stage Brief:
<exact path>
```

### 6.2. Желательные поля

Добавляются только тогда, когда помогают исполнению задачи:

```text
Recommended route:
<L0 / L1 / L2 / L3 / L4 / L5 / auto-route>

Downstream task artifacts:
<Stage Brief / approved task-specific docs / none>

Architecture context:
<exact relevant constraints / boundaries / references / none>

Architecture authority:
<approved decision / Stage Brief / project source-of-truth / not yet approved>

Architecture references:
<exact relevant project source-of-truth references>

Affected architecture boundaries:
<task-specific constraints applicable to the work>

Files / layers to inspect:
<task-specific files or layers beyond standard bootstrap>

Files / layers not to touch:
<protected files, layers or boundaries>

Report:
<not needed / chat-only / file report if non-trivial findings / file report required>

Subagents:
<do not use / consider only / explicitly allowed / required for specific bounded questions>

ExecPlan:
<not needed / use if substantial / required>

Verification commands:
<exact commands, if already known and useful>

Existing findings / review context:
<stable finding IDs, reviewed baseline or other relevant context for Review / Fix-loop tasks>
```

Необязательные поля не заполняются ради формы.

### 6.3. Принцип сборки

ChatGPT должен:

* задавать только task-specific constraints;
* не копировать в OPS Task все постоянные guardrails из `AGENTS.md`;
* сохранять `Use AGENTS.md.` и короткий Workflow activation как явную стартовую опору, но не дублировать весь repo-side bootstrap;
* формулировать `Task` как самостоятельную и проверяемую задачу;
* указывать `Intent` явно;
* задавать `Scope` по causal coherence задачи, а не по количеству файлов или строк;
* указывать `Expected artifact` явно и выбирать его в соответствии с §7;
* явно отделять `Constraints / out of scope`;
* задавать validation как evidence contract, а не только перечень команд;
* задавать stop / escalation conditions там, где Codex не должен принимать новое решение самостоятельно;
* не смешивать audit и implementation без соответствующего approval;
* не просить Codex читать весь repo без причины;
* не хардкодить guessed route file names вроде `L2.md`;
* не просить report там, где достаточно короткого chat answer.

Для TS-A OPS Task должен быть самодостаточным в пределах compact specification и execution envelope.

Для TS-B:

* Stage Brief содержит полную approved task-specific specification;
* OPS Task содержит execution envelope и exact Stage Brief path;
* полный Stage Brief не копируется в OPS Task;
* route / execution instructions не дублируются в Stage Brief без необходимости.

Для architecture-sensitive работы:

* TS-A передаёт exact relevant architecture references / constraints через OPS Task;
* TS-B передаёт их через Stage Brief;
* implementation-задача должна опираться на `Existing` / `Approved` решение либо действующий project source of truth;
* `Proposed` допустим только для read-only Audit, route-analysis или проверки alternatives и не является implementation approval;
* Codex не должен восстанавливать отсутствующий accepted architecture contract по памяти или форме кода.

Для repo foundation и задач, изменяющих `AGENTS.md`, OPS Task явно задаёт разрешённые paths / sections, expected artifact и validation / evidence. Foundation specification и architecture references / constraints передаются по выбранной ветке TS-A / TS-B без второго параллельного источника. Lifecycle, распределение ответственности и защита AGENTS core определяются §3.3 и §7.6 `Stage_Plan_Protocol.md`; выбор task shape остаётся за Task Shape Router.

Обязательные существующие inputs отделяются от разрешённых к созданию outputs. Ещё не созданный output не используется как существующий source of truth и не подменяет обязательный input. Bootstrap placement должен обеспечить требуемые входные файлы до первого Codex launch.

Для substantial implementation перед edit действует принцип:

```text
inspect actual repo
→ compare with accepted contract
→ preserve already-correct behavior
→ edit only actual gaps
```

Substantial implementation может выполняться последовательными bounded slices внутри одной approved OPS Task и применимого ExecPlan. Slice не становится новым Stage, Step, OPS Task или approval boundary, пока сохраняются accepted scope / contract / material risk. Детали sliced execution, включая уместную раннюю вертикальную validation, принадлежат `.agents/PLANS.md`; это не меняет существующие Repo change handoff / Review obligations.

Новые факты во время исполнения не означают автоматическое расширение scope:

* execution discovery внутри unchanged approved contract → continue;
* control-spec problem, требующая изменить accepted architecture / ownership / public or persistence contract / dependency / material scope / requirements / material risk → stop and return evidence for `Decision gate`;
* adjacent finding, не блокирующая текущий result → record without automatic scope expansion.

Fix-loop исправляет implementation defect при неизменном accepted contract и не используется для redesign самого contract.

### 6.4. Fixed Launch Prompt

Launch Prompt не является task specification.

Он только активирует repo-side workflow и передаёт exact OPS Task path:

```text
Use AGENTS.md.

Execute:
docs/codex/tasks/<TASK_FILE>.md

Follow the repository sequential bootstrap flow.
```

Единственная task-specific переменная в Launch Prompt — `<TASK_FILE>`.

В Launch Prompt не переносятся:

* Task;
* Scope;
* architecture decisions;
* validation contract;
* route details;
* Stage Brief content;
* постоянные repo guardrails.

Задача передаётся в порядке:

```text
TS-A:
OPS Task
→ placement
→ Fixed Launch Prompt

TS-B:
Stage Brief
→ OPS Task
→ placement
→ Fixed Launch Prompt
```

Placement должен использовать exact paths и проверять ожидаемое состояние до и после операции.

---

## 7. Expected artifact decision

Перед постановкой задачи ChatGPT должен решить, какой результат нужен.

| Expected artifact            | Когда выбирать                                                                                                                                                               |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `chat answer`                | Мелкая консультация, простая проверка, короткий вывод.                                                                                                                       |
| `file report`                | Содержательный audit/review/research/route-analysis, который нужно сохранить.                                                                                                |
| `audit findings`             | Read-only findings без implementation.                                                                                                                                       |
| `route comparison`           | Нужно сравнить архитектурные/implementation routes.                                                                                                                          |
| `implementation diff`        | Есть approved scope на изменение файлов.                                                                                                                                     |
| `docs update`                | Нужно обновить конкретный docs-файл после approved decision/change.                                                                                                          |
| `code review verdict`        | Нужно проверить implementation diff и получить review result.                                                                                                                |
| `Batched Code Review Report` | Broad/risky/multi-file review требует preserved review analysis under `docs/codex/reports/`.                                                                                 |
| `test changes`               | Нужно написать или обновить тесты inside approved test-writing scope.                                                                                                        |
| `ExecPlan`                   | Substantial, staged, long-running, architecture-sensitive или resumable implementation. Save concrete ExecPlan files under `docs/codex/plans/` when persistence is required. |
| `post-Codex fix`             | Codex уже ответил, но ошибся, пропустил поле, нарушил формат или scope.                                                                                                      |

Если expected artifact не выбран, Codex может вернуть неудобный для Command Center формат.

---

## 8. Когда просить report

Просить file report, если audit / review / research / route-analysis / architecture comparison / risk analysis / modernization analysis:

* нетривиальны;
* должны быть сохранены для дальнейшего решения;
* содержат findings, которые нужно передать в следующий шаг;
* требуют evidence, severity, comparison или recommendation.

Для лёгкой read-only проверки обычно достаточно chat answer или audit findings без file report.

Формулировка:

```text
Create a file report in docs/codex/reports/ if the audit/review produces non-trivial findings or if preserved analysis is needed.
In chat, return only report path, short summary, key blockers/risks, checks, and next safe step.
```

Не просить report по умолчанию для:

* L0/L1 мелких задач;
* простых docs-only правок;
* обычной implementation без preserved analysis;
* простого code review, если достаточно verdict;
* docs-update, если достаточно docs-update output.

Report не является source of truth и не разрешает implementation.

If the task uses a Stage Brief, ask Codex to include the Stage Brief path in the report metadata or summary.

A report does not override the Stage Brief.

### 8.1. Batched Code Review Reports

Просить Batched Code Review Report, если code review:

* broad;
* risky;
* multi-file;
* architecture-sensitive;
* touches multiple layers;
* involves DB/storage/network/filesystem/config/security/auth;
* involves LLM/provider/prompt/schema/tool/eval logic;
* involves async/concurrency/retry/timeout/cancellation/cleanup/idempotency;
* needs preserved intermediate batch findings.

Формулировка:

```text
Use `review-code`.
If large/batched review is needed, create or update exactly one Batched Code Review Report under `docs/codex/reports/`.
Use `<report_path>` if provided.
If `<review_focus>` is provided and report path is generated, include the focus suffix in the filename.
The report is preserved review analysis only and does not authorize implementation.
```

If `code_reviewer` is used, it may create or update exactly one approved Batched Code Review Report under `docs/codex/reports/` according to its `.toml` and `review-code/SKILL.md`.

---

## 9. Когда просить ExecPlan

Просить ExecPlan, если задача:

* long-running;
* multi-file;
* implementation-heavy;
* architecture-sensitive;
* staged;
* требует resumable work;
* приближается к L5;
* явно должна выполняться по плану.

Формулировка:

```text
Use ExecPlan according to `.agents/PLANS.md` if the work is substantial, long-running, implementation-heavy, architecture-sensitive, staged, or needs resumable context.
```

If the ExecPlan must be saved as a repository artifact, request it under:

```text
docs/codex/plans/<task-slug>-execplan.md
```

ExecPlan should structure execution inside approved scope.

It should not replace route selection or Stage Brief reading.

For Stage Brief based implementation, Codex should read the Stage Brief after the selected route file and before deciding whether an ExecPlan is required by local workflow, unless the direct task is specifically about an ExecPlan.

Не просить ExecPlan для:

* простых локальных правок;
* маленьких docs-only изменений;
* audit-only задач;
* route-analysis без implementation.

---

## 10. Когда просить code review

Просить code review, если нужно проверить implementation diff, risky change или broad multi-file change before acceptance.

### 10.1. Обычный code review

Для code review использовать repo-side `review-code` skill.

Review-задача оформляется полноценной OPS Task по §6. Обязательные поля §6.1 сохраняются; этот раздел задаёт только review-specific inputs и требования и не является вторым самостоятельным task template.

Review проверяет не только качество implementation, но и соответствие фактического candidate result исходному approved contract.

Для Review явно передаются:

* фактический diff / changed files и применимый baseline / candidate context;
* исходная OPS Task;
* Stage Brief исходной работы, если используется TS-B;
* relevant validation evidence;
* известные risks / blockers;
* findings предыдущих Review / Fix-loop cycles с существующими stable IDs, если они уже назначены;
* для architecture-sensitive Review — exact relevant architecture references / constraints из применимого OPS Task или Stage Brief.

Ссылки на исходную OPS Task / Stage Brief являются входами проверки. Review не создаёт альтернативную specification и не переопределяет исходный approved contract.

Review-specific часть OPS Task может выглядеть так:

```text
Intent:
code-review

Recommended route:
L3 Independent Checks or auto-route

Expected artifact:
code review verdict

Review inputs:
- <exact diff / changed files and baseline or candidate reference>
- <original OPS Task path>
- <Stage Brief path, if applicable>
- <relevant validation evidence>
- <known risks / blockers>
- <prior findings and stable finding IDs, if applicable>
- <exact applicable architecture references / constraints, if required>

Task:
Check the actual candidate result against the original approved Task / Brief.
Review correctness, architecture, contracts, tests, safety, maintainability, performance and integration risk.

Constraints / out of scope:
- Use `review-code` if triggered.
- Do not broaden Review beyond the assigned scope.
- Do not reconstruct missing accepted architecture from memory or code shape.
- Do not implement fixes unless explicitly approved and permitted by the active execution boundary.

Validation / evidence:
Base findings on the supplied candidate evidence and relevant repository context.
Clearly identify checks that could not be completed and why.

Final response:
Return the review verdict, evidence-backed findings, missing tests or checks, suggested verification, remaining risks, and any blocked / incomplete review lenses.
```

Architecture conformance остаётся одним из существующих review lenses, а не отдельным Review workflow.

Если обязательный architecture input отсутствует, недоступен или конфликтует, architecture-conformance lens считается `blocked / incomplete`. Остальные применимые review lenses продолжаются внутри assigned scope, но результат нельзя представлять как полностью завершённый architecture-conformance Review.

Code review verdict не является implementation approval, architecture approval, merge approval, Commit approval или release approval, если surrounding workflow явно не наделяет его таким значением.


Code review verdict is not implementation approval, architecture approval, merge approval, commit approval or release approval unless the surrounding workflow explicitly grants that meaning.

### 10.2. `review_focus`

Use `review_focus` when the review should be biased toward a specific lens.

Useful values:

```text
general_review
architecture_and_contracts
correctness_and_data_flow
security_and_safety
tests_and_verification
llm_agentic_tool_boundaries
performance_and_resources
integration_and_operations
```

Формулировка:

```text
Review focus:
<review_focus>

Use this as the primary review lens.
Still report clearly visible blocker or major issues outside the focus if they are within assigned scope.
Do not broaden review beyond assigned scope.
```

### 10.3. `code_reviewer`

Use `code_reviewer` through `subagent-routing` when independent write-limited code review materially reduces risk.

Good cases:

* broad/risky/multi-file diff;
* architecture-sensitive implementation;
* large review likely to lose cross-file context;
* review requiring Batched Code Review Report;
* review where independent findings are useful before acceptance.

Формулировка:

```text
Subagents:
Explicitly allowed to dispatch `code_reviewer` through `subagent-routing` if it materially reduces risk.

Code reviewer boundary:
- Use `.agents/skills/review-code/SKILL.md`.
- May create/update exactly one Batched Code Review Report under `docs/codex/reports/`.
- Must not edit code, tests, configs, docs, source-of-truth files, workflow files, task envelopes, Stage Briefs, ExecPlans, agents or skills.
- Must not implement fixes.
- Must not commit.
```

### 10.4. Multi-focus review

For broad or risky review, parent Codex may run several independent `code_reviewer` invocations with different `review_focus` values.

Correct model:

```text
agents-per-focus
not agents-per-batch
```

Do not split reviewers by batch by default.

Batching is internal to a single reviewer and its report.

Multi-focus orchestration belongs to parent Codex / `subagent-routing` / Command Center, not to the individual `code_reviewer`.

Do not tell an individual `code_reviewer` that sibling reviewers exist unless the explicit task is consolidation.

Example formulation:

```text
For broad/risky review, consider multi-focus review through `subagent-routing`.

If used, run independent `code_reviewer` invocations by review lens, not by file batch.

Suggested review_focus values:
- architecture_and_contracts
- correctness_and_data_flow
- security_and_safety
- tests_and_verification

Each invocation must receive its own bounded review envelope and its own report path under `docs/codex/reports/`.

Do not ask individual reviewers to coordinate with each other.
Parent Codex should consolidate findings after they return.
```

---

## 11. Когда просить write-tests

Use `write-tests` when the task grants approved test-writing scope.

Good cases:

* add missing tests;
* update stale tests after approved behavior change;
* add regression coverage;
* cover public contracts;
* cover boundary behavior;
* cover LLM/tool/provider/schema behavior;
* cover DB/storage/filesystem/network/CLI/API behavior;
* strengthen validation for risky implementation.

Do not use `write-tests` for read-only test risk audit.

Use `test_auditor` for read-only test audit.

### 11.1. Required clarity

A test-writing task should provide or allow Codex to derive:

* test goal or expected behavior;
* target files, changed files or diff;
* approved scope to write tests;
* relevant architecture rules;
* verification commands when known;
* out-of-scope boundaries.

If expected behavior is ambiguous, Codex should stop and report ambiguity instead of writing speculative tests.

For architecture-relevant tests, use the same exact accepted architecture references / constraints supplied through the active TS-A OPS Task or TS-B Stage Brief. Codex may inspect code to design coverage, but must not derive a missing accepted architecture contract from code shape; missing required context blocks that lens.

### 11.2. Prompt formulation

```text
Intent: test-writing
Expected artifact: test changes
Use `write-tests` if triggered.

Task:
Write or update tests for <behavior / bug / regression / contract>.

Expected behavior:
<source-of-truth behavior or acceptance criteria>

Scope:
- May edit tests related to <target>.
- May inspect target implementation files.
- Do not broaden scope.

Constraints:
- Follow existing local test style.
- Reuse existing fixtures/mocks/helpers when appropriate.
- Do not add new test libraries or dependencies without approval.
- Do not call real external services.
- Do not change production code unless fix scope is explicitly approved or a minimal local fix is necessary and safely inside approved scope.

Validation:
Run the most specific relevant test command first.
Run broader checks only if relevant and safe.
Report skipped validation with reasons.

Final response:
Return tests changed, scenarios covered, mocks/fixtures/helpers used or added, production changes if any, verification results and remaining risks.
```

### 11.3. Production-code boundary

If tests expose a production bug:

* Codex may fix production code only if active task explicitly includes fix scope; or
* the fix is minimal, local, necessary to complete requested coverage, and safely inside approved scope.

Otherwise Codex should report the bug and ask for approval before fixing.

---

## 12. Когда разрешать subagents

Subagents полезны, когда дают независимое покрытие риска, закрывают inspection gap или materially уменьшают нагрузку основного контекста.

Уместные случаи:

* architecture audit;
* test risk audit;
* docs consistency audit;
* broad / risky code review;
* route comparison;
* risky implementation planning;
* independent findings before acceptance;
* multi-focus code review.

Не использовать subagents для L0/L1 по умолчанию.

Формулировка:

```text
Use relevant existing approved subagents only if they materially reduce risk, improve independent coverage, close inspection gaps, or reduce main-context load through summary.
```

Subagent mode должен быть явным:

* `do not use subagents`;
* `consider subagents, but dispatch only if materially useful`;
* `explicitly allowed to dispatch existing approved subagents for bounded read-only audit questions`;
* `explicitly allowed to dispatch code_reviewer for bounded write-limited code review`;
* `required to dispatch specific approved subagents for specific bounded questions`.

Parent Codex передаёт каждому subagent bounded brief с:

```text
Assigned question:
<конкретный вопрос>

Scope:
<что разрешено читать / проверять>

Relevant inputs:
<task-specific evidence и references>

Expected output:
<findings / verdict / report / recommendation>

Constraints:
<применимые boundaries и permissions>
```

Если assigned question или review focus затрагивает architecture / contracts, parent дополнительно передаёт:

* relevant OPS Task;
* Stage Brief для TS-B;
* тот же exact relevant architecture contract, который применяется в основной Task / Review.

Можно передавать exact references вместо копирования полного contract.

Subagent не должен:

* полагаться на неявно inherited architecture context;
* самостоятельно восстанавливать accepted architecture из памяти или формы кода;
* расширять scope из-за отсутствующего input.

Если обязательный input отсутствует, соответствующая проверка считается blocked / incomplete.

Нерелевантному subagent полный architecture context не передаётся.

Для multi-focus review сохраняется модель:

```text
agents-per-focus
not agents-per-batch
```

Каждый reviewer получает собственный bounded review envelope и, если нужен preserved report, собственный exact report path.

Существенные findings сохраняют существующую identity при переходе между subagent report, consolidation, Fix Task и следующим Review. Merge или split finding identities должен быть явным.

Если subagents недоступны или запрещены environment policy, Codex продолжает manual-only только когда это безопасно и явно сообщает ограничение. Такой fallback не устраняет отсутствующий обязательный input.

Для L3 можно писать сильнее:

```text
Consider relevant existing approved subagents and consolidate findings by severity and evidence.
```

Subagents предоставляют findings, recommendations, verdicts или reports только в границах своих `.toml`.

Передача контекста не расширяет permissions.

Subagents не принимают architecture decisions, а их output не разрешает implementation.

---

## 13. Stop conditions

Codex должен остановиться перед действием и вернуть конкретный missing input, conflict или требуемый approval, если:

* обязательный task-specific input отсутствует, недоступен или противоречит OPS Task / Stage Brief / repo constraints;
* обязательный architecture input отсутствует, недоступен или противоречив;
* обнаружен control-spec problem: для продолжения требуется изменить accepted requirements или управляющую specification;
* требуется expansion beyond approved scope;
* появляется новый material risk class, не покрытый текущим approval;
* требуется не разрешённое текущим scope изменение architecture / ownership;
* требуется новая dependency;
* требуется изменение DB / persistence / state model;
* требуется изменение workflow transitions;
* требуется изменение public behavior;
* требуется изменение prompt / schema / model / provider / tool policy;
* требуется затронуть forbidden zones из `AGENTS.md`;
* требуется L5 deep branching без explicit approval;
* предполагаются unrelated validation fixes;
* требуется source-of-truth docs update вне approved scope;
* требуется изменение agent / skill / workflow file вне approved scope;
* требуется изменение protected `AGENTS.md` §§3–4 без отдельного explicit Command Center architecture decision и заранее обозначенного scope;
* предполагаются code / test / config / script edits во время read-only audit;
* требуется staging, unstaging, Commit или push без явной инструкции Command Center;
* действие выходит за permissions выбранного subagent.

Неблокирующий adjacent finding сам по себе не останавливает текущую Task.

Он:

```text
record
→ preserve for disposition
→ do not expand current scope automatically
```

Fix-loop исправляет implementation относительно неизменного accepted contract.

Если исправление требует изменить accepted architecture, ownership, requirements или другую управляющую specification:

```text
STOP
→ evidence
→ Decision gate
```

и работа не продолжается как локальный implementation Fix-loop.

Создание diff-artifact не разрешает Codex самостоятельно менять index. Technical baseline, final staging и другие Git mutations выполняются только по точным инструкциям Command Center и правилам Stage Plan.

В OPS Task достаточно короткой активации общего ограничения:

```text
Stop and report before touching anything outside approved scope.
```

и конкретных task-specific `Stop / escalation` условий из §6.1.

Не нужно копировать все постоянные guardrails в каждую OPS Task.

ExecPlan, validation success, findings, report, audit result или reviewer verdict сами по себе не расширяют approval.

---

## 14. Как анализировать ответ Codex

После ответа Codex Command Center проверяет:

* выполнил ли Codex task intent;
* не вышел ли за scope;
* использовал ли route разумно;
* объяснил ли route deviation, если было;
* не нарушил ли `AGENTS.md`;
* не создал ли лишние файлы;
* корректно ли использовал report / ExecPlan;
* понятны ли changed files или report path;
* есть ли validation evidence или skipped reason;
* есть ли risks/blockers;
* понятен ли next safe step;
* проверен ли `git status`, если repo был затронут.
* сохранилась ли identity reviewed candidate state и material findings через циклы;
* отделён ли implementation defect для Fix-loop от control-spec problem для `Decision gate`;
* определены ли `Documentation impact` и `AGENTS impact` перед closure.

### 14.1. Если был code review

Проверь:

* есть ли verdict;
* есть ли findings с evidence;
* не спутан ли review verdict с approval;
* есть ли missing tests / suggested verification;
* есть ли remaining risks;
* если был Batched Code Review Report, указан ли report path;
* если использовался `code_reviewer`, не написал ли он что-то кроме одного approved report under `docs/codex/reports/`;
* если был multi-focus review, не перезаписали ли reviewers один и тот же report;
* если была consolidation, не скрыты ли индивидуальные findings без объяснения.

### 14.2. Если был write-tests

Проверь:

* какие tests added/changed;
* какие scenarios covered;
* какие mocks/fixtures/helpers used or added;
* были ли production changes;
* есть ли отдельное объяснение production changes, если они были;
* были ли verification commands run;
* есть ли skipped validation reasons;
* остались ли uncovered cases or risks.

### 14.3. Если был subagent dispatch

Проверь:

* был ли subagent реально нужен;
* был ли brief bounded;
* не получил ли subagent лишние permissions;
* соблюдал ли subagent свой `.toml`;
* attached ли evidence к findings;
* корректно ли consolidated findings;
* не превращены ли findings/reports в implementation approval.

Если ответ неполный, следующая задача должна быть точной, а не общей.

Принцип follow-up:

```text
You missed <specific issue>.
Do not broaden scope.
Fix/check only <specific target>.
Return <expected artifact>.
```

### 14.4. Если Codex изменил repo

После любой write-задачи Codex Command Center не ограничивается summary или перечнем changed files.

До Review формируется `Repo change handoff`, включающий:

* точный task scope;
* baseline и однозначно определённый candidate state / delta;
* `git status --short --untracked-files=all`;
* отдельный `.diff` текущего delta;
* diff stat;
* `git diff --check` или `git diff --cached --check`;
* выполненную validation и причины skipped checks;
* summary Codex и известные risks / blockers.

Для Review также передаётся task-specific contract, необходимый для проверки результата:

* OPS Task;
* Stage Brief для TS-B;
* exact relevant architecture references / constraints для architecture-sensitive работы.

Для первого изменения при чистом task scope формируется initial delta.

Новые untracked-файлы при необходимости регистрируются через `git add -N`, чтобы они попали в patch без staging их содержимого. Перед такой операцией проверяются exact scope и существующее состояние index.

Каждый Review / Fix-loop cycle использует отдельный Stage-bound diff-artifact в:

```
docs/codex/diff/
```

Diff-artifacts не перезаписываются между циклами и не являются source of truth или approval.

Default write-cycle:

```
write-задача
→ Repo change handoff
→ Review
→ [Fix-loop → Repo change handoff → Review]*
→ closure changes, if applicable
→ final staged handoff
→ final Command Center acceptance
→ Commit
→ Remote Sync + verification, if required
```

Fix-loop применяется, если accepted contract остаётся верным, а implementation ему не соответствует.

Если correction требует изменить accepted architecture, ownership, public / persistence contract, dependency, material scope, requirements или material risk, работа выходит из Fix-loop и возвращается в `Decision gate`.

Для небольших причинно связанных corrections внутри unchanged contract допустим cumulative fast-path с одним cumulative handoff перед terminal Review; он не применяется при новой архитектуре, новом public / persistence contract, dependency или material risk.

Перед финальным staging должны быть разрешены применимые `Documentation impact`, `AGENTS impact` и archive / cleanup changes.

Финальный staged handoff формируется только после всех принятых repo-affecting closure changes и представляет полный candidate state, который предполагается принять в Commit.

`Commit` и `Remote Sync` — разные операции. Если Remote Sync требуется, после push проверяются local `HEAD`, expected remote branch SHA и final repo state.

Command Center самостоятельно возвращает точные copy-paste PowerShell-команды с фактическим scope.

Codex summary, report или validation без фактического `Repo change handoff` не заменяют Review.


---

## 15. Как использовать карту архитектуры

`Architecture_Map.md` — optional Command Center companion к OPS protocol для ChatGPT.

Карта обычно загружается в чат вместе с OPS, когда нужно быстро восстановить структурную модель Codex workflow.

Карта не является repo-side authority и не предполагается как обязательный файл внутри repo.

Карта нужна, чтобы быстро увидеть:

* какие слои входят в Codex workflow;
* какой слой чем владеет;
* где route files;
* где skills;
* где subagents;
* где reports;
* где ExecPlan;
* где находятся initial task envelopes и downstream task artifacts;
* где находятся Stage Briefs;
* как initial task envelopes связаны с Stage Briefs.

OPS protocol объясняет **как работать** с Codex.

Карта архитектуры показывает **что где находится**.

Карта не выбирает route и не задаёт exact route file path.

Exact route file path resolution остаётся за `reasoning-patterns`.

OPS должен быть понятен без карты, но карта помогает быстрее загрузить структурную модель системы.

### 15.1. Architecture Reasoning Guide

`Architecture_Reasoning_Guide.md` — внешний Command Center companion для architecture-sensitive работы.

Он помогает:

* определить масштаб архитектурного вопроса;
* увидеть связанные decision areas;
* активировать релевантные подходы, patterns, tactics и practices;
* применить supporting lenses;
* не смешивать system topology, application architecture, code organization и local design patterns.

Guide не является:

* project source of truth;
* repo-side workflow layer;
* route selector;
* implementation approval;
* заменой repo evidence;
* обязательным checklist для каждой задачи.

Архитектурное решение и approval остаются за Command Center. Codex может предоставлять evidence, alternatives, risks и recommendation.

---

## 16. Короткая формула

```
Architecture_Reasoning_Guide
→ активирует релевантные decision areas и supporting lenses для Command Center

Stage Plan
→ ведёт Architecture state и определяет Step / Gate / Decision gate / optional Codex Audit / Review / Fix-loop / closure

Command Center
→ определяет и утверждает цель, scope, expected artifact и применимый architecture contract

Task Shape Router
├─ TS-A → standalone OPS Task
└─ TS-B → Stage Brief → brief-backed OPS Task

Architecture context
├─ TS-A → OPS Task
└─ TS-B → Stage Brief

Fixed Launch Prompt
→ передаёт только exact OPS Task path и активирует repo-side bootstrap

AGENTS.md
→ задаёт repo guardrails и sequential bootstrap flow

OPS Task
→ initial task envelope до route selection

reasoning-patterns
→ выбирает provisional route choice и exact route file path

Selected route file
→ задаёт тактику

Stage Brief, only for TS-B
→ downstream full approved task-specific specification

skills
→ задают reusable procedures:
  - review-code → code review methodology
  - write-tests → approved-scope test implementation
  - report-writing → preserved reports
  - subagent-routing → agent dispatch and consolidation

agents
→ задают bounded specialist roles:
  - read-only auditors → findings only
  - code_reviewer → write-limited independent review report

PLANS.md
→ ведёт substantial implementation внутри approved scope

reports / diff-artifacts
→ сохраняют analysis / Review evidence, но не являются source of truth или approval

Codex
→ исполняет локально внутри approved contract

После write-задачи:
Codex result
→ Repo change handoff
→ Review
→ Fix-loop, если contract остаётся неизменным
  / Decision gate, если требуется изменить contract
→ Documentation impact / AGENTS impact / applicable archive closure
→ final staged handoff
→ final Command Center acceptance
→ Commit
→ Remote Sync + verification, if required

Решения и approval остаются за Command Center.
```
