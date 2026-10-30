# Карта архитектуры Codex workflow

Сухая карта текущей архитектуры работы Codex workflow.

Карта показывает:

* какие слои входят в локальный Codex workflow;
* какой слой чем владеет;
* где находятся routes, skills, agents, reports и ExecPlan;
* где находятся initial task envelopes и downstream task artifacts вроде Stage Briefs;
* где находятся временные Repo change handoff artifacts для Review;
* что не является source of truth;
* как Command Center должен интерпретировать repo-side workflow.

Это вспомогательная структурная карта для Command Center. Она используется вместе с `Command_Center_Role.md`, `Stage_Plan_Protocol.md`, `Command_Center_Working_State_Protocol.md`, `Architecture_Reasoning_Guide.md` и `OPS_CENTER_CODEX_PROTOCOL.md`, но не заменяет их.

Карта не заменяет:

* `AGENTS.md`;
* route files;
* skills;
* `.agents/PLANS.md`;
* subagent `.toml` files;
* task envelopes;
* Stage Briefs;
* repo guardrails.

Если эта карта временно прикреплена к Codex task или временно размещена в repo, Codex должен читать её только для задач, связанных с workflow synchronization, Command Center protocol, system-level audit или architecture/workflow integration.

---

## 1. Главный вход

```text
repo/
│
├── AGENTS.md
│   └── Главный project router + guardrails
```

`AGENTS.md` хранит не всё, что Codex может узнать.
`AGENTS.md` хранит то, что Codex не имеет права забыть.

The canonical Command Center `AGENTS.md` is a template and boundary reference in the private source repo. An instantiated project `AGENTS.md` is the first repo-side router and guardrail file. Its §§3–4 are protected workflow core; project-specific sections are adapted as needed during Stage 1 Repo foundation and later approved updates. The instantiated repo-side contract does not need the external orchestrator's name to operate.

### `AGENTS.md` owns

* purpose / current project state;
* context loading rules;
* agentic workflow entrypoint;
* Agentic Workflow Map;
* sequential bootstrap flow;
* initial task envelope placement;
* downstream artifact placement;
* route activation rules;
* skill activation rules;
* subagent trigger rules;
* report / ExecPlan handoff rules;
* project architecture guardrails;
* approval boundaries;
* high-risk zones;
* validation expectations;
* forbidden actions without explicit approval;
* Definition of Done.

### Agentic Workflow Map

Встроенная карта в `AGENTS.md` показывает:

* sequential bootstrap flow;
* layer ownership;
* route activation;
* exact route file resolution boundary;
* skill activation;
* subagent activation;
* context economy;
* report / ExecPlan handoff;
* final handoff.

### Sequential bootstrap flow

Managed OPS path — Codex reading order:

```text
Fixed Launch Prompt (exact docs/codex/tasks/<task>.md path; no task semantics)
  ↓
instantiated AGENTS.md
  ↓
OPS Task (initial task envelope; TS-A standalone or TS-B brief-backed)
  ↓
reasoning-patterns, if route selection is triggered
  ↓
provisional route choice and selected exact route file path resolved by reasoning-patterns
  ↓
selected route file
  ↓
Stage Brief, only when referenced by a TS-B OPS Task
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

This flow is sequential, not a parallel reading list.

Codex must not batch-read files from later layers before the current layer resolves what should be read next.

Route labels are not file names. Exact route file paths are resolved by `.agents/skills/reasoning-patterns/SKILL.md`.

Command Center authors a TS-B Stage Brief before its OPS Task; Codex reads the OPS Task first and the Stage Brief after the selected route file. The Fixed Launch Prompt activates the managed path without duplicating task semantics. `OPS_CENTER_CODEX_PROTOCOL.md` owns task construction and delivery.

Direct repo-local path:

```text
direct user/Codex task prompt
  ↓
AGENTS.md
  ↓
applicable local workflow and direct-task exceptions
```

Direct repo-local work is not automatically a managed OPS Task or a TS-A task. Its applicable prompt, `AGENTS.md`, and triggered skills define the entry contract.

### Layer ownership

| Layer                                        | Owns                                                                                        |
|----------------------------------------------| ------------------------------------------------------------------------------------------- |
| `AGENTS.md`                                  | project guardrails, approval boundaries, workflow entrypoints                               |
| `docs/codex/tasks/`                          | initial OPS Task envelopes for managed work; direct-task artifacts only when applicable     |
| `.agents/skills/reasoning-patterns/SKILL.md` | provisional route choice and exact route file path resolution                               |
| `docs/codex/reasoning/<exact route file>.md` | route-specific tactics after route path resolution                                          |
| `.agents/skills/*/SKILL.md`                  | reusable task procedures                                                                    |
| `.codex/agents/*.toml`                       | repo-local subagent role instructions; read-only by default unless explicitly write-limited |
| `.agents/PLANS.md`                           | ExecPlan lifecycle                                                                          |
| `docs/codex/reports/`                        | preserved analysis artifacts, not source of truth                                           |
| `docs/codex/diff/`                           | temporary ignored Repo change handoff artifacts for Review; not source of truth or approval |
| `docs/codex/stage_briefs/`                   | downstream approved task-specific scope/spec artifacts                                      |
| `docs/codex/plans/`                          | concrete ExecPlan artifacts                                                                 |

---

## 2. `.agents/`

```text
.agents/
│
├── PLANS.md
│
└── skills/
    ├── reasoning-patterns/
    ├── audit-only/
    ├── report-writing/
    ├── subagent-routing/
    ├── review-code/
    ├── write-tests/
    └── docs-update/
```

`.agents/` stores repo-scoped execution procedures.

Skills own reusable procedures.
Skills do not override `AGENTS.md`, task prompt, approved scope, selected route files, subagent `.toml` files, task envelopes, Stage Briefs or explicit approval.

---

## 3. `.agents/PLANS.md`

ExecPlan rules для substantial implementation.

### `docs/codex/plans/`

Stores concrete ExecPlan files for substantial, staged, long-running, implementation-heavy, architecture-sensitive or resumable work.

This directory stores plan artifacts only. ExecPlan rules remain owned by `.agents/PLANS.md`.

Use this directory when an ExecPlan must be preserved in the repository, for example:

```text
docs/codex/plans/<task-slug>-execplan.md
```

For a managed Stage-bound work unit, the corresponding example is `docs/codex/plans/stage-12-frontend-ownership-execplan.md`. The generic task-based example remains available for direct repo-local work. `.agents/PLANS.md` owns ExecPlan use and lifecycle.

### Owns

* when to create ExecPlan;
* when not to create ExecPlan;
* reports vs ExecPlans;
* living document rules;
* milestones;
* progress tracking;
* surprises / discoveries;
* decision log;
* concrete steps;
* validation and acceptance;
* idempotence and recovery;
* artifacts and notes;
* interfaces and dependencies;
* outcomes / retrospective.

### Used for

* substantial implementation planning;
* long-running implementation state;
* resumable work context;
* staged implementation;
* approved prototypes / parallel paths.

### Does NOT own

* audit/review reports;
* route selection;
* project guardrails;
* subagent dispatch;
* Command Center task formulation;
* source-of-truth project documentation.

---

## 4. Task envelopes and downstream artifacts

For every managed Command Center-originated Codex task, `docs/codex/tasks/<task>.md` is the initial OPS Task envelope and declares one task shape:

```text
TS-A standalone → OPS Task = compact approved task specification + execution envelope
TS-B brief-backed → Stage Brief = full approved task-specific specification
                    OPS Task = execution envelope + exact Stage Brief reference
```

The OPS Task is read after `AGENTS.md` and before route selection. A TS-B Stage Brief is downstream: it is read after the selected route file and before project docs/code inspection. For architecture-sensitive TS-A work, relevant accepted architecture references and constraints are supplied in the OPS Task; for TS-B, they are supplied in the Stage Brief. Codex and Review use that supplied contract rather than inferring accepted architecture from memory or code shape. Project-specific durable docs own their architecture content when present; neither task artifact grants new approval authority. Direct repo-local tasks follow their applicable entry contract and do not acquire a TS-A/TS-B label automatically.

### `docs/codex/tasks/`

Initial task envelope / OPS trigger.

Owns:

* task entrypoint;
* intent;
* route hint;
* expected artifact;
* referenced Stage Brief path;
* task-specific constraints;
* explicit context references.

Does NOT own:

* project guardrails;
* route file path resolution;
* implementation policy outside approved scope;
* approval expansion beyond the task.

### `docs/codex/stage_briefs/`

Downstream approved task-specific scope/spec artifact.

Owns:

* stage goal;
* accepted scope;
* non-goals;
* required implementation boundaries;
* test/validation expectations;
* stop conditions;
* report requirements.

Does NOT own:

* project-wide guardrails;
* exact route file path resolution;
* hidden expansion beyond approved task scope;
* implementation approval outside its accepted scope.

Stage Briefs are read after the selected route file and before project docs/code inspection.

If downstream task artifacts show that the provisional route choice is no longer lightest sufficient, Codex returns to `reasoning-patterns`, reroutes or stops on conflict before continuing.

### Canonical Stage-bound artifact identity

Managed Stage-bound work uses the work-unit stem `stage-<stage-id>-<work-slug>-<artifact-role>`, with an ordinal where cycle identity requires one. Structural examples:

```text
docs/codex/stage_briefs/stage-12-frontend-ownership-brief.md
docs/codex/tasks/stage-12-frontend-ownership-task.md
docs/codex/plans/stage-12-frontend-ownership-execplan.md
docs/codex/diff/stage-12-frontend-ownership-review-02.diff
docs/codex/reports/stage-12-frontend-ownership-review-02.md
docs/codex/reports/stage-12-frontend-ownership-review-02-architecture-and-contracts.md
docs/codex/reports/stage-12-frontend-ownership-review-02-tests-and-verification.md
docs/codex/tasks/stage-12-frontend-ownership-fix-01-task.md
```

The diff and reports with `review-02` represent one logical Review cycle; independent focus names follow the shared ordinal. A later Review/Fix-loop cycle uses a new ordinal without overwriting earlier evidence. Transport aliases such as `(1)` or `-corrected` do not create canonical versions. Direct repo-local artifacts may use applicable task-based names outside this Stage-bound contract. `Stage_Plan_Protocol.md` owns the Review/Fix-loop lifecycle.

---

## 5. Skills

### `reasoning-patterns/SKILL.md`

Thin route router.

Owns:

* lightest sufficient route;
* route hints;
* L0–L5 selection;
* route escalation/downgrade;
* exact route file path resolution;
* handoff to the selected exact `docs/codex/reasoning/<route_file>.md`.

Does NOT own:

* implementation policy;
* artifact policy;
* approval gates;
* final response contract;
* initial task envelope scope;
* downstream task artifact scope;
* Stage Brief content;
* project guardrails.

Route map:

| Route                   | Exact route file                                      |
| ----------------------- | ----------------------------------------------------- |
| `L0 Direct`             | `docs/codex/reasoning/L0_direct.md`                   |
| `L1 Micro-plan`         | `docs/codex/reasoning/L1_micro_plan.md`               |
| `L2 Plan Iterations`    | `docs/codex/reasoning/L2_plan_iterations.md`          |
| `L3 Independent Checks` | `docs/codex/reasoning/L3_self_consistency.md`         |
| `L4 Route Exploration`  | `docs/codex/reasoning/L4_shallow_tree_of_thoughts.md` |
| `L5 Deep Branching`     | `docs/codex/reasoning/L5_deep_tree_of_thoughts.md`    |

---

### `audit-only/SKILL.md`

Read-only investigation procedure.

Use before or during:

* refactor;
* deletion;
* architecture changes;
* new layers;
* risky implementation;
* unclear current behavior;
* broad scope changes.

Owns:

* read-only investigation boundary;
* audit-only mismatch detection;
* evidence vs speculation separation;
* P0/P1/P2 findings when useful;
* audit output shape.

Does NOT own:

* implementation;
* code/test/docs modification;
* commits;
* architecture decisions;
* real external calls.

---

### `report-writing/SKILL.md`

Preserved report authoring.

Use for:

* audit reports;
* review reports;
* research summaries;
* risk analysis;
* route analysis;
* comparison reports;
* consolidated findings.

Owns:

* file report vs chat report;
* report principles;
* metadata fields;
* severity model;
* finding format;
* flexible report skeleton;
* route handoff for reports;
* preserved analysis boundary.

Does NOT own:

* implementation approval;
* source-of-truth docs update;
* architecture decisions;
* route selection;
* ExecPlan lifecycle;
* subagent permissions.

---

### `subagent-routing/SKILL.md`

Existing subagent dispatcher and consolidation procedure.

Owns:

* when to use subagents;
* available subagent lookup;
* read-only auditor dispatch;
* write-limited `code_reviewer` dispatch;
* multi-focus code review orchestration;
* bounded subagent briefs;
* consolidation;
* severity mapping;
* handoff to `report-writing`.

For preserved Stage-bound multi-focus Review, the parent execution context supplies separate explicit report paths with the same Stage/work-unit identity and Review ordinal as the cycle's diff. The individual reviewers return independent findings; the parent execution context owns consolidation. Direct repo-local review may use the skill's task-based naming path. `subagent-routing` does not grant Review or architecture approval.

Does NOT own:

* creating new agents;
* granting permissions beyond agent `.toml`;
* implementation;
* architecture decisions;
* source-of-truth updates;
* replacing `AGENTS.md`;
* replacing selected route files;
* replacing `review-code` methodology;
* implementation approval.

---

### `review-code/SKILL.md`

Strict, practical, evidence-based code review methodology.

Owns:

* review invocation and review envelope;
* `review_focus`;
* binding constraints and evidence priority;
* engineering review stance;
* correctness / architecture / contracts / tests / security / performance / integration review priorities;
* conditional runtime and domain checks;
* finding severity and comment quality;
* large / batched review mode;
* Batched Code Review Report structure;
* code review output format.

Used by:

* direct review tasks;
* `code_reviewer.toml`;
* review-heavy routes;
* pre-acceptance review of non-trivial implementation diffs.

For preserved Stage-bound Review, `review-code` requires an explicit report path carrying Stage identity, work-unit identity, and Review ordinal. Its generic task-based report name applies to direct repo-local review outside that contract. The skill owns the detailed validation rules, not this map.

Does NOT own:

* implementation;
* fixes;
* commit approval;
* merge approval;
* release approval;
* architecture approval;
* subagent orchestration;
* task approval expansion.

---

### `write-tests/SKILL.md`

Approved-scope test implementation procedure.

Owns:

* test invocation and implementation envelope;
* behavior source priority;
* test-writing workflow;
* test design principles;
* regression-oriented coverage;
* coverage focus;
* test doubles / fixtures / helpers boundaries;
* architecture and production-code boundaries while writing tests;
* conditional runtime and boundary checks;
* safe verification and final response.

Used for:

* writing new tests;
* updating existing tests;
* regression coverage;
* approved test implementation work.

Does NOT own:

* read-only test audit;
* broad implementation outside test-writing scope;
* architecture decisions;
* unrelated production fixes;
* docs/config/workflow changes unless explicitly approved.

`test_auditor.toml` is used for read-only test risk audit.
`write-tests/SKILL.md` is used for approved test-writing implementation.

---

### `docs-update/SKILL.md`

Controlled one-file documentation update.

Use after approved:

* architecture change;
* runtime change;
* workflow change;
* model/provider/tool policy change;
* deployment/process change;
* source-of-truth documentation change.

Owns:

* identifying target doc file;
* identifying source-of-truth inputs;
* updating only approved doc file;
* removing stale claims;
* reflecting current behavior;
* keeping docs practical and not changelog-like.

Does NOT own:

* code changes;
* test changes;
* config/script changes;
* broad documentation rewrite;
* unrelated docs updates;
* source-of-truth decisions outside approved scope.

---

## 6. `.codex/agents/`

```text
.codex/
└── agents/
    ├── architecture_auditor.toml
    ├── test_auditor.toml
    ├── docs_auditor.toml
    └── code_reviewer.toml
```

`.codex/agents/*.toml` stores repo-local subagent role instructions.

Most subagents are read-only auditors.

An explicitly declared write-limited subagent may write only inside its declared boundary.

Subagents must follow their own `.toml` sandbox mode, role, write boundary and forbidden actions.

Subagents do not override `AGENTS.md`, task prompt, approved scope, selected route files, task envelopes, Stage Briefs or explicit approval.

---

### Read-only audit agents

Read-only audit agents provide findings and recommendations only.

They do not:

* edit files;
* implement;
* update source-of-truth docs;
* approve architecture direction;
* approve implementation;
* commit.

#### `architecture_auditor.toml`

Read-only architecture boundary auditor.

Checks:

* architecture boundaries;
* ownership;
* layer separation;
* responsibility leaks;
* source-of-truth conflicts;
* state/workflow ownership;
* external boundary ownership;
* hidden coupling;
* scope expansion risks.

Owns:

* specialist architecture findings.

Does NOT own:

* code edits;
* docs edits;
* test edits;
* config/script edits;
* commits;
* architecture decisions;
* implementation approval.

---

#### `test_auditor.toml`

Read-only test safety and coverage auditor.

Checks:

* coverage gaps;
* stale or weak tests;
* fake/mock/fixture risks;
* validation safety;
* tests hiding production wiring bugs;
* real external-call risks in tests.

Owns:

* specialist test findings.

Does NOT own:

* writing tests;
* deleting tests;
* weakening tests;
* modifying code/docs/configs/scripts;
* commits;
* implementation approval.

---

#### `docs_auditor.toml`

Read-only documentation consistency auditor.

Checks:

* stale documentation;
* docs/code mismatch;
* docs/config/script mismatch;
* source-of-truth conflicts;
* outdated setup/runtime/workflow/API/CLI documentation;
* documentation becoming changelog-like instead of durable;
* reports or temporary analysis artifacts mistaken as source of truth.

Owns:

* specialist documentation findings.

Does NOT own:

* docs rewrite;
* code edits;
* test edits;
* config/script edits;
* commits;
* source-of-truth decisions.

---

### Write-limited review agents

#### `code_reviewer.toml`

Write-limited independent code review agent.

Uses:

* `.agents/skills/review-code/SKILL.md` as review methodology.

May write:

* exactly one Batched Code Review Report under `docs/codex/reports/`, when report writing is requested or clearly required by review size/risk.

May use:

* `review_focus`, when assigned.

Owns:

* independent code review execution;
* bounded review handoff;
* one approved report file inside its declared boundary.

Does NOT own:

* code edits;
* test edits;
* docs edits;
* config/script edits;
* source-of-truth updates;
* workflow file edits;
* task envelope edits;
* Stage Brief edits;
* ExecPlan edits;
* agent/skill edits;
* architecture decisions;
* implementation approval;
* merge approval;
* commit approval;
* release approval.

`code_reviewer` reports are preserved review analysis only.

When a report is authorized, the reviewer uses the one supplied report path inside its write boundary. Cycle identity and consolidation belong to the parent execution context, not to the individual agent role.

---

## 7. Routes: `docs/codex/reasoning/`

```text
docs/codex/reasoning/
├── L0_direct.md
├── L1_micro_plan.md
├── L2_plan_iterations.md
├── L3_self_consistency.md
├── L4_shallow_tree_of_thoughts.md
└── L5_deep_tree_of_thoughts.md
```

Exact route file paths are resolved by `.agents/skills/reasoning-patterns/SKILL.md`.

Route files should not be opened by guessed names.

Each route file contains a loading assumption that sends Codex back to bootstrap if the file was reached without route path resolution.

### Route map

| Route                            | Owns                                             |
| -------------------------------- | ------------------------------------------------ |
| `L0_direct.md`                   | direct local execution for simple low-risk tasks |
| `L1_micro_plan.md`               | lightweight structured execution for small tasks |
| `L2_plan_iterations.md`          | multi-step / coordinated execution               |
| `L3_self_consistency.md`         | independent checks / audit / review              |
| `L4_shallow_tree_of_thoughts.md` | architecture route exploration                   |
| `L5_deep_tree_of_thoughts.md`    | approved deep branching / prototypes             |

### L0 Direct

* simple local low-risk tasks;
* obvious implementation path;
* smallest focused change;
* narrow validation if useful;
* no ExecPlan by default;
* no reports by default;
* no subagents by default;
* no broad repo scans.

### L1 Micro-plan

* small tasks;
* 2–4 clear steps;
* short active-thread plan;
* focused execution;
* narrow validation if useful;
* no ExecPlan by default;
* no reports by default;
* no subagents by default;
* no deep architecture analysis.

### L2 Plan Iterations

* several dependent steps;
* multiple files or important subsystem;
* ordered decomposition;
* step-by-step execution;
* local plan updates when facts change;
* short L2 for continuous pass;
* ExecPlan L2 for substantial/resumable work.

### L3 Independent Checks

* audit-only work;
* review-heavy tasks;
* risk inspection;
* independent findings;
* compare observations;
* rank findings by evidence/severity;
* optional subagent-routing;
* optional report-writing for preserved analysis;
* no implementation unless explicitly allowed.

### L4 Route Exploration

* strategy-heavy tasks;
* several plausible implementation routes;
* architecture-sensitive decisions;
* compare 2–5 routes;
* evaluate benefit/risk/cost/reversibility;
* recommend route or hybrid;
* use report-writing when preserved analysis is needed;
* no implementation without approved scope.

### L5 Deep Branching

* high-cost exploratory work;
* approved prototypes;
* parallel paths;
* route comparison not enough;
* requires explicit approval;
* requires ExecPlan;
* captures candidate paths;
* validation compares paths;
* cleanup/retirement expectations.

---

## 8. Reports

```text
docs/codex/reports/
├── .gitkeep
└── [*.md]
```

Reports are preserved analysis artifacts.

Reports may include:

* audit reports;
* code review reports;
* Batched Code Review Reports;
* per-focus code review reports;
* consolidated reports, when explicitly requested;
* research summaries;
* route-analysis reports;
* modernization findings.

For a preserved Stage-bound Review, a report and diff for the same logical cycle share the Review ordinal; focused reports append their focus after that ordinal. A later cycle gets a new ordinal. Direct repo-local reports may use applicable task-based names.

Reports are:

* not source of truth;
* not implementation approval;
* not architecture approval;
* not merge approval;
* not commit approval;
* not release approval;
* moved into durable docs only after explicit approval.

`code_reviewer` may create or update exactly one approved Batched Code Review Report under this directory according to its `.toml` and `review-code/SKILL.md`.

Other reports are created through `report-writing` or explicit approved reporting tasks.

---

## 9. Repo change handoff artifacts

```text
docs/codex/diff/
├── .gitkeep
└── stage-12-frontend-ownership-review-02.diff  [structural example]
```

`docs/codex/diff/` holds generated, transient and ignored Review handoff evidence; its `.gitkeep` remains tracked. A matching preserved Review report uses the same Stage/work-unit identity and logical ordinal. Earlier cycles are not overwritten. A diff is neither source of truth nor implementation, architecture, Review or Commit approval. It is not a repo-side bootstrap layer, OPS Task, Stage Brief, report or ExecPlan. `Stage_Plan_Protocol.md` owns Repo change handoff and closure operations.

---

## 10. Project docs

```text
docs/
└── [project-specific durable documentation]
```

Project docs contain durable project documentation when present.

This map does not define a mandatory universal set of project docs.

Different projects may define different durable documentation files depending on their architecture, runtime, domain, deployment model and workflow.

Project docs may include:

* project context;
* project map;
* architecture rules;
* runtime policy;
* model/provider/tool policy;
* development checklist;
* API / CLI documentation;
* deployment documentation;
* domain documentation;
* validation documentation.

Do not assume that a specific documentation file exists in every repo.

Do not treat `docs/codex/reports/` as durable project docs.

Do not treat report artifacts as source of truth.

If a project needs explicit durable architecture rules, they should be defined as project-specific source-of-truth documentation and referenced by task envelopes, Stage Briefs, skills or review envelopes when relevant.

Possible project-specific docs may include files such as:

```text
docs/PROJECT_CONTEXT.md
docs/PROJECT_MAP.md
docs/LLM_MODEL_POLICY.md
docs/DEVELOPMENT_CHECKLIST.md
```

These examples are not mandatory universal files.

### Artifact lifecycle boundaries

```text
durable project truth       → project-specific architecture/policy/runtime docs and instantiated AGENTS.md
execution / review evidence → OPS Tasks, TS-B Stage Briefs, ExecPlans and meaningful reports
transient Review evidence   → generated docs/codex/diff/*.diff
disposable temporary files  → reproducible transport or operational artifacts with no remaining value
```

Classification follows meaning, not directory alone. Completed useful evidence may be kept in optional external Project History; it is neither project source of truth nor a repo-side bootstrap layer or default Codex context. `Stage_Plan_Protocol.md` owns archive and cleanup decisions and operations.

---

## 11. Command Center companions

The canonical seven-source Command Center bundle is versioned in this private source repo. Its files have distinct roles and are not automatically loaded together in a normal product repo:

| Source | Command Center role | Normal repo-side role |
| --- | --- | --- |
| `Command_Center_Role.md` | Engineering role and scope discipline | None by default |
| `Stage_Plan_Protocol.md` | Stage, Review/Fix-loop and closure lifecycle, including Stage 1 Repo foundation | None by default |
| `Command_Center_Working_State_Protocol.md` | Persistent Command Center working-state ownership, synchronization and recovery | None by default |
| `Architecture_Reasoning_Guide.md` | Architecture reasoning companion | None by default |
| `Architecture_Map.md` | Structural ownership and placement companion | None by default |
| `OPS_CENTER_CODEX_PROTOCOL.md` | Managed OPS Task construction and delivery | None by default |
| `AGENTS.md` | Canonical template and boundary reference | Instantiated first repo-side router and guardrails |

The private source repo may version canonical copies of all seven. A normal product repo does not thereby carry or load every Command Center companion. For managed work, the Fixed Launch Prompt points to an exact OPS Task; the instantiated project `AGENTS.md` then starts repo-side bootstrap. Direct repo-local work starts from its direct prompt and `AGENTS.md`. `Architecture_Reasoning_Guide.md` remains an external reasoning companion unless explicitly supplied as relevant context.

Command Center companions не заменяют:

* `AGENTS.md`;
* selected route files;
* skills;
* subagent `.toml` files;
* `.agents/PLANS.md`;
* task envelopes;
* Stage Briefs;
* project guardrails;
* project-specific source-of-truth documentation.

`Architecture_Reasoning_Guide.md` помогает расширять пространство архитектурного рассуждения, но архитектурное решение и approval остаются за Command Center.

---

## 12. Ownership formula

```text
AGENTS.md
→ project guardrails, approval boundaries, bootstrap entrypoint

reasoning-patterns
→ route selection and exact route file path resolution

route files
→ route-specific execution tactics

skills
→ reusable task procedures

subagent-routing
→ subagent selection, dispatch, multi-focus review orchestration, consolidation

agent .toml files
→ bounded specialist roles, sandbox modes, write boundaries, forbidden actions

PLANS.md
→ ExecPlan lifecycle

docs/codex/reports/
→ preserved analysis artifacts, not source of truth

docs/codex/diff/
→ temporary ignored Repo change handoff artifacts for Review, not source of truth or approval

docs/codex/tasks/
→ initial OPS Task envelopes for managed work; direct-task artifacts only when applicable

docs/codex/stage_briefs/
→ downstream full approved task-specific specification for TS-B

docs/codex/plans/
→ concrete ExecPlan artifacts

Command_Center_Role.md
→ engineering role and reasoning stance

Stage_Plan_Protocol.md
→ long-running Command Center workflow, Architecture state, Review/Fix-loop and Repo change handoff

Command_Center_Working_State_Protocol.md
→ persistent Command Center working-state ownership, synchronization and recovery

Architecture_Reasoning_Guide.md
→ architecture decision map and reasoning triggers, not workflow or project source of truth

OPS_CENTER_CODEX_PROTOCOL.md
→ Codex task framing, expected artifacts and result review

Architecture_Map.md
→ structural map of repo-side workflow and Command Center companions

Command Center
→ decisions, approvals, interpretation and acceptance of Codex output
```

---

## 13. Local distribution subsystem

`Command-Center.bat` launches `scripts/command-center.ps1` from the physical source repository location. The PowerShell engine owns Create, Initialize, Update All, source verification, project-root settings, and non-interactive Guard/scheduler actions. It copies current Git-tracked `.agents/**`, `.codex/**`, and `docs/codex/reasoning/**` files by exact path without deleting unknown target files.

`config/distribution.local.json` is ignored machine-local state in the source repository. It owns configured project roots, the enrollment list, and the Guard scheduler task identity. Discovery inspects immediate child Git repositories under those roots; enrollment comes from the registry, not target `AGENTS.md` or another per-project marker. The source repository is excluded from targets by resolved path.

The source `AGENTS.md` owns the managed workflow core delimited by its existing markers. A target `AGENTS.md` keeps project-owned content outside that core. The source `.gitignore` contains a commented Project Gitignore Template; the engine renders its universal rules into a managed block at the end of each target `.gitignore`, while target stack/project rules outside the block remain project-owned.

Target `docs/codex/tasks/`, `stage_briefs/`, `reports/`, `plans/`, and `diff/` are local artifact directories. Distribution ensures their `.gitkeep` sentinels but does not synchronize or delete their other contents. Guard repairs registered projects without Git commit or push. Source verification is read-only; distribution requires a valid source with clean distribution-relevant inputs.
