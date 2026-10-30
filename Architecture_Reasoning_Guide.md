# Architecture Reasoning Guide

> Универсальная карта архитектурного пространства для Command Center.

`Architecture_Reasoning_Guide.md` помогает распознавать масштаб архитектурного вопроса, замечать связанные области и поднимать релевантные подходы, паттерны, тактики и инженерные знания в контексте текущей задачи.

Файл служит когнитивным индексом, а не каталогом готовых решений.

Он:

* не определяет архитектуру конкретного проекта;
* не выбирает паттерн автоматически;
* не заменяет факты текущего repo и project source-of-truth;
* не ограничивает анализ только перечисленными примерами;
* не является обязательным checklist для каждой локальной задачи;
* не передаёт архитектурное ownership от Command Center.

Названия подходов используются как триггеры связанных знаний, а не как рекомендации к обязательному применению.

Карта намеренно объединяет архитектурные стили, способы декомпозиции, методологии, паттерны, тактики и практики. Её задача — активировать релевантные области знаний, а не построить строгую академическую таксономию.

---

## 1. Decision levels

Архитектурный вопрос может находиться сразу на нескольких уровнях.

| Level | Смысл | Примеры вопросов |
|---|---|---|
| **System** | Состав и взаимодействие крупных исполняемых частей системы | monolith или services; synchronous или event-driven interaction |
| **Application** | Внутренняя архитектура приложения и направление зависимостей | layers, modules, domain/application/infrastructure boundaries |
| **Project / codebase** | Организация repo, packages, features, public APIs и допустимых зависимостей | package-by-feature, FSD, modular packages, monorepo |
| **Module / feature** | Responsibility, contracts, ownership и state отдельной функциональности | public interface, orchestration, module boundary |
| **Local design** | Устройство конкретного участка реализации | objects, functions, algorithms, composition, design patterns |

`Cross-cutting` — дополнительный marker scope для решений, которые пересекают несколько уровней: data, security, reliability, observability, runtime, migrations и другие.

Уровни не образуют жёсткую иерархию. Локальное изменение может затронуть системный contract, а системное решение — потребовать нескольких локальных паттернов.

---

## 2. Architecture Decision Map

Таблица описывает основные области, в которых возникают архитектурные решения.

Одна задача может одновременно относиться к нескольким областям.

| № | Decision area | Смысл | Подходы и понятия-триггеры |
|---:|---|---|---|
| 1 | **System architecture and topology** | Состав крупных исполняемых частей системы, их изоляция и взаимодействие | monolith, modular monolith, services, microservices, serverless, event-driven architecture |
| 2 | **Domain decomposition and ownership** | Разделение предметной области, business capabilities и responsibility | DDD, bounded contexts, capabilities, aggregates, domain services, ownership boundaries |
| 3 | **Application architecture and dependency direction** | Размещение business logic, orchestration и направление зависимостей | layered, hexagonal, clean, onion, vertical slice, ports and adapters, MVC, MVP, MVVM, MVI |
| 4 | **Project and codebase organization** | Организация codebase, feature boundaries, public APIs и допустимых зависимостей | package-by-feature, package-by-layer, FSD, modular packages, monorepo, multi-repo |
| 5 | **Data and persistence** | Владение данными, source of truth, persistence и consistency | repository, unit of work, active record, data mapper, CQRS, event sourcing, caching |
| 6 | **Integration and communication** | Взаимодействие modules, processes и external systems | REST, RPC, messaging, pub/sub, webhooks, adapters, gateways, contract versioning |
| 7 | **Workflow, state and coordination** | Long-running processes, state transitions и coordination | state machine, saga, process manager, orchestration, choreography, compensation |
| 8 | **Reliability and distributed-system tactics** | Поведение системы при failures, delays, retries и partial unavailability | timeout, retry, circuit breaker, bulkhead, outbox, idempotency, deduplication |
| 9 | **Security and trust boundaries** | Границы доверия, полномочий и доступа к sensitive operations и data | authentication, authorization, least privilege, validation, secrets isolation, audit trail |
| 10 | **Deployment, runtime and operations** | Запуск, execution model, configuration, observability, scaling и rollout | containers, workers, queues, processes, threads, async model, scheduling, backpressure, health checks, canary, blue-green, rollback |
| 11 | **Local design patterns and abstractions** | Локальная организация behavior, variability и component interaction | Strategy, Adapter, Factory, State, Observer, Facade, Decorator, Command, composition |
| 12 | **Evolution, refactoring and migration** | Безопасный переход от текущего состояния к target structure | strangler, branch by abstraction, expand-contract, migration adapters, feature flags |

---

## 3. Supporting lenses

Supporting lenses не являются самостоятельными архитектурными уровнями. Они помогают рассматривать любую область карты с дополнительной стороны.

| Lens | Что она активирует | Понятия-триггеры |
|---|---|---|
| **Drivers and constraints** | Цели и ограничения, определяющие применимость решения | business goal, сроки, бюджет, team size, team topology, Conway's law, scale, operational cost |
| **Quality attributes** | Свойства системы, между которыми возникают trade-offs | correctness, reliability, security, performance, scalability, maintainability, testability, observability, operability |
| **Ownership and boundaries** | Владение logic, data, state, contracts и changes | source of truth, responsibility, public API, dependency boundary, trust boundary |
| **Simplicity and reversibility** | Простота, цена усложнения, blast radius и возможность отката | simplest sufficient option, local change, reversibility, rollback, migration cost |
| **Language and framework idioms** | Естественные механизмы языка, framework и ecosystem | conventions, protocols, composition, dependency injection, lifecycle, standard library |
| **Repo evidence and governance** | Фактическое устройство repo, assumptions, approval и durable rules | current boundaries, existing mechanisms, ADR, architecture rules, review gates, source of truth |

Negative triggers:

```text
premature abstraction
speculative generality
hidden ownership
circular dependencies
shared mutable state
hidden source of truth
distributed monolith
pattern stacking
architecture without evidence or owner
```

---

## 4. Key distinctions

### System topology ≠ application architecture

Количество processes, services и deployment units не определяет внутреннее устройство каждого приложения.

### Code organization ≠ ownership

Разделение directories и packages не создаёт независимые responsibility boundaries само по себе.

### Local design pattern ≠ system architecture

`Strategy`, `Adapter`, `Factory` и другие local patterns не отвечают на вопрос о структуре всей системы.

### Target architecture ≠ migration path

Хорошее target solution может быть неприемлемым без безопасного пути перехода, compatibility и rollback.

### Cross-cutting concern ≠ отдельный слой

Security, reliability, observability, data и migrations могут пересекать несколько уровней и modules.

### Pattern name ≠ recommendation

Совпадение терминов задачи с известным pattern не означает, что pattern применим или нужен.

---

## 5. Usage note

Карта не задаёт обязательную последовательность анализа.

В контексте конкретного Stage она может использоваться как ориентир:

```text
масштаб решения
→ связанные decision areas
→ релевантные подходы и их сочетания
→ supporting lenses
→ факты текущего repo
→ архитектурное решение Command Center
```

Для простой локальной задачи может быть достаточно одной области.

Для крупного Stage могут одновременно оказаться релевантны:

```text
application architecture
+ project organization
+ data
+ workflow
+ reliability
+ migration
```

Названия в карте:

* не являются готовым решением;
* не требуют применения;
* могут сочетаться;
* могут оказаться неприменимыми после анализа текущего контекста;
* служат точками входа в более широкое архитектурное рассуждение.

Вариант без нового архитектурного механизма остаётся полноценной возможностью.
