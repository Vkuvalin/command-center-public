# Stage Plan Protocol

> Рабочий протокол для Command Center.

Stage Plan — навигационный слой командного центра для длинной работы над проектированием, архитектурой, кодингом и постановкой задач Codex.

Он использует Stage/Loop-модель для организации работы на длинной дистанции: Stage фиксирует направление, Step фиксирует текущий вопрос, Step-loop позволяет уточнять вопрос столько раз, сколько нужно, а Gate закрывает решение и даёт переход дальше.

Stage Plan нужен не для того, чтобы обложить работу правилами, а чтобы удерживать общий ход работы, не терять решения и спокойно двигаться от обсуждения к Stage Brief, OPS Task, review, fix-loop и commit.

Навигационная плашка отдельно отражает текущую фазу работы через `Phase loop` и зрелость архитектурного решения через `Architecture`; `Architecture` не является отдельным workflow.

`Command_Center_Working_State_Protocol.md` задаёт отдельный persistent working-state layer Command Center и сопровождает Stage Plan сквозным образом. Его правила не дублируются здесь; working-state persistence не является отдельным workflow или значением `Phase loop`.

Это не repo-side Codex workflow.
Codex не должен знать всю историю Stage-обсуждения.
Если работа в Stage передаётся Codex через OPS flow, Codex получает OPS Task и, только для TS-B, referenced Stage Brief.

---

## 1. Назначение

Stage Plan используется, когда работа идёт крупными блоками, а количество уточнений внутри блока заранее неизвестно.

Он помогает не фиксировать весь путь заранее, а двигаться последовательно:

* сначала определить цель работы;
* затем собрать верхнеуровневую карту Stage: заявить будущие Stage и примерные вопросы, которые будут разбираться;
* при старте конкретного Stage ещё раз переосмыслить, уточнить и утвердить его границы;
* дальше двигаться внутри текущего Stage через Step и Step-loop;
* закрывать решения через Gate;
* собирать решения закрытых Step в `Decision gate`;
* при необходимости проверять сборное решение, repo-факты, альтернативы и риски через `Codex Audit`;
* отслеживать зрелость архитектурного решения через `Architecture`;
* при необходимости собирать Stage Brief, OPS Task и передавать задачу Codex.

Stage Plan лучше подходит для длинной разработки, архитектуры, кодинга, проектирования и работы с множеством уточнений.

Если цель ещё не оформлена, работа может начинаться со Stage 0 — свободного обсуждения, синхронизации и сбора будущего Stage Plan.

---

## 2. Базовые сущности

**Stage** — большой блок работы внутри проекта.
Stage имеет цель, границы и верхнеуровневую карту вопросов, которые нужно последовательно разобрать.

**Step** — конкретный вопрос, решение или участок работы внутри Stage.
Step помогает не решать всё сразу, а удерживать фокус на одном текущем вопросе.

**Step-loop** — любое количество уточняющих подитераций внутри одного Step.
Количество loop заранее не фиксируется: пока вопрос не закрыт, работа остаётся внутри текущего Step-loop.

**Gate** — явное закрытие текущего Step.
Gate означает, что решение по текущему Step сформулировано, зафиксировано и можно переходить дальше.

**Decision gate** — фаза сборки и проверки решения по всему текущему Stage.
Command Center сводит решения закрытых Step, проверяет их совместимость, формирует или уточняет сборное решение и выбирает дальнейший переход:

```text
Decision gate
├─ принять сборное решение;
├─ при необходимости отправить его на Codex Audit;
└─ вернуть отдельный вопрос в Step-loop.
```

**Architecture** — сквозное навигационное состояние зрелости архитектурной составляющей текущего Stage.
Оно не является отдельной фазой, не заменяет `Phase loop` и не передаёт архитектурное ownership Codex.

`Architecture_Reasoning_Guide.md` используется как reasoning companion для `Architecture`: помогает распознавать уровень решения, связанные decision areas и supporting lenses, но не задаёт workflow и не принимает решение.

**Stage Brief** — отдельная подробная task-specific specification для TS-B / brief-backed OPS Task, собранная из принятых решений, уточнений и выводов. В ней фиксируются цель, scope и non-goals, значимые architecture / ownership constraints, invariants, required behavior и acceptance expectations.

**OPS Task** — обязательный task file `docs/codex/tasks/<task>.md` для работы, передаваемой Codex через OPS flow. Он содержит execution envelope и явный `Task shape: standalone` (TS-A) либо `Task shape: brief-backed` (TS-B). TS-A также содержит compact task specification; TS-B ссылается на Stage Brief с полной task-specific specification. Выбор формы определяется Task Shape Router по смыслу и preserved value отдельного Brief, а не по размеру задачи. OPS Task оформляется по `OPS_CENTER_CODEX_PROTOCOL.md`.

OPS Task является initial task envelope repo-side Codex workflow. Stage Brief для TS-B — downstream artifact.

---

## 3. Stage 0 и старт работы

Stage Mode может начинаться не сразу с разработки.

В новом чате или при новой большой теме сначала может идти Stage 0 — свободное обсуждение, синхронизация и сбор цели.

Stage 0 нужен, чтобы:

* собрать идею;
* понять, что вообще разрабатываем;
* определить цель работы;
* обозначить границы и риски;
* наметить будущие Stage;
* перечислить примерные вопросы, которые будут разбираться в рамках этих Stage;
* определить, есть ли архитектурная составляющая и находится ли она в состоянии `N/A`, `Existing` или `Exploring`.

Итог Stage 0 — не готовая задача для Codex, а консолидированное определение проекта и верхнеуровневый Stage Plan: предварительная карта дальнейшей работы. Их persistent working state ведётся согласно `Command_Center_Working_State_Protocol.md`.

После Stage 0 начинается работа по конкретным Stage.

При создании нового проекта с нуля foundation выполняется в `Stage 1 — Repo foundation` по §3.3, а не внутри Stage 0. Для существующего проекта сохраняется текущая Stage-нумерация; при необходимости foundation включается в согласованный Stage без повторного создания уже корректного каркаса.

При старте каждого конкретного Stage его шаг `X.0` используется для повторного уточнения: мы ещё раз переосмысливаем цель, границы и вопросы именно этого Stage перед тем, как идти дальше.

На Stage 0 и `X.0`, если архитектурная составляющая применима, `Architecture_Reasoning_Guide.md` используется для первичной ориентации по масштабу решения и связанным decision areas.

После этого определяется начальное состояние `Architecture` текущего Stage.

### 3.1. Принцип верхнеуровневого Stage Plan

Верхнеуровневый Stage Plan не должен заранее фиксировать полный список Step внутри каждого будущего Stage.

На этапе верхнеуровневого планирования для каждого Stage фиксируются только:

* краткое название Stage;
* цель Stage;
* примерные вопросы или зоны, которые предстоит разобрать;
* ожидаемый верхнеуровневый итог без преждевременной фиксации конкретного artifact;
* очевидные риски и зависимости.

Начальный состав и порядок конкретных Step уточняются при входе в Stage на шаге `X.0` и при необходимости корректируются в ходе работы.

Количество Step-loop заранее не определяется. Необходимость `Codex Audit` и Stage Brief уточняется по мере проработки Stage и зависит от фактического scope, рисков и ожидаемого результата. **Если работа передаётся Codex через OPS flow, OPS Task обязателен.**

Это сохраняет гибкость верхнеуровневого плана: новые факты, ограничения, архитектурные развилки или риски уточняют состав конкретного Stage, а не требуют пересобирать всю предварительную карту работы.

### 3.2. Верификация намерения

Перед переходом к Stage 0, Stage framing, Step discussion или составлению верхнеуровневого Stage Plan сначала выполняется верификация намерения.

Минимальная проверка:

* кратко сформулировать, как понята цель;
* отделить факты от предположений;
* обозначить неясности, риски и возможные границы scope;
* определить, затрагивает ли задача архитектурное решение или существующие архитектурные границы;
* определить, нужны ли уточняющие вопросы.

Если есть риск неверного направления, нужно задать уточняющие вопросы и дождаться ответа.

Если цель достаточно ясна, можно не задавать вопросы, но нужно прямо зафиксировать, что уточнения не требуются, и взять ответственность за переход к следующему режиму.

Для сложных, архитектурных, code-sensitive или неоднозначных задач можно добавить короткие attack questions:

* что может быть неверно понято;
* где может расползтись scope;
* какие source-of-truth файлы важны;
* какие слои нельзя трогать;
* что может сломаться при неверном решении;
* как проверить результат;
* нужен ли сначала audit-only или Codex Audit.

Attack questions не используются как ритуал для простых задач.

### 3.3. Stage 1 — Repo foundation

Stage 1 нового проекта переводит принятую foundation architecture в минимальный проверяемый каркас repo и адаптированный `AGENTS.md`. Stage 0 определяет цель и верхнеуровневый план; project-specific foundation не выполняется внутри Stage 0.

На `1.0` уточняются foundation scope, architecture / ownership boundaries и required validation. До project-specific write Command Center принимает необходимые foundation decisions через обычный `Decision gate`; implementation опирается на `Approved` решение либо существующий applicable approved contract. Проектирование всей будущей системы заранее не требуется.

Создаются только необходимые принятой архитектуре directories / packages / modules и согласованные минимальные configuration / startup / test elements. Универсальное дерево каталогов и структуры под неутверждённые будущие возможности не создаются. Наличие каркаса не считается реализацией функций продукта.

`AGENTS.md` формируется из действующего approved шаблона: project-specific sections анализируются и заполняются по необходимости. Заполнение каждого раздела ради формы не требуется. Protected §§3–4 сохраняются; их изменение требует отдельного explicit Command Center architecture decision, заранее ограниченного scope и отдельного Review.

Command Center определяет approved meaning / scope; Codex в bounded OPS Task физически создаёт согласованный каркас и редактирует разрешённые sections `AGENTS.md`; Command Center проверяет результат через `Repo change handoff → Review` и принимает его либо возвращает на Fix. Эта модель ответственности применяется и к последующим AGENTS updates.

Foundation contract передаётся через TS-A OPS Task либо TS-B Stage Brief. Принятые архитектурные решения получают project-specific durable owner(s) в approved scope; `AGENTS.md` содержит только необходимые краткие guardrails и ссылки, а не дублирует полную архитектурную документацию.

До первого Codex launch Command Center организует минимальный placement bootstrap по §7.5: рабочий каталог, approved шаблон `AGENTS.md`, OPS Task и необходимые referenced workflow / task artifacts должны быть доступны. Placement готового шаблона не является его project-specific заполнением и не заменяет foundation implementation. Git initialization / remote binding выполняются только при явном включении в scope и по отдельным точным operator-командам; наличие remote не обязательно.

Foundation проверяется относительно approved contract: структура repo, содержание `AGENTS.md` и durable references согласованы; предусмотренная validation выполнена либо skipped reasons приняты. Дальнейшие handoff / Review / closure выполняются по §7. Foundation не вводит новую фазу `Phase loop` или отдельный approval workflow.

---

## 4. Рабочий порядок

Обычный порядок работы в Stage Mode:

1. Начать со Stage 0, если нужно собрать идею, цель и верхнеуровневый Stage Plan.
2. Выбрать конкретный Stage из верхнеуровневой карты.
3. Открыть шаг `X.0`, уточнить цель, границы и вопросы текущего Stage и определить начальное состояние `Architecture`.
4. Открыть первый Step.
5. Вести Step-loop столько, сколько нужно для закрытия текущего вопроса.
6. Закрыть Step через Gate.
7. Перейти к следующему Step и повторять Step-loop / Gate, пока не будут закрыты ключевые вопросы Stage.
8. Перейти в `Decision gate`: собрать решения закрытых Step, сформировать или уточнить сборное решение Stage и выбрать дальнейший переход.
9. Если выбран `Codex Audit`, оформить отдельную read-only задачу по OPS protocol: выбрать применимый task shape, сформировать OPS Task и Stage Brief только для TS-B, передать задачу через OPS delivery, выполнить Audit, провести Review результата и повторно открыть `Decision gate`.
10. После принятия сборного решения в `Decision gate`, если работа передаётся Codex, применить Task Shape Router и подготовить управляющие artifacts по `OPS_CENTER_CODEX_PROTOCOL.md`: TS-A ведёт к standalone OPS Task; TS-B — сначала к Stage Brief, затем к brief-backed OPS Task.
11. Для TS-B сначала сформировать Stage Brief, затем brief-backed OPS Task с точной ссылкой на него. Для TS-A сформировать standalone OPS Task. В обоих случаях явно указать `Task shape:`. Authoring выполняется по `OPS_CENTER_CODEX_PROTOCOL.md`.
12. Передать подготовленную задачу через OPS delivery: выдать placement PowerShell для task artifacts и отдельно Fixed Launch Prompt с exact OPS Task path. PowerShell отвечает только за размещение и verification artifacts; Fixed Launch Prompt только активирует repo-side bootstrap и не содержит task specification.
13. Получить результат Codex и провести Review относительно исходной OPS Task / Stage Brief и фактического evidence. После любой write-задачи до Review сформировать `Repo change handoff` по §7. Для read-only задачи Review проводится по соответствующему report / findings / evidence без искусственного write-handoff.
14. Если accepted contract остаётся верным, а implementation требует исправления, запустить Fix-loop по §7. После новых write-изменений сформировать применимый `Repo change handoff` и повторить Review. Если finding требует изменить сам accepted contract, architecture, ownership или другой approval boundary, вернуть вопрос в `Decision gate`, а не продолжать как implementation Fix-loop.
15. После принятия write-result выполнить closure по §7: разрешить применимые Documentation / AGENTS impact, artifact archive / cleanup, проверить final working state, сформировать exact final staging и final staged handoff, выполнить Commit после принятия финального состояния и, если требуется closure contract, отдельный Remote Sync с verification. Если repo не изменялся, staging и Commit пропускаются и работа переходит к следующему применимому этапу.

`Architecture` обновляется по мере изменения зрелости архитектурного решения на протяжении Stage и не является отдельным последовательным шагом рабочего порядка.

`Architecture_Reasoning_Guide.md` подключается по смыслу при формировании, проверке или пересмотре архитектурного решения и также не является отдельным последовательным шагом рабочего порядка.

Короткая схема:

```text
Stage 0, if needed
→ верхнеуровневый Stage Plan
→ Stage X.0 framing
→ Step discussion
→ Step-loop
→ Gate
→ следующие Step
→ Decision gate
   ├─ accepted
   ├─ Codex Audit → Review → Decision gate
   └─ Step-loop → Gate → Decision gate
→ Task Shape Router, if Codex work exists
   ├─ TS-A → standalone OPS Task
   └─ TS-B → Stage Brief → brief-backed OPS Task
→ OPS delivery
   ├─ placement PowerShell
   └─ Fixed Launch Prompt
→ Codex
→ Repo change handoff, for write result
→ Review
→ [Fix-loop → Repo change handoff → Review]*
→ applicable closure
→ final staged handoff, for write result
→ Commit, if repo changed
→ Remote Sync / verification, if required
→ Stage closed
```

`Architecture` сопровождает рабочий порядок как независимое сквозное состояние зрелости. Полный список состояний и правила переходов определены в §6.3.

Не каждый Stage обязан проходить все фазы.

Если Stage не передаёт работу Codex, OPS Task не требуется. Stage Brief создаётся только для TS-B Codex-задачи.

Task Shape Router, OPS delivery, execution slices, Repo change handoff и closure operations не становятся отдельными значениями `Phase loop`.

Substantial execution может выполняться bounded slices внутри одной approved Task и применимого ExecPlan. Slice не является новым Stage, Step, OPS Task или approval boundary, пока сохраняются accepted scope / contract / material risk.

Если объём report / files / findings / diff велик, Review может выполняться по batch согласно §7.3.

Codex Audit остаётся необязательной read-only проверкой repo, diff, архитектурной границы, alternatives, tests/docs или рисков. Его focus определяется текущим `Decision gate`, scope и audit focus; Audit не даёт implementation или architecture approval.

---

## 5. Нумерация

Stage и Step нумеруются так, чтобы было понятно, где именно находится работа.

Пример:

```text
Stage 14
  14.0 Stage framing
    14.0.1 loop
    14.0.2 loop
    decision / gate passed

  14.1 First Step
    14.1.1 loop
    14.1.2 loop
    decision / gate passed

  14.2 Second Step
    ...
```

`14.0` обычно используется для framing текущего Stage: уточнения цели, границ и вопросов перед началом работы.

`14.1`, `14.2`, `14.3` и дальше — это отдельные Step внутри Stage.

`14.1.1`, `14.1.2`, `14.1.3` — это loop внутри конкретного Step.

Количество loop заранее не фиксируется.
Пока вопрос не закрыт через Gate, работа остаётся внутри текущего Step-loop.

Gate в конце Step фиксируется внутри самого Step и не выводится как отдельная фаза `Phase loop`.

---

## 6. Навигационная плашка

В начале каждого stage-сообщения используется короткая навигационная плашка.

Она нужна, чтобы не терять текущий Stage, фазу workflow, состояние архитектурного решения, Step, вопрос, Gate и позицию внутри общей работы.

Формат:

```text
🧭 Stage <номер> — <краткое название Stage>

Phase loop: <Stage framing / Step discussion / Decision gate / Codex Audit / Stage Brief / OPS Task / Review / Fix-loop / Commit>
Architecture: <N/A / Existing / Exploring / Proposed / Assessed / Approved> — <optional short summary>
Current step: 14.X — <название>
Current question: <какой вопрос закрываем/уточняем сейчас>
Decision gate: <что должно быть решено, чтобы идти дальше>
Position: 14.1 🔵 — <название> | 14.0 ✅ · 14.1 🔵 · 14.2 ⏳
Working state (last update: <date or compact marker>): <active logical working-state owners from the current project namespace, resolved according to `Command_Center_Working_State_Protocol.md`>
```

`Working state` показывает активные persistent working-state files; их initialization, synchronization, recovery и extensions определяются `Command_Center_Working_State_Protocol.md`.

### 6.1. Phase loop

`Phase loop` показывает, в какой фазе Stage сейчас находится.

Возможные фазы:

```text
Stage framing — уточняем цель, границы, вопросы текущего Stage и начальное состояние Architecture.
Step discussion — обсуждаем текущий Step; локальный Gate фиксируется в конце Step без отдельной фазы Phase loop.
Decision gate — подводим итог решений по закрытым Step, собираем или уточняем сборное решение Stage и выбираем дальнейший переход: принять решение, при необходимости отправить его на Codex Audit либо вернуть отдельный вопрос в Step-loop. Если Codex Audit проводился, после Review его результата Decision gate открывается повторно.
Codex Audit — необязательная read-only фаза, где Command Center формирует задачу Codex для проверки repo, diff, архитектурной границы, alternatives, tests/docs или рисков до implementation. Результат возвращается в Review и не является approval на implementation или архитектурным approval.
Stage Brief — для TS-B собираем отдельную полную task-specific specification из принятых решений до OPS Task.
OPS Task — создаём обязательный initial task envelope для передаваемой Codex работы; TS-A содержит компактную specification, TS-B ссылается на Stage Brief. Фиксированный Launch Prompt только передаёт путь к OPS Task и не является отдельной фазой.
Review — проверяем report / files / findings / diff и соответствие результата applicable approved contract. Review может относиться как к результату отдельного `Codex Audit`, так и к результату основной OPS Task.
Fix-loop — точечно исправляем найденные проблемы.
Commit — фиксируем локальный final accepted state. Если closure contract требует Remote Sync, после Commit выполняются отдельный push / verification; Stage закрывается после завершения применимых closure operations.
```

Не каждый Stage обязан проходить все фазы.
`Phase loop` нужен только для навигации: он показывает, где сейчас находится работа.

### 6.2. Current step / Current question / Decision gate

`Current step` показывает, какой Step сейчас открыт внутри Stage.

```text
Current step: 15.1 — Workflow input and starting job state
```

`Current question` фиксирует конкретный вопрос, который сейчас нужно закрыть.

```text
Current question: Откуда стартует workflow?
```

`Decision gate` показывает, какое решение нужно принять, чтобы перейти дальше.

Во время `Step discussion` он отражает условие закрытия текущего Step:

```text
Decision gate: выбрать стартовую точку workflow и согласовать границы Step
```

Во время фазы `Decision gate` он отражает условие принятия сборного решения Stage:

```text
Decision gate: подтвердить сборное решение, отправить его на Codex Audit или вернуть вопрос в Step-loop
```

Эти поля нужны, чтобы обсуждение не расползалось: пока текущий вопрос или сборное решение не закрыты, работа остаётся в соответствующем loop.

### 6.3. Architecture

`Architecture` показывает зрелость архитектурной составляющей текущего Stage.

```text
Phase loop
= текущее действие

Architecture
= зрелость архитектурного решения
```

`Architecture`:

* живёт независимо от `Phase loop`;
* не является отдельной фазой workflow;
* не дублирует `Codex Audit`, `Review`, `Stage Brief` или другие действия;
* не принимает решение автоматически;
* не передаёт архитектурное ownership Codex;
* отражает агрегированное состояние архитектурного решения всего текущего Stage.

Формат:

```text
Architecture: <state> — <краткий объект или содержание решения>
```

Примеры:

```text
Architecture: Exploring — ownership extraction state
Architecture: Proposed — DB-backed extraction boundary
Architecture: Assessed — compatible after transaction-boundary correction
Architecture: Approved — repository owns persistence; workflow owns orchestration
Architecture: N/A
```

Состояния:

```text
N/A — архитектурная составляющая в текущем Stage отсутствует.
Existing — новое архитектурное решение не создаётся; Stage следует уже принятой архитектуре и существующим boundaries.
Exploring — архитектурное решение формируется или пересматривается: исследуются варианты, ownership, boundaries, trade-offs и связь с актуальным состоянием repo.
Proposed — Command Center сформировал предварительное архитектурное решение в Decision gate. Оно ожидает принятия либо дополнительной проверки. Proposed не делает Codex Audit обязательным.
Assessed — предварительное решение прошло фактически проведённую дополнительную проверку по repo-фактам, совместимости, альтернативам и рискам, а результат проверки был рассмотрен в Review. Assessed не означает approval.
Approved — Command Center принял архитектурное решение в границах scope текущего Stage.
```

`Architecture: Approved` означает зрелость принятого архитектурного решения в scope текущего Stage, но не доказывает соответствие implementation этому решению.

Для architecture-sensitive work exact relevant architecture references / constraints передаются через OPS Task для TS-A либо через Stage Brief для TS-B. Codex проверяет их совместимость до write и не восстанавливает отсутствующий accepted architecture contract по памяти или форме кода. Тот же relevant contract используется в Review. Missing / conflicting required input возвращает evidence в `Decision gate`. Это не создаёт отдельный Architecture Gate и не требует универсального architecture file.

Типичные переходы:

```text
N/A / Existing → Exploring, если в Stage появляется новое архитектурное решение
Exploring → Proposed
Proposed → Approved, если дополнительная проверка не требуется
Proposed → Assessed, если дополнительная проверка была проведена и рассмотрена
Proposed / Assessed → Exploring, если решение требует пересмотра
Assessed → Approved
Approved → Exploring, если изменился scope или появились новые существенные факты
```

Это не обязательная линейная цепочка. `Assessed` используется только тогда, когда дополнительная проверка действительно проводилась. Если Command Center располагает достаточными фактами, Codex Audit не даёт существенного снижения риска и решение принято, допустим прямой переход `Proposed → Approved`.

Правила:

* Codex Audit остаётся optional и запускается только тогда, когда он materially improves confidence, проверяет repo-факты или снижает риск.
* При `Exploring`, формировании `Proposed` или пересмотре решения `Architecture_Reasoning_Guide.md` может использоваться как карта уровней, decision areas и supporting lenses; это не обязательный checklist.
* Codex может предоставить evidence, alternatives и recommendation, но не переводит `Architecture` в `Approved`.
* `Approved` устанавливается только Command Center и относится только к scope текущего Stage.
* Если Stage содержит несколько архитектурных вопросов, поле показывает агрегированное состояние всего Stage.
* При нескольких архитектурных вопросах показывается самое незрелое существенное состояние либо текущий критический архитектурный вопрос.
* Краткое пояснение после тире опционально и должно оставаться коротким.
* `Assessed` не является обязательным состоянием и не используется, если дополнительная проверка не проводилась.
* Если Stage создаёт или изменяет архитектурное решение, переход к Stage Brief возможен после `Approved`. Состояния `Existing` и `N/A` не требуют нового архитектурного approval.

### 6.4. Position и статусная шкала

`Position` показывает текущее место внутри Stage и состояние соседних Step.

Пример:

```text
Position: 14.1 🔵 — Workflow input | 14.0 ✅ · 14.1 🔵 · 14.2 ⏳
```

Статусы:

```text
⏳ pending  — ещё не дошли
🔵 active   — сейчас обсуждаем
✅ done     — решение принято
🟨 deferred — отложили сознательно
🟥 blocked  — нельзя идти дальше
```

`🟥 blocked` отражает временную невозможность продолжить текущий Step или Stage из-за недостающих данных, внешней зависимости или отсутствующего approval. Это не состояние `Architecture` и не отдельный стандартный исход `Decision gate`.

`Position` нужен, чтобы быстро видеть:

* какой Step сейчас активен;
* какие Step уже закрыты;
* какие Step ещё впереди;
* какие вопросы отложены или заблокированы.

Если Stage содержит много Step, `Position` можно схлопывать диапазонами, чтобы не перегружать навигационную плашку.

Пример:

```text
Position: 14.0–14.5 ✅ · 14.6 🔵 · 14.7–14.10 ⏳
```

Не схлопывай active step, blocked/deferred step, unresolved Gate и ближайший next step, если это ухудшает навигацию.

---

## 7. Review, Fix-loop и Commit

### 7.1. Repo change handoff

После любой write-задачи Codex и до соответствующего Review Command Center должен получить проверяемый handoff фактических изменений repo.

Handoff используется:

* после первичной OPS Task, если она изменила repo;
* после каждого Fix-loop либо перед terminal Review согласованной cumulative-серии;
* перед финальным принятием и Commit.

Strict incremental Review — default: каждый нетривиальный Fix получает отдельный delta и Review. Command Center может объединить небольшие причинно связанные corrections в cumulative fast-path с одним handoff и terminal Review, только если неизменны accepted contract, architecture / ownership, public / persistence / state contract, dependencies и material scope / risk.

Для первой write-задачи при чистом task scope формируется обычный delta. В strict incremental режиме перед следующей write-задачей текущее состояние Stage фиксируется в index как технический baseline после проверки scope и существующего repo state по §7.5:

```text
index = состояние до текущей write-задачи
working tree = изменения текущей write-задачи
git diff = текущий delta
```

Staged baseline служит только точкой сравнения и не означает approval или Commit. Если существующий index делает сравнение небезопасным или неоднозначным, требуется отдельное решение, а не автоматический unstage.

Repo change handoff включает:

* точный task scope, baseline и проверяемый candidate state / delta;
* `git status --short --untracked-files=all`;
* отдельный `.diff` текущего delta либо финального staged состояния;
* diff stat;
* `git diff --check` либо `git diff --cached --check`;
* выполненную validation и причины skipped checks;
* summary Codex и известные риски.

Для cumulative Review передаётся вся серия изменений относительно общей точки сравнения, а не только последний Fix.

Большой или многофайловый diff передаётся одним `.diff` и проверяется по batch. Прямые файлы запрашиваются только тогда, когда diff недостаточен для надёжного Review.

Новые untracked-файлы перед обычным delta diff регистрируются через `git add -N` по точным путям, чтобы они попали в patch без staging их содержимого.

Diff-файлы сохраняются под уникальными именами в ignored и untracked директории `docs/codex/diff/` и не перезаписываются между Review/Fix-loop циклами. Используется Stage-bound work-unit stem и последовательный Review ordinal; связанный report сохраняет тот же logical ordinal. Naming / placement определяются `Architecture_Map.md`.

Command Center самостоятельно определяет нужный режим handoff и возвращает точные copy-paste PowerShell-команды с фактическим scope и уникальным именем artifact. Конкретная validation определяется правилами текущего repo.

Codex не должен выполнять Commit, push, staging или unstaging без явной инструкции Command Center.

Ниже — состав Git-операций, а не готовые operator scripts. Проверки и упаковка команд выполняются по §7.5; финальный staging — только после closure changes по §7.6.

Текущий delta после первой write-задачи или Fix-loop:

```powershell
git status --short --untracked-files=all
git add -N -- <new-untracked-files>
git -c core.quotepath=false diff --output=docs/codex/diff/<artifact-name>.diff -- <scope>
git diff --stat -- <scope>
git diff --check -- <scope>
```

Команда `git add -N` используется только при наличии новых untracked-файлов.

Baseline перед следующим Fix-loop:

```powershell
git add -A -- <scope>
git status --short --untracked-files=all
git diff --cached --stat -- <scope>
git diff --cached --check -- <scope>
```

Финальный staged handoff перед Commit:

```powershell
git add -A -- <scope>
git diff --cached --check -- <scope>
git diff --cached --stat -- <scope>
git -c core.quotepath=false diff --cached --output=docs/codex/diff/<artifact-name>.diff -- <scope>
git status --short --untracked-files=all
git diff --stat -- <scope>
```

Шаблоны не заменяют точные команды: Command Center подставляет фактические пути, учитывает новые файлы и не смешивает текущий Stage с unrelated changes.

### 7.2. Review findings disposition

`Review` используется:

* после `Codex Audit` — для проверки findings, repo-фактов, альтернатив и рисков до implementation;
* после основной OPS Task / Fix — для проверки report/files/diff и принятия результата.

Review проверяет исходный контракт OPS Task / Stage Brief и качество фактического candidate. Review inputs, включая relevant architecture contract, и правила blocked/incomplete проверок — по §10.1 OPS protocol.

В Review phase каждый P0/P1/P2 finding должен получить disposition:

* fixed now;
* accepted risk;
* deferred to конкретный Stage/Step;
* converted to OPS Task;
* rejected with reason;
* intentionally not carried;
* keep as-is / protected non-change.

Переносимые между циклами существенные findings сохраняют stable IDs; merge / split отмечается явно. При другой severity scale сохраняются исходные обозначения и тот же принцип disposition.

`Keep as-is` защищает рассмотренный участок от ненужных изменений; `fixed now` требует evidence исправления. Acceptance определяется severity, scope и disposition, а не условием `findings = 0`.

Если finding затрагивает архитектурное решение, его disposition должен быть отражён в состоянии `Architecture`.

P0 не закрывает Review без явного решения.

P1 нельзя переносить дальше без ближайшего Stage/Step или approved deferral.

P2 можно отложить или закрыть как cleanup, но нельзя бесконечно переносить без решения.

Fix-loop исправляет implementation внутри неизменного accepted contract. Изменение contract или approval boundary требует `STOP → evidence → Decision gate` по OPS protocol. Неблокирующие adjacent findings не расширяют scope.

Если Review относится к результату Codex Audit, работа возвращается в `Decision gate`. Report, reviewer verdict и validation сами по себе не являются approval.

### 7.3. Batch processing в Review

Если объём report/files/findings/diff слишком велик для надёжного единого прохода, Review может быть разделён на batch.

Каждый batch должен иметь:

* конкретную цель;
* ограниченный набор материалов или findings;
* промежуточный вывод либо disposition.

После каждого batch обновляется сборная картина Review. Review считается завершённым только после обработки всех запланированных batch и принятия решений по существенным findings.

Batch processing не является отдельной фазой `Phase loop` и не применяется к небольшим локальным задачам.

### 7.4. Commit cleanup

В Commit phase для отработанных одноразовых файлов из `docs/codex/*`, которые не нужны для следующего Stage, provenance, reuse, audit или recovery, верни точные cleanup candidates и команды по §7.5.

Не включай файлы, которые должны переиспользоваться или ещё нужны активной работе / Review.

Не предлагай полуавтоматически удалять файлы вне `docs/codex/*`.

Durable project truth остаётся у владельца; завершённое execution / review evidence с исторической ценностью может архивироваться; ненужные temporary artifacts удаляются.

Project History: `<project-history-root>\<project>\<stage>\<relative-path>`. Относительные пути сохраняются; архив не является project truth или default bootstrap context.

Архивация: `inventory → copy → verify → cleanup source`. До copy проверяются source / destination и overlap; после — ожидаемый набор, структура и целостность копий. При ошибке copy / verification source не удаляется.

Отдельный archive receipt нужен только по требованию Stage; обычно достаточно проверяемого output операции.

Пример операции удаления после необходимых проверок:

```powershell
Remove-Item -LiteralPath "docs/codex/tasks/example-task.md","docs/codex/reports/example-report.md","docs/codex/stage_briefs/example-brief.md"
```

Repo-affecting archive / cleanup входит в Review и завершается до final staging по §7.6.

### 7.5. Commit commands и общие правила PowerShell

Правила едины для placement, проверок и всех Git / файловых операций.

Простая независимая операция — одна copy-pasteable строка. Связанные проверки, mutation и postconditions — один self-contained `& { ... }` block, выполняемый одной вставкой и не зависящий от внешних переменных.

Любая mutation: `expected state → verify → mutate exact scope → verify resulting state`. Paths / targets / refs — фактические. При ошибке или unexpected state операция останавливается и возвращает факты Command Center без автоматических исправлений.

До mutation проверяется staged / unstaged / untracked state. Pre-existing user work, ранее принятые изменения и parallel work сохраняются.

Перед rollback выясняется provenance; после approval предпочтителен selective recovery с сохранением корректных accepted частей. Прежний snapshot может быть read-only donor, но не новым approval.

Artifacts и operator-команды выдаются раздельно:

* Stage Brief — отдельный файл, только для TS-B;
* OPS Task — отдельный файл;
* placement PowerShell — отдельный copy-paste block;
* Fixed Launch Prompt — отдельный copy-paste block после placement / verification.

PowerShell переносит готовые файлы из фактической папки Downloads в согласованные repo paths с verification. Содержимое Task / Brief и Launch Prompt в скрипт не встраивается; скрипт не запускает Codex. Authoring и fixed Launch Prompt принадлежат OPS protocol.

### 7.6. Завершение Stage

После принятия implementation для closure проверяются:

```text
Documentation impact: <none / affected durable owners>
AGENTS impact: <yes / no>
```

В approved scope обновляются только owners, ставшие stale после accepted change; при отсутствии impact правки не нужны. AGENTS updates — event-driven, с распределением ответственности и защитой §§3–4 по §3.3. Если текущая Task не разрешает менять `AGENTS.md`, Codex только сообщает `AGENTS impact` и необходимые изменения; сама правка требует explicit approval и соответствующего execution scope в OPS Task. Документация текущего поведения сверяется с принятой реализацией.

Порядок завершения:

```text
implementation reviewed / accepted for closure
→ approved Documentation / AGENTS updates
→ applicable archive / cleanup
→ verify final working state
→ exact final staging
→ final staged handoff
→ final Command Center acceptance
→ Commit
→ Remote Sync / verification, if required
→ applicable execution-infrastructure cleanup
→ Stage closed
```

Repo-affecting closure changes также проходят handoff / Review. Финальный staged handoff показывает весь candidate scope относительно `HEAD`, а не только последний delta. При первом Commit, когда `HEAD` ещё отсутствует, baseline явно задаётся как пустое дерево Git, а handoff включает весь предлагаемый к первому Commit scope; несуществующий предыдущий commit не предполагается.

Перед Commit staged candidate должен соответствовать принятому reviewed state без unrelated staged work в Commit и непринятых unstaged changes внутри scope. Validation выполнена либо skipped reasons приняты; blocking obligations закрыты, findings имеют disposition.

Новые изменения требуют evidence и acceptance — старый Review на них не распространяется. Hash подтверждает только byte identity сопоставимых representations / baseline, не correctness или approval.

После Commit проверяются фактический commit SHA и resulting repo state. Если repo не изменялся, staging и Commit пропускаются.

Remote Sync выполняется отдельно, только при canonical remote и соответствующем closure contract. После push exact approved target проверяются local `HEAD`, expected remote branch SHA и final repo state. Если post-verification недоступна: `Remote verification: unresolved`, без автоматического повторного push.

Temporary branches / worktrees / refs очищаются отдельно после проверки сохранности accepted state и отсутствия потребности для recovery / следующего Stage. Tracked changes не переносятся в post-Commit cleanup.

Stage закрывается после выполнения применимых closure obligations, включая Remote Sync / verification, если они обязательны.

---

## 8. Принцип гибкости

Stage задаёт направление, но не фиксирует количество обсуждений заранее.

Внутри Stage можно уточнять, спорить, менять формулировки, возвращаться к деталям и продолжать Step-loop до тех пор, пока текущий вопрос не будет закрыт через Gate.

Гибкость не отменяет последовательность: сначала закрываем текущий Step, затем переходим к следующему.

Если был выбран Codex Audit, после Review его результата `Decision gate` открывается повторно: сборное решение может быть принято либо отдельный вопрос возвращён в Step-loop.

`Architecture` может сохранять состояние между фазами. При появлении новых существенных фактов, изменении scope или необходимости пересмотра решение возвращается в `Exploring`. Это не ошибка workflow, а явная фиксация изменения зрелости решения.

Если в процессе появляется новая крупная тема, её можно:

* встроить в текущий Step-loop;
* отложить;
* вынести в отдельный Step;
* вынести в будущий Stage.

Главное правило: внутри Stage решения принимаются последовательно, через Step-loop, Gate и `Decision gate`, а зрелость архитектурного решения отдельно отражается через `Architecture`.
