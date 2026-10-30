# L5 Deep Branching

Use this route for high-cost exploratory work, approved prototypes, parallel paths, or deep branching when shallow route comparison is not enough.

L5 is not a fixed complexity label. It is a route hint for expensive, risky, or experimental execution.

This route is Tree-of-Thoughts-inspired, but it is not a request to expose hidden reasoning. Use explicit route artifacts, evidence, prototypes, validation, and decision records.

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

Use L5 only when the task is explicitly approved and:

* alternatives must be prototyped or tested;
* route comparison alone is not enough;
* wrong architecture choice would be costly;
* implementation may require staged work;
* work must be resumable;
* validation must compare several paths;
* the user explicitly asks for deep branching, prototypes, experiments, or high-risk exploration.

Typical examples:

* testing competing architecture approaches;
* validating a risky refactor path;
* building a proof-of-concept before choosing implementation;
* comparing parallel implementation strategies;
* exploring a new integration pattern with unknown constraints.

## Approval requirement

Do not start L5 work without explicit approval.

Before L5 work begins, confirm:

* approved scope;
* allowed files/layers;
* whether prototypes are allowed;
* whether parallel paths are allowed;
* what must not be touched;
* validation expectations;
* cleanup or retirement expectations.

A safe additive prototype inside an approved ExecPlan does not require a separate stop only if the approved ExecPlan scope explicitly allows prototypes or parallel paths and it:

* stays inside approved scope;
* is clearly labeled as prototype;
* adds no dependency;
* changes no DB model;
* changes no public behavior without approval;
* changes no prompt/schema/model policy without approval;
* avoids forbidden zones from `AGENTS.md`;
* has validation and cleanup path.

## ExecPlan

L5 requires an ExecPlan according to `.agents/PLANS.md`.

Do not keep L5 work only in the active thread.

The ExecPlan must capture:

* purpose;
* approved scope;
* non-goals;
* candidate paths;
* prototype plan;
* validation plan;
* progress;
* discoveries;
* decision log;
* idempotence and recovery;
* final outcome.

Update the ExecPlan when a prototype changes understanding, a path is rejected, validation fails, or scope changes.

## Core approach

1. Confirm approval and scope.
2. Read `.agents/PLANS.md`.
3. Create or update the ExecPlan.
4. Define candidate paths or prototype branches.
5. Keep each path bounded and labeled.
6. Validate each path using agreed evidence.
7. Compare results.
8. Retire rejected paths safely.
9. Recommend or implement the selected path inside approved scope.
10. Record outcome and remaining risks.

## Prototypes and parallel paths

Prototypes should reduce risk, not expand scope.

Each prototype or path should specify:

* purpose;
* files/layers touched;
* expected learning;
* validation method;
* cleanup or retirement path;
* decision criteria.

Do not keep abandoned prototypes unless the user explicitly wants them preserved.

Do not turn prototypes into production behavior without approval.

## Subagents

Use existing approved subagents when they reduce risk or improve comparison quality.

Useful cases:

* `architecture_auditor` for architecture boundaries and ownership risks;
* `test_auditor` for validation strategy and test risk;
* `docs_auditor` for documentation consistency after route selection.

Do not use subagents as a substitute for approval.

Subagents provide findings and recommendations. They do not choose the final route or authorize implementation.

## When to choose another route

Use L4 if route comparison is enough and no prototype is needed.

Use L3 if the task is mainly audit or risk discovery.

Use L2 if the implementation path is already selected, approved, and does not require experimental branching.

Use a lighter route if inspection shows that L5 is unnecessary.

If the user requested L5 but a lighter route is enough, briefly explain why.

## Stop conditions

Stop and ask for approval if L5 work reveals need for:

* broader architecture change;
* new dependency;
* DB model change;
* workflow transition change;
* public behavior change;
* prompt/schema/model policy change;
* touching forbidden zones from `AGENTS.md`;
* expanding prototype into production behavior;
* keeping abandoned experimental code;
* fixing unrelated failures;
* scope materially wider than approved.

## Validation

Validation must compare the candidate paths or prove the selected path.

Useful validation may include:

* focused tests;
* manual smoke checks;
* prototype-specific assertions;
* narrow integration checks;
* type checks;
* lint checks;
* evidence from subagents;
* documented route comparison.

Manual smoke checks may use real services only when explicitly manual; pytest/CI must not call real Telegram/LLM/API.

Route-level validation is incremental. For code changes, `AGENTS.md` remains authoritative for final validation expectations; skipped validation must be explicit with a reason.

For code changes, consider project validation commands from `AGENTS.md` when relevant:

* `uv run ruff check .`
* `uv run pyright`
* `uv run pytest`

Record expected and observed results in the ExecPlan.

## Output

Final L5 output should include:

* approved scope;
* ExecPlan path;
* candidate paths tested;
* selected path;
* rejected paths and why;
* prototypes kept or removed;
* validation results;
* files changed;
* remaining risks;
* approval needs, if any.
