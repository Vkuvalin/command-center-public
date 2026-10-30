# AGENTS.md

Стартовый router + guardrails для Codex/agents в `название проекта`.

`AGENTS.md` хранит не всё, что Codex может узнать.
`AGENTS.md` хранит то, что Codex не имеет права забыть.

## 1. Purpose

`текст`

## 2. Current Project State

`текст`

<!-- BEGIN MANAGED REPO WORKFLOW CORE -->
<!-- Shared repo-local bootstrap/routing contract. Centrally synchronized; project-specific rules belong outside this block. -->

## 3. Context Loading Rules

Do not read all docs, routes, skills, agents, or source files by default.

Minimum context by default:

* `AGENTS.md`;
* the exact task envelope referenced by the Launch Prompt, read after `AGENTS.md` and before route selection;
* files directly related to the task.

Read additional files only when the task requires them.

Rules:

* Keep context loading narrow and task-specific.
* Do not scan the whole repo unless the task clearly requires it.
* Do not batch-read workflow files from later bootstrap layers before the current layer resolves what should be read next.
* Do not treat preserved reports as source of truth.
* Do not create new planning, memory, review, audit, routing, or workflow systems without explicit approval.
* Sections §3 (Context Loading Rules) and §4 (Agentic Workflow) are protected workflow core. Changes require a separate explicit architecture decision and predefined scope; every change must receive explicit Review before acceptance.
* If required context is missing or the task depends on an unapproved decision, stop and report what is missing.

## 4. Agentic Workflow

Используй локальный agentic workflow, когда это снижает риск, уменьшает повторение промптов, помогает удержать scope, улучшает независимую проверку или делает long-running work более управляемой.

Agentic workflow не заменяет `AGENTS.md`, task prompt, explicit approval, fixed scope, project architecture rules и validation gates.

Workflow-файлы задают локальную процедуру исполнения. Они не являются product requirements, не принимают architecture decisions и не дают permission на implementation.

### Agentic Workflow Map

Эта карта показывает, какой локальный workflow-файл читать дальше. Она не заменяет route files, skills, `.agents/PLANS.md`, agents или `report-writing`. Она указывает на owners, но не дублирует их процедуры.

Sequential bootstrap flow:

```text
Launch Prompt with exact task envelope path
  ↓
AGENTS.md
  ↓
initial task envelope: docs/codex/tasks/<task>.md
  ↓
reasoning-patterns, if route selection is triggered
  ↓
provisional route choice and selected exact route file path resolved by reasoning-patterns
  ↓
selected route file
  ↓
downstream task artifacts, if referenced
  ↓
route confirmation / reroute / stop on conflict
  ↓
applicable skills / PLANS / report-writing, if triggered
  ↓
project docs/code, only as needed
  ↓
subagents, only if materially useful and allowed
  ↓
execution / validation / final handoff
```

Important!

```text
This flow is sequential, not a parallel reading list.

Do not batch-read files from later layers before the current layer has resolved what should be read next.

Route labels are not file names. Do not infer route file paths from labels such as L2, L3, or Plan Iterations.

The exact route file path must be resolved by `.agents/skills/reasoning-patterns/SKILL.md` before opening any `docs/codex/reasoning/*` file.

The initial task envelope is the task artifact referenced by the Launch Prompt.

It is read after `AGENTS.md` and before route selection.

It is not a downstream task artifact.

Task envelope may use one of two packaging forms:

Standalone (TS-A) → task envelope contains the required compact task specification.
Brief-backed (TS-B) → task envelope references a downstream specification artifact.

Packaging form affects artifact loading, but it does not define routing, permissions, or workflow ownership.

Referenced original Tasks / Briefs in a review task are review inputs, not an alternative specification for that review.

Direct repo-local tasks retain explicitly defined direct-task exceptions; requirements that apply to the managed OPS-task path do not make an OPS Task mandatory for those direct tasks.
```

Layer ownership:

| Layer                                        | Use / read when                                                                                           | Owns                                                                                                                                |
|----------------------------------------------|-----------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| `AGENTS.md`                                  | always first after external task prompt                                                                   | project guardrails, approval boundaries, workflow entrypoints                                                                       |
| `docs/codex/tasks/`                          | initial task envelopes referenced by the Launch Prompt; read after `AGENTS.md` and before route selection | task envelope                                                                                                                       |
| `.agents/skills/reasoning-patterns/SKILL.md` | `L0-L5`, route hint, auto-route, ExecPlan mention или route-selection task                                | route selection                                                                                                                     |
| `docs/codex/reasoning/<exact route file>.md` | only after reasoning-patterns resolves the exact path                                                     | route-specific tactics                                                                                                              |
| `.agents/skills/*/SKILL.md`                  | when task intent triggers the skill                                                                       | reusable task procedure                                                                                                             |
| `.codex/agents/*.toml`                       | through `subagent-routing` or explicit bounded task                                                       | repo-local subagent role instructions; read-only by default unless an agent explicitly declares a narrower write-limited permission |
| `.agents/PLANS.md`                           | substantial, staged, long-running, implementation-heavy или resumable work                                | ExecPlan lifecycle                                                                                                                  |
| `docs/codex/reports/`                        | when preserved analysis is explicitly requested or clearly needed                                         | report artifacts, not source of truth                                                                                               |
| `docs/codex/diff/`                           | only when the task explicitly references a diff artifact                                                  | temporary ignored and untracked Repo change handoff artifacts for Review; not source of truth or approval                           |
| `docs/codex/stage_briefs/`                   | downstream specification artifact when referenced by the task envelope                                    | detailed specification artifact                                                                                                     |
| `docs/codex/plans/`                          | when an ExecPlan must be preserved as a repository artifact                                               | concrete ExecPlan files                                                                                                             |

Route map:

| Route | Use for                                                |
| ----- | ------------------------------------------------------ |
| `L0`  | simple local low-risk task                             |
| `L1`  | small task with a few clear steps                      |
| `L2`  | multi-step implementation inside approved scope        |
| `L3`  | audit, review, risk inspection, independent findings   |
| `L4`  | architecture-sensitive route comparison                |
| `L5`  | approved prototypes, deep branching, or parallel paths |

Operating rules:

* Use the lightest sufficient route.
* Follow the bootstrap flow sequentially.
* Do not open route files by guessed names.
* If the external task prompt references `docs/codex/tasks/<task>.md`, read that initial task envelope after `AGENTS.md` and before route selection.
* Read `reasoning-patterns` before any route-specific file whenever route selection is triggered.
* Treat the route choice as provisional until downstream task artifacts have been checked.
* Read the required exact task envelope referenced by the Launch Prompt after `AGENTS.md` and before route selection.
* After reading downstream task artifacts, confirm the route, reroute through `reasoning-patterns`, or stop and report a conflict before continuing.
* Read only the exact route file resolved by `reasoning-patterns`, unless comparing or auditing routes.
* Read only triggered skills.
* Preserve direct-task exceptions defined by triggered skills, such as report-only, ExecPlan-only, explicitly requested subagent audit tasks, or explicitly requested write-limited review tasks.
* Do not read all docs, all routes, all skills, all agents, or the whole repo by default.
* Use subagents only when they materially reduce risk, improve independent coverage, close inspection gaps, or reduce main-context load through summary.
* Subagent permissions come from each `.toml`; `subagent-routing` does not grant additional write permission.
* Reports preserve analysis and do not approve implementation.
* `docs/codex/diff/` is not a bootstrap layer or project source of truth. Read or write artifacts there only when the active task explicitly references or requests them, and do not treat a diff as implementation, architecture, merge, Commit or release approval.
* ExecPlans organize approved substantial work, but do not override `AGENTS.md`, task prompt, fixed scope or approval boundaries.
* If the task prompt, initial task envelope or referenced downstream task artifacts conflict with `AGENTS.md`, applicable workflow files or each other, stop and report the conflict.
* If a referenced workflow file, skill or subagent is unavailable in the current environment, continue manually only if safe, and explicitly report what was unavailable.

### Source files

* `.codex/agents/*.toml` — repo-local subagent instructions. Most agents are read-only auditors. An explicitly declared write-limited agent may write only inside its declared boundary.
* `.agents/skills/*/SKILL.md` — repo-scoped skill instructions.
* `.agents/PLANS.md` — ExecPlan rules for substantial long-running implementation work.
* `docs/codex/reasoning/<exact route file>.md` — route-specific execution tactics; exact route paths are owned by `reasoning-patterns`.
* `docs/codex/reports/` — preserved Codex audit/review/research artifacts.
* `docs/codex/diff/` — temporary ignored and untracked Repo change handoff artifacts used for Review before Commit.
* `docs/codex/tasks/` — initial task envelopes referenced by the Launch Prompt; read after `AGENTS.md` and before route selection.
* `docs/codex/stage_briefs/` — downstream approved task-specific Stage Briefs; full specification for TS-B brief-backed tasks.
* `docs/codex/plans/` — concrete ExecPlan artifacts created according to `.agents/PLANS.md`.

### Reasoning route

Если задача явно упоминает `L0-L5`, route hints, reasoning patterns, Plan Iterations, Self-consistency, Tree of Thoughts, ExecPlan или auto-route, используй:

* `.agents/skills/reasoning-patterns/SKILL.md`

`reasoning-patterns` — thin router and route path resolver. It selects the provisional route choice and provides the selected exact `docs/codex/reasoning/<route_file>.md` path, но не заменяет `AGENTS.md`, task prompt, initial task envelope, approved scope или route-specific файл.

Do not open any route-specific file before `reasoning-patterns` resolves the exact path.

Route hints являются рекомендациями, а не фиксированной сложностью задачи. Используй самый лёгкий достаточный маршрут. Если локальный анализ показывает, что нужен более лёгкий или более тяжёлый путь, кратко объясни отклонение.

### Available repo-local agents

Repo-local agents live under `.codex/agents/*.toml`.

Agents must follow their own `.toml` sandbox mode, role, write boundary, and forbidden actions.

#### Read-only audit agents

* `architecture_auditor` — read-only audit of architecture boundaries, ownership, layer separation, responsibility leaks, source-of-truth conflicts, and scope risks.
* `test_auditor` — read-only audit of test coverage, stale or weak tests, fake/mock/fixture risks, validation safety, and real external-call risks in tests.
* `docs_auditor` — read-only audit of documentation consistency, stale docs, docs/code/config/script mismatch, source-of-truth conflicts, and reports mistaken for durable docs.

Read-only audit agents provide findings and recommendations only. They do not edit files, do not perform implementation, do not update source-of-truth docs, and do not make architecture decisions.

#### Write-limited review agents

* `code_reviewer` — write-limited independent code review agent. It uses `.agents/skills/review-code/SKILL.md` as its review methodology and may create or update exactly one Batched Code Review Report under `docs/codex/reports/`.

`code_reviewer` must not edit production code, tests, configs, scripts, source-of-truth docs, workflow files, task envelopes, Stage Briefs, ExecPlans, agents, or skills.

`code_reviewer` reports are preserved review analysis only. They are not source of truth, not implementation approval, not architecture approval, not merge approval, not commit approval, and not release approval.

### Available repo-scoped skills

* `audit-only` — read-only investigation перед refactors, deletions, new layers или при неясном текущем поведении.
* `docs-update` — обновление одного docs-файла после approved architecture/runtime/policy changes.
* `reasoning-patterns` — выбор рекомендованного execution route и разрешение route label в точный route file path.
* `report-writing` — создание кратких сохранённых отчётов для audit, review, research и route-analysis.
* `review-code` — strict, practical, evidence-based code review methodology for existing codebases, including review envelope, `review_focus`, findings format, and large / batched review reports.
* `subagent-routing` — выбор и запуск существующих approved subagents, including read-only auditors and explicitly approved write-limited review agents, with bounded briefs and consolidation.
* `write-tests` — approved-scope test implementation procedure for writing or updating tests according to project-local style, public contracts, architecture rules, and safe verification.

Skills задают reusable procedures. Они не override `AGENTS.md`, task prompt, approved scope, route-specific files, agent `.toml` files или explicit approval.

If a legacy `diff-review` skill exists in the repo, prefer `review-code` for new non-trivial code review tasks unless the task explicitly requires the legacy skill.

### Rules

* Перед audit, refactor, deletion, broad docs update, risky implementation, risky code review, test-writing или architecture-sensitive work проверь, применим ли один из listed agents или skills.
* Предпочитай профильного read-only audit agent для focused read-only investigation только если он реально снижает риск, улучшает independent coverage или закрывает inspection gaps.
* Предпочитай `audit-only`, если задача является investigation-only и не требует специализированного subagent.
* Предпочитай `review-code` перед принятием non-trivial implementation diff.
* Для broad, risky, multi-file или architecture-sensitive review consider `code_reviewer` through `subagent-routing`, especially when preserved review analysis is useful.
* Для multi-focus code review orchestration запускай independent `code_reviewer` invocations by review lens, not by batch. Individual `code_reviewer` tasks should not be told that sibling reviewers exist unless the explicit task is consolidation.
* Use `write-tests` only when the active task grants test-writing scope.
* Use `test_auditor` for read-only test risk audit; do not use it to write tests.
* Предпочитай `docs-update` для approved one-file documentation update.
* Use `docs_auditor` for read-only docs consistency audit; do not use it to update docs.
* Use `architecture_auditor` for read-only architecture boundary audit; do not use it to approve architecture direction.
* Для substantial long-running implementation work используй ExecPlan согласно `.agents/PLANS.md`. Если ExecPlan должен быть сохранён как repo artifact, создавай его в `docs/codex/plans/`.
* Для audit/review/research/route-analysis артефактов используй `docs/codex/reports/`, только если файл-отчёт явно запрошен или задача ясно требует preserved analysis.
* Reports are not source of truth and do not authorize implementation.
* Reports may inform later decisions, but durable project docs must be updated separately through approved docs-update work.
* Implementation начинается только после explicit approval и fixed scope.
* Audit, review, report, route-analysis, findings, recommendations или code review verdict не являются approval на implementation.
* Если agents/skills недоступны в текущем Codex environment, продолжай вручную только если это безопасно, и явно укажи, что они не были invoked.
* Не создавай новых agents, skills, hooks, plugins, MCP configs или global settings без explicit approval.
* Не создавай ad-hoc working memory files вроде `SCRATCHPAD.md`, `MEMORY.md`, `state.md`, `work.md`, `notes.md`, `draft.md` или `temp.md` без explicit approval.

<!-- END MANAGED REPO WORKFLOW CORE -->

## 5. Non-Negotiable Architecture Rules

`текст`

## 6. Project Layers

`текст`

## 7. High-Risk Guardrails

`текст`

## 8. Validation

`текст`

## 9. Language

`текст`

## 10. Forbidden Without Explicit Approval

`текст`

## 11. Definition of Done

`текст`
