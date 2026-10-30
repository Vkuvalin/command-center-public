# 🧠 Command Center

Система работы специалиста с ChatGPT и Codex: от проработки решения до исполнения и проверки изменений.

## Проверка навигации по схеме

Нажмите на блоки **«Веб-часть»** и **«Локальный репозиторий»**: каждый должен открыть соответствующий документ. Второй переход ведёт сразу к разделу.

```mermaid
flowchart LR
    W["Веб-часть"] -->|"Задание"| R["Локальный репозиторий"]
    R -->|"Результат и проверки"| W
    W -.-> C["Относительная ссылка — контроль"]
    click W href "https://github.com/Vkuvalin/command-center-public/blob/main/docs/guide/LINK_TEST_WEB.md" "Открыть описание веб-части" _blank
    click R href "https://github.com/Vkuvalin/command-center-public/blob/main/docs/guide/LINK_TEST_REPO.md#repo-target" "Открыть раздел локальной части" _blank
    click C href "docs/guide/LINK_TEST_WEB.md" "Контроль относительной ссылки" _blank
```

Это временная проверка кликабельной навигации перед подготовкой полного показа процесса.
