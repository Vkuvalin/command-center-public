# L1 Micro-plan

Use this route for small tasks that need a few clear steps but do not require heavy planning, independent audit, route exploration, or ExecPlan.

L1 is not a fixed complexity label. It is a route hint for lightweight structured execution.

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

Use L1 when the task:

* has a clear goal;
* needs about 2–4 steps;
* has low or moderate risk;
* affects a narrow area;
* benefits from a short plan before editing;
* does not need long-running state.

Typical examples:

* small code adjustment plus one related test update;
* narrow docs update across a few sections;
* small refactor with obvious scope;
* focused cleanup in one module;
* adding a small missing case to existing logic.

## How to work

1. Inspect only the relevant files.
2. Write a short plan in the active thread.
3. Execute the plan.
4. Adjust the plan only if inspection reveals a material difference.
5. Check the diff.
6. Run narrow validation if useful.
7. Summarize the result.

The plan should be short. Do not create a long checklist.

Example:

```text
Plan:
1. Inspect current behavior.
2. Apply focused change.
3. Update the narrow test or docs section.
4. Run relevant validation.
```

## Do not use by default

For L1 tasks, do not use by default:

* ExecPlan;
* reports;
* route exploration;
* subagents;
* broad repository scans;
* deep architectural analysis;
* long visible rationale.

## When to choose another route

Use a lighter route if the task is actually local and obvious.

Use a heavier route if inspection shows that the task:

* spans multiple layers;
* requires substantial decomposition;
* has unclear behavior;
* may affect architecture boundaries;
* may affect workflow transitions;
* may change public behavior;
* may require independent audit;
* may need route comparison;
* may take long enough to require ExecPlan.

If the requested L1 route is not appropriate, briefly explain the route adjustment.

## Validation

Use narrow validation when it helps confirm the change.

Route-level validation is incremental. For code changes, `AGENTS.md` remains authoritative for final validation expectations; skipped validation must be explicit with a reason.

Examples:

* run the specific test file touched by the task;
* run a focused lint/type check if relevant;
* skip validation only for docs/prose-only edits that do not alter behavior, routing labels, prompts, schemas, config, scripts, tests, or public UX contracts.

Do not run broad validation unless the change justifies it.

## Output

Final response should be concise:

* short summary of the change;
* files or areas changed;
* validation run or skipped;
* any route adjustment, if it mattered;
* remaining risk, if relevant.
