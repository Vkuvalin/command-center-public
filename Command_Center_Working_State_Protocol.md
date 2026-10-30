# Command Center Working State Protocol

> Persistent working-state layer for ChatGPT Command Center.

## 1. Purpose

This protocol defines how Command Center keeps a compact, persistent, model-managed working state across long chats, context compression, runtime replacement, and migration between chats.

Its purpose is not to create a second documentation system or a second workflow. It gives the existing Command Center workflow a durable state plane that can be read and updated by ChatGPT while work continues.

The protocol owns:

- the Command Center Library namespace;
- the canonical project working-state files;
- their responsibility boundaries;
- initialization and recovery;
- update / synchronization rules;
- safe mutation of Library files;
- navigation registration of active working-state files;
- temporary worktree rules for state-file editing.

It does not own Stage / Step / Gate / Decision gate semantics, Architecture maturity, OPS Task construction, Codex repo-side workflow, or project repository source-of-truth documentation.

---

## 2. Core model

Command Center uses four storage zones with different responsibilities:

| Zone | Responsibility |
|---|---|
| ChatGPT Library | Persistent mutable source of truth for Command Center project working-state owners and their current physical generations. |
| `/tmp` | Disposable but reusable session-local verified mirror and transactional worktree for routine internal state-file editing. |
| `/mnt/data` | Runtime workspace for user uploads, transformations, code, and user-facing/generated artifacts. It is not the routine path for Command Center working-state mutation. |
| Conversation Files | Chat-scoped artifact channel for uploads and preserved deliverables such as Stage Briefs, OPS Tasks, reports, diffs, transfer packages, and other explicit outputs. |

Short formula:

```text
Library            = persistent working state
/tmp               = session-local verified mirror + transactional worktree
/mnt/data          = user/file workspace
Conversation Files = chat artifacts / deliverables
```

`/tmp` and `/mnt/data` are never the persistent source of truth for Command Center working state.

A verified current generation may remain under `/tmp` and be reused across multiple mutations in the same runtime. This is an optimization only: `/tmp` is disposable, may disappear at any time, and must never become a recovery dependency.

Observed zero-noise behavior of `/tmp` is useful but is not treated as a correctness guarantee of the platform. Correctness depends on Library persistence and publication verification, not on the continued existence or invisibility of `/tmp`.

Routine working-state mutation should not be routed through `/mnt/data` when a direct `/tmp` → Library publication path is available. `/mnt/data` remains the correct workspace for user-facing/generated artifacts and other tasks that genuinely require it.

---

## 3. Project namespace

Standard project state lives under:

```text
/Command Center/<project_name>/
```

The standard project space has four canonical logical working-state owners:

```text
OPERATION_MEMORY.md
STAGE_PLAN.md
PROJECT_DEFINITION.md
ARCHITECTURE.md
```

Their physical Library artifacts are generation files:

```text
/Command Center/<project_name>/
├── OPERATION_MEMORY__g000001.md
├── STAGE_PLAN__g000001.md
├── PROJECT_DEFINITION__g000001.md
└── ARCHITECTURE__g000001.md
```

Generation numbering is monotonic per logical owner. Different owners may therefore have different current generation numbers.

A generation suffix is a storage-level implementation detail. It does not change the semantic responsibility of the owner and must not be interpreted as architecture maturity, Stage progress, importance, or revision history.

The stable identity for Command Center reasoning is the logical owner inside the project namespace, not a long-lived `file_id`, `library_file_id`, or exact generation filename. Physical Library identities are transient handles used for reading, verification, concurrency checks, retirement, and recovery.

All four logical owners may be initialized immediately when the project Library space is initialized.

A logical owner being present does not mean that it must already contain meaningful project state. Empty, pending, or not-yet-defined state is valid until enough information exists to populate it safely.

The core model assumes one primary working-state namespace per project. Chat branches, parallel workstreams, copied namespaces, merge/retirement of branches, and similar fork-management are explicitly user-controlled and outside this core protocol. Command Center must not infer a new branch namespace automatically.

---

## 4. Working-state principle

The four canonical files are working state, not revision history.

They describe the current usable state that Command Center should rely on now.

General rule:

```text
old state
→ accepted change
→ replace / reconcile current state
```

Do not retain obsolete alternatives, superseded architecture, former plan versions, or discussion chronology merely for historical completeness.

History belongs to the conversation, repository history, reports, commits, preserved task artifacts, or another explicitly approved historical system when needed.

The working-state layer optimizes for:

- current correctness;
- compactness;
- continuity;
- reproducibility of future decisions;
- resistance to context drift;
- fast recovery.

Physical generations are transactional storage artifacts, not preserved working-state history. After a new generation has been published and verified, the previous generation is retired unless it must temporarily remain for recovery after an interrupted cleanup.

---

## 5. Canonical working-state files

The canonical names in this section identify logical owners. When this protocol says `OPERATION_MEMORY.md`, `STAGE_PLAN.md`, `PROJECT_DEFINITION.md`, or `ARCHITECTURE.md`, it refers to that semantic owner regardless of the current physical Library generation filename.

### 5.1. `OPERATION_MEMORY.md`

Purpose:

> Compact high-signal operational context needed for Command Center to continue the current work without substantial loss of thread.

This is the most dynamic file and the only canonical core file that may freely contain not-yet-accepted working material.

Typical contents may include:

- exact current navigation snapshot;
- current Stage / Step context;
- current question and Decision gate;
- active hypotheses or unresolved questions;
- blockers;
- continuation point;
- material findings awaiting disposition;
- temporary but important evidence from reports, diffs, files, or Codex output;
- recovery notes;
- facts that are currently needed for reasoning but do not yet belong to another canonical owner.

`OPERATION_MEMORY.md` may also contain a compact persistent bootstrap / recovery block for high-value continuity anchors that should survive ordinary Stage-local compression.

Such a block may include:

- compact reminders of canonical Command Center owners and their responsibilities;
- current project / operator context needed for recovery or safe continuation;
- temporary pre-Stage navigation state until canonical Stage navigation is established;
- other small recovery-critical anchors defined by the active Command Center activation envelope.

This block is part of `OPERATION_MEMORY.md`; it is not a separate working-state owner, workflow, source of truth or substitute for canonical source-files.

Its purpose is retrieval / continuity, not duplication of detailed protocol procedures. If its contents conflict with an applicable current canonical owner, the canonical owner remains authoritative within its responsibility.

`OPERATION_MEMORY.md` is not a conversation transcript and should not accumulate stale discussion.

Most dynamic `OPERATION_MEMORY.md` content is normally Stage-local or near-Stage-local in character.

On Stage transition, aggressively trim or rewrite completed-Stage operational material so that only information still useful for continuation survives.

A current persistent bootstrap / recovery block and other still-valid recovery-critical anchors are preserved across this compression. Their persistence does not protect stale values: obsolete anchors must be reconciled or removed when they are no longer current.

Promotion rule:

```text
in-flight / unresolved state
→ OPERATION_MEMORY.md

accepted durable project meaning
→ PROJECT_DEFINITION.md

accepted architecture
→ ARCHITECTURE.md

accepted Stage-route change / Stage outcome
→ STAGE_PLAN.md
```

After promotion, redundant operational notes should be removed when they no longer help active reasoning.

---

### 5.2. `STAGE_PLAN.md`

Purpose:

> Current high-level Stage Plan and compact state of the route actually taken through completed Stages.

`STAGE_PLAN.md` serializes the project Stage Plan; it does not contain the `Stage_Plan_Protocol.md` rules themselves.

It should contain the latest valid route, not a history of former plan versions.

If an early plan had 17 Stages and the accepted current plan has 27, the working file should describe the current 27-Stage model rather than preserve old plan revisions.

Completed Stages may keep concise durable outcomes when they help later work, for example:

- what was accepted;
- what was implemented;
- what project boundary was established;
- what downstream Stage now depends on that result.

This is a compact route record, not a changelog.

Typical update events:

- Stage 0 completion / initial high-level Stage Plan;
- accepted change to Stage composition or order;
- Stage framing that materially changes the current plan;
- Stage completion / status transition;
- later accepted re-planning.

---

### 5.3. `PROJECT_DEFINITION.md`

Purpose:

> Current definition of what the project is, what is being built, why it exists, for whom, and under which accepted product / technical boundaries.

This is intentionally broader and more plastic than a frozen exhaustive technical specification.

Its exact sections are project-dependent. Useful content may include:

- purpose / problem / value;
- users or actors;
- scope;
- non-goals;
- core behavior;
- product requirements;
- important technical requirements;
- constraints;
- external boundaries;
- quality expectations;
- success or acceptance characteristics.

Do not fill sections merely because a template contains them.

Stage 0 relation:

```text
intent verification
→ Stage 0 exploration
→ Steps / Gates
→ Stage 0 Decision gate
→ current Project Definition
→ high-level Stage Plan
```

The Stage 0 consolidated decision forms or materially updates `PROJECT_DEFINITION.md`.

The file remains revisable. Later accepted project-level scope, requirement, product-contract, or technical-boundary changes update the current definition directly.

`PROJECT_DEFINITION.md` is not a TS-B Stage Brief. A Stage Brief remains task-specific; Project Definition is project-level working context.

---

### 5.4. `ARCHITECTURE.md`

Purpose:

> Current architectural contract and architecture view that Command Center must account for when making later decisions and authoring Stage Briefs / OPS Tasks.

`ARCHITECTURE.md` is not:

- a brainstorm;
- a conversation log;
- an ADR history;
- a list of every rejected alternative;
- a dump of low-value implementation detail.

It contains architecture that is accepted or otherwise established as current project reality.

Useful levels may include, when relevant:

- system architecture;
- application architecture;
- project / codebase organization;
- subsystem / module ownership;
- data and persistence boundaries;
- workflow / state ownership;
- integration boundaries;
- security / trust boundaries;
- important cross-cutting constraints;
- local architectural patterns that materially constrain future work.

The file should be used together with:

- `Command_Center_Role.md` — engineering role / architecture ownership;
- `Architecture_Reasoning_Guide.md` — cognitive index for architecture reasoning.

Architecture promotion rule:

```text
discussion / alternatives
→ conversation + OPERATION_MEMORY.md

architecture decision accepted by Command Center
→ ARCHITECTURE.md
```

An accepted architecture decision may be recorded before implementation. When the distinction matters, the file must not present an approved target as already-existing repository fact.

Use lightweight wording such as:

```text
Existing: ...
Approved target: ...
```

only where that distinction is materially useful.

If implementation or later evidence forces the accepted architecture to change, Command Center returns through the applicable decision process and then updates `ARCHITECTURE.md` to the new current state. Superseded architecture is removed or reconciled rather than retained as history.

---

## 6. Additional working-state files

The four canonical files are the core working-state set.

Command Center may add additional persistent working-state files when a project has stable concerns with distinct responsibilities that cannot be represented cleanly in the four core files.

A new working-state file must:

1. have a clear semantic owner / responsibility;
2. hold current reusable state rather than ad-hoc notes;
3. not duplicate an existing core file;
4. be registered in the navigation `Working state` line;
5. follow the same Library generation, mutation, verification, and recovery rules as the canonical files.

Additional owners use the same logical-owner / physical-generation distinction as the four canonical files.

Do not create extra files merely to reduce file size or to capture temporary thoughts.

Files such as generic `NOTES.md`, `THOUGHTS.md`, `SCRATCHPAD.md`, or arbitrary topic fragments should not be created as persistent working-state owners without a real responsibility boundary.

---

## 7. Navigation integration

The active working-state set must remain visible in the Stage Plan navigation so both the user and Command Center are continuously reminded that the files exist.

Add one compact line to the navigation block:

```text
Working state (last update: <date or compact marker>): OPERATION_MEMORY.md · STAGE_PLAN.md · PROJECT_DEFINITION.md · ARCHITECTURE.md
```

Per-file timestamps are not required.

The purpose of the line is:

- state-file discoverability;
- recovery orientation;
- visual reminder during reasoning;
- extension-file registration.

If an extension file becomes part of canonical active working state, append its logical owner name to the same line.

Navigation registers logical owners, not physical generation filenames. Generation suffixes and transient Library identities do not belong in the Stage Plan navigation.

The navigation line does not make persistence a new `Phase loop` value.

---

## 8. Synchronization model

Persistence is cross-cutting.

The existing Command Center workflow remains authoritative for when decisions become accepted. This protocol only determines which working-state owner must be synchronized when accepted or operationally material state changes.

Typical synchronization triggers:

### `OPERATION_MEMORY.md`

Update whenever operational continuity would materially benefit, including:

- current question / continuation change;
- important new evidence;
- blocker or unresolved finding;
- substantial external handoff / return;
- recovery-relevant transition;
- a persistent project / operator / bootstrap anchor used for recovery or safe continuation becomes known, changes, becomes stale, or requires reconciliation;
- Gate / Decision gate where current working context changes;
- Stage transition.

### `STAGE_PLAN.md`

Update when the accepted Stage route changes, a Stage is completed, or Stage framing materially changes the high-level plan.

### `PROJECT_DEFINITION.md`

Update when an accepted project-level definition changes: purpose, scope, requirement, product contract, major constraint, or other durable understanding of what is being built.

### `ARCHITECTURE.md`

Update when an architecture decision becomes accepted / Approved, when an accepted architectural contract is corrected, or when confirmed project/repo evidence materially changes the current architecture understanding.

Do not update a file merely because a related topic was discussed.

### Synchronization coalescing

Intermediate refinements inside one coherent reasoning or execution interval should remain local in the `/tmp` candidate rather than producing repeated Library publications.

Preferred pattern:

```text
local candidate
→ refine
→ refine
→ validate
→ one coherent Library publication
```

A new Library publication is warranted when the owner has reached a meaningful synchronization boundary: accepted or operationally material state must become durable, an external handoff is about to occur, recovery continuity would materially benefit, or another workflow event requires persistent state.

Coalescing must not delay durability across a boundary where losing the local candidate would materially impair continuation.

### Working-context refresh

Working State persistence and model-context refresh are different operations.

Do not reread Working State on a fixed message cadence.

At meaningful workflow boundaries where context drift would materially increase risk, ensure that the current `OPERATION_MEMORY.md` is actively available to Command Center reasoning.

Typical refresh points include:

- Stage entry or Stage transition;
- Decision gate;
- before authoring Stage Brief / OPS Task;
- after a substantial external Codex handoff and before Review;
- recovery or runtime/context continuity uncertainty;
- when current navigation, scope, ownership or continuation is no longer confidently held.

A context refresh is read-only and does not itself create a new Library generation.

When the current verified `/tmp` base is known to match the active Library generation, it may be reused for refresh; otherwise resolve and read the current Library generation according to the normal recovery / completeness rules.

The purpose of refresh is to restore high-signal operational context — including the persistent bootstrap / recovery block, current navigation and current continuation state — without repeatedly injecting the full Working State on every message.

---

## 9. Multi-file state changes

One accepted decision may affect several working-state owners.

For a coherent multi-file transition:

1. identify every owner made stale by the accepted change;
2. update and verify durable domain owners first (`PROJECT_DEFINITION.md`, `ARCHITECTURE.md`, `STAGE_PLAN.md`, extension owners as applicable);
3. update `OPERATION_MEMORY.md` last so it reflects the completed resulting state and acts as the recovery commit marker for that logical transition.

Candidates for several owners may be prepared and validated locally before publication. Persistent publication still follows the owner ordering above; this protocol does not assume an atomic multi-file Library transaction.

If any required domain-owner update fails, do not write a misleading final operational-memory state that claims the transition completed.

---

## 10. Safe Library mutation

Routine working-state edits use generational copy-on-write publication rather than in-place overwrite:

```text
resolve current Library generation
→ obtain or reuse verified `/tmp` base
→ copy immutable base to next-generation candidate
→ targeted local mutation
→ local diff / validation
→ concurrency check
→ publish next generation to Library
→ exact publication verification
→ retire previous generation
→ verify namespace state
→ keep new generation as the session-local verified base
```

The stable semantic identity is the logical owner. Physical Library generations and their `file_id` / `library_file_id` values are transient storage identities.

### 10.1. Resolve current generation and obtain a complete base

Before a mutation, resolve the current physical generation for the logical owner.

Obtain the complete current content when no verified local mirror is available. If a read is partial or indicates that more content remains, continue reading before constructing the local base.

A full Library read is required when:

- the owner has not yet been loaded in the current runtime;
- the verified `/tmp` mirror is missing;
- the runtime/session changed;
- Library generation identity no longer matches the local mirror;
- recovery is in progress;
- completeness or provenance is uncertain.

If a verified `/tmp` base already exists and Library metadata confirms that the same generation is still current, the full file does not need to be read again merely to perform another mutation.

Do not mutate from an incomplete or unverified base.

### 10.2. Session-local verified mirror and immutable base

Keep an exact verified copy of the current generation under `/tmp` while it remains useful in the active runtime.

`/tmp` is disposable and must never become the persistent source of truth or a recovery dependency. If it disappears, reconstruct the required base from Library.

The current verified base is immutable for the duration of a mutation. Create the next candidate by copying the base:

```text
/tmp/<owner>__gNNNNNN.base.md   # verified immutable base
        ↓ copy
/tmp/<owner>__g<next_generation>.md   # mutable candidate
```

Do not edit the verified base in place.

### 10.3. Targeted mutation

Apply changes only to the candidate.

Prefer targeted edits to the candidate. Do not regenerate the entire file from model memory unless the task explicitly requires a full rebuild and the complete current source has been loaded.

Several intermediate refinements may be applied to the same local candidate before the next synchronization boundary. They do not require separate Library publications.

### 10.4. Local diff / validation

Compare the immutable base with the candidate locally before publication.

Validate that the delta matches the intended state transition. Unexpected broad deletion, unrelated rewrite, missing mandatory content, unexplained large diff, or semantic movement to the wrong owner requires stop / re-check before publication.

Mechanical validation should remain inside the runtime when possible. The model context needs the meaningful delta and relevant evidence, not necessarily the full repeated contents of both files or every line of a large diff.

A zero diff means there is no state change to publish.

### 10.5. Optimistic concurrency

Capture the current Library generation identity used to construct the local base.

Immediately before publishing the next generation, re-check the Library namespace / metadata for that logical owner.

Publication is allowed only when the generation used as the base is still the current valid generation and no unexpected newer or conflicting generation has appeared.

Use the strongest available transient identity evidence, such as the current generation filename together with current `file_id`, `library_file_id`, version metadata, size, or equivalent platform identity where useful.

If the Library state no longer matches the base:

```text
STOP stale publication
→ resolve current Library generations
→ reread / recover current state as needed
→ rebase / reconcile candidate
→ validate again
```

Do not publish a candidate derived from stale state as though it were current.

### 10.6. Publish next generation

Publish the complete validated candidate as a new Library generation for the same logical owner.

Example:

```text
OPERATION_MEMORY__g000018.md   # current verified Library generation
OPERATION_MEMORY__g000019.md   # next candidate published as a new Library file
```

Publication creates the next physical Library object; it does not overwrite the current generation in place.

The generation number is monotonic per logical owner and carries no semantic meaning beyond ordering physical generations.

Never delete or replace the current verified generation before the next generation has been successfully published.

### 10.7. Exact publication verification

A successful write/upload response alone is not sufficient evidence that the new generation is safe to accept.

After publication, verify that the published Library generation represents the validated local candidate exactly enough for safe acceptance.

The local base-versus-candidate semantic diff has already established what changed. Post-publication verification answers a different question:

```text
published Library generation
==
validated local candidate
```

Prefer exact-content / byte-equivalent verification when available. A strong digest/checksum and size may be used as compact evidence when derived from complete representations. Full file contents do not need to be emitted into model context merely for mechanical identity verification.

Also verify that:

- the expected generation exists under the correct project namespace and logical owner;
- the result is complete;
- no unexpected competing newer generation appeared during publication.

If exact publication verification fails, the previous verified Library generation remains current and must not be retired.

### 10.8. Retire previous generation

Only after the next generation has been successfully verified may the previous generation be retired from Library.

Preferred order:

```text
publish next
→ verify next
→ retire previous
```

If retirement of the previous generation fails after the new generation has been verified, this is a recoverable cleanup condition rather than data loss. Preserve both generations, treat the verified newer generation as the recovery candidate, and reconcile the residue on the next safe access.

After retirement, verify that the namespace is coherent and normally contains exactly one current generation for that logical owner.

### 10.9. Reuse and cleanup of `/tmp`

After a successful mutation, the verified candidate becomes the new session-local base for subsequent mutations.

Cleanup obsolete local generations and failed candidates when practical, but do not delete the current verified `/tmp` base merely because one mutation completed if it is likely to be reused in the active runtime.

Correctness must remain unchanged if the entire `/tmp` worktree disappears immediately after successful Library publication and verification. Library remains the persistent source of truth.

---

## 11. Initialization

When a new standard Command Center project space is initialized:

1. use the accepted project name / namespace when it is already known;
2. if the final project name is not yet known, use a clearly temporary project namespace rather than blocking Stage 0;
3. create `/Command Center/<project_name>/` or the temporary equivalent if absent;
4. create the first physical generation for each of the four canonical logical owners if absent, normally using `__g000001`;
5. initialize `STAGE_PLAN.md`, `PROJECT_DEFINITION.md` and `ARCHITECTURE.md` with minimal pending / not-yet-defined content rather than invented project facts;
6. initialize `OPERATION_MEMORY.md` with the minimal operational context already known at that point; if the active Command Center activation envelope defines a persistent bootstrap / recovery block, materialize it there using only known values, applicable operator defaults and explicit unresolved markers rather than invented project facts;
7. register the four logical owner names in the navigation `Working state` line when canonical Stage navigation becomes applicable;
8. populate or synchronize owners only as sufficient project evidence, operationally material context and accepted decisions emerge.

Initial physical examples:

```text
OPERATION_MEMORY__g000001.md
STAGE_PLAN__g000001.md
PROJECT_DEFINITION__g000001.md
ARCHITECTURE__g000001.md
```

A temporary project namespace is only a naming placeholder. Once the project name is accepted, the project Library folder may be renamed or moved while preserving the same working-state responsibilities.

Initialization must not fabricate Project Definition, Stage Plan, or Architecture merely to avoid an empty file.

---

## 12. Recovery and new-chat continuation

Recovery and continuation are explicit. The user identifies or confirms the intended project namespace; Command Center must not auto-switch between project spaces or infer a branch namespace.

When Command Center must recover project context from Library:

1. identify the intended project namespace;
2. enumerate the physical generations for each registered logical working-state owner;
3. resolve the current valid generation for `OPERATION_MEMORY.md` and read it for current navigation and continuation;
4. resolve the current valid generation for `STAGE_PLAN.md` and read it for the current route;
5. resolve the current valid generation for `PROJECT_DEFINITION.md` and read it for the current project definition;
6. resolve the current valid generation for `ARCHITECTURE.md` and read it for the current architectural contract;
7. resolve and read any additional working-state owners registered in navigation when relevant;
8. reconcile the recovered state with the current user request and any fresh chat evidence before continuing;
9. if the active Command Center activation envelope defines a persistent bootstrap / recovery block for `OPERATION_MEMORY.md`, reconcile that block after recovery:
   - if absent, add it through a targeted safe mutation;
   - if present, preserve it and update only missing or stale block content;
   - preserve unrelated current `OPERATION_MEMORY.md` state;
   - do not perform this mutation when the active task is explicitly read-only.

Normal state for one logical owner is exactly one current physical generation.

If several generations for the same owner are present, do not blindly choose the highest number. Treat the highest generation as the primary recovery candidate, inspect / validate it, and determine whether the older generation is an interrupted-cleanup residue.

Typical recovery pattern:

```text
older generation + newer generation
→ inspect newer as recovery candidate
→ if newer is complete and coherent, accept it as current and retire stale predecessor when safe
→ if validity is uncertain, preserve both and stop for reconciliation
```

A generation number orders physical candidates; it does not itself prove validity.

When a verified current generation has been recovered, Command Center may hydrate a reusable `/tmp` mirror for subsequent mutations. Loss of that mirror later does not alter persistent state.

The files complement ChatGPT's normal conversation context and memory. They do not require ignoring available conversation history.

If Library state and current chat evidence conflict materially, do not silently choose one. Identify the conflict and resolve which state is current before making further durable updates.

---

## 13. Boundaries

The working-state layer does not replace:

- the conversation;
- `Stage_Plan_Protocol.md`;
- `Architecture_Reasoning_Guide.md`;
- `OPS_CENTER_CODEX_PROTOCOL.md`;
- `Architecture_Map.md`;
- `Command_Center_Role.md`;
- repo-side `AGENTS.md`;
- Stage Briefs;
- OPS Tasks;
- ExecPlans;
- reports / diff artifacts;
- durable project source-of-truth documentation in the repository;
- Git history.

Working-state files are primarily Command Center's own compact project context.

They should not be mirrored into the product repository by default.

Conversation artifacts and repository artifacts may inform working state, but they do not automatically become working-state owners.

---

## 14. Failure / stop rules

Stop the state mutation and preserve the last verified Library generation when:

- the current generation cannot be resolved safely;
- the required current content cannot be read completely when no verified local mirror is available;
- the project namespace is ambiguous;
- the candidate mutation has an unexpected or overly broad diff;
- a concurrent Library generation change is detected;
- required owner files cannot be updated coherently;
- publication of the next generation fails;
- publication verification does not confirm the expected candidate;
- multiple generations cannot be reconciled safely;
- a proposed persistent extension has no clear responsibility boundary.

If publication verification fails, do not retire the previous verified generation.

If the next generation has been verified but retirement of the previous generation fails, preserve both generations, treat the state as a recoverable cleanup residue, and reconcile it on the next safe access. Do not destroy the verified newer generation merely to restore a single-file appearance.

Missing or lost `/tmp` state is not itself a persistent-state failure. Rehydrate the required verified base from Library.

Do not repair ambiguity by silently inventing state.
