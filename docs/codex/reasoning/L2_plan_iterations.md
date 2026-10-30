# L2 Plan Iterations

Use this route for multi-step work where Codex must decompose the task, keep execution order clear, and adjust the path when repository inspection reveals new facts.

L2 is not a fixed complexity label. It is a route hint for structured step-by-step execution.

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

Use L2 when the task:

* has several dependent steps;
* touches multiple files or one important subsystem;
* needs ordered execution;
* benefits from decomposition before editing;
* may require narrow validation after intermediate changes;
* is too large for L1 but does not require architecture route exploration.

Typical examples:

* implementing a focused feature across code and tests;
* updating one workflow path and related tests;
* changing a schema plus its validation/tests;
* coordinated docs/code update;
* medium refactor inside approved scope.

## Core approach

Use Plan Iterations / Least-to-Most style execution:

1. Load the referenced downstream task artifacts, such as Stage Briefs, before inspecting project code.
2. Inspect the relevant context.
3. Decompose the task into ordered subproblems.
4. Execute one subproblem at a time.
5. Check whether new facts change the route.
6. Update the local plan if needed.
7. Validate the result.

Do not expose hidden chain-of-thought. Use concise visible rationale only when it affects the route, risk, or implementation path.

## Short L2 vs ExecPlan L2

Use a short plan in the active thread when the task is medium-sized and easy to finish in one continuous pass.

Use an ExecPlan according to `.agents/PLANS.md` when the task is substantial, long-running, implementation-heavy, multi-file, architecture-sensitive, or expected to need resumable working context.

If substantial work is done without an ExecPlan, briefly explain why.

Do not create `SCRATCHPAD.md`, `MEMORY.md`, `state.md`, `work.md`, `notes.md`, or other ad-hoc working files.

## How to work

For short L2:

1. Write a compact plan in the active thread.
2. Execute the plan step by step.
3. Mention material plan changes when they happen.
4. Run relevant validation.
5. Summarize the outcome.

For ExecPlan L2:

1. Read `.agents/PLANS.md`.
2. Create or update the ExecPlan before substantial implementation.
3. Keep the ExecPlan current as work proceeds.
4. Record progress, discoveries, decisions, validation, and recovery notes in the ExecPlan.
5. Continue within approved scope without asking for every next step.
6. Stop if work exits approved scope.

## Do not use by default

For L2 tasks, do not use by default:

* broad route exploration;
* deep prototypes;
* parallel implementation paths;
* unrelated refactors;
* broad repository scans;
* subagents as a ritual.

## Subagents

L2 does not normally require subagents.

Consider existing approved subagents only if inspection shows that independent coverage would materially reduce risk, for example:

* the task touches several project layers;
* tests/docs/runtime consistency is uncertain;
* there is risk of breaking architecture boundaries;
* the task is becoming closer to L3 audit or L4 route exploration.

If subagents become important, briefly explain why.

## When to choose another route

Use a lighter route if the task is actually local or has only a few obvious steps.

Use L3 if the main need is audit, review, independent findings, or risk discovery.

Use L4 if there are several plausible architecture or implementation routes and the correct path is not obvious.

Use L5 only after explicit approval for deep branching, prototypes, or high-cost exploratory work.

Pause before continuing if inspection reveals:

* architecture direction not approved;
* workflow transition changes;
* DB model changes;
* public behavior changes;
* prompt/schema/model policy changes;
* forbidden zones from `AGENTS.md`;
* scope materially wider than the task.

## Validation

Validation should match the size and risk of the change.

Prefer narrow validation first when useful, then broader validation if the task justifies it.

Route-level validation is incremental. For code changes, `AGENTS.md` remains authoritative for final validation expectations; skipped validation must be explicit with a reason.

For code changes, consider the project validation commands from `AGENTS.md`:

* `uv run ruff check .`
* `uv run pyright`
* `uv run pytest`

If validation is skipped, explain why.

## Output

Final response should include:

* what was changed;
* whether a short plan or ExecPlan was used;
* files or areas changed;
* validation run or skipped;
* material route changes, if any;
* remaining risks or approval needs, if relevant.
