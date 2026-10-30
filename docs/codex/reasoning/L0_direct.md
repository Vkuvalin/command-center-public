# L0 Direct

Use this route for simple, local, low-risk tasks with an obvious implementation path.

L0 is not a fixed complexity label. It is a route hint for direct execution when extra planning would add more noise than value.

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

Use L0 when the task:

* is local and focused;
* affects one small area;
* has an obvious path;
* has low architectural risk;
* does not require route comparison;
* does not require independent audit;
* does not require long-running state.

Typical examples:

* typo or wording fix;
* small docs edit;
* small local code correction;
* focused test expectation update;
* simple rename inside a narrow scope;
* small formatting or message adjustment.

## How to work

1. Inspect only the files needed for the task.
2. Make the smallest focused change.
3. Check the diff.
4. Run only relevant validation if useful.
5. Report what changed.

Keep the work direct. Do not turn L0 into planning, audit, or architecture analysis.

## Do not use by default

For L0 tasks, do not use by default:

* ExecPlan;
* reports;
* route exploration;
* subagents;
* broad repository scans;
* multi-file refactors;
* hidden chain-of-thought;
* long visible rationale.

## When to choose another route

Use another route if inspection shows that the task is not actually local.

Escalate or pause when the task touches:

* workflow transitions;
* DB models;
* public behavior;
* prompt/schema/model policy;
* architecture boundaries;
* multiple project layers;
* forbidden zones from `AGENTS.md`;
* unclear or risky behavior.

If the user requested L0 but a heavier route is needed, briefly explain why before continuing.

## Validation

Use the lightest useful validation.

Route-level validation is incremental. For code changes, `AGENTS.md` remains authoritative for final validation expectations; skipped validation must be explicit with a reason.

Examples:

* skip validation only for docs/prose-only edits that do not alter behavior, routing labels, prompts, schemas, config, scripts, tests, or public UX contracts;
* narrow test for a local behavior change;
* formatting/lint check only if the changed file needs it.

Do not run broad validation unless the change justifies it.

## Output

Final response should be short:

* changed file or area;
* what changed;
* validation run or skipped;
* any remaining risk, if relevant.
