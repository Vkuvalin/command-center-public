<a id="presentation-top"></a>

<div align="center">

# 🧠 Command Center — полный процесс

**Как специалист, управляющий веб-чат и локальный Codex ведут проект от вопроса до принятого результата.**

[README](README.md) · [Блочная компоновка](#version-v2) · [Прямые связи](#version-v1-new) · [Артефакты](#artifacts) · [Протоколы](#sources)

</div>

Специалист и ChatGPT прорабатывают задачу в вебе. Codex выполняет ограниченные поручения в репозитории. Между ними передаются задания, проверяемые изменения и результаты проверок; решения и точка продолжения остаются в файловой памяти управляющего чата.

Два варианта показывают один процесс. В каждом веб-схема и локальная схема продолжают друг друга через **A — задание в репозиторий** и **B — результат обратно в веб**. Ссылки внутри карточек открывают соответствующий источник.

**Синий** — обсуждение и решения; **жёлтый** — передача задания; **зелёный** — Library; **фиолетовый** — действия в репозитории; **розовый** — Review и исправления; **серый** — вспомогательные механизмы.

<a id="versions"></a>

## Варианты схем

По умолчанию раскрыта схема с блочной компоновкой. Её можно свернуть и открыть схему с прямыми связями между группами.

<a id="version-v2"></a>

<details open>
<summary><strong>Схема — блочная компоновка</strong></summary>

**X1–X11** — панели веб-процесса; **R1–R10** — панели локального Codex. Метки в пунктирных карточках указывают панель и целевой блок. **L0–L5** остаются маршрутами работы Codex.

<a id="web-process"></a>

<a id="web-v2"></a>

### Веб-процесс и Library · [Веб-редактор 1](https://mermaid.live/edit#pako:eNrlXVtz28aS_iso5sEvgsWLRElM4hRF0bb2SKKKpGPlrLZYIAmKXFMECwRtK7fSJXbOlrNRnBNXstkT53Z2s4-KIsW0LUtV5xeAf-H8ku3umQEGIEjJsmgryYNNEMQMZrp7ur--zOi9UMko66FESFXV5UbJaFRqK4nlhqLUtTWjbSWUsrZi6nTDMG4klFJda7VqJbxRMRrWZW21Vl9LKEmzptVHlJbWaKkt3axVxAO52rt6QonE6XvduFWqaqZFL1CUBrw519RKtcYKPBJlN02tcaPnZlMrl-lGnH0v12BU2uqi7_YtU2s24cb1WtmqJpRoPMzul9rmTRhFvdbQNZPdarWLV-Dpar5m1fV5zVypNfioFMUymgllXHwrGpZlrCaUyeUG0ciZhZKfhmegoxXsSFmK_OtyaCmi_OORYn9uP7Dv09Uze8c-sPe76_Y-XHfsfcXuKN2N7qa9013vbi6H_g36KNdMvWTVjIYyl4Wv1wuzC_n0Qh76e6Ncu6m0rLW6_uaFWzSraDjcvP26pd-2VK1eW2kk6nrFev1WtWbpagvopicahrmq1V83buomjlVFqiS0xtqtqm7qFy69UbwE48MRdbofwYiewEjuwvV2z2C722-MFuF5c_SS_b9w62n3kxEF2uzYT7qb3Xsjir1nH9pH3a3uf4gGODv7F-hgh77f7d5jzX-ECR92P4abzoNH_EV79F74bcd-Ct0d4NdDexf-PVag1b59wDuRaSHN36ytVC2YlqZUTb3y5oWqZTVbidHRlZpVbRcvlozV0bdvtG_Cw41R-LKqNcpqSW9Yuqk228V6rTRarBvF0VUNfs9Z2opeWKxrjcKiaVhGyahfXC2_FouqMKAAkqm9JLugWCBNuvXmhUIR-rlx4RJ1qmCnb4xql94YhWnw_4H7iUTill4kpufyyWz-veWQ_U13y_4VqYCC8hHQbR1e0YH_kSw7QPpPiB4wBOIJ0fwJk6fultL9TxQuIC88_dZy6AN4Q1kv1VogXvSaP6ezmaFJFptrGEW_uwEj-BlFAUes2I-QUt17cBtG7QrWVyBE-91tEKy7QsS8AkQLBim_AZPssEYPQepIdrCJu7KOiEb7KJ72jkwW-EYja71qQVJb-IMaVu2O6moBleb7M3AaltXpBehy5trCTDI_m1kYMn-ZktsDbm27q_UXkFcvB1wmf4sMtJ91t3GCsK4ZX-j_DcXUmwYxS278jJ5LXgE1mGN9fA-_PYKX7nBug8Zgyw6GgoJ2D9UL6KJPlcxiTiVx20O90t161UwXXI-oKs5VrRjtRllDff_8vK41KqYG3F6KFPKZAvA8m5xPB7I7Mv7i7F6KIqfZmJYusmW9ThoPWOdqGsZpaZSAI6xao01zlAabe2chNbyxTpJUgph07zj6g2seZmA6MO5DlBzQTLT4DrvbTJiOGb8wyIqqXhKK2lXZePd9UNtf2DvLofe5hu39-RsQ1018wMM6RyVT370_uWtaUS8q0M1PuGacBeIoDpzdY8ap5ZByMbAv9hrqpY8CxUUI34F2vk6Qc9CH3igj5EHWwU9KpVavJ16LhCOT0fBIyzKNG3ritYnxYrQSHgHhN8zEa3q5MlapeHBSFHESCZb9nf2ZfR8G8xOYgf9SgFxX0j4ZY8p_B3iIs1xniOAJhxykcnYJg6wjS5EBgXiq_yo5O6V47PogLfY5sM01iqwlIUIHYJDI9sBGHwrrNZEyHeCO9O5Xq_3GVK-MqohMwOhtE3h88iJwKb04RJbqTZLQQxgmWC5Z7nChydSWzJwLadEibRCO2xMsBGh7QjZ_TtaxgwzmQPtQYvjHHrCNYs9M8A7H7H8ErDyXyQyX-Sq4uyQBwHKP68KNBfHpO1JMHpSLYHaTXJmOi2ngTgclBmeOq4AziWDRIa2DpyAoTg-HDCw_gVVyD5sipz1a7ve6pK8k82lwgK5ols5Jv0E-4a67NPyEoYVq74JWPSIyMi4d9jo-S1FmyeYz2SHipRgpjYcM2qMQwNUnPbrZb8OIPm8dB6L4BNJL-WxyeDOIRDiM2gV-PiKlglADwQFcwLyA-Fu4jJluOuGgybQPEab-c_2vnPbf9QKiY9EdwQMH3KUXHfvC76G2cdQOv4ey6gitB-MlZJ1Bip7BQqcXuQUHjbJ0-nnNIdu3pCr2SH_-yrDRrgATyCQKmKCc0ROkdO2OgHEyG_w4LnpKHBdDHBcbhOPYABlu2yCcuYcOmovd0DY-psWyi6u5D3pDomBcZPCyYjGR4KUVEAaZuQJdzvA7ygqoHKZgvkYFw9wE1NZ_8UYXhBP7SVCX88n8texs_p3hxe2-JNv5lLkvSAEMH9xBIWNuM0x8nSQBpy6PXwrlLYwmlVElfbvWgkWwQpdNYDFc08-g6JtGSy_DD8lWS2_xy2bThIGVhSv-hGj_iN4V5FAhb9AZ30Sa8VX4ao1WPKZqZgnJXbLaQM_Te94xsZb64M-zdLyfE4UOUMR81MlrM7P54Q17jIYLapBQERkQGjM4LdxjTRll_baSbJdr1kmHnEqlF4c-5oAQ1SGZuHUW7z7WiKCWkrR6wq_ymDnSm6TuJRnqaewEClBJeRQLtwTfC64T_3-lmBg08S14rvqdTmauiBew6D9bnl4tGjg2tyELTEP_FLNTgbdbKJg8rCFLmK-hTNxPPA8Tb_0WKXZKizSGFomz034AVukBcOIzsEqfOQHpXzC8QVe7AnAz8Lol_Cp7v48ZGiCHZ6LcTySBTii0dyLwhcXXn_bGB5xoKHNLWNwUuAfrkoLQm6zjL-GSnDboxZNwcFM9G-TMHAhI-IhBQcfKvCQln1nMFVLphXw6W0hlZtJLhcVsJp9JZeZI1asIj-wnaqmqWStNS2WpCJoRrRRPdFjFBOjtXnsArwg2BJapNVoV3SShWEinZ-SczY4bktvkjhppvCC80F8Xn4k8PY8WZlkVeGhPPAZNtmGZa2XVaNTXZAnakZ1XOZyBSiEgNEW-sD-D8y15sqAflax-s6bfUnhPXCuBmKHTq_QCtN-R2-sRpNzV5CKi3LzWuqHkqlpTV7JGG8ZHs87n1KQgJVxPB_i3Y0yjpuYyufTM8KzlhJsRkJ3x42w5H10-N0TXdRyHRpRi2h6jTQ4u9S0AJPMJxzydnU1fHv6op_mo3WQ4T1oq02ZNrxyLP0ibCCcWhUkyWvw2KitHa_WkLdxG8s9u2sIjYK7M8geR7vJjwOmgZ6blZ4iyfuM_Fmz89XixGI8OMP7jaPzH-xl_Cg_toV-E4kDuJtlMrGZ4DHLh2kiBngIxQD_5PQuF_bySK_QoRb12WEnFIXeRWUSYBQkkRwxsGmtPbf_aFyMMjDgfSYpf6PNXbvJjquOfY-DjCG0-RR5wiKc17v1X_hnx-yRr3mHzHtH9Zy4GnnBEIFzEhmWj1BolgDNKOehCEfttjZ4Lpmltq0qBB9Uwy9Da7qh1Qys7N07LtnxueoghGI6lDhQipVrUSjf0sruyHJb9SBzagYXyFHjEgl77Hi1DkRPFCRVSwdMGhrJADpCZj_0stOAFv3PeLc4lU8PL1PKMDSahyI9hro1Pp_ktg8NSQHIlfRWopSwat3QzV9XrdacMhtUZ7YvyOOwtAFXTSr1cuw0SM6e1G6WqAghztWmx4KUrDPDcgUL-1mb3Plx6FPcrV7ZjagWnoNZpCmqTpnBajg_PoJI19S048CnI-T2i8GWH6I169LFH14rQjXCAPeyzd7t3UB0zJyook-eEjJ-xKD17CV_fd1B58HTWS-DkYjadA0ZSCQkyjyI3N6MStyyjeeGS_bVCqTZ0nJn_5xtuICOxM0TK4xzPDQ8lx5GX07zAwhe74Iw4DiCTNedIGEyEwHP8DikeYT567tEVv8twrUjL_LePaPu92UgQhYRLyh0lKrIygmx-CDx-SggcRwgc5xXID8FUfU6ZmR_wjnCzMf4D4u3YJjdcGAh4h2dJj2cmrw_1hZj8-hr8b6oRBnGtwkIwKhXWEFxlRIBSDAOl1bSUUe4MUNaJZdP2Xnb86mWsyuuFbPrt2fT1oXFQiBS6VM9IaXZcVSmqGByPymEpRThGGcKlYKQwmeRosCARrxGFlpj42HMilDO1SmWE3tj9uHu_uznS444ElQv_yDr7lRT0L2JkB1SMwUengBjtCgXfIQqDiLziiNNEVDWJxmBvG4itWmq51moardrpikdZZyQab6ezM7MpKjf_zpPmRN0AN-5S-RHLtIpAJi6bgBXb3eLKJSDEeXl2aXhg7mGPi-rgK0l_SMqOIzucAc2NAqNYnPQp4gJeEvkrqZqDHn9KVKB8g9LmVDHLEsrrJw8di8-Gw4jzexWlpTgzYjNXhlxV4wkFKyfO0x8X5OPDpzDVkHOMPaFdpSese8LRYgzu2jDrmCZ4HC0oZkbKk5nev3hq4k5A5d9sAbiAhMykStaV3-f6VNatIoL6XTDEYdkXCoc6Syio-d-o1Gobw7AsK-LTS8f38AW5pVQgEqD8sEjofaaqhcpmtejyygjq1pPUdfzgHuFAaPm-X3I9BCQc_XexrYy0aI99FpA53r8ePd4HNZenipo-ADVPIGpmAv8loOXPKXj8f_D_NwA-H7DgMSGK-1JNusiSir1zvWaxbzH6oMV7Nonk51u2vOQYbf227Lhi4AlLf3x7cDyJZ7c6kCKTdNNxKUac-iS0rh2lVNe1RrvZL33IvHEcN5UkBJYVBfnur7zkeSKuBhGX7fo5jWnl8D11NblwhaWXH4iCr-CMezBZ3goEZAvJueGJ3t9RIwhnhdAPEaHsuGb9axgc-EYd8KpBHoTDJ1CCsDNRqBbwrjJ5B_CQ1W6xz74JCykBDXBtA367A_JptNqmrvqJzAOxr1DAImzjWAmouKKrnJYvIFkkBYXMn94jxSuRkeeRZHXHQ5MBXsGhfRAgYanM_PwQyxpSQMIa46ujK2DV3XfEJ6uvGgAQc2uNkncDolfbgFnjwZAXUTq4MFl9wyY99TNYAGGo_7n-hdJst6rsQWmPD9qQulHS6qBdTT7aq8nfqxLrX49wdnuveioRuOvHWMtiAiyyTvb7qDdaiyZ8Q0KOiLnueXf1PMYQBcCv3lrmA3CBz0ON6xnzkG3LWJrg-wj7uPJnF9491qEf4GBM_LYdDDH-fDa5kLuczg5xf0eYu3boPmPVqHMQAwvh8eVB6orbQNxqveNs6B7kJXFoy30ijl9kLOPbKAFmHvdvc7OOy5Spd-aRSJUmvuZOzQoZMtek8RcL8-axdb1FrCBW5Jq4Ah7YQPJz7EM-MrJxkrkTM5ZGTJfcuXE0kXBjJjxujO9pYVP4LptttnWQeOBrL8TF7wpNnNIVmkRXiKR8bnY6m8y-49vFQeh-R6Qz6cQGwmWMj7T5ZIeXM3BX8Ijt1ejjCvVdrmcCRk-_UPnuPimsNBLg4Y0E-Knc2DP-8X2ZaFuOsz4vy3Kk2O-FFP1euG6YN2DlFcAUWLrHlkyqLUBQVdNo1N6lBa6uGmW93mtFeBcKdRFsSFYB5JhrxPFMdqaPdjsTljtLR3JHqfqCx06e8QTDIcHdJxjPllwM2TuRS3J4eTz6_MLZ2O9ZCxwuZBbTWUrrFObT8xlYQQgDWWUWzykjuHh87vg9pa6261ZNBcWhI2AAqjN3o_WiLJ9O5tLDrZoXyJ4QA9M9P1Ohh3MIjCeR1FM8x7dTYRqAcfpjAvq8rN7Zc0OHi3BwtUFZA0d4Amqi9_mmPKr54bAfxUwZtVabEiLd5_UezH11ndNNntwUIIg126XBykV-HScwoMzViqZmrp072YqE1ZZW0dU6Gx9ImtXn-JPnk6zFa9Nzs7mrwxOu-z6zdhgY6YKbgvIe0XLSQHSSkzfWxYKdW25eVwR4SHCF64HHdGzBrae0kV7ajdGRysaCqpecU3l40uoHSeM52wEAVGzJe9f5kSAgbXt8B-X-H0SUlibP_zZlMcbM9YV0Nje8QU7R-H6iMMY9lIhe1LdzwqGyjcAM1LoT3g_EXc52NQcT4wXH1YQaXPzA8hMeejiWRpTuMNUgqwk-kM_8K6_PBlaWz5BP5hLge3LAZurJYOQd10sT2qCta1OIvKd8yJusQ38uIKzAM9W2WWBiF-NPqvDVAhG38z5JjI5htb-fPCucWhxeSGcxm_mXdCpfmEmDJzbLK2RczfoTsklhJxEA8wDJjzjJpycslMd1HovIyWej9Dme8DwpuPEY1lP-O1C7UNYrtQbl51fLL2oqk9nU8Owkdj6bB56B7-_hlXdL475vhyoHZ55spmP5eHXWJj8dgKMpYSWx1QHFZFmozq23PVe8HPPsOX9xLi7OJYd4th_qM3qFh4dfO0coyidL8tj5nSAPWo6asjoqJ6vreN98_6iIi5w_1kVZ1LTQBD69OOMy80Njm9_h9DDvh77nBTgnqwkUsi8d7ersBvYVyZ0kjn7-WBlRjaZuEjgpMJ6cwUqcUT788EO-JB0Ny-9l5n2wQJjb5wIHS1O8PLif_3yGMe1TetEDICAffDadyrz9EuLZblUeA0AscNnjLEtnHXLDQwtk40TRbc5DAp8Sb3y_OSHjQe_vBLyfYtFesvnR5dQp0WUkTGdTh_2RXU_oXxk8ZDcN0G9v5KDcxRkVtpw2aeFThmK3JGV077JaFWnrVaf3QEXWwxccgWzZRzwR6ESYnQz0QQCItg_OnyONBaElpPaaih029Ft0XoIqi_2LaslBq_-Mzjg4m2UvbbIUuwL2RChFyMAmZzQDpD2HHVPwd35EcbOqI8qMg-BHlKSEBEWQuTdkw3cYkfDtuSeDgnkNsNB_QHnKXRviQa7ek3HEGRQuSqIAsABA3S05XTD4WE8OnDxxZFn9fBq0i4x3hpFgXtoghMPRSyNycbnIOh2dv3qF8yRFYAZ_kwd4iWEP2NRzdqUYp9jac4Kh_yYOK3eBjFPyLbCYc-38gupI0kw8xOj1utihX_w47bDvcC1Pu4ek5hFeiwPDxMYab2tPEbrU_vuAA8fkA8HD3hPBvad5h0-LLdnfPYnwspKHiMUfwFTu2_8D_39hf2X_DT6_B6J8xU87ONnJon1Q5tX03OIQEUUKlM2VxbxyVa-Dz-g96pcf6oSb9nmwlUbOEnUfsaMs6S-Y8E7OTLvyY6yqNKZe7cftxj47JGzQ2YVAvmvTQ94PqJvK1Xaxz6lS4tD6faodeYaZUaSg2P7u_RMQ7ERTJ8aNCdqzIqnJh6rCLy9G0NTVZL6Q-9Ps3FxuqEKp5G7A8mzJFfvPKJiK0VVy1Ts8UXjIjIxbt3CXK4V1RuatgIMp6LxQx2EKFBxadzzAAVLEr6Tp92iUPn8gYGpKKxd7q5CWItQlaHH6iLGPMfYxzj7i7GOCfUyyjyn2AQqMfUagM_ozVYC-lVt6UYxiMloZ0wYeJvi63JIBBtE4HpuM6gOVoqexOOGANx-LxqKRyYEbuT3N6U-isKaxcHRsbMJpWoxrYX18YFOy3Py94ehEbHD9l6cxsZu3jU7GorHiQK552ooicOfVsfFI5eRTlq1wsNxMRqYi2jj_qpa1VlUzTW0tMabERL_lcT1aib0eGgmtmLVyKGGZbX0ktKrDAsOvoffwj3oth6yqvgpWMQGXpl5u34bOzBsq9bEcWm58AO2bWuPPhrEqujCN9ko1lKho9RZ8azfLgDNn2B8hcx4B4dfNlNFuWKFENDZBfYQS74VuhxJqLDpxMTwBnIxOhMemJqPj8ZHQWghhz8WxicnI-OR4GD7i8dgHI6F36b1jFyenpiJT8cj41MTkVDQSGQnp5ZplmPPs77XRn2374P8BwNcJQQ)

```mermaid
---
config:
  layout: dagre
  look: classic
  fontFamily: Arial, sans-serif
  fontSize: 16
  flowchart:
    nodeSpacing: 12
    rankSpacing: 12
    padding: 6
    diagramPadding: 6
    wrappingWidth: 260
    curve: linear
    subGraphTitleMargin:
      top: 5
      bottom: 8
---
flowchart TB
 subgraph X1["X1 · ВЕБ · намерение и старт"]
 direction LR
 W_INTENT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Верификация намерения</b><br/>Цель, факты, допущения и границы<br/>Уточнения перед началом новой темы<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#32-верификация-намерения' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_START{"Нужно сформировать<br/>цель и карту этапов?"}:::decision
 W_ZERO["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage 0 · собрать замысел</b><br/>Идея, цель, границы и риски<br/>Определение проекта и карта Stages<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#3-stage-0-и-старт-работы' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_FOUNDATION["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage 1 · для нового проекта</b><br/>Принятый каркас repo и проектный AGENTS<br/>Создание через обычную OPS-задачу<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#33-stage-1--repo-foundation' target='_blank'>Stage Plan</a></div></div>"]:::infra
 X1_TO_W_FRAME["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X2 · Stage X.0 · рамка этапа</b></div>"]:::continuation
 X1_TO_W_SYNC["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X8 · Сохранить значимое состояние</b></div>"]:::continuation
 W_INTENT --> W_START
 W_START -->|"Да"| W_ZERO
 W_START -->|"Нет"| X1_TO_W_FRAME
 W_ZERO --> X1_TO_W_FRAME
 W_FOUNDATION -. "Частный рабочий Stage" .-> X1_TO_W_FRAME
 W_ZERO -. "Определение и план" .-> X1_TO_W_SYNC
 end
 style X1 fill:#101820,stroke:#75b2f0,color:#edf4ff
 subgraph X2["X2 · РАБОЧИЙ STAGE · рамка и разбор текущего вопроса"]
 direction LR
 W_FRAME["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage X.0 · рамка этапа</b><br/>Выбрать Stage и сверить намерение<br/>Цель, границы и вопросы этапа<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#4-рабочий-порядок' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_STEP["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Step · один текущий вопрос</b><br/>Перед обсуждением сверить намерение<br/>Варианты, ограничения и основания<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#32-верификация-намерения' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_LOOP["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Step-loop · уточнение</b><br/>Разобрать детали и противоречия<br/>Продолжать до закрытия вопроса<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#4-рабочий-порядок' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_GATE{"Gate · условие<br/>закрытия Step выполнено?"}:::decision
 X2_TO_W_MORE["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X3 · Остались вопросы текущего Stage?</b></div>"]:::continuation
 X2_TO_W_EXTRA["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X11 · Связанные инструменты</b></div>"]:::continuation
 X2_TO_W_STAGE["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X2–X3 · Рабочий Stage</b></div>"]:::continuation
 W_FRAME --> W_STEP
 W_STEP --> W_LOOP
 W_LOOP --> W_GATE
 W_GATE -->|"Нет: уточнить"| W_LOOP
 W_GATE -->|"Да"| X2_TO_W_MORE
 X2_TO_W_EXTRA -. "Поддержка выбранной операции" .-> X2_TO_W_STAGE
 end
 style X2 fill:#101820,stroke:#75b2f0,color:#edf4ff
 subgraph X3["X3 · РАБОЧИЙ STAGE · выбор следующего действия"]
 direction LR
 W_MORE{"Остались вопросы<br/>текущего Stage?"}:::decision
 W_DG{"Decision gate<br/>Какое решение принять?"}:::decision
 W_MATURITY["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Зрелость архитектурного решения</b><br/>N/A / Existing / Exploring<br/>Proposed / Assessed / Approved<br/>Сквозное состояние внутри Stage<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#63-architecture' target='_blank'>Stage Plan</a></div></div>"]:::infra
 X3_TO_W_STEP["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X2 · Step · один текущий вопрос</b></div>"]:::continuation
 X3_TO_W_AUDIT["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X4 · Необязательный Codex Audit</b></div>"]:::continuation
 X3_TO_W_ACCEPT["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X4 · Принятый контракт</b></div>"]:::continuation
 W_MORE -->|"Да: следующий Step"| X3_TO_W_STEP
 W_MORE -->|"Нет"| W_DG
 W_MATURITY -. "Сопровождает решения" .-> W_DG
 W_DG -->|"Вернуть вопрос"| X3_TO_W_STEP
 W_DG -->|"Нужен repo-аудит"| X3_TO_W_AUDIT
 W_DG -->|"Принять"| X3_TO_W_ACCEPT
 end
 style X3 fill:#101820,stroke:#75b2f0,color:#edf4ff
 subgraph X4["X4 · ПЕРЕДАЧА · согласовать поручение"]
 direction LR
 W_ACCEPT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Принятый контракт</b><br/>Согласовать смысл, границы задачи и результат<br/>Зафиксировать допустимые изменения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#6-как-chatgpt-собирает-задачу-codex' target='_blank'>OPS</a></div></div>"]:::transfer
 W_NEED{"Нужна работа<br/>Codex?"}:::decision
 W_AUDIT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Необязательный Codex Audit</b><br/>Отдельная read-only задача<br/>Проверить repo, границы или риски<br/>После Review вернуться в Decision gate<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#4-рабочий-порядок' target='_blank'>Stage Plan</a></div></div>"]:::transfer
 W_SHAPE{"Task Shape Router<br/>TS-A или TS-B?"}:::decision
 X4_TO_W_CLOSED["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X7 · Stage закрыт</b></div>"]:::continuation
 X4_TO_W_TSA["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X5 · TS-A · самостоятельный Task</b></div>"]:::continuation
 X4_TO_W_BRIEF["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X5 · TS-B · сначала Stage Brief</b></div>"]:::continuation
 W_AUDIT --> W_SHAPE
 W_ACCEPT --> W_NEED
 W_NEED -->|"Да"| W_SHAPE
 W_NEED -->|"Нет"| X4_TO_W_CLOSED
 W_SHAPE -->|"TS-A"| X4_TO_W_TSA
 W_SHAPE -->|"TS-B"| X4_TO_W_BRIEF
 end
 style X4 fill:#101820,stroke:#e6bb62,color:#edf4ff
 subgraph X5["X5 · ПЕРЕДАЧА · подготовить файлы задания"]
 direction LR
 W_TSA["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>TS-A · самостоятельный Task</b><br/>Полная постановка внутри OPS Task<br/>Границы задачи, ограничения и проверки<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#63-принцип-сборки' target='_blank'>OPS</a></div></div>"]:::transfer
 W_BRIEF["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>TS-B · сначала Stage Brief</b><br/>Подробный принятый контракт<br/>docs/codex/stage_briefs/<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#authoring-order-и-loading-order' target='_blank'>OPS</a></div></div>"]:::transfer
 W_TSB["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Затем brief-backed OPS Task</b><br/>Управляющее задание с точной ссылкой<br/>docs/codex/tasks/<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#authoring-order-и-loading-order' target='_blank'>OPS</a></div></div>"]:::transfer
 W_PLACE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Разместить и проверить файлы</b><br/>Placement PowerShell для артефактов<br/>Отдельный Fixed Launch Prompt<br/>с точным путём OPS Task<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#64-fixed-launch-prompt' target='_blank'>OPS</a></div></div>"]:::transfer
 W_A["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>A · задание в репозиторий</b><br/>Последовательный вход Codex<br/>Продолжение на второй схеме<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#repo-v2' target='_top'>К локальной схеме</a></div></div>"]:::repo
 X5_TO_W_B["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X6 · B · результат Codex</b></div>"]:::continuation
 W_BRIEF --> W_TSB
 W_TSA --> W_PLACE
 W_TSB --> W_PLACE
 W_PLACE --> W_A
 W_A -. "Локальное выполнение: схема 2" .-> X5_TO_W_B
 end
 style X5 fill:#101820,stroke:#e6bb62,color:#edf4ff
 subgraph X6["X6 · ВОЗВРАТ · Review и исправления"]
 direction LR
 W_B["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>B · результат Codex</b><br/>Изменения и проверяемый handoff<br/>либо read-only report / подтверждения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#repo-v2' target='_top'>К локальной схеме</a></div></div>"]:::repo
 W_REVIEW["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Review относительно задания</b><br/>Task / Brief и фактический кандидат<br/>Diff, отчёт, проверки и риски<br/>У каждого замечания явный исход<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#72-review-findings-disposition' target='_blank'>Stage Plan</a></div></div>"]:::review
 W_VERDICT{"Решение специалиста<br/>по результату Review"}:::decision
 W_FIX["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Ограниченный Fix</b><br/>Исправить реализацию в прежнем контракте<br/>Новый кандидат и повторный Review<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#72-review-findings-disposition' target='_blank'>Stage Plan</a></div></div>"]:::review
 X6_TO_W_DG["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X3 · Decision gate Какое решение принять?</b></div>"]:::continuation
 X6_TO_W_SHAPE["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X4 · Task Shape Router TS-A или TS-B?</b></div>"]:::continuation
 X6_TO_W_CLOSURE["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X7 · Подготовить завершение</b></div>"]:::continuation
 X6_TO_W_SYNC["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X8 · Сохранить значимое состояние</b></div>"]:::continuation
 W_B --> W_REVIEW
 W_REVIEW --> W_VERDICT
 W_VERDICT -->|"Результат Codex Audit"| X6_TO_W_DG
 W_VERDICT -->|"Меняется контракт"| X6_TO_W_DG
 W_VERDICT -->|"Дефект реализации"| W_FIX
 W_FIX --> X6_TO_W_SHAPE
 W_VERDICT -->|"Принять для завершения"| X6_TO_W_CLOSURE
 W_REVIEW -. "Факты и замечания" .-> X6_TO_W_SYNC
 end
 style X6 fill:#101820,stroke:#ed9bae,color:#edf4ff
 subgraph X7["X7 · ЗАВЕРШЕНИЕ · приёмка и фиксация результата"]
 direction LR
 W_CLOSURE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Подготовить завершение</b><br/>Влияние на docs / AGENTS<br/>Согласованные обновления, архив и cleanup<br/>Проверить итоговое состояние репозитория<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#76-завершение-stage' target='_blank'>Stage Plan</a></div></div>"]:::repo
 W_CHANGED{"Есть изменения<br/>репозитория?"}:::decision
 W_FINAL["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Финальный staged handoff</b><br/>Согласованный набор файлов и staging<br/>Финальный diff, status, stat и проверки<br/>После всех closure-изменений<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#71-repo-change-handoff' target='_blank'>Stage Plan</a></div></div>"]:::repo
 W_FINAL_OK{"Финальная приёмка<br/>специалистом"}:::decision
 W_COMMIT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Commit и оговорённый Remote Sync</b><br/>Проверить SHA и итоговое состояние репозитория<br/>Если требуется — push<br/>и сверка local / remote SHA<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#76-завершение-stage' target='_blank'>Stage Plan</a></div></div>"]:::repo
 W_CLOSED["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage закрыт</b><br/>Итоги и точка продолжения сохранены<br/>Перейти к следующему Stage<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#76-завершение-stage' target='_blank'>Stage Plan</a></div></div>"]:::web
 X7_TO_W_FIX["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X6 · Ограниченный Fix</b></div>"]:::continuation
 X7_TO_W_SYNC["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X8 · Сохранить значимое состояние</b></div>"]:::continuation
 X7_TO_W_TRANSFER["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X10 · Пакет переноса при смене чата</b></div>"]:::continuation
 W_CLOSURE --> W_CHANGED
 W_CHANGED -->|"Нет: без staging и Commit"| W_CLOSED
 W_CHANGED -->|"Да"| W_FINAL
 W_FINAL --> W_FINAL_OK
 W_FINAL_OK -->|"Нужен Fix"| X7_TO_W_FIX
 W_FINAL_OK -->|"Принято"| W_COMMIT
 W_COMMIT --> W_CLOSED
 W_CLOSED -. "Итоги" .-> X7_TO_W_SYNC
 W_CLOSED -. "Если меняем чат" .-> X7_TO_W_TRANSFER
 end
 style X7 fill:#101820,stroke:#ed9bae,color:#edf4ff
 subgraph X8["X8 · LIBRARY · выбор владельцев и безопасная запись"]
 direction LR
 W_SYNC["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Сохранить значимое состояние</b><br/>Решение, результат, замечания<br/>или новая точка продолжения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#8-synchronization-model' target='_blank'>Working State</a></div></div>"]:::memory
 W_ORDER["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Если обновляются несколько файлов</b><br/>Сначала профильные владельцы<br/>OPERATION_MEMORY — последней<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#9-multi-file-state-changes' target='_blank'>Working State</a></div></div>"]:::memory
 W_BASE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Проверенная база и кандидат</b><br/>Полностью прочитать текущую версию файла<br/>Проверенное зеркало /tmp и точечный diff<br/>Потерянный /tmp восстановить из Library<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#10-safe-library-mutation' target='_blank'>Working State</a></div></div>"]:::memory
 W_PUBLISH["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Безопасное обновление Library</b><br/>Повторно сверить актуальность базы<br/>Опубликовать и точно проверить новое<br/>Только затем убрать предыдущее<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#10-safe-library-mutation' target='_blank'>Working State</a></div></div>"]:::memory
 X8_TO_W_STAGE["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X2–X3 · Рабочий Stage</b></div>"]:::continuation
 X8_TO_W_OWNERS["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X9 · Четыре владельца</b></div>"]:::continuation
 X8_TO_W_STAGE -. "Рабочее состояние" .-> W_SYNC
 W_SYNC --> W_ORDER
 W_ORDER --> X8_TO_W_OWNERS
 W_BASE --> W_PUBLISH
 W_PUBLISH -. "Актуальное состояние для работы" .-> X8_TO_W_STAGE
 end
 style X8 fill:#101820,stroke:#6ec7a0,color:#edf4ff
 subgraph X9["X9 · LIBRARY · четыре владельца памяти веб-чата"]
 direction LR
 subgraph W_OWNERS["Четыре владельца"]
 direction TB
 W_PD["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>PROJECT_DEFINITION.md</b><br/>Что строим, для кого<br/>Требования и границы<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#53-project_definitionmd' target='_blank'>Working State</a></div></div>"]:::memory
 W_ARCH["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>ARCHITECTURE.md</b><br/>Принятые решения и контракты<br/>Ответственность компонентов<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#54-architecturemd' target='_blank'>Working State</a></div></div>"]:::memory
 W_PLAN["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>STAGE_PLAN.md</b><br/>Карта этапов и их состояние<br/>Переходы и значимые итоги<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#52-stage_planmd' target='_blank'>Working State</a></div></div>"]:::memory
 W_OM["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>OPERATION_MEMORY.md</b><br/>Текущий вопрос и рабочие факты<br/>Замечания и точка продолжения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#51-operation_memorymd' target='_blank'>Working State</a></div></div>"]:::memory
 W_PD ~~~ W_PLAN
 W_ARCH ~~~ W_OM
 end
 style W_OWNERS fill:#101820,stroke:#6ec7a0,color:#edf4ff
 X9_TO_W_BASE["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X8 · Проверенная база и кандидат</b></div>"]:::continuation
 X9_TO_W_RECOVER["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X10 · Новый чат · восстановление контекста</b></div>"]:::continuation
 W_OWNERS --> X9_TO_W_BASE
 W_OWNERS -->|"При восстановлении контекста"| X9_TO_W_RECOVER
 end
 style X9 fill:#101820,stroke:#6ec7a0,color:#edf4ff
 subgraph X10["X10 · LIBRARY · перенос и восстановление чата"]
 direction LR
 W_TRANSFER["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Пакет переноса при смене чата</b><br/>Текущая позиция, ссылки и вопросы<br/>Доступ к сохранённым владельцам<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#12-recovery-and-new-chat-continuation' target='_blank'>Working State</a></div></div>"]:::memory
 W_RECOVER["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Новый чат · восстановление контекста</b><br/>Подтвердить пространство проекта<br/>OM, Stage Plan, Definition, Architecture<br/>Сверить новый ввод и свежие факты<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#12-recovery-and-new-chat-continuation' target='_blank'>Working State</a></div></div>"]:::memory
 W_RESUME["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Вернуться в рабочую точку</b><br/>Сверить намерение и текущую позицию<br/>Продолжить открытый вопрос, Review<br/>или перейти к следующему Stage<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#12-recovery-and-new-chat-continuation' target='_blank'>Working State</a></div></div>"]:::memory
 X10_TO_W_STEP["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X2 · Step · один текущий вопрос</b></div>"]:::continuation
 X10_TO_W_REVIEW["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X6 · Review относительно задания</b></div>"]:::continuation
 X10_TO_W_FRAME["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>X2 · Stage X.0 · рамка этапа</b></div>"]:::continuation
 W_TRANSFER --> W_RECOVER
 W_RECOVER --> W_RESUME
 W_RESUME -. "Текущий Step" .-> X10_TO_W_STEP
 W_RESUME -. "Ожидающий Review" .-> X10_TO_W_REVIEW
 W_RESUME -. "Следующий Stage" .-> X10_TO_W_FRAME
 end
 style X10 fill:#101820,stroke:#6ec7a0,color:#edf4ff
 subgraph X11["X11 · ПО НЕОБХОДИМОСТИ · связанные инструменты"]
 direction LR
 W_HELPER["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>ChatGPT Helper</b><br/>Работа с веб-интерфейсом ChatGPT<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/chatgpt-helper' target='_blank'>Проект</a></div></div>"]:::infra
 W_HUB["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Reviewer Hub</b><br/>Отдельный рецензент<br/>с проектной памятью<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/reviewer-hub' target='_blank'>Проект</a></div></div>"]:::infra
 W_CHAT_SKILLS["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Chat Skills</b><br/>Внешняя библиотека процедур<br/>управляющего чата</div>"]:::infra
 W_HELPER ~~~ W_HUB ~~~ W_CHAT_SKILLS
 end
 style X11 fill:#101820,stroke:#99adbe,color:#edf4ff
 X1 ~~~ X2 ~~~ X3 ~~~ X4 ~~~ X5 ~~~ X6 ~~~ X7 ~~~ X8 ~~~ X9 ~~~ X10 ~~~ X11
 classDef web fill:#182f4a,stroke:#75b2f0,color:#edf4ff;
 classDef memory fill:#16382e,stroke:#6ec7a0,color:#edf4ff;
 classDef transfer fill:#423218,stroke:#e6bb62,color:#edf4ff;
 classDef repo fill:#302447,stroke:#b6a0e5,color:#edf4ff;
 classDef review fill:#402730,stroke:#ed9bae,color:#edf4ff;
 classDef infra fill:#28323b,stroke:#99adbe,color:#edf4ff;
 classDef decision fill:#40351f,stroke:#e6bb62,color:#edf4ff;
 classDef continuation fill:#101820,stroke:#8191a5,stroke-dasharray:4 3,color:#d5e2f3;
```

[К началу файла](#presentation-top) · [Веб-схема](#web-v2) · [Локальная схема](#repo-v2)

<a id="repo-process"></a>

<a id="repo-v2"></a>

### Локальный Codex · [Веб-редактор 2](https://mermaid.live/edit#pako:eNrdXXtvG0eS_yoD-g__w5H41INOfJAl2StEtgRSTrx3OhBDcigNTHGImaEfcRJI9jre3RiRnThYI7t2HosDDrgDQttSTFmWDNwnGH6F_SRXVd090zMckrIsSk7-kKgZTvd0V1VX_erRrVuxslnRY7mYqqrL9bJZrxorueW6otS0m2bTySkVbcXS6YZpXs0p5Zpm20YZb1TNunNeWzNqN3PKlGVotbhia3VbtXXLqIoHCsanek5JjtF1zbxeXtUsh16gKHV4c6GhlY36CjySYjctrX6162ZDq1Toxhi7rhgwKm1tMXT7uqU1GnDjE6PirOaU1FiC3S83rWswippR1zWL3bKbpQvw9OqS4dT0i5q1YtT5qBTFMRs5JSuuSqbjmGs5ZWK5TjTyZqEsnYNnoKMV7EjJJ_9jOZZPKv_3UnH_7j51v3cfwOf_uk_cp3Tvjbvf2XB33W13y913n7utzm34e7dz393rfOXuKO7zzl34YkuZBrLcWI79J3ReMSy97BhmXZnPw-V0cQre8UHFuKbYzs2a_uHp6zTTVCLRuHHG0W84qlYzVuq5ml51zlxfNRxdtYGWeq5uWmta7Yx5Tbdw_CpSKqfVb15f1S399NkPSmen2CA7624bBrQJg9t3t9mo1zt3OvdgrHvw1fYHoyV43Bo9O6816-VVZdEy1xqO0rnjvnJb7kuYCkzN3e7cVrALaMdmt7BYUJY0-yo1dX-CyW7Cw_eVzga-Yxte-xxeuAPXQIVt9zVe0LPybKUZWsbKqgMD15RVS69-eHrVcRp2bnR0xXBWm6WRsrk2-vHV5jV4uD4KF2tavaKW9bqjW2qjWaoZ5dFSzSyNrmnw_WJ-tjB7aWlqaW7h0sha5dR1vaReS51WHBAL3fnwdBEE4vRZ93tgEQztmeqNEYihnf1gFEbIfwPXcrmcAzJsV3WLcewCdF0YGtuSI4r7A1APmOW-AoozarOXwlw8bgHJQfyIJZuMkYzZol0rzq5bMMc2SGlLcdsKfPuC7kEDIQGdTervnGk6Nky0Qc_5T33Z-YqEBrrYg9-vSQTax8dLb-an0ipoM3pLzdRQTahWs6bbEltLNdA1p8-yJtGstPSGSWxcmip8NDQmpkaUubrhgAr114lg3FJBncrBsqBV8iVQ-E9ATlhq9PcmiuQeLM_buG79BQaNzuXoElvu46raAMHYhYa4yIA1LeWcZehVerpilu1RNAM3Rh1oYo8eF7NgssVpIP5svji9MDN7pbiYX1hamF6YR_6NqaRRXqmgbJ2VhqPiTNxnMOt1pmBU9yX8sQWkuNe5o9L4u5kLrxjA2fzC5aXZ4qXZ2ZnZmVvLMfdvolNcA8-BapJOY0sJbz5DvaiAfLdAPf6ZVCQson9bjn0OfVf0smGD1ob-88ni0kKRvyUfKUHJ7LtLUD6F6js9oli6Zpt1lPaG5gDR6zZJkjRxXBVGvak5wQHOLHxyqbCUn526OORBZlFjoaEj7fMM1QQpJlAjnJ9czfQfN2hWRVXPehpWUrb8Pi5Zb-3yezKzu7iPz3wGEvDIbS3HPguxrufTT1Aw5Od9SkIbvV5BkICkhAeUqlGr5U4lE8mJVCIO-tO8qudOlca0hJ6Nl82aaeVO6ZVqploNIIsUIgsinvsPQBU_uv8NP_90f6Y7njTGmeKNoGtbfHMbLRh8_yuQmdvzHkCjj7wehcbrLancWLXc1wwV7XYeui9AE7TxYovPqRXAFsFVyHr4kcDIOsz2zyBMtwFp1LSSXgNyBXEJGL079DXo1Za7g5bvuLTfiLYC39ij9lUQCnu0mx6jhY_m5lEXdqu1KOL113KzUzOMqUPjaQYW9lNgEeBHLpUcFTBKW-BO6Kogs89rQi8IEhhfkRW3Ue-j6MLvO6G-EJOARQtrXr8vxNeIrtepxxDC9hQ3wz5sNTD5IM0DD4PAbL9_InCKkQ_0h65aum3WmrhaCdIcgXQMUP5HIR1vpfaR_AUHiMNQCvJmF8AOwhrlX-uPJGcqJFZCEJ4yNeExH57TAZHr9bJeUcB3M6pa2bGpH8WHEcfH-L7IR2s6q6aF7DOtCrR22x6EpRuHQTnTC5fOz-UvSgBHeAHtEPAnEhDWeoGX9BfCHyBjN7yZLhaWFhaHJjQeH_doELRQ4c4mjZot3j2uv8l_pFXd2fCVy_dwcw-EY5d0yW2FAPAeweWW5_dI3ossDGg4sWGAPqzbJ8yL57bo685fGCm3PHXn03UbfoM3TY8-99ynkxaxZFq1watFF6lioCax30qorhn6dcSOKQkhFYaHG9Mc-kgaH9zM-cS_1r-dzw7Ct2KMl-eHOcQMDnFM6DgQs10Qi3vCtICQAubigsGE9EsUIZjJeuerA87g3PBGP4ajP4e_SGJfwnDREpJBRsg0zWRNmSZZG4jMGXgUkNtDHoHvRhRQRd8Iy87ItM_Qw3JMGYGmQekKoRjeeQBry5f8e672ZBUocPsPAUS8xVhFOF6WmOiW24QsNyi8cZv-pvEHMAl2FXAeQr2EVBN7HLWpp1ZpDh73w85E6pDORBqdCVpRfAExL4IhJtLzuLgQJYEBYFbiJQs3gEojRfiMZv1VpOfgvUfSCr1WbrgDiqdOF-cTQ7Mn8wkR5exsUoyRlPa2uyPUsxTf5MCUqXiwOLvw-CsBKdgt31Ycm9MgxWo8lDc6nygyKkb6CvOJAdhgPjk8grN4-CsSJ5Aa4ci9QWjh7vnERov6DMOGBMDD1MUwMVjRDVKhr1EO4RkST7g4WdIni2tG2TKLDSB2NPmTg8ifGh75Uzz1QNQmTEJOEalcWtGSuPfOTxA_yDK0SF29FOFHHg9TouAi8qpzN4Cu4Ou7J8utFPGpCDS0yFzZ0SxLDWJZengsY2BnD80wA51A0jZFQ7aDbusrmXsPwGSTDYsreYJnitDWL7nLS47uBgHg5yfLhHTR1mvVIsAG27Ad8MluRnMhPYgLmeFxgfAcKH8G_PdEtCxkKImWEg_WO3d51AEsOoI7gflaHE-Rx0JLq43RCNaOVuXdQIbw-N2FaFZlivaqVgMaFR1L14tmtQiuaRPe2mPhZAaxLDs8ljEgA1oIlsIzMtb7jGHbRMvdrgymHCTsPPQ9tzfcVu0Tm94gGmr7_TB74_5CYoFviFR-3LWevaGXF4E2J8vFbLGi640DsjA7iIUJ5YsvviAlyNGDuM5wcyausyHIKiDhWwHXAOZNHxLzoqJgLpr72P0JTN1T9-8AOb6Dn8fud17mO-CVxb1gAS3nDfSE2goTiUCYoFcEvafDeRTS_i6uJkXXKOLIAmCgtFpeQGQbUTq6Ym8CMAHbLM5PXSqIWBwG8Tp_hWXzmpbBjhcs2cIPCTtQVr8LOxwfbPMzwto1zahpJYqgNkzVLpsNvaKy2Osh08Lg0y3NXlkaGpvHgc1PZI4iNnsFN16jNmOeWpsJ6pav135mQBpvK6TFWLB1k-JUOyyA9ioQ9-ySdckFCkTJBSc5a5n2CxUWsKgXfPuSBGGfGm_-1isAZq_MTuMKGBqvha0g5MFKgSSXiJaYpHV8bn8bLL6QnokLwPiCxSs6G3EmD69QF6AqY6FUnieT6zskQ4KImdcEgN58xmOxuxTVvO9pEAym3FEIYoryD7m_Y0ymkJpC_utAUBw8y5rUzDJB_m72e0Y6UgDW9DXTukkicHFhZhYj6P8V1JeMNKFKqc5mdy1AhoVyKKczxFjkOBm0n7BECRjE9NugGCMf2if5uR4ZwqOLM7qPJRnhWiXaf7zT-VqRizwOOAmMEi5cmv_j8OZBUDOvaxXVrNduKjRcbt6UUbgUztgBBzwzV1icWpr-w_AGPEGE_5FFWIVxRrC8z5wYvBlV7rXXrwqwbwgY0Q-P8v5ADtNr3vZ1D2gior6BRSL3JQK6aHC73vEoGpREAQ_-Il-jB9Q762_RMlcs3ba7tWNomLRgZCjAx4mqwtMZIuT7EJ36HmP6rEt8u5rLNQ1o_dH2QxeMsN7wPus3NqIVAxTbGBBC9m8Fk-SSLIfmKsQ0jMozh0Tl6AvypQRTVnHOJKZttFRyJEpKVWLk-V7nIcbLo1F3v7V_FFb6oKuebMLj8Ez8UpNXArx5cRnuWGJ69g3R4D7lummBemgOtSFbOkwiOdM8spxQ5YLWrBgOkaVP0Yr_0MBilcWF_PBANSykcI7L8rkahbHOG3XEjzayuUclFU9K--7XjoLzsZwwnGJ3BaBiKoFJAOjBDR742ZZKXa5bOLlV4IZZrZ5YZQoOWsWhYETBq0rh9Sj05TWbSjX5ZVRVitzHwNLpfPY3l_bkusdLfKIUSwLN8nnZHvm87CG16BhqUQ6sQHn8g6IaLLLxize1UNw-Ho4kt3iIC3225ywh20PB9kaIR7I03w0bejUfW3GFsPmG5yKHHGe_gFouAaKXfi1WJne96FVS4vMOiwXy4qUIzCRyVPdwyNBg08tSuU-hEYyAvmLeU9A_E3gjKIs8UHziFdlp1dsggqjlDZZkU3IBrddhqpI-npqfm5kapjx1RzAoibtHlQYoOrdDCV8_uULoihXRi2IeaZcFBezDdUE_dnPOa9umjRCE2lhXWHkq52NY1auoYgotTdmuoB1RWBHOiZkDfDnV3Pu2IKNiF5oD3rJ63bSuIkuirIDXdEB10XTx_NyVWwG8et64EdjxwGrVWNDqTucv8PkivJo3o4rW_jB1aWbh_PkhgsSGqYAxrK_oijDcB4rXlDRbx21qPNQs1Snvcf2z3gX6-eaagqM5TRsz5c06mNHyVb0SB_VdrcZhfprD_oZB6eWrkeIeR037nIeUW3EJl558LRvVghYxRlMEz8wxwRqixI0nWSSXUVpApG6ZY6WkvUM8gQ1b54YmFW-HNLhK4Nt-mAVnWQgWmd8mqXmIN7C6Bq2d5Fc855vVqBuWEY6z5SPVNLbJUyYVgzuCojfibf8OtuHlx3hQoVex6tFtb3mXktU-kaKx322kiAAlh8wCDwTAAf8OjIEwCtJGnVxXSa9QVb8y3cjq6vxQiNTc27njGYTQeylaEi4hRpAWriLed1-LWIkkabKp4ZM4F_UGKR4TVfaxwys6Qm_oFY0ZO6QfMY5-BIWOxxUWfBPblqUkY4uCyr0CeP3rAb2wdyg03aMMsPBRn_0qycnsO4t6vw1IgYrFLmPsbWL5He0UMupVSxOEn7o8M7c0NMLLcaCekTIR83vGAySRmOc3GugK0Do_-_Hc7CdDlHIJb0d7Oi2eQGauBsLE98itOIQHESDv0mxheJLMQnOObju2nH334g7PeQlesMboBKsiQwSXxt-H4IFZDiT4zMJ0YWgExziq2myAl6kHjjboDhCxGuIeUZ8TIrc0-j7kDszxAOqjZ6z8aNRHMGgrHydxl8mwVzoXTB69X5Hqw4Wjg0ax90keR0FpQEo0ExV3NAZo_QCkm1f7xJUSboi0vaqfPZL5XR7MOknhDo-_D-m7pzpYzGnTDyss5EomAFb8r6Swu2dd_W-9wwKChYkc8EYi58lJrVLS-xcmjr9VUx90TyDonuDb2564T91v4ecB_MYA_s_w88D9Bb2xB-5D-OJn94F3lFCg1KSfOPSI4_f1JI8oy3akPiSvPxL7y33XOd51_kxwD2cweBpd6PY06qAbfgTOr4ya3PPZiYjg-LH9UC5dHC7g52dpw-k2QV1vYPC6923NnqoYwGenvKquAcw67AqWyyQLC8MO9XfJGxWDkEdBR1rRoVQkGzwDE9pwHpUr6J_sFYXibRRHwnj3_F0xkoXkvc3N2HE8KEva8bhFteq7Ij30E6_-v8P3FO_wjU4UzwtBxmCm-n2TH9zcYdaMSo-Su4PKj5cKmJ-9VBhiOTXFglgyRpRaSFkW3bKDO9Uidubs8cKMlr_VgLKLoQ074vgzirGW2OEG7WhFoWCmEZNVvxKMBe3p1WD6Yu1tTOnWSvhe7ING4C-M9w4fnFpr1hxDrZrlpk1encqo_q64IT_BAmWLCwvzw4uXTpJFjhYKovwuryPpE9zlA8VaryHvUA-XrkZgiQMO9vzclWHXifbO-ymDcn4Do84C_rCaDElSwvZK1DB6B47IPg5GTLbw7RFlzyJcKzF3cN9vwinoULIaT6YKdCui4kw_8g6fdu_dBl1kyVHk3vHjiWgoq1cmS1o_KDuJUFashu_cvwFm_YZ22zwGaPs_7ncIY3HbzWP_1CrfDobPYRkUS-ZresC66xFZnhreuVaaVcbny07T0osUBjQD2TzcRN7mRfi0oSxY70Vxo_vdRyp2b-sAI3Hbg8fHpdBZARtX61FTHXHMtVq33iZoBiMfdMbi8PiCwatufvxA0SG-FYIXmFK8mbY_YTjJ54koJ_LLNd4vdsgzfDc2zAyPDRja6mbDo16lWe0-m87fL-rLE3s36k8Pj_o44qJAtH0ALfPCIwBt1A50Xve0z7bDeme4cGujSjWwx86UwHzfjStTeR5CmslzVcWvp_NdsSS0TW-Vg81PMls-yEseZn7_LXzlfrCK5k6QqntOYaAxechEdTJBB22zo1weAaaI2s4bcVoLTuxPBDlQo6_jidV8k36rR4xsen5uaItx0QShLKzqtZoyqtToLG1pUU5buubocXEssPEp_H2ZUgJTtZpvvPzE_La8R8LfpBdet9u8XOHYToCwy5bRoLUoPzfSsJPda9EnyaCA8MWpS1MXZmeGeO4cLAd2qJvI9ft1m_zAbF-B_tPXk7hyRETgGRfCNj-Omx7mTjHwnOkq-MPL0PvuPXs1DN60dDXieL4TZdyp-clMVp2fnJh8FxZeuDyVHyoD31DZ3D5z1ryQ7IWmZkmnon9D-K6rYAujdFE89YVBnHxDsGSdnNA20yt0QHXoDJyA4PBsL9_6gZV_hoPrttG0V3_LyxJUMtP5_RJlR2HC6Eypgxx8389SgW4XW_WYMvGlUhxOFy0bngMtt-N_-w49qGY_3bHL_Ts6RmlD1G4KTz5Itq4zoxNvlVrKs9M48uwQjnyafWTYR5Z9jLGPcfYxwT4m2UcS_2UG_ZOPGb2qXNdL4u0TqWpG894-ni2lqong28_ILdmuadF4LD2R0r3GY3p5XOvXWFRu8uaZVDqVnPAjEWOl0liqT3NEbbxpOpHKZMb7YotQUzo7ib83kRpP94-ABBrTQuBtUxPpVLrUl1uBtqI83Xt1OpusHnzKsnhHy8tEcjKpZfmlWtHsVc2ytJu5jJIW_VayeqqaPhOLx1YsoxLLOVZTj8fWdFiQeBm7hf8SZTnmrOpr-nIsB39aeqV5AzqzrqrUx3Jsuf45tG9o9X83zTXRhYXnzcRyVa1mwxUrbZhh_8LFewSEXremzWbdieVS2RT1Ecvdit2I5dR0anwkMQ6cTI0nMpMTqexYPHYzhspkJDM-kcxOZBPwMTaW_jwe-5TemxmZmJxMTo4lM-OTyYnxRDIe08k5u8j-2w3905vP_x-Zvkbz)

```mermaid
---
config:
  layout: dagre
  look: classic
  fontFamily: Arial, sans-serif
  fontSize: 16
  flowchart:
    nodeSpacing: 12
    rankSpacing: 12
    padding: 6
    diagramPadding: 6
    wrappingWidth: 260
    curve: linear
    subGraphTitleMargin:
      top: 5
      bottom: 8
---
flowchart TB
 subgraph R1["R1 · ЛОКАЛЬНО · последовательный вход Codex"]
 direction LR
 C_A["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>A · принятое поручение</b><br/>Launch Prompt указывает точный OPS Task<br/>Связь с первой схемой<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#web-v2' target='_top'>К веб-схеме</a></div></div>"]:::transfer
 C_AGENTS["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>1. Проектный AGENTS.md</b><br/>Состояние проекта, правила и ограничения<br/>Bootstrap и границы полномочий<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/AGENTS.md#3-context-loading-rules' target='_blank'>AGENTS</a></div></div>"]:::repo
 C_TASK["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>2. Initial OPS Task</b><br/>TS-A: спецификация внутри Task<br/>TS-B: Task со ссылкой на Brief<br/>docs/codex/tasks/<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#6-как-chatgpt-собирает-задачу-codex' target='_blank'>OPS</a></div></div>"]:::repo
 C_ROUTE_NEEDED{"Задача вызывает<br/>выбор маршрута?"}:::decision
 R1_TO_C_ROUTER["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R2 · 3. reasoning-patterns</b></div>"]:::continuation
 R1_TO_C_DOWNSTREAM["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R2 · 5. Подробности задания</b></div>"]:::continuation
 C_A --> C_AGENTS
 C_AGENTS --> C_TASK
 C_TASK --> C_ROUTE_NEEDED
 C_ROUTE_NEEDED -->|"Да"| R1_TO_C_ROUTER
 C_ROUTE_NEEDED -->|"Нет"| R1_TO_C_DOWNSTREAM
 end
 style R1 fill:#101820,stroke:#b6a0e5,color:#edf4ff
 subgraph R2["R2 · МАРШРУТ · выбор, подробности и подтверждение"]
 direction LR
 C_ROUTER["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>3. reasoning-patterns</b><br/>Самый лёгкий достаточный маршрут<br/>Разрешить label в точный путь файла<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/reasoning-patterns/SKILL.md' target='_blank'>reasoning-patterns</a></div></div>"]:::repo
 C_READ_ROUTE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>4. Один выбранный route-файл</b><br/>Прочитать тактику выбранного маршрута<br/>Предварительный выбор проверить дальше<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/reasoning-patterns/SKILL.md#route-file-resolution-rule' target='_blank'>reasoning-patterns</a></div></div>"]:::repo
 C_DOWNSTREAM["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>5. Подробности задания</b><br/>Stage Brief для TS-B — после route-файла<br/>Остальные referenced artifacts по задаче<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#authoring-order-и-loading-order' target='_blank'>OPS</a></div></div>"]:::repo
 C_CONFIRM{"Задание и правила<br/>согласованы?"}:::decision
 C_STOP["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Остановиться и вернуть вопрос</b><br/>Конфликт контракта, границ задачи или правил<br/>Недостающие данные и препятствия<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#13-stop-conditions' target='_blank'>OPS</a></div></div>"]:::review
 R2_TO_C_ROUTES["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R3 · Маршруты L0–L5</b></div>"]:::continuation
 R2_TO_C_RULES["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R4 · 6. Подключить нужные процедуры</b></div>"]:::continuation
 R2_TO_C_B["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R6 · B · результат в Command Center</b></div>"]:::continuation
 C_ROUTER --> C_READ_ROUTE
 C_ROUTER -. "Выбрать один" .-> R2_TO_C_ROUTES
 C_READ_ROUTE --> C_DOWNSTREAM
 C_DOWNSTREAM --> C_CONFIRM
 C_CONFIRM -->|"Подтвердить"| R2_TO_C_RULES
 C_CONFIRM -->|"Пересмотреть маршрут"| C_ROUTER
 C_CONFIRM -->|"Конфликт"| C_STOP
 C_STOP --> R2_TO_C_B
 end
 style R2 fill:#101820,stroke:#b6a0e5,color:#edf4ff
 subgraph R3["R3 · L0–L5 · варианты организации работы"]
 direction LR
 subgraph C_ROUTES["Маршруты L0–L5"]
 direction TB
 C_L0["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L0 · прямое действие</b><br/>Простая локальная задача<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L0_direct.md' target='_blank'>L0</a></div></div>"]:::repo
 C_L1["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L1 · короткий план</b><br/>Небольшая задача с ясными шагами<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L1_micro_plan.md' target='_blank'>L1</a></div></div>"]:::repo
 C_L2["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L2 · план и итерации</b><br/>Последовательная реализация<br/>в согласованных границах<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L2_plan_iterations.md' target='_blank'>L2</a></div></div>"]:::repo
 C_L3["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L3 · независимые проверки</b><br/>Аудит, Review и разбор рисков<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L3_self_consistency.md' target='_blank'>L3</a></div></div>"]:::repo
 C_L4["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L4 · сравнение вариантов</b><br/>Архитектурные альтернативы<br/>и их последствия<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L4_shallow_tree_of_thoughts.md' target='_blank'>L4</a></div></div>"]:::repo
 C_L5["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L5 · глубокое ветвление</b><br/>Разрешённые прототипы и ветви<br/>Явное согласование и ExecPlan<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L5_deep_tree_of_thoughts.md' target='_blank'>L5</a></div></div>"]:::repo
 C_L0 ~~~ C_L3
 C_L1 ~~~ C_L4
 C_L2 ~~~ C_L5
 end
 style C_ROUTES fill:#101820,stroke:#b6a0e5,color:#edf4ff
 end
 style R3 fill:#101820,stroke:#b6a0e5,color:#edf4ff
 subgraph R4["R4 · ИСПОЛНЕНИЕ · процедуры, контекст и тип задачи"]
 direction LR
 C_RULES["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>6. Подключить нужные процедуры</b><br/>Skills по характеру операции<br/>PLANS для объёмной или длительной реализации<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/AGENTS.md#available-repo-scoped-skills' target='_blank'>AGENTS</a></div></div>"]:::repo
 C_CONTEXT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>7. Нужные документы и код</b><br/>Только относящийся к задаче контекст<br/>Проверить реальное состояние репозитория<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/AGENTS.md#3-context-loading-rules' target='_blank'>AGENTS</a></div></div>"]:::repo
 C_EXECPLAN["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>ExecPlan · ход большой задачи</b><br/>Границы задачи, прогресс, открытия и решения<br/>docs/codex/plans/<br/>Обновлять по ходу исполнения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/PLANS.md#execplan-file-location' target='_blank'>ExecPlan</a></div></div>"]:::memory
 C_MODE{"Характер<br/>поручения"}:::decision
 R4_TO_C_SKILLS["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R7 · Семь skills</b></div>"]:::continuation
 R4_TO_C_WRITE["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R6 · Исполнить согласованную задачу</b></div>"]:::continuation
 R4_TO_C_READONLY["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R5 · Read-only анализ / аудит</b></div>"]:::continuation
 R4_TO_C_DISPATCH["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R8 · Родитель готовит ограниченное поручение</b></div>"]:::continuation
 C_RULES -. "Применимые процедуры" .-> R4_TO_C_SKILLS
 C_RULES --> C_CONTEXT
 C_RULES -. "Для объёмной реализации" .-> C_EXECPLAN
 C_EXECPLAN -. "Progress и решения" .-> R4_TO_C_WRITE
 C_CONTEXT --> C_MODE
 C_MODE -->|"Без реализации"| R4_TO_C_READONLY
 C_MODE -->|"Разрешены изменения"| R4_TO_C_WRITE
 C_CONTEXT -. "Нужен отдельный анализ" .-> R4_TO_C_DISPATCH
 end
 style R4 fill:#101820,stroke:#b6a0e5,color:#edf4ff
 subgraph R5["R5 · READ-ONLY · исследование и отчёт"]
 direction LR
 C_READONLY["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Read-only анализ / аудит</b><br/>Исследовать факты и риски<br/>Запись — только запрошенный отчёт<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/audit-only/SKILL.md' target='_blank'>audit-only</a></div></div>"]:::repo
 C_REPORT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Результат read-only задачи</b><br/>Findings / подтверждения и нужный report<br/>docs/codex/reports/<br/>Без искусственного write-handoff<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/report-writing/SKILL.md#file-report-vs-chat-report' target='_blank'>report-writing</a></div></div>"]:::transfer
 R5_TO_C_B["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R6 · B · результат в Command Center</b></div>"]:::continuation
 C_READONLY --> C_REPORT
 C_REPORT --> R5_TO_C_B
 end
 style R5 fill:#101820,stroke:#b6a0e5,color:#edf4ff
 subgraph R6["R6 · ИЗМЕНЕНИЯ · реализация, проверка и возврат"]
 direction LR
 C_WRITE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Исполнить согласованную задачу</b><br/>Код, тесты и документация по заданию<br/>Большую работу вести ограниченными частями<br/>Отмечать прогресс и результаты<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#63-принцип-сборки' target='_blank'>OPS</a></div></div>"]:::repo
 C_VALIDATE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Проверить кандидат</b><br/>Проверки из Task и проектных правил<br/>Результаты и причины пропусков<br/>Самопроверка и нужный code review<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/review-code/SKILL.md#4-mandatory-workflow' target='_blank'>review-code</a></div></div>"]:::review
 C_FIX{"Нужен Fix внутри<br/>текущего задания?"}:::decision
 C_HANDOFF["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Repo change handoff</b><br/>Границы задачи, baseline и точный набор изменений<br/>Status с untracked, diff, stat, diff check<br/>Проверки, сводка, риски и препятствия<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#71-repo-change-handoff' target='_blank'>Stage Plan</a></div></div>"]:::transfer
 C_B["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>B · результат в Command Center</b><br/>Специалист передаёт артефакты в веб<br/>Review, Fix или приёмка на первой схеме<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#web-v2' target='_top'>К веб-схеме</a></div></div>"]:::transfer
 R6_TO_C_STOP["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R2 · Остановиться и вернуть вопрос</b></div>"]:::continuation
 R6_TO_C_DISPATCH["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R8 · Родитель готовит ограниченное поручение</b></div>"]:::continuation
 C_WRITE --> C_VALIDATE
 C_VALIDATE --> C_FIX
 C_FIX -->|"Да: контракт прежний"| C_WRITE
 C_FIX -->|"Нет"| C_HANDOFF
 C_VALIDATE -. "Конфликт с контрактом" .-> R6_TO_C_STOP
 C_HANDOFF --> C_B
 C_VALIDATE -. "Нужен независимый Review" .-> R6_TO_C_DISPATCH
 end
 style R6 fill:#101820,stroke:#b6a0e5,color:#edf4ff
 subgraph R7["R7 · 7 SKILLS · подключаемые процедуры"]
 direction LR
 subgraph C_SKILLS["Семь skills"]
 direction TB
 C_SK_ROUTE["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>reasoning-patterns</b><br/>Маршрут и точный файл<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/reasoning-patterns/SKILL.md' target='_blank'>reasoning-patterns</a></div></div>"]:::infra
 C_SK_AUDIT["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>audit-only</b><br/>Исследование без изменений<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/audit-only/SKILL.md' target='_blank'>audit-only</a></div></div>"]:::infra
 C_SK_REVIEW["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>review-code</b><br/>Проверка кода и diff<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/review-code/SKILL.md' target='_blank'>review-code</a></div></div>"]:::infra
 C_SK_TEST["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>write-tests</b><br/>Тесты в разрешённых границах<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/write-tests/SKILL.md' target='_blank'>write-tests</a></div></div>"]:::infra
 C_SK_DOCS["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>docs-update</b><br/>Согласованная документация<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/docs-update/SKILL.md' target='_blank'>docs-update</a></div></div>"]:::infra
 C_SK_REPORT["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>report-writing</b><br/>Сохранённый анализ<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/report-writing/SKILL.md' target='_blank'>report-writing</a></div></div>"]:::infra
 C_SK_AGENTS["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>subagent-routing</b><br/>Агенты, briefs и консолидация<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md' target='_blank'>subagent-routing</a></div></div>"]:::infra
 C_SK_ROUTE ~~~ C_SK_DOCS
 C_SK_AUDIT ~~~ C_SK_REPORT
 C_SK_REVIEW ~~~ C_SK_AGENTS
 end
 style C_SKILLS fill:#101820,stroke:#99adbe,color:#edf4ff
 end
 style R7 fill:#101820,stroke:#99adbe,color:#edf4ff
 subgraph R8["R8 · МНОГОАГЕНТНАЯ РАБОТА · поручения и консолидация"]
 direction LR
 C_DISPATCH["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Родитель готовит ограниченное поручение</b><br/>Один вопрос, границы задачи и нужный контекст<br/>Ограничения и ожидаемый результат<br/>Отдельный путь отчёта, если нужен<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md#dispatch-mode' target='_blank'>subagent-routing</a></div></div>"]:::repo
 C_CONSOLIDATE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Родитель объединяет замечания</b><br/>Проверить подтверждения и противоречия<br/>Сохранить IDs, убрать дубли<br/>Следующий шаг в границах задачи<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md#consolidation' target='_blank'>subagent-routing</a></div></div>"]:::review
 C_LENSES["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Несколько code reviewers</b><br/>Независимые направления проверки<br/>Свой brief и путь отчёта у каждого<br/>Объединение результатов у родителя<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md#multi-focus-code-review' target='_blank'>subagent-routing</a></div></div>"]:::infra
 R8_TO_C_POOL["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R9 · Независимые роли</b></div>"]:::continuation
 R8_TO_C_MODE["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R4 · Характер поручения</b></div>"]:::continuation
 R8_TO_C_FIX["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R6 · Нужен Fix внутри текущего задания?</b></div>"]:::continuation
 C_DISPATCH --> R8_TO_C_POOL
 C_CONSOLIDATE -. "После анализа до исполнения" .-> R8_TO_C_MODE
 C_CONSOLIDATE -. "После проверки кандидата" .-> R8_TO_C_FIX
 C_LENSES -. "Организация review" .-> C_DISPATCH
 end
 style R8 fill:#101820,stroke:#ed9bae,color:#edf4ff
 subgraph R9["R9 · НЕЗАВИСИМЫЕ РОЛИ · выбрать по задаче"]
 direction LR
 subgraph C_POOL["Независимые роли"]
 direction TB
 C_AR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>architecture_auditor</b><br/>Слои, ответственность и границы<br/>Только чтение<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/architecture_auditor.toml' target='_blank'>Роль</a></div></div>"]:::repo
 C_TR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>test_auditor</b><br/>Покрытие и безопасность тестов<br/>Только чтение<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/test_auditor.toml' target='_blank'>Роль</a></div></div>"]:::repo
 C_DR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>docs_auditor</b><br/>Документация и реализация<br/>Только чтение<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/docs_auditor.toml' target='_blank'>Роль</a></div></div>"]:::repo
 C_CR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>code_reviewer</b><br/>Независимое направление проверки<br/>Ровно один review-report<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/code_reviewer.toml' target='_blank'>Роль</a></div></div>"]:::repo
 C_AR ~~~ C_DR
 C_TR ~~~ C_CR
 end
 style C_POOL fill:#101820,stroke:#b6a0e5,color:#edf4ff
 R9_TO_C_CONSOLIDATE["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R8 · Родитель объединяет замечания</b></div>"]:::continuation
 C_POOL --> R9_TO_C_CONSOLIDATE
 end
 style R9 fill:#101820,stroke:#b6a0e5,color:#edf4ff
 subgraph R10["R10 · ДОПОЛНЕНИЕ · локальная инфраструктура"]
 direction LR
 C_CLI["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>PowerShell / launcher</b><br/>Create, Initialize, UpdateAll<br/>Подключение и обновление проектов<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/scripts/command-center.ps1' target='_blank'>PowerShell</a></div></div>"]:::infra
 C_MANAGED["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Общие файлы проекта</b><br/>Управляемые блоки AGENTS<br/>.agents / .codex / reasoning<br/>Общие ignore-правила<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/scripts/command-center.ps1#L945-L989' target='_blank'>PowerShell</a></div></div>"]:::infra
 C_GUARD["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Опциональный Guard</b><br/>Восстановить управляемые файлы<br/>в зарегистрированных проектах<br/>Без Commit и push<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/scripts/command-center.ps1' target='_blank'>PowerShell</a></div></div>"]:::infra
 R10_TO_C_AGENTS["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R1 · 1. Проектный AGENTS.md</b></div>"]:::continuation
 C_CLI --> C_MANAGED
 C_GUARD -. "Восстановить" .-> C_MANAGED
 C_MANAGED -. "Подготовленная среда" .-> R10_TO_C_AGENTS
 end
 style R10 fill:#101820,stroke:#99adbe,color:#edf4ff
 R1 ~~~ R2 ~~~ R3 ~~~ R4 ~~~ R5 ~~~ R6 ~~~ R7 ~~~ R8 ~~~ R9 ~~~ R10
 classDef web fill:#182f4a,stroke:#75b2f0,color:#edf4ff;
 classDef memory fill:#16382e,stroke:#6ec7a0,color:#edf4ff;
 classDef transfer fill:#423218,stroke:#e6bb62,color:#edf4ff;
 classDef repo fill:#302447,stroke:#b6a0e5,color:#edf4ff;
 classDef review fill:#402730,stroke:#ed9bae,color:#edf4ff;
 classDef infra fill:#28323b,stroke:#99adbe,color:#edf4ff;
 classDef decision fill:#40351f,stroke:#e6bb62,color:#edf4ff;
 classDef continuation fill:#101820,stroke:#8191a5,stroke-dasharray:4 3,color:#d5e2f3;
```

[К началу файла](#presentation-top) · [Веб-схема](#web-v2) · [Локальная схема](#repo-v2)

</details>

<a id="version-v1-new"></a>

<details>
<summary><strong>Схема — прямые связи между группами</strong></summary>

Та же система с непрерывными стрелками между группами: для подробного разбора зависимостей и обратных переходов.

<a id="web-v1-new"></a>

### Веб-процесс и Library · [Веб-редактор 1](https://mermaid.live/edit#pako:eNrlXOtzE1eW_1duKR_4osa2bPxQCFOyLGzv2JZLEoHMsqVqSS1La0mtarUwzquwPcBOkYlDFmqy2QmBZHbz1ThWEGDsqvkLWv_C_iV7zrmPfqjlyQACF_kQIt_u-zrnd8_rntOfRIpmyYjEI5qmXW0UzUa5uha_2mCspm-abTvOjNo6_Wma63FWrOmtVrWIDWWzYV_U69XaZpwlrKpei7KW3mhpLcOqluUL2erHRpyNTeLfMBANzFjTMloGDF0ymnblYtVq2by9blhrRqq0ZrTirKzXWgZvhpXAmI21rG3ptrEG8y2lV-ZT2Vx-NZFb4O-sG0Yz1bCtzRXYTbqRM5txZlttMUIDGldretGoGw07UauuNfBHnK2kV1K01Jq5Uazolh1338829SJMGmfjMd5o6Y111TgxLbail0rUMCbeKlX1NUuvrwbbNyy92YSWy9WSXYmz2OQob2-1C_PwqJKr2jVjWbfWqg2xCMZs3MW0_Ktg2rZZh67Qk5ilVs1ys_ASjLSGI7HL-dRKLvPRv16NOF8795277O9PWG_LOXY6vVtO19lznjvd3lZvmzldlqzo9vxqjiXNel1vlFgS6GJYVyP_BgOWqpZRtKtmg49_Ob-4koORYdzzpeo11rI3a8YHZzZoQ7GJ0eb1923juq3pSN94zSjb729UqrahtYBoRrxhWnW99r55zbBw4RoSJK43NjcqhmWcuXC-cAFW2-ndgLX9EVb5zNnD1fZ2mfMClnxIjzrwG5rOjxTgfWvkgvO_0PS890WUQZ8951lvu3cnypwD58g57u30_iQ74E6dn2GAPfr7Vu8O7_5jb9s56t2GRvXisZjogOaFZ0iuI-cQ_zxy9uG_pwx6dZxDMYiXFp79W9W1ig3b0lnFMsofnKnYdrMVHxlZq9qVduFs0ayPfLjevgYvN0aKnPhakYivNduFWrU4UqiZhZG6Ds-ztr5m5AHAjfyqZdpm0aydrZfeG49psKAQkmn9JDvDbMCWYX9wJl-AcdbPXKBBGQ56fkS_cH4EtiH-Be7H4_ENo0BMz-YSmdwngKXvejvOL0gFABPMdwSDH8LQN4gse0D6L4gesATiCdEcl3QDHu2w3p-BantAXnj7d1cjn8EMJaNYbQG8aJo_pDLpoSGL73VUHIQj5zFCAVfMnCdIqd4daIZVu8D6BkDU6e0CsG5JiPkBhNsjym_BJru80wNAHWEHu3DKOx1GjUfw5zOkgJcs8BetrPW2gaS18IE2qjldDSUDX55G-30MnIZj9bIAMholv2wCPM2nUDY9dL5y7gLNfgJi_xejZmQQnTEiGaxEkrnT-w-J5AGy6WImsZwaMoCunOUQukGnC5joonrPhc7XvTsegPGeuIstdVgJeIEj6nQCEq0fbgHKeOZ-u_CZcIFyGzbyVMNTDgDaJUH87FVET2p1iCw1moS3I1hm13nBpfozUhuwCR-1XeZ-76oHFCNbJBMPJAtBTfxKNn-NR4yU8QuhtI48DL_tU1ywAKF89oT--y3onaV0erjM18CkJQQAy31mAPBI8fshbOiJX2OgYtjmVhSxh2NkG_rtk1Ls4CkQTHK-J9mP5-A5AEWNcMQVzzM4JXewK3Lag7d390jPJ3IpMCbmwZAXpN8i-2rfPRpBwtBBdfZBqh4TGTmXjsKMiOV0Bkd3HnAlJgzdLwKSk5sp7mnvOD8DQ2gHYYPOzcOQc6KFrcHK-Tq_xXWiYvcpKKnwQaL0dpHdoetM5C5lFnMfDc-U_gsdwee0YcIcavSbKJS4IQIbv0FCBbfuV7AK_CsjCTbCUterLRscF_rZrJnoidFjwEvTbBkleJBotYyW-NlsWrCwEqfRI6AQ0v4JzdUh64t4cwRQEtTaB0rBCUSacSa8ZexPjmu6VURyF-020POfxnq1UbZ0bpSkL63MJXKL6ZUhWyZjpMkOwHLYdR0VZK3f-PToMQ9E76C2I5OU_t1iltE0XdEmOr-g98BIW8llJXORsQdcKyFzbwvJ_4QrxzsoUoG1X7L0alajc32ALlVv520rMGnwjmka7lUrm-1GSUdz8uW53WformbIegGT4T6okfvOPbB3f3K-EjZHUNnz8yHE7I60AJzOAHM3cWlucYie-HcwPbJwF7lGMgNsUgGBpFkyrrNEu1S1XTw9gJcO5GvQZRdApJc0s1HbZC7nhV4TWtFrJyEbQmxeUrJBN-t7UpHgYLGMca1qbDAxEhcjX4B8QW3K-kX2O6RPbUtvtMqGxcGQTKZWh4iGEGFxRHbrDR50cWHwiMTOc5QiblgApT53sZ_3s9jFRlf6es4TsKoBSOSHbvOB_wI_ydaEUXwxBzfas0U2GEyE56gLAx_SGeq8WZsZRF0-CTIylckn03OpKyAG0rl0Mr1EqkVDCes804oV3V5r2hqPRtCO9tCs9ElJDSOz1_uxAVP8ClCspFJz3rDNHnPdeXEO6SSH2SfZhcQqGlI5vbXOshW9abCM2Yb9UrdcVkvIswm_Z8NGyGUTQ8Mjzc9DOehtKIMiIKdw8V7HjduOezzIdyQsRK4r0ZX32SFAYt6f-v7nQMie6Lcde6ScFF5vHYHjmjJPMRh8jBB8TH4LLPFlsTabWUxdHCa_ZwW_3ZCsCJ2xWatqlP1sPiC6PxYw8FnjodILO5bMYmuEztsImQb5Ao7bGjkVTNPbdoXsbs20StDb6YLvqpdUw8uyLZedHaIHIgyHQ0ak1Ap6cR08BHWyFMt-JA7twUEB67X3JTlkHXXKpG25xZSTTiH4LfTkAAfIzKdBFtowwTvOu9WlRHJ48U4R98BQDqlVrmkDMo230s3LU-DdHcVSddXGVs0Nw8pWjFpNeSc88t2RFzY4WogJSSf1YvU6IGZJbzeKFQbmVL1pc9_dBQO8d8hI_W_37sJPn-B-68J2QivjFrQabUFr0hZeluPDU6ikTQMHDgxossWOycnrEr1Rjj71yVpuh5MJtt_nKDj7vZsojrnHEBYPUxGTF6SAxSTifN9E4SGCQm-Ak-CuZYGR5K0j88gxvDamNYwND8dss3nmgvMto6AV2nLc4QksOZSZOGCYn5hJ5S5lVvht7QMQm1_TzcgPyBPu34CRgf6PkpI-I-MJtcFxdANQA1zG4cn6WXErErDcBd89d2oBmzwoUcAdontVIGYFWGWWy7wjGJpoo3hcSqSlZbMRMuVA4W8LkaRi8W_O4H9TuEGgfLiYujw0LkpnGv2DF3S0u-6BlhHrA3UHIdlKPsIIt8PIg5OCncxh7reLABP0xKuWA-XWzVXL5SjNCP7O3d52tM9oDrtm_ZEP9guJkZ_lyg4p8C5WxwBK-1IMdYnCAJO3HASYimkW0Ri0QgMtgJZWqraaZqv6cpEnPhhB48NUZm4xSdf0D32x6LC8DxmFORahX_-p7e0IsRPi1V1cvDI8k-NBf0xMWgEeGeIRhML-wB3Q3ihWhRdRX6L2Enfxv5C4Oeyz-uVtw3eINhUC9SKUSyd6zPUSXw4nzrsLpeRSOnspM0TTklw0PLfc-JPGZYgi89ypE3Z3veYCmvt43xAISPuiTwJDHcb9QWpU6jOqLkUQLV1WrBl6o90cFKHkNhCum4LroXcZYRbTW7-unZrUwojLQ-AvAxWhjpILiZV5HmO6L2-ZwsNu4WT5XaiAWUksDQ96f8NAgFS-dJqJCCVlbgwOZCpxRANQxES5PvgGIggHk7djIXOVSNvBS3a7xf8_MEzkiXGD-NmCZzcBn2arbRlakMjC_X2LABvjtyhFoOKaoQlavgKyCAX59O8RWj4yiugd4ecuT8ERDmGIljtyDkMQlkwvLw_x5gTzKKucr0pWwKm7q-CTMeqmbbDsZqPov43zS5vsQoIGeTWhgweTX6Fs01uPQdF34DfekPzfjXus2W5V-Iue_CQMhtbMol4D6WqJ1S4k3lUhBtouNTfk21lvSoPXlOGs5TYuj2dQIPq430dGixY5f1NYSB1Ekz8j6Sma3GDEMOmT480rBdMOwaQ7DRfrr5mHA_ILl1PLaUp-XlqczSQyH1Fs45iyPHe5wbgTEnAkN2Ifj4iGXgSawgPc6OxHK8nhaahHHiYrw4hHvbt41xEqArzpSh7jPxpi3UdDnCUhAXhCk0g0Q8D9I0i-KTiJ3PQ8z03PXzatddCyecCHbfgANq21QKxWLLNR_Zhu87W6WTJq_dASQzAaIhxddZB81qYfWunLK6lMFiM1P5EYvYP0ZWRT7snQJSihQchZHZ6cWc2k_yWVzOXnUqA7F0UowoXFT8hLRkYa8hGQFFXx2Gdcv_AXf-BqwptsOCB3_jTx_dw4hlb_HaidLxngEJETVC-9Gt8v5xOZ5MLwYq4w-GIOeAa-lo9X_sv2TiA5S6SP-1xZqQkeiDDYNkmHfZlWIm1z7HVIhgLXH27o_VTxcsKXffXqXFxdSgwx-wqz1mkKHw-_Vfn93rIHYdDdDJPgXlXOg1Ui59sj_UVmgzQbTh_rYlyV55vAp1dnXHp5aGxLr6YyFLAV1oKPeT8MTAMXwUg3j6fjqTtSeSqBSOSvMe5OHyvHNLNpWKRE85wnr-EkzrHPP_9cHEklYUVbelkZc5fzs4lsarjpTNLb4jKS3MrHdOWpCnR8weq-NBIhVTHUyMFxmw6myHdSucWU_SgM3i2KTKqYQUgqnCcP8Il0xTC6wEbsetMDpI64-eQhBTdgsC0uUaSvybvt02K96S5dFaxhS9WCpVubpw6AY6NaSy8bWo2vT6u37QH5mf8kBi_NLi1mh6fWnbtocaPIoNCR4GZf9BEaJeV90FKhZjLX_PFHLmd23LsjqdgJuMoIwMtwaHpOhRmeNLmuJ4Ei7B5fpQ13pBg8oomeiQsWkcyBg7u1EKLeDdB2IFLpO78ZKKUzc6nM8IAkQzde8JC7ysM3aMTRpZjLJW840hvJ9CZNCWmFqZQyMNnvwQgsBbUkhYx47py49UdD8umpY_gMsLhmV7VytWagRQJU56HJ1quyPJdJrGQvDpPr31NRSQdvn46VTqCKIBH3pGRaHvxlMlIRZrvIPEeKCt7i9x2epKluf0EhH-GekCs7zrEIJqmAhIpiHob4vM7h6Tv4eElWRGpvajhgw9igxFutaDbsaqP9WqRAJpVMfzhMRLgXlJzdskY2oNM99cbCPSQobAXKPnzZEgdS9EsMbAtGc_-xr3qEhMJylLmRuSibUw53lCU8jpsUPv0qRuQGEfgO3MpYsIZDDOrfIJ6yl4ZYyCy-sRAolXCdGjJYpb_S2_GqkZPLWoWB4bN7veLny7D8LzEYWq4iPC7BoeRS1HvhLoOUx6cv5n2aUNQXE09dAc3Fa5EeMJAo98FMvOv8D_x7z_nG-Sv8_xGojm9EkvU-L_txL8-7XCRgYRLXPcinYJBzKUP4XUgtrQ5RHMrvlSwYNfBP_XW6orQBc4VFKJ9Wzr2iPxJctuhTHmKQ1wYNUcxRoTX1s06AvsNLZU6uGFy4NDvkBC_DYgvtwoDKLa5nbtBdKh7sJ5zbMuvWXxBI2WveqxVxyF8DSS2xVA2evBpBkwuJXD77-8WlpexQQcmy69VareVNWXlBgVuM5FJ0oSu8siMuJl1j_JaQXDc4mQddT7nW3qDiQ_mFHqZpF-SXW9xvuGDrpyAD7uEFxafikyv9j79D65O_QN_UUF9nEaO6jfRLzZVaVd9sEG1Ywa9K-UUb1n-rQnDflHFvHT4pBr4INYq3h9oDVnyr0m_P03hQJcg0Cawm513Vkr1dPbufm_fVajPtLIMXHknVRErqF0qI7MgTEvhQCTtLexYDucXAYqifMESgKmv9BYJiraDA1DAu4efm5XJ92tynNwN7dLvwejBYIyXRarCGHW4I8h5UWBro4r2SEFzhJYduKaqEARaOeWoSRTPWoqmitD4eup28jz2c4Jf0bmWaeAXrwPgLuWwi7Oksf0rVSW6dklhTLjsrK9VEC5VUyMKYvjb6JVr5bAnBx_8OpPSKAErwiwVgJMWFIBUJv3ssprgrcrTFBDzV15P1K9pFnqc351PS6-GA9GuckYp1fagOdP4ryfldmRzCNxC4Zjqp_z0q6Oiocqr-pEynK2TK4hWZStqHmcCgPtiJ-0r3ExG-LAI8bZ-6yYveREYxi8hW82auBcQPHD4sXfclcXUZT-jpw2FgCIVlSl1yk5ikzBQJTb7spv4DebF6PUgk_6seijhHYk2Uz-RJbZL7ddfKhTdBdcAXqroyIRid-hcKk5jqIBXEfEoM8VCJKRns67_O6h9BopiG-Jt08dTMfTkJ_SPwDYkRVO5MyFrhh6ABRejcWJ1spVt83kw_RTteOqjbB3n8ebjYGzoWK_gqGI0dSAwvcr1f1HKXjtTt36MKAB7Kw4nhVzICVFcZkArsRmFFSKKB0YKu76S7EQOOLRHb8IW-lIByH4nf6gk6sB5fVmzHf63G1bAigNBSvg4PKCKA9y9Cf6u8dNHNJyQ9HR8FFT8bpEjJLxK9eFrygSgjkZmFJMUfi-yHF6rWkAL8HYqDC9kW4CV9KHPOKLMNo8DKYBnG3xubjpUn9GjLtsx1I_7e1LlCrDwaBa_QtOLvGaXyRLn8vrcnd-dk58nx6ZihOk8axSn9pM6yckx0n4iNx8amVXdjslCYjJ3Qnb4AwruOj8YmJqZU18KkPmqcO7ErlZGIeUdjU-Oj7rylmYJunNCZ7FnRNzY9HhsvqL4zM3qpcFJfmeapph4_N1b-h1smZ0B-MlMSexR4NXoipzw9uXB8mZ74hZDwjmGr9XTkJWMDuobQ2NNVhPJDu4ahytNVyJeX6coPWmjPML5CT_AC17PUu2SU9XbNZgqBU8VYSfbXuBc3dnYavLhINLJmVUuROH75NRqpG-C44Z-RT_AbqlcjdsWogxiIw0_LKLWvayXdWtdo5quRq43PoH9Tb_zBNOtyCMtsr1UicfoYbTTSbpZ025jjX3hVr4DvZVhJs92wI_HYzAyNEYl_ErkOf07MnJ04NzEFSJyamjk3NT0VjWziW-NnY9PnZmZi41NToxNT059FIx_TrBNnY6Ox0THA7vTU5Mz4zHg0YoDpZlrL_CO99K3ez_4feZaP2Q)

```mermaid
---
config:
  layout: elk
  look: classic
  fontFamily: Arial, sans-serif
  fontSize: 16
  elk:
    preset: depthFirst
    mergeEdges: false
    layeringStrategy: LONGEST_PATH
    keepEntryNodeOnTop: true
    nodePlacementAlignment: NONE
  flowchart:
    nodeSpacing: 32
    rankSpacing: 48
    padding: 12
    diagramPadding: 12
    wrappingWidth: 260
    subGraphTitleMargin:
      top: 8
      bottom: 20
---
flowchart TB
 subgraph W_ENTRY["ВЕБ · специалист и ChatGPT Command Center"]
 direction TB
 W_INTENT["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Верификация намерения</b><br/>Цель, факты, допущения и границы<br/>Уточнения перед началом новой темы<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#32-верификация-намерения' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_START{"Нужно сформировать<br/>цель и карту этапов?"}:::decision
 W_ZERO["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage 0 · собрать замысел</b><br/>Идея, цель, границы и риски<br/>Определение проекта и карта Stages<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#3-stage-0-и-старт-работы' target='_blank'>Stage Plan</a></div></div>"]:::web
 end
 subgraph W_STAGE["РАБОЧИЙ STAGE · вопросы и решения"]
 direction TB
 W_FRAME["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage X.0 · рамка этапа</b><br/>Выбрать Stage и сверить намерение<br/>Цель, границы и вопросы этапа<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#4-рабочий-порядок' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_STEP["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Step · один текущий вопрос</b><br/>Перед обсуждением сверить намерение<br/>Варианты, ограничения и основания<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#32-верификация-намерения' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_LOOP["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Step-loop · уточнение</b><br/>Разобрать детали и противоречия<br/>Продолжать до закрытия вопроса<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#4-рабочий-порядок' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_GATE{"Gate · условие<br/>закрытия Step выполнено?"}:::decision
 W_MORE{"Остались вопросы<br/>текущего Stage?"}:::decision
 W_DG{"Decision gate<br/>Какое решение принять?"}:::decision
 W_MATURITY["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Зрелость архитектурного решения</b><br/>N/A / Existing / Exploring<br/>Proposed / Assessed / Approved<br/>Сквозное состояние внутри Stage<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#63-architecture' target='_blank'>Stage Plan</a></div></div>"]:::infra
 W_FOUNDATION["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage 1 · для нового проекта</b><br/>Принятый каркас repo и проектный AGENTS<br/>Создание через обычную OPS-задачу<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#33-stage-1--repo-foundation' target='_blank'>Stage Plan</a></div></div>"]:::infra
 end
 subgraph W_PREP["ПЕРЕДАЧА · ограниченное поручение"]
 direction TB
 W_AUDIT["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Необязательный Codex Audit</b><br/>Отдельная read-only задача<br/>Проверить repo, границы или риски<br/>После Review вернуться в Decision gate<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#4-рабочий-порядок' target='_blank'>Stage Plan</a></div></div>"]:::transfer
 W_ACCEPT["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Принятый контракт</b><br/>Согласовать смысл, границы задачи и результат<br/>Зафиксировать допустимые изменения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#6-как-chatgpt-собирает-задачу-codex' target='_blank'>OPS</a></div></div>"]:::transfer
 W_NEED{"Нужна работа<br/>Codex?"}:::decision
 W_SHAPE{"Task Shape Router<br/>TS-A или TS-B?"}:::decision
 W_TSA["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>TS-A · самостоятельный Task</b><br/>Полная постановка внутри OPS Task<br/>Границы задачи, ограничения и проверки<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#63-принцип-сборки' target='_blank'>OPS</a></div></div>"]:::transfer
 W_BRIEF["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>TS-B · сначала Stage Brief</b><br/>Подробный принятый контракт<br/>docs/codex/stage_briefs/<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#authoring-order-и-loading-order' target='_blank'>OPS</a></div></div>"]:::transfer
 W_TSB["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Затем brief-backed OPS Task</b><br/>Управляющее задание с точной ссылкой<br/>docs/codex/tasks/<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#authoring-order-и-loading-order' target='_blank'>OPS</a></div></div>"]:::transfer
 W_PLACE["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Разместить и проверить файлы</b><br/>Placement PowerShell для артефактов<br/>Отдельный Fixed Launch Prompt<br/>с точным путём OPS Task<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#64-fixed-launch-prompt' target='_blank'>OPS</a></div></div>"]:::transfer
 W_A["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>A · задание в репозиторий</b><br/>Последовательный вход Codex<br/>Продолжение на второй схеме<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#repo-v1-new' target='_top'>К локальной схеме</a></div></div>"]:::repo
 end
 subgraph W_RETURN["ВОЗВРАТ · Review, исправления и завершение"]
 direction TB
 W_B["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>B · результат Codex</b><br/>Изменения и проверяемый handoff<br/>либо read-only report / подтверждения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#repo-v1-new' target='_top'>К локальной схеме</a></div></div>"]:::repo
 W_REVIEW["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Review относительно задания</b><br/>Task / Brief и фактический кандидат<br/>Diff, отчёт, проверки и риски<br/>У каждого замечания явный исход<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#72-review-findings-disposition' target='_blank'>Stage Plan</a></div></div>"]:::review
 W_VERDICT{"Решение специалиста<br/>по результату Review"}:::decision
 W_FIX["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Ограниченный Fix</b><br/>Исправить реализацию в прежнем контракте<br/>Новый кандидат и повторный Review<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#72-review-findings-disposition' target='_blank'>Stage Plan</a></div></div>"]:::review
 W_CLOSURE["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Подготовить завершение</b><br/>Влияние на docs / AGENTS<br/>Согласованные обновления, архив и cleanup<br/>Проверить итоговое состояние репозитория<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#76-завершение-stage' target='_blank'>Stage Plan</a></div></div>"]:::repo
 W_CHANGED{"Есть изменения<br/>репозитория?"}:::decision
 W_FINAL["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Финальный staged handoff</b><br/>Согласованный набор файлов и staging<br/>Финальный diff, status, stat и проверки<br/>После всех closure-изменений<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#71-repo-change-handoff' target='_blank'>Stage Plan</a></div></div>"]:::repo
 W_FINAL_OK{"Финальная приёмка<br/>специалистом"}:::decision
 W_COMMIT["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Commit и оговорённый Remote Sync</b><br/>Проверить SHA и итоговое состояние репозитория<br/>Если требуется — push<br/>и сверка local / remote SHA<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#76-завершение-stage' target='_blank'>Stage Plan</a></div></div>"]:::repo
 W_CLOSED["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage закрыт</b><br/>Итоги и точка продолжения сохранены<br/>Перейти к следующему Stage<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#76-завершение-stage' target='_blank'>Stage Plan</a></div></div>"]:::web
 end
 subgraph W_MEMORY["LIBRARY · память управляющего веб-чата"]
 direction TB
 W_SYNC["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Сохранить значимое состояние</b><br/>Решение, результат, замечания<br/>или новая точка продолжения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#8-synchronization-model' target='_blank'>Working State</a></div></div>"]:::memory
 subgraph W_OWNERS["Четыре владельца"]
 direction TB
 W_PD["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>PROJECT_DEFINITION.md</b><br/>Что строим, для кого<br/>Требования и границы<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#53-project_definitionmd' target='_blank'>Working State</a></div></div>"]:::memory
 W_ARCH["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>ARCHITECTURE.md</b><br/>Принятые решения и контракты<br/>Ответственность компонентов<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#54-architecturemd' target='_blank'>Working State</a></div></div>"]:::memory
 W_PLAN["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>STAGE_PLAN.md</b><br/>Карта этапов и их состояние<br/>Переходы и значимые итоги<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#52-stage_planmd' target='_blank'>Working State</a></div></div>"]:::memory
 W_OM["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>OPERATION_MEMORY.md</b><br/>Текущий вопрос и рабочие факты<br/>Замечания и точка продолжения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#51-operation_memorymd' target='_blank'>Working State</a></div></div>"]:::memory
 W_PD ~~~ W_PLAN
 W_ARCH ~~~ W_OM
 end
 W_BASE["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Проверенная база и кандидат</b><br/>Полностью прочитать текущую версию файла<br/>Проверенное зеркало /tmp и точечный diff<br/>Потерянный /tmp восстановить из Library<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#10-safe-library-mutation' target='_blank'>Working State</a></div></div>"]:::memory
 W_PUBLISH["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Безопасное обновление Library</b><br/>Повторно сверить актуальность базы<br/>Опубликовать и точно проверить новое<br/>Только затем убрать предыдущее<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#10-safe-library-mutation' target='_blank'>Working State</a></div></div>"]:::memory
 W_ORDER["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Если обновляются несколько файлов</b><br/>Сначала профильные владельцы<br/>OPERATION_MEMORY — последней<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#9-multi-file-state-changes' target='_blank'>Working State</a></div></div>"]:::memory
 W_TRANSFER["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Пакет переноса при смене чата</b><br/>Текущая позиция, ссылки и вопросы<br/>Доступ к сохранённым владельцам<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#12-recovery-and-new-chat-continuation' target='_blank'>Working State</a></div></div>"]:::memory
 W_RECOVER["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Новый чат · восстановление контекста</b><br/>Подтвердить пространство проекта<br/>OM, Stage Plan, Definition, Architecture<br/>Сверить новый ввод и свежие факты<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#12-recovery-and-new-chat-continuation' target='_blank'>Working State</a></div></div>"]:::memory
 W_RESUME["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Вернуться в рабочую точку</b><br/>Сверить намерение и текущую позицию<br/>Продолжить открытый вопрос, Review<br/>или перейти к следующему Stage<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#12-recovery-and-new-chat-continuation' target='_blank'>Working State</a></div></div>"]:::memory
 end
 subgraph W_EXTRA["ПО НЕОБХОДИМОСТИ · связанные инструменты"]
 direction LR
 W_HELPER["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>ChatGPT Helper</b><br/>Работа с веб-интерфейсом ChatGPT<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/chatgpt-helper' target='_blank'>Проект</a></div></div>"]:::infra
 W_HUB["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Reviewer Hub</b><br/>Отдельный рецензент<br/>с проектной памятью<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/reviewer-hub' target='_blank'>Проект</a></div></div>"]:::infra
 W_CHAT_SKILLS["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Chat Skills</b><br/>Внешняя библиотека процедур<br/>управляющего чата</div>"]:::infra
 end
 W_INTENT --> W_START
 W_START -->|"Да"| W_ZERO
 W_START -->|"Нет"| W_FRAME
 W_ZERO --> W_FRAME
 W_FRAME --> W_STEP
 W_STEP --> W_LOOP
 W_LOOP --> W_GATE
 W_GATE -->|"Нет: уточнить"| W_LOOP
 W_GATE -->|"Да"| W_MORE
 W_MORE -->|"Да: следующий<br/>Step"| W_STEP
 W_MORE -->|"Нет"| W_DG
 W_MATURITY -. "Сопровождает<br/>решения" .-> W_DG
 W_FOUNDATION -. "Частный рабочий<br/>Stage" .-> W_FRAME
 W_DG -->|"Вернуть вопрос"| W_STEP
 W_DG -->|"Нужен repo-аудит"| W_AUDIT
 W_DG -->|"Принять"| W_ACCEPT
 W_AUDIT --> W_SHAPE
 W_ACCEPT --> W_NEED
 W_NEED -->|"Да"| W_SHAPE
 W_NEED -->|"Нет"| W_CLOSED
 W_SHAPE -->|"TS-A"| W_TSA
 W_SHAPE -->|"TS-B"| W_BRIEF
 W_BRIEF --> W_TSB
 W_TSA --> W_PLACE
 W_TSB --> W_PLACE
 W_PLACE --> W_A
 W_A -. "Локальное<br/>выполнение:<br/>схема 2" .-> W_B
 W_B --> W_REVIEW
 W_REVIEW --> W_VERDICT
 W_VERDICT -->|"Результат Codex<br/>Audit"| W_DG
 W_VERDICT -->|"Меняется<br/>контракт"| W_DG
 W_VERDICT -->|"Дефект<br/>реализации"| W_FIX
 W_FIX --> W_SHAPE
 W_VERDICT -->|"Принять для<br/>завершения"| W_CLOSURE
 W_CLOSURE --> W_CHANGED
 W_CHANGED -->|"Нет: без staging<br/>и Commit"| W_CLOSED
 W_CHANGED -->|"Да"| W_FINAL
 W_FINAL --> W_FINAL_OK
 W_FINAL_OK -->|"Нужен Fix"| W_FIX
 W_FINAL_OK -->|"Принято"| W_COMMIT
 W_COMMIT --> W_CLOSED
 W_ZERO -. "Определение и<br/>план" .-> W_SYNC
 W_STAGE -. "Рабочее<br/>состояние" .-> W_SYNC
 W_REVIEW -. "Факты и<br/>замечания" .-> W_SYNC
 W_CLOSED -. "Итоги" .-> W_SYNC
 W_SYNC --> W_ORDER
 W_ORDER --> W_OWNERS
 W_OWNERS --> W_BASE
 W_BASE --> W_PUBLISH
 W_PUBLISH -. "Актуальное<br/>состояние для<br/>работы" .-> W_STAGE
 W_CLOSED -. "Если меняем чат" .-> W_TRANSFER
 W_OWNERS -->|"При<br/>восстановлении<br/>контекста"| W_RECOVER
 W_TRANSFER --> W_RECOVER
 W_RECOVER --> W_RESUME
 W_RESUME -. "Текущий Step" .-> W_STEP
 W_RESUME -. "Ожидающий Review" .-> W_REVIEW
 W_RESUME -. "Следующий Stage" .-> W_FRAME
 W_EXTRA -. "Поддержка<br/>выбранной<br/>операции" .-> W_STAGE
 classDef web fill:#182f4a,stroke:#75b2f0,color:#edf4ff;
 classDef memory fill:#16382e,stroke:#6ec7a0,color:#edf4ff;
 classDef transfer fill:#423218,stroke:#e6bb62,color:#edf4ff;
 classDef repo fill:#302447,stroke:#b6a0e5,color:#edf4ff;
 classDef review fill:#402730,stroke:#ed9bae,color:#edf4ff;
 classDef infra fill:#28323b,stroke:#99adbe,color:#edf4ff;
 classDef decision fill:#40351f,stroke:#e6bb62,color:#edf4ff;
 style W_ENTRY fill:#101820,stroke:#75b2f0,color:#edf4ff
 style W_STAGE fill:#101820,stroke:#75b2f0,color:#edf4ff
 style W_PREP fill:#101820,stroke:#e6bb62,color:#edf4ff
 style W_RETURN fill:#101820,stroke:#ed9bae,color:#edf4ff
 style W_MEMORY fill:#101820,stroke:#6ec7a0,color:#edf4ff
 style W_OWNERS fill:#101820,stroke:#6ec7a0,color:#edf4ff
 style W_EXTRA fill:#101820,stroke:#99adbe,color:#edf4ff
 linkStyle default stroke:#b7c2d0,stroke-width:1.8px;
```

[К началу файла](#presentation-top) · [Веб-схема](#web-v1-new) · [Локальная схема](#repo-v1-new)

<a id="repo-v1-new"></a>

### Локальный Codex · [Веб-редактор 2](https://mermaid.live/edit#pako:eNrdXFtvG0eW_isN-sEvbIkiqRuTeEFLlEcILQqinHh3tSCaZFFqqMkmupuWnRt0GcezmyCyJxlskBnLk1ns2wIjKVJMXQ3ML2j-hfkle86pqr6QLcpjh5IzD5bZ3VXVVeecOuc7l-pPYxWzymKZmKqqS42K2ajpy5mlhqIY2iOz5WQUZqzSpWmuZpSKodm2XsEbcJ_aKUrTYjaDllXWdFZmdMt2-P06s5ZZrrrM7IxS0wyb8dsNeN-8oVVYnTWcrKEvN_BHRpkrzOV4i1XGmrmGYz2ag6aFxqLZzCiO1aL-NbPhzGh13XiUUbKWrhlxxdYatmozS6_JBkX9E5ZRRsbo2jDXKiua5WT81xebWkVvLGeUVJLftLTGqnczPSHWpVWrdGNEtKrq2rKl1ee7769ZWrMJdz7Wq85KRkkmE_y-3SrfgUcri7pjsLuataw3xCQUxcFFTcirsuk4Zh26Qk9ihDdrZfE2NIKRlnEkZap0u1BY_PelmPtHd8f9wX0K__-f-9zdUf72UnFfueedDffEPXQP3HN3393tbMLvk87X7lnnK_dIcfc7j-HBgTIFRHi4FPsPGLqqW6zi6GaDv2mqlIXR36_qDxTbeWSwD26u0aqSiUTz4XsOe-ioGvIsY7Ca897aiu4w1QbKsUzDtOqa8Z75gFk4exWpktEaj9ZWmMVu3nq_fCvLJ9lZd9swoW2Y3Ll7yGe93tnqPIG5nsGjw_eHy9DcGr6V11qNyooyb5n1pqN0ttxjd9d9CUuBpbmHnU0Fh4B-fHWF-aKyqNmr1NX9ERa7DY2_Vjob-I5DeO0-vPAIroEKh-4pXlDb4GoDK7T05RUHJq4pKxarfXBzxXGadmZ4eFl3VlrloYpZH_5otfUAGjeG4aKuNapqBUSZWWqzVTb0ynDZMMvDdQ2ezy_kirm5xezibGFuqF69scbK6oMRtcHWbioOSAZzPrhZApm4ecv9AdgE09tTvXkCQbRb7w_DLMVf4Fwmk3FAau0aszjX7sDwxYGxbmRIcV8ABYFh7jFQnVOcvxTW43EMyA4iSGzZ5szkDJf9duP8ehfW2AZJ3VXctgJPf6J70EFKQWebxrttmo4NC21SO7_Vl52vSHBgiDP4e0pi0L46fnorv5FSQWnSWwxTQ72gWi2D2QG2lg3QLjdv8S7RrLRY0yQ2LmaLHw6MickhZbahO6A0_b0iGbdYVLMZ2Bq0U74ECv8WyAnbjX5vo0iewRbdxL3rbzLodDtDl9jzHHfWBgjGCXTEjQas2VVuWzqrUeuqWbGH0do8HHagiz18VcyCxZamgPi5hdJUYTp3vzS_UFgsTBXyyL8xlbTKsQrq1lluOiquxN2DVa9zJaO6L-HHAZDiSWdLpfn3MhdecQlnFwr3FnOluVxuOjf9Kejv_5aD4h7YB6oF9BrfSnhzD3WjAvK9Cyryd6QmYRP9y1Lscxi7yiq6DZrbH39hYLKTGlIsptlmAyW8qTlA6IYd3Pa77im3MSedZ-5PQNM2XhwIdbAb0tTh9fAR_kyqfR2W_zug_SbobUMrMwNoE9byoD626DFI6K57hDrkquRoSFuGJ_awvaobhj3cS4_h4oezeZSqXgGJIl5_ecllpzlTB8bTNCj1HWARWGMugntCv3JKW4D_mCrJ7POa7ACqW85XZMUm7iD4Cyqjs9U1Fmp30A3dMuyPhWgFsco6jdiFV7wtwK3IPtlxLh-4fbAxCMzhuycCNzj5arrBVADIptFCkEXG4ReQjunCx3PFRZCRuwOTjlE0-YgWifB7yEjaymCHhUIUdloKRtEB4nB9j7w5AbOBBkL5-_p3AWjaJVZSEHa4mvCYD-0YYBvWqLCqAjhYr2kVx6ZxFF8hXx3j-9oQreWsmBayz7Sq0Ntte2CAbryJvZgqzM3MLtwNmAqJp9pdEIpIQFbrJ7ykX2hIgIxRhqK4WJgfmNB4fDyjSdBGhTvbNGu-ec-E_iY0Tru6s-Erlx_g5hkIxwnpkk2FoMQZAY9dD0EGcGBQGOAVSJAwffiwz7lPJGzRN53_5KQ88NSdT9dD-Au-CTXd94DodYvYSEq1wT9AsFnVUZPY_5BQPdDZGnCfNaphb5IMDLoN-cTf17_Nj5KHFtLUCLRBAYNscQF8yTEhUItojNoZ2lzgS-YTA5O0fEJ6k-BpnHJP8gCYdyQZF_AjhcnizAdZPIHmx1LZ8Fu-FF0ZnAjgYU__D-cTJU7FSBSRT1yiNfIjgyP4CBH8mKQBmC4h3itUOu6ZT2zca3vompFp7qYuuuOwvzZo152iGEEbki64uF7Sj5TqesUyS00gdjT5Ry4jf3Jw5E-KEA9Rm7QVwSXchXxDBsT94jgQ8YO03C7p2JfSxRM-hxJlSJBXncchvQuPH18vt5LEpxLQ0NJIIUazLHkZy1KDY1mKWHYGxH7JzRGQtE1-0mEY0B4Hufe0s4WgvLMZVxZIcStS2b4UYJgg8AaZxv3rZUKqZDOjVgKrZOu2A2jtUTQXUpdxIT04LqSRC6D8OSQ4k1FGRTodBJU2iZYBHqx3Hgt_BFAHGMJ1CRO4z8F33hltrTb6Kbwf7crHoUjs1QOJaFalS_aKZgCNSo7FWMmslQC0tuCtF2yc9GUsGx0cyzgOAS0EW2GPjPU5Z9gh0fKkJ1IcDB90nvmY7pWwVefEplcIZtr-ONzeuH8lscA3RCo_AbpzD1llHmhzvVwcLVUZa74mC0cvY2FC-eKLL0gJCvQgr9PCnMnr0SjwmLufm8JUxPfuj2Bydtw_gun_A_z73v0DbTnUbwe-U08aCyFDv-zDwr18bnBh7DHp08JMTsANeCJDCeCUuD-HheZL2ryw8WFvey4uuf3cCwX9sOt5JYcIljGQ_SpkkbHPfD47V5QOMXrSnf8CCT0liTvyPJYD_C9gpilR0WOmrw4h-QFu7YGmG1qZwhhNU7UrZpNVVR4AecMoN_i2i7n7iwNj8ziw-XmQowiDjuHGKSoO7tO0uWt54KuQv3DMircVUhg84rFNzuIR92KPQ8EHzzslK7EhQ5kvekJVkpOCtVzRdOVJuOsJT1-SIJxT5-1fe0IDdQTugIHxWqpl0jg8uxnwPmiLBSIEPre_DeeSAm3iEpv9RPZko7MR5_JwjLoADQmPZ4hgdTBdFdDZCE5FigNU454IiJxQaOFrT4NgeG1LITQns1nB8a4woklqCvnPgKA4eR66NMwKoete9nv2MFIA6qxuWo9IBO4WpnMYxvrfsL7kpOlK_na2o1Ibuex0YS7_rwOToQWmVVWzYTxSSCSEylWG4VJicV9wvkeJCDtXMhtxLFWLB9AFwsAI3iu8BS0xHEpw09M1KHvc5nBpEsFvDKw86TwTWuXqg9taq6o7RJY-eQ2_0SWK4OOF2QGmMpAr3g4SOjfakd3qfKMEM3rh0ONBXCHp3PCMRJfp8DOiwUg0vfQbPswzqXzoVYEg2RYHniKG3pvz9gIiT3DK0GHbC4m4O9AJZkCPuP4IayipjwADbwn_BBt-9W6kWFOqV_WBIOYV5ljJk8Ud8ibB8Y-y-dnp7CDlqdeGU8TwjNJlKDqbXdFF35NXSHlQVlzGlANlE-Qddoen_9zLOa9vmyobzqjggYbCBGjQ-efJVxlM9-bBSyt8YHukoGFSeCz42vJl-HJKovuJsrSKQ2gO2At1zbRWkSVRKTKv6yVB7qnSzOx9NDgcAsLWUmb0h6ESBp4y4bBtC_DdIU9RhvJaUbmT32TnpgszMwM0RE1TqaxojWWmwN-qWau9HmIpazYDfjDSA6F0-ZnQP-skllyNCff5SKbtnJaNYdlWw7G0yiqrxsEvq9XisD7N4b9hUqyyGinucdS0-8Kp2o0HbN_1p1QoJVlClFKat0zHrJgGStz4CPdlOKVVQelemeMZzYtBTqgCayE3X1gYnE_TqyOwIEPCliiIO6M3EL7biGNeEdLcFFz7mTIlZxLIhpQEEsZyutEsvyvx7DOcCketuH82BGMPA-n-NQsXJ2X4urQNTlrFqWDsxFM4IidPDx_YVPgjLqPUTnCM1xCD2wOTgNsiqNItBu6-MsUJo0wRYYJlOaKci2Na5JOshTwkeXmGNzDbh6AnAGH3RREiDcOj0HGuRQMZ1jbFMcjSYKVXdJHl4T9JiWVP9IvECUNV4wr_KUtwA9GlXRz8gqDSBQGw4od9qn5GJkffWoz6lXH9KZj57bElXinQP1G9ld6oWZokfPbe9OziwAgfdJUudCZlvHlPqNhIk_0r9QVDtF7IfTSb-3iAUh6Ai9FAfVdEADlSRpTzDqHiNwDAIfIu5oqDk2Ru3B1mO3YwfOq5zfsiXRnOx1xjBrmL4IH59yF4aJWXEny6MFUcGMERiamtJjhJLFRq3xvf4PUWFwQtroncgdn3IXdoja-hPi5E27-M-gjDvuDxhsdchr0041EoavhuYd03A7Rho3jxyZJfgtKAqGglKtaFhmj9FKRbpGvAwcWyUttL25yRzJ-IWMx1Cnf3_PuQvnepl4s5QkGRhBVKJgRW_Ed8Q4Stq_-UMzEKxt69l1-cxSzun_AYmfst_HsKfzGP-xf499T9qwKu51Pw-XbgxlMJcnlZC2YzH_MsL53BodjmBcB2erY4n12c-s0gPeRQvhkLCM55YQfejAy5XnYCLVAf71erxntOIoVrUMMOdXSOcCfqyJM4DPUzF2vhOxxF-Hx-UPggXDAvD0f4yQMqmD0kkOlNDF73ru2WG1Ud-OxUVtQ6AJw33TsiQBwQ7_lCIY_S_Xt5JMFLv4EfxvNv27IaOLpQizDjyYVinR3cmRvNqmD7itOyWInAtRny7bGMtS1yk1TSEo7DEBr7uvfgXG-2GyRl0xP9qxIMHlgS4hG11CHHrBu9kkDbHGZ-2Um6wfEFIWEvP14Q5hIZYlFPTl4cVYUgSPN5InNMfgz_3WJHcIVvx4bpwbEBAWMvG767KF_X7lP2-m5RP7iwt6P-1OCojzMucZ80GHF83q1DuYU9Eynu3WD1Xm8NrEiGnfOCPEUgizORtFIDsekrZ0povW_HleyCAGbTC0JVieupBQ-hUZFUsTDoNGcPZKL6NApH0Rl9OmVPDBXZ564zX1F50v65BlmR2UZERQGCJ_4-DLhXYrTZaTuOJ_8DtvuAikJPpLj8KMpst8SxniNxooCC2F3xhnCi5F2DQFhFbRp69YKCm9eFQF4aNJ-bKw6wmBL3ukhES90ZyDAzy-6jFXhMPEIrUGVFlFb4USQWyvx8YTsa6ypYZYGJ-p8pBgIOgFeB5Yu1p396gTW-F8foql1955zLG_WW4ehqzay0bAoJqpzqb-t09riHs3MzC_hFELCrO1FFvlFnqVBz_Jb2K6Kddfxuhyih3-0G0XmuAafyswMT03kTZLG4wgxDGVYM-qJIwGBNWUxzWFx-GEH_BH7foyBU1jB8YOendA4DxzDP_bq-bpvG6z2u8HyGXbH0JtmpYLuhpj3SKxM-SS4LQdzNzmXv5KYHeF4UNiZ3v2R2yS90EZ8M8dXI__jaAk2TVCN7Qgjb4oMk1FjsJOA5t-Pww8sJ-TqBvxomb1pMjThWe62Mu5GfTI-q-cmJybdh4Z172YWBMvAVJZjPeQjUC0XcaWlW4Lswvyffp-dsMJr2KJ76wiDPpRFkX6dKnTbXK_SJjq4TaiHBEfkFUa6AOXLdwX3bbNkrv-ZtKRFiVlHVW963fwKfARL38WMy3ldlxL3gZ0h6vkuCbT4jXQ-K-jPvoyIXtkMAsMlb-h8kCHyNRL7T-5RF6NmQ0huXEYB_KaYM-dMtdn0QQwzb9Ur_UjwXJ-iDp-nlxF-EIOoBl0WxZDyAEt3nkFdbUqRzk35DLy5ioSPTPbTrGqnrjDtvjsfyvfP5YgWBIzGCXC-ojPJUWBvaK6KOure8QJCQFycER5LUwTMYPW_4LvKcCi-YiziP4r1GFvqHqv75mPOWuWwxG6P33jh-4bw3AlUIB8-HiJli_bhXSC5pyPd09Iw-C9SM93QMfmcGIwTy4F440Y7T-iw0JzmgJ9NeuJ3aiNuyMDVUpSqezczel9WJgY2W6fnEgc_QQwwio0vTPZnAEIE9KKoTu95NXO3-rEJng7-l--sK5-6pLzhSIsW4YaGk9YdueVyjN_rFl-TuheLU_N2BpJn3TpkkiFrD81DsOjJaexSoV4oeU16ImWN4mO7jD39nSMe72xGXu9D7mElwEVhHcCAdjogTHd6EPIHuO3KkF9RVg4x6WgwqpYs7fWK4nd4PNwhfxupDI0Djcutx-OfjCKm1o625v8JAP_HbXyBM3U_MnIho9a6YF53Tpdo0bzDPvNHXJ6fB-1tjZaUGDlLmxshEspbW4rZjmassc2N8tJysJeIV0zCtzA1WraVrtfeCPfmxFNl5LDWRZF7nMVYZ1_p1ltVgons6mUqOTHjd2Vi5PJbs0x3jP6JrKpFMp8e9ruUxLcFG-3alc-DivYnkeCrhv7c6WdZYn84EG0Tf5EQqmSp7fScntWq5X19Z_ey9OjU6Urt0yQSpxLcqJa0TwKpE3xUHOnKz_0Zd0fS8UUdRxBfZNYpOga6UQ43uGcWdQE9SO28yW_LL_6HJAlpdLVLvKqtpLcNRvFeNV5JV2V8Vqf2hCfANYvHYsqVXYxn8_Go8VmfgDuBl7FP8culSzFlhdbYUy8BPi1VbD9WqZq2q9Oal2FLjc-jf1Br_Zpp1OYSF55VjGfoebDzGyz2m-XdVvSaAb5k1ZbYaTiyTgm2CY8Qyn8YexjLq-Pj40Gh6NDUxOTY5lkqkR-OxR7HMyHh6KDkxOpken0iOJdOJ8fTn8dgn9Fp4kEgmRlLQPp0cSU3AcIwi63f5d2_p87ef_z-41Gi8)

```mermaid
---
config:
  layout: elk
  look: classic
  elk:
    preset: depthFirst
    mergeEdges: false
    nodePlacementAlignment: NONE
    keepEntryNodeOnTop: true
  fontFamily: Arial, sans-serif
  fontSize: 16
  flowchart:
    nodeSpacing: 32
    rankSpacing: 48
    padding: 12
    diagramPadding: 12
    wrappingWidth: 220
    subGraphTitleMargin:
      top: 8
      bottom: 20
---
flowchart TB
 subgraph C_BOOT["ЛОКАЛЬНО · последовательный вход Codex"]
 direction TB
 C_A["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>A · принятое поручение</b><br/>Launch Prompt указывает точный OPS Task<br/>Связь с первой схемой<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#web-v1-new' target='_top'>К веб-схеме</a></div></div>"]:::transfer
 C_AGENTS["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>1. Проектный AGENTS.md</b><br/>Состояние проекта, правила и ограничения<br/>Bootstrap и границы полномочий<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/AGENTS.md#3-context-loading-rules' target='_blank'>AGENTS</a></div></div>"]:::repo
 C_TASK["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>2. Initial OPS Task</b><br/>TS-A: спецификация внутри Task<br/>TS-B: Task со ссылкой на Brief<br/>docs/codex/tasks/<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#6-как-chatgpt-собирает-задачу-codex' target='_blank'>OPS</a></div></div>"]:::repo
 C_ROUTE_NEEDED{"Задача вызывает<br/>выбор маршрута?"}:::decision
 C_ROUTER["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>3. reasoning-patterns</b><br/>Самый лёгкий достаточный маршрут<br/>Разрешить label в точный путь файла<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/reasoning-patterns/SKILL.md' target='_blank'>reasoning-patterns</a></div></div>"]:::repo
 C_READ_ROUTE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>4. Один выбранный route-файл</b><br/>Прочитать тактику выбранного маршрута<br/>Предварительный выбор проверить дальше<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/reasoning-patterns/SKILL.md#route-file-resolution-rule' target='_blank'>reasoning-patterns</a></div></div>"]:::repo
 C_DOWNSTREAM["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>5. Подробности задания</b><br/>Stage Brief для TS-B — после route-файла<br/>Остальные referenced artifacts по задаче<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#authoring-order-и-loading-order' target='_blank'>OPS</a></div></div>"]:::repo
 C_CONFIRM{"Задание и правила<br/>согласованы?"}:::decision
 C_STOP["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Остановиться и вернуть вопрос</b><br/>Конфликт контракта, границ задачи или правил<br/>Недостающие данные и препятствия<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#13-stop-conditions' target='_blank'>OPS</a></div></div>"]:::review
 end
 subgraph C_ROUTES["L0–L5 · маршруты организации работы"]
 direction TB
 C_L0["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L0 · прямое действие</b><br/>Простая локальная задача<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L0_direct.md' target='_blank'>L0</a></div></div>"]:::repo
 C_L1["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L1 · короткий план</b><br/>Небольшая задача с ясными шагами<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L1_micro_plan.md' target='_blank'>L1</a></div></div>"]:::repo
 C_L2["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L2 · план и итерации</b><br/>Последовательная реализация<br/>в согласованных границах<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L2_plan_iterations.md' target='_blank'>L2</a></div></div>"]:::repo
 C_L3["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L3 · независимые проверки</b><br/>Аудит, Review и разбор рисков<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L3_self_consistency.md' target='_blank'>L3</a></div></div>"]:::repo
 C_L4["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L4 · сравнение вариантов</b><br/>Архитектурные альтернативы<br/>и их последствия<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L4_shallow_tree_of_thoughts.md' target='_blank'>L4</a></div></div>"]:::repo
 C_L5["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L5 · глубокое ветвление</b><br/>Разрешённые прототипы и ветви<br/>Явное согласование и ExecPlan<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L5_deep_tree_of_thoughts.md' target='_blank'>L5</a></div></div>"]:::repo
 C_L0 ~~~ C_L3
 C_L1 ~~~ C_L4
 C_L2 ~~~ C_L5
 end
 subgraph C_EXEC["ИСПОЛНЕНИЕ · родительский Codex"]
 direction TB
 C_RULES["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>6. Подключить нужные процедуры</b><br/>Skills по характеру операции<br/>PLANS для объёмной или длительной реализации<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/AGENTS.md#available-repo-scoped-skills' target='_blank'>AGENTS</a></div></div>"]:::repo
 C_CONTEXT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>7. Нужные документы и код</b><br/>Только относящийся к задаче контекст<br/>Проверить реальное состояние репозитория<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/AGENTS.md#3-context-loading-rules' target='_blank'>AGENTS</a></div></div>"]:::repo
 C_EXECPLAN["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>ExecPlan · ход большой задачи</b><br/>Границы задачи, прогресс, открытия и решения<br/>docs/codex/plans/<br/>Обновлять по ходу исполнения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/PLANS.md#execplan-file-location' target='_blank'>ExecPlan</a></div></div>"]:::memory
 C_MODE{"Характер<br/>поручения"}:::decision
 C_READONLY["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Read-only анализ / аудит</b><br/>Исследовать факты и риски<br/>Запись — только запрошенный отчёт<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/audit-only/SKILL.md' target='_blank'>audit-only</a></div></div>"]:::repo
 C_WRITE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Исполнить согласованную задачу</b><br/>Код, тесты и документация по заданию<br/>Большую работу вести ограниченными частями<br/>Отмечать прогресс и результаты<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#63-принцип-сборки' target='_blank'>OPS</a></div></div>"]:::repo
 C_VALIDATE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Проверить кандидат</b><br/>Проверки из Task и проектных правил<br/>Результаты и причины пропусков<br/>Самопроверка и нужный code review<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/review-code/SKILL.md#4-mandatory-workflow' target='_blank'>review-code</a></div></div>"]:::review
 C_FIX{"Нужен Fix внутри<br/>текущего задания?"}:::decision
 C_HANDOFF["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Repo change handoff</b><br/>Границы задачи, baseline и точный набор изменений<br/>Status с untracked, diff, stat, diff check<br/>Проверки, сводка, риски и препятствия<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#71-repo-change-handoff' target='_blank'>Stage Plan</a></div></div>"]:::transfer
 C_REPORT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Результат read-only задачи</b><br/>Findings / подтверждения и нужный report<br/>docs/codex/reports/<br/>Без искусственного write-handoff<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/report-writing/SKILL.md#file-report-vs-chat-report' target='_blank'>report-writing</a></div></div>"]:::transfer
 C_B["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>B · результат в Command Center</b><br/>Специалист передаёт артефакты в веб<br/>Review, Fix или приёмка на первой схеме<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#web-v1-new' target='_top'>К веб-схеме</a></div></div>"]:::transfer
 end
 subgraph C_SKILLS["7 SKILLS · подключаемые процедуры"]
 direction TB
 C_SK_ROUTE["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>reasoning-patterns</b><br/>Маршрут и точный файл<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/reasoning-patterns/SKILL.md' target='_blank'>reasoning-patterns</a></div></div>"]:::infra
 C_SK_AUDIT["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>audit-only</b><br/>Исследование без изменений<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/audit-only/SKILL.md' target='_blank'>audit-only</a></div></div>"]:::infra
 C_SK_REVIEW["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>review-code</b><br/>Проверка кода и diff<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/review-code/SKILL.md' target='_blank'>review-code</a></div></div>"]:::infra
 C_SK_TEST["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>write-tests</b><br/>Тесты в разрешённых границах<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/write-tests/SKILL.md' target='_blank'>write-tests</a></div></div>"]:::infra
 C_SK_DOCS["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>docs-update</b><br/>Согласованная документация<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/docs-update/SKILL.md' target='_blank'>docs-update</a></div></div>"]:::infra
 C_SK_REPORT["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>report-writing</b><br/>Сохранённый анализ<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/report-writing/SKILL.md' target='_blank'>report-writing</a></div></div>"]:::infra
 C_SK_AGENTS["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>subagent-routing</b><br/>Агенты, briefs и консолидация<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md' target='_blank'>subagent-routing</a></div></div>"]:::infra
 C_SK_ROUTE ~~~ C_SK_DOCS
 C_SK_AUDIT ~~~ C_SK_REPORT
 C_SK_REVIEW ~~~ C_SK_AGENTS
 end
 subgraph C_MULTI["МНОГОАГЕНТНАЯ РАБОТА · по необходимости"]
 direction TB
 C_DISPATCH["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Родитель готовит ограниченное поручение</b><br/>Один вопрос, границы задачи и нужный контекст<br/>Ограничения и ожидаемый результат<br/>Отдельный путь отчёта, если нужен<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md#dispatch-mode' target='_blank'>subagent-routing</a></div></div>"]:::repo
 subgraph C_POOL["Выбрать подходящие независимые роли"]
 direction TB
 C_AR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>architecture_auditor</b><br/>Слои, ответственность и границы<br/>Только чтение<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/architecture_auditor.toml' target='_blank'>Роль</a></div></div>"]:::repo
 C_TR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>test_auditor</b><br/>Покрытие и безопасность тестов<br/>Только чтение<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/test_auditor.toml' target='_blank'>Роль</a></div></div>"]:::repo
 C_DR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>docs_auditor</b><br/>Документация и реализация<br/>Только чтение<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/docs_auditor.toml' target='_blank'>Роль</a></div></div>"]:::repo
 C_CR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>code_reviewer</b><br/>Независимое направление проверки<br/>Ровно один review-report<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/code_reviewer.toml' target='_blank'>Роль</a></div></div>"]:::repo
 C_AR ~~~ C_DR
 C_TR ~~~ C_CR
 end
 C_CONSOLIDATE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Родитель объединяет замечания</b><br/>Проверить подтверждения и противоречия<br/>Сохранить IDs, убрать дубли<br/>Следующий шаг в границах задачи<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md#consolidation' target='_blank'>subagent-routing</a></div></div>"]:::review
 C_LENSES["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Несколько code reviewers</b><br/>Независимые направления проверки<br/>Свой brief и путь отчёта у каждого<br/>Объединение результатов у родителя<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md#multi-focus-code-review' target='_blank'>subagent-routing</a></div></div>"]:::infra
 end
 subgraph C_INFRA["ДОПОЛНЕНИЕ · локальная инфраструктура"]
 direction LR
 C_CLI["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>PowerShell / launcher</b><br/>Create, Initialize, UpdateAll<br/>Подключение и обновление проектов<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/scripts/command-center.ps1' target='_blank'>PowerShell</a></div></div>"]:::infra
 C_MANAGED["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Общие файлы проекта</b><br/>Управляемые блоки AGENTS<br/>.agents / .codex / reasoning<br/>Общие ignore-правила<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/scripts/command-center.ps1#L945-L989' target='_blank'>PowerShell</a></div></div>"]:::infra
 C_GUARD["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Опциональный Guard</b><br/>Восстановить управляемые файлы<br/>в зарегистрированных проектах<br/>Без Commit и push<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/scripts/command-center.ps1' target='_blank'>PowerShell</a></div></div>"]:::infra
 end
 C_A --> C_AGENTS
 C_AGENTS --> C_TASK
 C_TASK --> C_ROUTE_NEEDED
 C_ROUTE_NEEDED -->|"Да"| C_ROUTER
 C_ROUTE_NEEDED -->|"Нет"| C_DOWNSTREAM
 C_ROUTER --> C_READ_ROUTE
 C_ROUTER -. "Выбрать один" .-> C_ROUTES
 C_READ_ROUTE --> C_DOWNSTREAM
 C_DOWNSTREAM --> C_CONFIRM
 C_CONFIRM -->|"Подтвердить"| C_RULES
 C_CONFIRM -->|"Пересмотреть<br/>маршрут"| C_ROUTER
 C_CONFIRM -->|"Конфликт"| C_STOP
 C_STOP --> C_B
 C_RULES -. "Применимые<br/>процедуры" .-> C_SKILLS
 C_RULES --> C_CONTEXT
 C_RULES -. "Для объёмной<br/>реализации" .-> C_EXECPLAN
 C_EXECPLAN -. "Progress и<br/>решения" .-> C_WRITE
 C_CONTEXT --> C_MODE
 C_MODE -->|"Без реализации"| C_READONLY
 C_MODE -->|"Разрешены<br/>изменения"| C_WRITE
 C_READONLY --> C_REPORT
 C_WRITE --> C_VALIDATE
 C_VALIDATE --> C_FIX
 C_FIX -->|"Да: контракт<br/>прежний"| C_WRITE
 C_FIX -->|"Нет"| C_HANDOFF
 C_VALIDATE -. "Конфликт с<br/>контрактом" .-> C_STOP
 C_HANDOFF --> C_B
 C_REPORT --> C_B
 C_CONTEXT -. "Нужен отдельный<br/>анализ" .-> C_DISPATCH
 C_VALIDATE -. "Нужен<br/>независимый<br/>Review" .-> C_DISPATCH
 C_DISPATCH --> C_POOL
 C_POOL --> C_CONSOLIDATE
 C_CONSOLIDATE -. "После анализа до<br/>исполнения" .-> C_MODE
 C_CONSOLIDATE -. "После проверки<br/>кандидата" .-> C_FIX
 C_LENSES -. "Организация<br/>review" .-> C_DISPATCH
 C_CLI --> C_MANAGED
 C_GUARD -. "Восстановить" .-> C_MANAGED
 C_MANAGED -. "Подготовленная<br/>среда" .-> C_AGENTS
 classDef web fill:#182f4a,stroke:#75b2f0,color:#edf4ff;
 classDef memory fill:#16382e,stroke:#6ec7a0,color:#edf4ff;
 classDef transfer fill:#423218,stroke:#e6bb62,color:#edf4ff;
 classDef repo fill:#302447,stroke:#b6a0e5,color:#edf4ff;
 classDef review fill:#402730,stroke:#ed9bae,color:#edf4ff;
 classDef infra fill:#28323b,stroke:#99adbe,color:#edf4ff;
 classDef decision fill:#40351f,stroke:#e6bb62,color:#edf4ff;
 style C_BOOT fill:#101820,stroke:#b6a0e5,color:#edf4ff
 style C_ROUTES fill:#101820,stroke:#b6a0e5,color:#edf4ff
 style C_EXEC fill:#101820,stroke:#b6a0e5,color:#edf4ff
 style C_SKILLS fill:#101820,stroke:#99adbe,color:#edf4ff
 style C_MULTI fill:#101820,stroke:#ed9bae,color:#edf4ff
 style C_POOL fill:#101820,stroke:#b6a0e5,color:#edf4ff
 style C_INFRA fill:#101820,stroke:#99adbe,color:#edf4ff
 linkStyle default stroke:#b7c2d0,stroke-width:1.8px;
```

[К началу файла](#presentation-top) · [Веб-схема](#web-v1-new) · [Локальная схема](#repo-v1-new)

</details>

## Как читать процесс

Stage 0 помогает сформировать замысел и верхнеуровневый план. При входе в рабочий Stage уточняются его вопросы; каждый Step проходит обсуждение и собственную контрольную точку. Decision gate сводит решения закрытых Step, проверяет их совместимость и выбирает дальнейший путь. Для нового проекта подготовка каркаса репозитория относится к Stage 1 и проходит тот же процесс постановки и проверки.

Library сопровождает работу на всём пути. Сохранённые решения и состояние используются при продолжении; новый чат сверяет их с текущим вводом и свежими фактами. Актуальность кода при необходимости проверяется отдельным repo-аудитом.

L0–L5 определяют организацию работы: прямое действие, план, итерации, независимые проверки или сравнение вариантов. Skills задают процедуры конкретных операций. Дополнительные агенты получают ограниченные вопросы и возвращают результаты родительскому Codex.

Создание задания и загрузка контекста имеют разный порядок: **веб создаёт Brief перед Task для TS-B; Codex читает Task, при необходимости выбирает и читает маршрут, затем загружает Brief**. После чтения подробностей маршрут подтверждается, пересматривается либо работа останавливается при конфликте.

Локальная схема показывает управляемый OPS-путь; прямые локальные обращения следуют применимым проектным правилам.

<a id="artifacts"></a>

## Что передаётся и где сохраняется

| Артефакт | Место | Назначение |
|---|---|---|
| Определение проекта, архитектура, план Stages и оперативная память | ChatGPT Library, отдельное пространство проекта | Принятые основания и точка продолжения управляющего веб-чата |
| OPS Task | `docs/codex/tasks/` | Управляющее поручение, scope, ограничения и ожидаемый результат |
| Stage Brief для TS-B | `docs/codex/stage_briefs/` | Подробный принятый контракт, на который ссылается Task |
| ExecPlan | `docs/codex/plans/`, когда требуется сохранённый план | Ход длительной локальной работы, progress, открытия и решения |
| Audit / Review report | `docs/codex/reports/`, когда требуется сохранённый отчёт | Findings и основания для рассмотрения результата |
| Delta / финальный staged diff | `docs/codex/diff/` | Точный кандидат для соответствующего Review до Commit |
| Принятые изменения продукта | Код и постоянная документация репозитория; затем Git-история | Проверенная реализация и её зафиксированный состав |

Для write-задачи handoff связывает **scope, baseline, фактический diff и выполненные проверки**. После Fix передаётся новый применимый кандидат. Финальный staged handoff формируется после всех согласованных closure-изменений; специалист принимает именно это состояние перед Commit.

Для read-only задачи возвращаются результаты исследования и evidence. Исход замечания может быть исправлением, согласованным переносом, принятым риском или отклонением с основанием.

<a id="sources"></a>

## Исходные протоколы

<details>
<summary>Правила и ответственность файлов</summary>

| Источник | Ответственность |
|---|---|
| [Роль Command Center](Command_Center_Role.md) | Позиция управляющего инженерного чата |
| [Stage Plan Protocol](Stage_Plan_Protocol.md) | Stage / Step / Gate, Review / Fix и завершение |
| [OPS Protocol](OPS_CENTER_CODEX_PROTOCOL.md) | Создание задания, передача и анализ результата |
| [Working State Protocol](Command_Center_Working_State_Protocol.md) | Владельцы Library, обновление и восстановление |
| [Architecture Map](Architecture_Map.md) | Размещение артефактов и границы ответственности |
| [Architecture Reasoning Guide](Architecture_Reasoning_Guide.md) | Области архитектурного анализа |
| [AGENTS.md](AGENTS.md) | Шаблон проектного входа и обязательных локальных правил |

</details>

[README](README.md) · [Блочная компоновка](#version-v2) · [Прямые связи](#version-v1-new) · [Артефакты](#artifacts) · [Протоколы](#sources) · [К началу файла](#presentation-top)
