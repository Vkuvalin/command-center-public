# L4 Route Exploration

Use this route when the task is architecture-sensitive, strategy-heavy, or has several plausible implementation paths.

L4 is not a fixed complexity label. It is a route hint for comparing routes before choosing a direction.

This route is Tree-of-Thoughts-inspired, but it is not a request to expose hidden reasoning. Use concise route comparison, evidence, and recommendation.

## Loading assumption

This route file must be opened only after `.agents/skills/reasoning-patterns/SKILL.md` resolves it as the selected exact route file.

If this file was reached by guessing a route file name from a route label, stop and return to the bootstrap sequence:

1. `AGENTS.md`
2. initial task envelope, if referenced: `docs/codex/tasks/<task>.md`
3. `.agents/skills/reasoning-patterns/SKILL.md`
4. selected exact route file

For repo task-file based work, the initial task envelope should already have been read before route selection.

Read downstream task artifacts, such as Stage Briefs, after this route file and before project docs/code inspection.

If downstream task artifacts reveal that this route is no longer the lightest sufficient route, return to `reasoning-patterns` and select a safer route before continuing.

## When to use

Use L4 when the task:

* has several plausible architecture or implementation routes;
* may affect project structure, workflow ownership, model policy, schemas, prompts, rendering, delivery, or public behavior;
* has meaningful cost if the wrong route is chosen;
* needs route comparison before implementation;
* asks for architecture planning, design review, or strategic direction.

Typical examples:

* planning Web / Mini App / MAX integration;
* choosing where a new responsibility should live;
* comparing workflow designs;
* planning payment/balance architecture;
* deciding how to evolve LLM prompts, schemas, or model policy;
* selecting a migration path before implementation.

## Core approach

1. Define the decision question.
2. Inspect only relevant project context.
3. Generate 2–5 plausible routes.
4. Compare routes by evidence, not taste.
5. Drop clearly dominated routes.
6. Recommend one route or a hybrid route.
7. Return a report or move into ExecPlan only when implementation is approved.

Do not implement architecture-sensitive changes unless implementation scope is explicitly approved.

## Route comparison criteria

Compare each route by:

* benefit;
* risk;
* cost;
* reversibility;
* affected files/layers;
* validation path;
* approval needs;
* compatibility with `AGENTS.md`;
* risk of broad rewrite or scope creep.

Prefer routes that:

* preserve existing backend-controlled workflow;
* keep responsibilities in the correct layer;
* minimize public behavior changes;
* are reversible;
* can be validated with focused tests;
* avoid unnecessary new dependencies;
* keep diff focused.

## Subagents

Use existing approved subagents when they materially improve route evaluation.

Useful cases:

* `architecture_auditor` for layer boundaries, workflow ownership, and scope risk;
* `test_auditor` for validation feasibility and test coverage implications;
* `docs_auditor` for consistency with current docs and project setup.

Do not run subagents by default.

Use them when independent findings would reduce the chance of choosing a bad route.

Subagents provide findings and recommendations. They do not choose the final architecture route.

## Report vs ExecPlan

Use a report when the user must choose or approve the route.

Preferred location for preserved analysis:

* `docs/codex/reports/`

Use ExecPlan according to `.agents/PLANS.md` only when:

* the route has been selected;
* implementation is approved;
* the work is substantial, multi-step, or architecture-sensitive;
* the implementation must be resumable.

Route exploration alone is not an ExecPlan.

## Candidate route format

Keep route comparison compact.

Recommended format:

```text
Route A: <name>
- Summary:
- Benefits:
- Risks:
- Cost:
- Reversibility:
- Affected layers/files:
- Validation path:
- Approval needs:

Route B: <name>
...
```

After comparison, include:

```text
Recommended route:
Rationale:
Rejected alternatives:
Remaining risks:
Next safe step:
```

## When to choose another route

Use L2 if the implementation path is already clear and approved.

Use L3 if the main need is audit, review, or findings collection rather than route selection.

Use L5 only after explicit approval when route comparison is not enough and alternatives require prototypes, deep branching, or high-cost exploratory work.

Pause before continuing if route exploration reveals that implementation would require:

* unapproved architecture direction;
* dependency changes;
* DB model changes;
* workflow transition changes;
* public behavior changes;
* prompt/schema/model policy changes;
* touching forbidden zones from `AGENTS.md`;
* scope materially wider than requested.

## Validation

For L4, validation usually means route evidence, not full implementation tests.

Useful validation may include:

* reading relevant source files;
* checking existing tests;
* confirming current architecture docs;
* running narrow commands only if they directly support the route decision;
* asking relevant subagents for bounded findings.

Do not run broad validation unless it directly helps choose the route.

If L4 leads into approved code changes, route-level validation remains incremental; `AGENTS.md` remains authoritative for final code-change validation, and skipped validation must be explicit with a reason.

## Output

Final route exploration output should include:

* decision question;
* inspected scope;
* candidate routes;
* comparison criteria;
* recommended route;
* rejected alternatives;
* approval needs;
* next safe step;
* whether a report was created.
