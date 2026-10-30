<a id="presentation-top"></a>

<div align="center">

# 🧠 Command Center — полный процесс

**Как специалист, управляющий веб-чат и локальный Codex ведут проект от вопроса до принятого результата.**

[README](README.md) · [Блочная компоновка](#version-v2) · [Прямые связи](#version-v1-new) · [Артефакты](#artifacts) · [Протоколы](#sources)

</div>

Специалист и ChatGPT прорабатывают задачу в веб-чате. Codex выполняет ограниченные поручения в репозитории. Между этими средами передаются задания, проверяемые изменения и результаты проверок; решения и точка продолжения остаются в файловой памяти управляющего чата.

Два варианта показывают один процесс. В каждом варианте веб-схема и локальная схема продолжают друг друга через **A — задание в репозиторий** и **B — результат обратно в веб**. Ссылки внутри карточек открывают соответствующий источник.

- **Синий** — обсуждение и решения.
- **Жёлтый** — передача задания.
- **Зелёный** — Library.
- **Фиолетовый** — действия в репозитории.
- **Розовый** — Review и исправления.
- **Серый** — вспомогательные механизмы.

<a id="versions"></a>

## Варианты схем

По умолчанию раскрыта схема с блочной компоновкой. Её можно свернуть и открыть схему с прямыми связями между группами.

<a id="version-v2"></a>

<details open>
<summary><strong>Схема — блочная компоновка</strong></summary>

**X1–X11** — панели веб-процесса; **R1–R10** — панели локального Codex. Метки в пунктирных карточках указывают панель и целевой блок. **L0–L5** остаются маршрутами работы Codex.

<a id="web-process"></a>

<a id="web-v2"></a>

### Веб-процесс и Library · [Веб-редактор 1](https://mermaid.live/edit#pako:eNrlXVtz28aS_iso5sEvgiWSujKJUxRF29ojiSqSjpWz2lKBJChxTREsELStOEnpEjs5Za8V-8SVbPbEcZKzm32UFcmmZVmu2l8A_oX8ku3umQEGF1KyLMaK8yARBDCDxnRP99eXGd6IFI2SHklEVFWdrxWNWrmymJivKUpVWzGaVkIpaYumTicM40pCKVa1RqNSxBNlo2ad15Yr1ZWEkjQrWrVPaWi1htrQzUpZ3JCrfKwnlOgwfa8a14pLmmnRAxSlBk_O1bVipbYIt8TYSVOrXQmcrGulEp0YZt9LFaBKW571nb5mavU6nLhcKVlLCSU2PMDOF5vmVaCiWqnpmslONZqFC3D3Ur5iVfVpzVys1DhVimIZ9YQyJL4VDMsylhPK6HyNxsh5CyU_DvdAR4vYkTIX_df5yFxU-b-nin3ffmDfo6MX9pa9b--2V-1dOG7Zu4rdUtpr7XV7q73aXp-P_Bv0UaqYetGqGDVlKgtfLy9MzuTTM3no771S5arSsFaq-vtnrtFbxQYG6tfftfTrlqpVK4u1RFUvW-9eW6pYutqAcdMTNcNc1qrvGld1E2lVcVQSWm3l2pJu6mfOvVc4B_QhRa3250DRHlByC443A8S2N9_rL8D9Zv-531Z_Uuz_gdPP23f6FGi3Ze-119u3-xR7xz6wX7Y32n8TjfAN7V-hky36fqt92-3iZ3jxg_YXcMG5-SV_4A49H65t2c-hy338emBvw98zBVrt2vu8I3lMpHEwK4tLFryepiyZevn9M0uWVW8k-vsXK9ZSs3C2aCz3f3ileRVurvXDl2WtVlKLes3STbXeLFQrxf5C1Sj0L2twPWdpi_rCbFWrLcyahmUUjerZ5dI78ZgKBIUMnRocujOKBVKlW--fWShAP1fOnKNOFez0vX7t3Hv98Br8P0hBIpG4pheI-bl8Mpu_MR-xv29v2E9wFFBgPodxW4VHtOA_DssWDP8dGg8ggfhC477H5Kq9obT_A4UMhhfu_mA-8ik8oaQXKw0QM3rMX9PZTM8kjL3rAE6B9hpQ8BjFASlW7Kc4Uu3bcBqo9grYtyBMu-1NELBbQtS8gkSTB0d_DV605TZ8CBJIMoTN3Jn2ksZqF0XV3pKHB77Jw_OmxUpt4AV1QLVbqqsbVHrzx8B3mGjHF6fzmUszE8n8ZGamx9xmqm8H-Lbpzt1fQXq9fPCy_Adkp_2ivYkvCTOdcYj-rynEU-TQU2D5Ok0AoV_kLl9Qy-QFUJk5t-cfqd0OEx6QBtAsbHoCkSiQt1ENgd66q2RmcyqJ5Q7qn_bGmxYHIQ9RVTX1uqGWjWatpKF9eHUpqNTKpgZyMBddyGcWQBqyyel0qCBEh15fEOZiKAOMprmzbPqvkmbck6cckwGJSsAdVqXWpHeUiM19NJPqHa2jJK8gJu2bjo7hGooZohbQfYCSAxqMpuVBe5MJ0yH0CwOuqOo5odBd1Y5nPwH1_rW9NR_5hGvi4OXvQVzX8QYP6xzVTX0HL7mzXVHPKtDNLziTnEniqBR8u2eMU_MR5WxoX-wx1EsHBYsTEb7D2Pk6Qc5BH3qthBAJWQeXlHKlWk28Ex2IjsYG-hqWaVzRE--MDBVi5YE-EH7DTLyjl8qD5bIHV8UQV5Fg2Y_sr-x7QMwvYCr-U4HhupD2yRgzEFvAQ3zLVYYc9jg8IWW0TXhlFVmKDAjFX51nycmpy0Pnh6PJ7gPrXAPKWhOKdMAIiW0AaoYgt6A5lccDzkg0vFktOKh6ZVVFQwBmcZMA597rwKv0bA9Zq9dJUg-ATLBrsvzhhJNH22cIXRiM1mmNsN-OYCXA4Vdg932yoS1kNAfpBxLjv_AAdZwGzFhvccz_Z8DYU5lMb4VABXeZJAFY73F5uPFwePWIlJUHISMIXic3qOViHTjTQunBt8cZwRnlgKgDmhfPQWicXg4Y2N6DWXMbmyPHPdrvbZ3iF5L5NDhQFzRL5yxYI59y25kmgYGhiWtvg6Z9ScPIuHUQdJzmYszCTWeyPcRRcVIiD5kzgIIAR3cCutpv22h8PjgMXPEXSM_ls8nevUE0yuHVNvDzKSkXhCAIGuAA3gsGfwOnM9NRRySaTH4P4etvq3_nY_8oCJQORX0EGxzQl5517A0_h1rHUT_8HMqqI7Qe7JeQdQcpfQYXnV7kFhxMytLp5zWHcj-QqtghPfqEYaZtATCQSRRwQTmjO0j52i0B72Q2-PFd7Jj4Lo74Lt4N3zECGZ5bI_y5g46bi-nQTj6jybKNs7kDqsNBwbhK92nFYirhUyskjDJxAbqc4GeURVA5TMF8hwqGuQ-osb_0RiWEy3snrMvpZP5SdjL_Ue_if9-QDX3O3BocAQw43CQnm1xqePFVkgR8dZl-f0jwRwpW4P0wcgllpj-p9Cvp65UGTIxFOqwD29kxqP660dBLcJhsNPQGP6zXTSC15HHcvd6WjwKFIiJMDp6QUdzC6QJt0L6RVhQYB9qymftmDd1wXNXMIrKoaDWBB8f34uNi_nXAsCfpxL8iku2ivDnVyUsTk_nekT1I5ILqJDRFRodoBseHe78po6RfV5LNUsU6KsmpVHq25zSHBMEOyCyusjj7oYYHNZtkCRJ-NclMmF4nEyHJUKCxE3RAxeZRRtx6_Ci4Tvx_QvE1aOKbotxcOJ1MXBAPYJkHjLut-zRvKG1uQxYMh_4ViokBbzdQMHmIRJYwX0N5cO94bibe-q1Y_JhWbBCtGGen_QAs2QPgxFdgyb5yguC_YqiEjrYFSGeAd8PVVx1MVxc5PBGDcCQJ9IRWgy8DX1hc_3kwzuBEV5lLw-KwwEGYm8yCuJ1_A1_J8YOePMkON9W0Rs7QvoCTTxmMdCzU76TsM7O5hVR6Jp_OLqQyE-m5hdlsJp9JZaZI5asIrew9tbikWYt1S2VpEHojmjGeiLOKSdjrQbsAjwg3CJap1Rpl3SThmEmnJ-R80ZYb5lvnTh5pvjCs0Vknn4hcvYo2drM5cOOOuBWabcryA3D1MQviBxgvsgKg9Xiqwechy_GTsNyC_ewwySWfPCwD9QN51KBzlax-taJfU_jDuKYT4CQIFN8i99sjlLmLyVlE23mtcUXJLWl1XckaTaCP3jqfU5NiOOF4PMTPHmRaOjWVyaUnemeBR9yMhRwUOAwfcOryuR660ENIGo0UsyAY_XKgsW8y4TAfkebx7GT6fO-pHudUu0n9LT7O42ZFLx-KaUgzCWcahUkyhPw0Kj5HAwbSKm4j-bKbVvEImCuz_EYcd_k24HTYPePyPTSyfkAxGA4o9OFCYTjWBVAMIaAY6gQoSHXtoH-G4kBuL2k1rMx4BnLhai6ByEJxRSf5PQnl_6qSK-tSisBtsfKQA-6usyg1C1hwvQqKGLO3rA-n_d87avCukfCXko0Quv2Nw4i46sQLMBDzEnEERUKQxOMChs4a4IT4fpS572H3Do39Yy4SnhBJKBwVjUtGsdFP4KmfcuYLBey_0X8qmKc1rSUKfqiGWYLWdkutGlrJOXFc9uVz4z0MDXGctq_QUKoFrXhFL7mzzMO6n4lTWzBpngOvWEBu16N5KH2uOGFMKuZaw2ARyAQy9VkYKy140FvOw9mpZKp3GWaeVcJkGflKzH3y6Ti_xQjLS2EPf3NDl6x4alfU_2FXcl3NrHFNN3NLerXaAczTZD5fuQ4CNaU1a8UlDAou1y1ZRuCefYXcvPX2PTj06Pc3ro8H1TKSr1aJfLVO5B9XCHpne8nw-uYh8irU6QmoYxE9Er63h332dvsmamzmv3VKQjoi84IlGNjD-PS_ifqFZ-J-B47OZtM5YChVxSATKYB0NSZxzTLqZ87Z3ymUJUS_nbmePnJDGYqdIbge4hCwd8B6GHk6zmtGfOETzozDMDUZfg6ewYoICMjPkE4SFiZwjo74WQaFRUbpv3yDthtMpIIoJNyh3FJiIqEkhs2PmoeOiZqHETUP8yLsh2DN7lNS6Sc8IzxzdORBxB3T5UYtQzFy74zt4cykVNK3wUCHV5WDy07l0SCuSzARjHIZJbmFQJElS75o34NuWbkWgq11bgKcChPsk1VumrpWUo1adUWVgfPbNFUvL2TTH06mL_eMrULO0DV7Qdq05epQUZXheGYe7UvRkn6GkilQKiwtOSss6MSrZKE1JmZ2PNHTiUq53CfxvC_g1nQqof6ZdfqENPivgsp9yqVxShWQs21hBVo02iBMbziKNRJTTRpvMMw1xGUNtVRp1I1G5XgFs6wzEpMP09mJyRSV4j_ypHBRecCJW1RixbLIItqIEyxkSrc3uPYJCcGen5zrHRB8GHB3HRDmq72XNKIUIaX3o-AtFmHd5SCCVyy2byq8LvQJKScSG5-rJkdhv0dBdMq8ZQF2dJNACoxKNmZvq4TNDTPjN3Ghx4VEnqizcuTShMPiiZx8ioj1OEUaiCIrgQjyEanFcN-lXpZujfCQXVh4jnQqM9lfesoBjzDKf9haeAElmdWVDDA_z9WsrHJFsPZRODRiSSOKvDpTKKz5P6i6bNOtDvHppsN7-JqcXaqJCdGHWBf1CdPgQpOzsnx5ZoR168lJO2tmAsKBkPQTv-R6BpDw9z_FajzSogGzLaD2cOfS_OEOaLs0VtD0Lmh7BNE2E_hvAGXfpzj1_8L_7wG0PmBxagIb96TyfJHcFcsOg9ayY11-t8l7MnnwV5u2UpTjFmcZL2tAVLDp8YEpqeaWPLoWtRW6dMmTX3eLJylISicdt6XPKd8C48xKur_gmGSvew6UBQHwdakQI2x2d1iD9aZN8rAaxhO2buo4Fpk7BqmLyZkLLJn-QJTGhdcXhA_LB6HwbiY51TuJ_ScqEuEGEWiiQSgJT_CQyg0HEFInvMaShwTxjr5gpum5BCPtPaZU92ll6jpfO0ePChJWIucEyLOaDfbZMe_iy6kDLFyD6zd9lZ6UKhCuildz3n3TEhpla_eKwIZFXeXMeA3RJDFayPzlBil8aWh5mkxWs0xCw5wU4FSIiKYy09M9rAJJwRBWGK8dZQOsuudIUVZfNgCY5lZqxeDqUK_KApPKAzivo7ncpacKzWssUbnJKx1FprLljWKxx9ebjaWwtVeeYAR3kBWqUMNz7psC-W-r6uxcp3Fya-YCFRqS-8rkgcU3WCqBAMfLYFgaMceaBHXRHt8OrsR6xoRgL1hzvg_u_GmoKz5hXrLlM3MjfB1oh7DEycWyDw1OdPGKRv7YXpGgP59NzuTOp7M9XIczwP1R9PmxUtfZcIOFJvkUIZXGYQ6m9LacpfrdXDuOx7kjx9GTjKR8C1p46R7KJ64JgKcy28DcKKkSx9fcqekhK-jaQ_5gYRs9hjJYOAxiRf6UK-ChDSTnzD7glJGBlGyleGOJYjrkHpmjjYTvNeLxvXx3PyAFA6pmX_iruNyTeOBrL8TF77-NHNN_G0X_jaR8anI8m8x-5FttQ2hvS-RvycdhLgbxkRYJbfEyD-6_vmRrajr4bx2n64lA4eNPVCnrLS91kU_74rm3PQXLXofbvfTTIXbo97IfKXZ9IUXXFy4b5hWYfwtgECzdY1FG1QaAsCXTqFU-pmmuLhslvRq0JbwLhboINyfLgOrMFeJ7JjvRQcedXPV6iG_M4R2lOg4Im4F_AV6E7OD4_SO5ZIkvTcCAhQB2u4E5IYlCZjadpdTVwnR6OgOz6bfVrzFizorYeE79BYCIu8xJ5yu--T4-p0kOxtTlZtWqqKBWdIQTwA3myTReVxTGk7l0byVBOAyEJ5hmekzFLM4WQJ7UWWjpIV8Yh4xiMvAF-RB8oYOzEoq2j-Hwa42iOY5odQi87PIlllQlxTxe2u9K6beW6xJ23eWlMMxr9vrE6zznK-ASa7pNRMulki0ngKFMVQqmZq6cOjmLDqgNrayrVUYfSJ3VYaObV5Oy2UvjU5O5i70TtHs-A3gQGpyDk2LkA2LmZLpofy-vO8niuRtudlsEo0iQZeODG7NswOnntFWCtFamJRXdhdV9MUIDAuyxXVxlsgALrwrEp7lbFfBdYUAMd0Lnw59E4OZGT__ydEFj5vJMOpvrHZFjRN8vlHS5jeIRRJFbRySVLQBnINl94d1QHOcsOXQwNh5wnE74w0UiLEnjGQ_HNom6J6ZAZGXCCfnKPzfDo088qSPv4SbA_GiXRfSj4Uh-WC-OaN2WH44hkh_zIXmyI525gLgE9-Lb5NEuuPJYFb5fKIJ3nieJ0SGs9veTZ1Vns70LFc1mM_-STuUXJtLg2U3ySiKv_v0FWaWwXSiAgS2sOG05ebg9FlmUVCFpucfyLjkdNrk8TapuKI7lqf8O475Q0suVGpUrLJde17Qms6ne2VXsfDIP3LuUTQe45l2kGtwWoBVI8HosJa96W-fZA47EhGVlWQyM9r7gCbrfcWPIo_N00LOTwOtzc3Yq2cN9IVHD0SMCvPwudCNOHtq_Gean--OzLGDvJL0dP5-vChYRmNPHwhiLzy7UgV-vz8DMdM_Y53dnA0z8qeOOEM4-fAKj7EqbBncJnRwpen_6WBpVjbpuEnxZYLw5gZk5oXz22Wd8ijqal5_LTPuAgzDIrwQf5sZ49XUnn_wEo-jH9My7gEROfDadynz4O0TQ3eJFBpFYqDTgdEu7Y3JjRJNk7UjxdM5DgqcSb3zXnCB1t-e3Qp5P0W_vsPnx59gx8Wd0gHY_H_DHkj3JBqU7yW7iodNq1W7ZkhOq_zlumiREKYr1q5SAvsVKdaTFb63g9ptuL19zZLJhv-QpSCe27aST90Pgtr1_-lxurJ8t4qivqNhhTb9Gu2Kosvi_rrbspgVOaCeLk5n-vmWvYiXGjgjLCFlY58xmYDWwibY3uOgJT2am-xQ31dunTDjgn2rNJPgox71DYkNstRdJ6I5b9EB7bgXM-Z9Q4HKXerhHsHejJGdvMwdSUaRNIKX2hj-L0X2nWI6yPEFsWU_d7bSqj3eIIWhehSGEREZ-lMwUi2CcdUgvT19ZxWmSKLCdf8i93QTZXdZUnVzFyDFWVh2B9D_Envgu-nHK6QWAc46dK6iaJC3FI5ded43tB8d3bR_w7bvmafeQVD5icrGXnFjL5G3tKfCX2v8YshedvO_8gHfjee-m8QPHBaTs53iivPrlIQL4B_Aq9-z_hv9f29_a_4DPH2FQvuWbVRxto9oO0PRiemq2h_AjBcrmwmxeuahXwdF0l4Y-cvf5wjX0PIZLlLMs4eesXpZ-UId3cmLale9stkQ0BbUftx27bP-4bttawvBdGu_xckzdVC42C-7IBfcloKASK-N_yrhNQ-r5pRG2Oa4TNscM8UkNp8nJVOHK6w1m6mIyv5D7y-TUVK6nAqnkrsDUbLhjep-qLb6kEC359i2emTxgBsYtqbjFFcIq5hODe4jQtrOOdxUqMDTfeDQEpIcfSa8e0CQdfn9ibEwrFYJFUnNR6hK0N33E2ccg-xhiH8PsY4R9jLKPMfYBiot9RqEz-tU0wOHKNb0gqBiNlQe1rvtLviu3ZEBBNB6Oj8b0rsrQ01jsOsGbD8biseho10X1nuZY5Mubxgdig4MjTtPCsDagD3VtShabP3cgNhLvXp7maUzs5m1jo_FYvNCVa562osDdeXR8KFo--ivL1jdcbkajY1FtiH9VS1pjSTNNbSUxqMRFv6UhPVaOvxvpiyyalVIkYZlNvS-yrMPkwq-RG_gbc_MRa0lfBmuYgENTLzWvQ2fmFZX6mI_M1z6F9nWt9lfDWBZdmEZzcSmSKGvVBnxr1kuALyfYb-I5t4Dw62bKaNasSCIWH6E-IokbkeuRhBqPjZwdGAFOxkYGBsdGY0PDfZGVCMKds4Mjo9Gh0aEB-Bgejn_aF_mYnjt4dnRsLDo2HB0aGxkdi0WjfRG9VLEMc5r9fCD9iuCn_w-zecfh)

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
 W_INTENT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Верификация намерения</b><br/>• Цель, факты, допущения и границы<br/>• Уточнения перед началом новой темы<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#32-верификация-намерения' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_START{"Нужно сформировать<br/>цель и карту этапов?"}:::decision
 W_ZERO["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage 0 · собрать замысел</b><br/>• Идея, цель, границы и риски<br/>• Определение проекта и карта этапов<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#3-stage-0-и-старт-работы' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_FOUNDATION["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage 1 · для нового проекта</b><br/>• Принятый каркас репозитория и проектный AGENTS<br/>• Создание через обычную OPS-задачу<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#33-stage-1--repo-foundation' target='_blank'>Stage Plan</a></div></div>"]:::infra
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
 W_FRAME["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage X.0 · рамка этапа</b><br/>• Выбрать Stage и сверить намерение<br/>• Цель, границы и вопросы этапа<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#4-рабочий-порядок' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_STEP["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Step · один текущий вопрос</b><br/>• Перед обсуждением сверить намерение<br/>• Варианты, ограничения и основания<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#32-верификация-намерения' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_LOOP["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Step-loop · уточнение</b><br/>• Разобрать детали и противоречия<br/>• Продолжать до закрытия вопроса<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#4-рабочий-порядок' target='_blank'>Stage Plan</a></div></div>"]:::web
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
 W_MATURITY["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Зрелость архитектурного решения</b><br/>• Статусы: N/A / Existing / Exploring / Proposed / Assessed / Approved<br/>• Состояние решения отслеживается в течение Stage<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#63-architecture' target='_blank'>Stage Plan</a></div></div>"]:::infra
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
 W_ACCEPT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Принятый контракт</b><br/>• Согласовать смысл, границы задачи и результат<br/>• Зафиксировать допустимые изменения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#6-как-chatgpt-собирает-задачу-codex' target='_blank'>OPS</a></div></div>"]:::transfer
 W_NEED{"Нужна работа<br/>Codex?"}:::decision
 W_AUDIT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Необязательный Codex Audit</b><br/>• Отдельная задача без изменения продукта<br/>• Проверить репозиторий, границы задачи или риски<br/>• После Review вернуться в Decision gate<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#4-рабочий-порядок' target='_blank'>Stage Plan</a></div></div>"]:::transfer
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
 W_TSA["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>TS-A · самостоятельный Task</b><br/>• Полная постановка внутри OPS Task<br/>• Границы задачи, ограничения и проверки<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#63-принцип-сборки' target='_blank'>OPS</a></div></div>"]:::transfer
 W_BRIEF["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>TS-B · сначала Stage Brief</b><br/>• Подробный принятый контракт<br/>• docs/codex/stage_briefs/<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#authoring-order-и-loading-order' target='_blank'>OPS</a></div></div>"]:::transfer
 W_TSB["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Затем brief-backed OPS Task</b><br/>• Управляющее задание с точной ссылкой<br/>• docs/codex/tasks/<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#authoring-order-и-loading-order' target='_blank'>OPS</a></div></div>"]:::transfer
 W_PLACE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Разместить и проверить файлы</b><br/>• Размещение артефактов через PowerShell<br/>• Отдельный Fixed Launch Prompt с точным путём OPS Task<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#64-fixed-launch-prompt' target='_blank'>OPS</a></div></div>"]:::transfer
 W_A["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>A · задание в репозиторий</b><br/>• Последовательный вход Codex<br/>• Продолжение на второй схеме<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#repo-v2' target='_top'>К локальной схеме</a></div></div>"]:::repo
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
 W_B["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>B · результат Codex</b><br/>Изменения и проверяемый handoff либо отчёт и подтверждения для read-only-задачи<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#repo-v2' target='_top'>К локальной схеме</a></div></div>"]:::repo
 W_REVIEW["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Review относительно задания</b><br/>• Task / Brief и фактический кандидат<br/>• Diff, отчёт, проверки и риски<br/>• У каждого замечания явный исход<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#72-review-findings-disposition' target='_blank'>Stage Plan</a></div></div>"]:::review
 W_VERDICT{"Решение специалиста<br/>по результату Review"}:::decision
 W_FIX["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Ограниченный Fix</b><br/>• Исправить реализацию в рамках прежнего контракта<br/>• Новый кандидат и повторный Review<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#72-review-findings-disposition' target='_blank'>Stage Plan</a></div></div>"]:::review
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
 W_CLOSURE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Подготовить завершение</b><br/>• Оценить влияние на документацию и AGENTS<br/>• Согласованные обновления, архив и очистка<br/>• Проверить итоговое состояние репозитория<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#76-завершение-stage' target='_blank'>Stage Plan</a></div></div>"]:::repo
 W_CHANGED{"Есть изменения<br/>репозитория?"}:::decision
 W_FINAL["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Финальный staged handoff</b><br/>• Согласованный набор файлов, подготовленный к коммиту<br/>• Финальный diff, status, stat и проверки<br/>• После всех действий по завершению<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#71-repo-change-handoff' target='_blank'>Stage Plan</a></div></div>"]:::repo
 W_FINAL_OK{"Финальная приёмка<br/>специалистом"}:::decision
 W_COMMIT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Commit и оговорённый Remote Sync</b><br/>• Проверить SHA и итоговое состояние репозитория<br/>• При необходимости выполнить push и сверить локальный и удалённый SHA<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#76-завершение-stage' target='_blank'>Stage Plan</a></div></div>"]:::repo
 W_CLOSED["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage закрыт</b><br/>• Итоги и точка продолжения сохранены<br/>• Перейти к следующему Stage<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#76-завершение-stage' target='_blank'>Stage Plan</a></div></div>"]:::web
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
 W_SYNC["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Сохранить значимое состояние</b><br/>• Решения<br/>• Результаты<br/>• Замечания<br/>• Точка продолжения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#8-synchronization-model' target='_blank'>Working State</a></div></div>"]:::memory
 W_ORDER["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>При обновлении нескольких файлов</b><br/>• Сначала профильные владельцы<br/>• OPERATION_MEMORY — в последнюю очередь<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#9-multi-file-state-changes' target='_blank'>Working State</a></div></div>"]:::memory
 W_BASE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Проверенная база и кандидат</b><br/>• Полностью прочитать текущую версию файла<br/>• Проверенное зеркало /tmp и точечный diff<br/>• Потерянный /tmp восстановить из Library<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#10-safe-library-mutation' target='_blank'>Working State</a></div></div>"]:::memory
 W_PUBLISH["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Безопасное обновление Library</b><br/>• Повторно сверить актуальность базы<br/>• Опубликовать и точно проверить новую версию<br/>• Только затем убрать предыдущую версию<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#10-safe-library-mutation' target='_blank'>Working State</a></div></div>"]:::memory
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
 W_PD["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>PROJECT_DEFINITION.md</b><br/>• Что строим и для кого<br/>• Требования и границы<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#53-project_definitionmd' target='_blank'>Working State</a></div></div>"]:::memory
 W_ARCH["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>ARCHITECTURE.md</b><br/>• Принятые решения и контракты<br/>• Ответственность компонентов<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#54-architecturemd' target='_blank'>Working State</a></div></div>"]:::memory
 W_PLAN["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>STAGE_PLAN.md</b><br/>• Карта этапов и их состояние<br/>• Переходы и значимые итоги<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#52-stage_planmd' target='_blank'>Working State</a></div></div>"]:::memory
 W_OM["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>OPERATION_MEMORY.md</b><br/>• Текущий вопрос и рабочие факты<br/>• Замечания и точка продолжения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#51-operation_memorymd' target='_blank'>Working State</a></div></div>"]:::memory
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
 W_TRANSFER["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Пакет переноса при смене чата</b><br/>• Текущая позиция, ссылки и вопросы<br/>• Доступ к сохранённым владельцам<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#12-recovery-and-new-chat-continuation' target='_blank'>Working State</a></div></div>"]:::memory
 W_RECOVER["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Новый чат · восстановление контекста</b><br/>• Подтвердить пространство проекта<br/>• Прочитать OM, Stage Plan, Definition и Architecture<br/>• Сверить новый ввод и свежие факты<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#12-recovery-and-new-chat-continuation' target='_blank'>Working State</a></div></div>"]:::memory
 W_RESUME["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Вернуться в рабочую точку</b><br/>• Сверить намерение и текущую позицию<br/>• Продолжить открытый вопрос или Review либо перейти к следующему Stage<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#12-recovery-and-new-chat-continuation' target='_blank'>Working State</a></div></div>"]:::memory
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
 W_HUB["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Reviewer Hub</b><br/>Отдельный рецензент с проектной памятью<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/reviewer-hub' target='_blank'>Проект</a></div></div>"]:::infra
 W_CHAT_SKILLS["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Chat Skills</b><br/>Внешняя библиотека процедур управляющего чата</div>"]:::infra
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

### Локальный Codex · [Веб-редактор 2](https://mermaid.live/edit#pako:eNrlXXtv28aW_yqE8kf-EW09_VDaLBzbyTWq2IbstNldLwRaomwisiiQVB5NWyTxTdO7CeqkTXGD3hunTbHAAneBKo7dyPEL2E9AfYV-kj3nzJAcPiQ5jmWnd_9IJJGc4cx5_s6ZM-PbsZJeVmO5mCzLC7WSXqtoS7mFmiRVlVt6w8pJZWXJUOmCrl_LSaWqYppaCS9U9Jp1UVnRqrdy0pihKdW4ZCo1UzZVQ6s4D8xpn6s5KTlEv6v6jdKyYlj0AkmqwZvn6kpJqy3BIyl20VBq10IX60q5TBeG2O-yBqNSVmYDl28YSr0OFz7TytZyTkoNJdj1UsO4DqOoajVVMdgls7F4CZ5entesqnpZMZa0Gh-VJFl6PSdlnV-LumXpKzlpZKFGNHJnIc1fgGegoyXsSCok_30hVkhK__tGsv9mr9s_2o_h83_s5_Y6XTuw99t37R17y9609-0Nu9m-B9932o_svfZDe1uyN9r34camNA5kubkQ-w_ovKwZasnS9JqUL8DP8eIYvOOjsnZdMq1bVfXjszdopqlEon7znKXetGSlqi3VclW1Yp27saxZqmwCLdVcTTdWlOo5_bpq4PhlpFROqd26sawa6tnzHy2eH2ODbN-xWzCgNRjcvr3FRn2nvdp-AGPdg1tbHw0uwuPG4Pnf77yU8kqjVlqWZg19pW5J7VX7rd2038B0YHr2VvuehN1AWzbDmdk5aV4xr7nN7Z9h0mvQ4JHUvovv2oLXb8CLt-E3UGPL3sUf9Lw4a2Gmhra0bMEEFGnZUCsfn122rLqZGxxc0qzlxuJASV8Z_PRa4zo8XBuEHytKrSyX1JqlGnK9sVjVSoOLVX1xcEWB-7OFybnJ6fmx-amZ6YGV8pkb6qJ8PXVWskA8VOvjs0UQjLPn7R-BVTC0V7I7RiCKcv6jQRgh_x-4l8vlLJBls6IajHOXoOu5vrEvOSDZL4B6wDT7LVCdUZy9FObi4xqQHUSRWLPGmMoY77RtxtnvJsyzBRLblOyWBHdf0zVo4EhDe83t84KuWyZMuE7Pek9-3X5IQgTd7MH_uyQOrZPjqUuBM2kZrBu9paoraDZko1FVTYG9i1WwPWfPsybRLDXUuk7snB-b-6RvzEwNSFM1zQKT6umMyMD5OXksBypCGvM1UPnPQFJQPfq-huK5Byp7D3XZr3DQ8EKOLmHrfdSyuyAoO9AYlQ5Y1JQuGJpacVuU9ZI5iC7i5qAFzczBk2IcTLw4DoyYLBTHZyYmrxZnCzPzM-MzeeTlkEyW5q0MhthaqlsyzsZ-BbO_wwyPbL-BL5tAkgftVZnGH2Y0vKIHlwszV-Yni9OTkxOTE7cXYvZfnU6BTkRfMANg9eCFRBawZg9hFPs4CglkvQmm8xsyn6BU_7IQ-xL6LqslzQSLDv0XksX5mSJ_SyFSmpLZ95emQgpNe3pAMlTF1Gso-XXFAqLXTJIqYeKoIVqtoVj-AU7MfDY9N1-YHLvc50Fm0YqhEyRr9ApNBhkqMCmcn9zsdB83WFtJls-7VlcwwPw6qq-rx_yayOwQ9_GZL0ACntrNhdgXAdZ1fPo5iob4vEdJaKPWygggkJTwgFTRqtXcmWQiOZJKxMGW6tfU3JnFISWhZuMlvaobuTNquZKpVHyoI4Wog4hn_x0Qx0_2f8O_X-yXdMWVxzgzwhF0bTl37qFXg_u_AZm5r-8AQrrI63FYv86SKjiwpr3LUNNO-4n9GqxBC39s8nk1fbjDr4k-N8hQGbZAXwcq_QifBqaBI1wNqTCiFKHnXXSTaGefwFewwU17G73lSVnIAWUJ7piD5jUQHHMwTLPBuU-m8mgvw6YvisDdLeHk2ARjfN_4ngHlXwcWAv7kkstRBOOiAeGIKjtk9ssDIR8EFoz3iCeRpQhmWoyTvv4Qy4D3C7LX6w-0nJC6C4yYanABOSDDv0kYni4GcTxXug9PEM4wIoKlUWVDNfVqA_WagNAxyEgPN3EcMvJODsJh55wFBGK4Bk3EDkAkBELS73eeCmGZoMHdJAMvgfQQaMZngPnUEGSt_TDuxkCu4MJjG77B2a0PAkIpDWtZN5C7ulGG1nbLxcV04ShwaXxm-uJU4bKAlJzwohWIKIgEBNpe40_6hjEjUCyMk8aLc_Mzs32TKXude4A9GgQpOVxZo1EzxWdw-pFEwSlZhPZdvwX6EW7sgSDskMG5JxGi3iOM2HSDKiEskjyASl4YG_po5HX9nKUMuGP7tv0XRtJNUcRajlU6wNCdHt1w47PTFrVkWjYhdMb4q6yhwTHfSbiua-oNBKMpAXLN9Q-IpjmWEgwAxLD5xO93vs9newFmZ4xX8v0cYgaHOOSYQhC1HRCLB457AmEFEMcFgwnr1yhCMJM77YeHnMGF_o1-CEd_Af8jiX0DwwXvyTw3GstxJmvSOMlaT6jP0KiD4V2Y4rs3IIFJ-s6BAIxM-wxqLMSkAWjql64A5OGd-8C7-JPf5-ZPNIVOIPDCB7E3GasoMBAlJrolttgCC4m5E4o5HZgqSCh25YtGAr0EzBN7HK2qa15pDi73g9FJ6ojRSRqjE9IorkAsLGHAiew9KhdFzK-5t3jD8hhg0sgYvqJZP4wMRdz3CFahk-YGO6Dk7Xgxn-ibX8knnJRqe40SmWS0t-xtxzwLyVSOYJmJB8-zA48jjiBYyS55_uLEIgwh-eOCwcF8osioGBlY5BM9MEI-2T-Cs-T7WxKnfYzhWFR4gBDD3vOIjR71FeYkwex8E6IuRXlroHAU46EcwjMknrsnh92iSZ8srmglQy_WgdjR5E_2In-qf-RP8XUOojZhEoqNyOSSRgvi3nkxhPhBnqFJ5uqNkNeUoiAj8ql934eu4Pb90-VUinhUBPoZ5KrMaHalerEr3T92MaCzhy6Ypz_uArl3BdzA3dVbkXOPwV2T_4pLBYJmkmOp37CoV6KY-C4B4I3TZUK6aKrVShEgg6mZllor3YrmQroXFzL94wJhOTD8DPjvOam3gJMkWgo8uNO-zxMPGHeuUohCfGtyLEVRC6lVCxMSXBvv-5YhTz5MiGZTpmguK1WgT9EyVLWoV4oQmjbgrR2UJtOLXdn-sYsBGLBAoAavyEnvM2ZtES13IpdJ7Z9oWRSh2zftJ17UdsD91D6x6YCzyemr5bX_lUQD3xRpAHmIPXlTLc0CjU6Xm9liWVXrh2RlthcrE9JXX31FhpCjB-d3hrsz53c2AFkdSPhOwNWHedNHxLxoLFiIZj-zfwZXt27_DSDHD_Dvmf2Du8zui8ribsKAVPouRkItiYmFL1XQKSXfMeA8Dql_n1DTTcJRcpLsjwTGq-kmRrYQqUuUihehgi-3661EOzLuJPIwC9j-T8zAk4Jsu6mUTfwQUAUVFYRQxckBOm8hWrmuaFVlkVKwdV02S3pdLcsseXvE1WiI9uYnr873TQCGQQCei7xG1PYWLuyivWMxXIuJ8Kbf8r1kMBtvSWTnWMZ2jbJY2yzN9laU8K2QJgTS_L5cvMNRzmJmHwO1DSwvBnffkEDsU-O1P3oBwuTVyfHZ_Nh033juahriE1aZJARNpGqCXfJz_Xt__YfwXNyBlq9ZVqN9N87k4i1aDDR4LPHKnGWozERwOYiveTkCvXOdLQegE6Yc6CPX1mDqZVUiUOpUooj9nuAKDTKMZEEF4uIE2FJMVS9RkBAWBdelRwrDirqiG7dIHC7PTExi3v2__JaV4cVAEVd7LVyKkGGJH1oo6mPmcpjc389YNQUMYjavV0aSD-2zwlSHxcfjy0razwQZ4RYmOuJcbX8riTUmh5wE5hRnpvP_2r95EEAtqEpZ1mvVWxINl7s8aRCXrHj4dsgBT0zNzY7Nj_-pfwMeIcL_xPKxjsOm-JGSN5h5IR-DqHufRUL4XFRB2l63msWuOWSETzxN_IKirl3edrcDtnHSxj69EftyMsLol0PveBqNXaLwCX-RZ_B91p_1N2voS4ZqmmHDGRgm6ZCIGPg40Xq4ZsTJGT_BzECHMX0RkuhQcyHmIQYiRIAuGGHd4X3RbWxEK4Y7tjCjhOzf9C-2C-IdmKsjuUFYnzkirMegkmsXTFnGOZPkttCJiaksYc0TU9cP2k8w4R4N27uZg-Nw4oc1BK4XfRacDTOC7go3FzGW4BFQOq73HhAtHtG6OimqC_zQUDIVYpLJmeeS55QqJZRGWbOIPF1KZbyHepbIzM4U-ofBQaGCi2WGx92OUOw7qsZGCPQw3rHUiy92o16iTbrPF8d2o9gUgGE4fcMSgRizG0xEwFje5WmmLaHyZhmYpFcqVPUdMgonmWYPlc7gZID4moW5DLdshhfM0M3rJlWd8p9RZTNiHz0rwwvZP9yCKzda7pIrir2gAWwlMdthJTF7RPM7hOaXgzSwNn-nfArLqfzqTi2wYhAP5rGbPMGGseAGWwruYJk7o81j0eX3w5m-qpPNuERY_64bhgeCc2_95MCxxU6d1Lei1vLQjl4pLL2usowkr7KKAF3OKtkDHDo08BSYxWXQEEsqHzgL74H4zwEtfrlsP_wwCs3TsrsnBqHPAVaaswpvcH9HqZH6dCw_NTHWT9kKZ0loKXmPTPomrQk0I8onvcUeJii0SyBUuMWKXoW9ImKSO8RDv_7tY6aHd9iibSB73iNYSSsuGnl1vk7JVUCLQ86K5X9QkjZgBN_ydNQp1uPi6hjtPfAcSUbGLhQLwnb5hm5cQx5GuRC3aY-iqPHixamrt30o-aJ207cDhJXasWzaavsv8Pk6aAbWomru_jQ2PTFz8WIfoWldl8CT1pZUBw-8QxLpFSuyDK2c8eyRr_x7j9uyOyGwwfch4etMS7EaJiKSRg3cc-maWo6DW6hU4nQLe8Vf4NxKy2rpWkfliaMl3-DJ8mZcAMunX6VHhbBFzCcVIWS0dPC2KJTDSZaJZsyQOTPCYsnqaDuno3z73S70TXDeDckItoTvlmIoga2xsDWHLRKsJ3ghVNJL5bt8vx-5MLdHtvwdZwonFHC2KKInM4X7qaK3NW79E2xqLAzx5Een6tzj2xj0PjW6XZJcQ_-fklwEaTlod1CID5Lwe-BRHM8i7HrKhUqaHWP2G7OkrKbQy-IIzd1tUK5XCbyXEj3BEmqEhsEq6n1710nzCMIn-is-iQtRbxBSSVFlL9tcpQNv6JRIGjpiJDOMkQwlwoclljd09ocLC6xNSpF3yj12r4V0k_iBRHuHEsi5T7ps7EmOZt9b-rvs5vJXa4Zct7vb559oS5VWqxiKQ_ixKxNT830jvJi6cgj-rFO68hVP20QipD9obs5H68Lkp1OTn_VRygXQ7ivrFQMXHpM4cPIDik2OEIb4yDs_Odc_ScZsmipbqmkJtuOll_XY4CWI_hqrU6wKDRBcGH8Xgvtm2ZPgEzPjc30jOGZ45UYdQlVBmn-OSlGx-ukOOadTIrcw-i7k9s3xEOajY3r_eMyHP20s0Lx9n8mwWzroX_f6sHLlR0uI-51i56NSjoPSgJRoJjJuhvXR-kWwTgLjtVXKNbx25BoTYC2-dEtOtCUU7Yaj0pMsgg4wKDjPLiwKk6S3OtDGKFZ8yY2RD9R4t4QFAtcLe3fdExr8xZscGEci7NFRpbyodi_eHH6nph44H0FwPsK3AD631-3v4d9j-B-XGl7Cv8f2rxjIPbafwI2X9mP3bCe_4DjlcHtkKnd45vVrtugdueLQNQg9pgXEfoefQjGWs4_fC8bjoXOB_FtgxXLS7S5VgOtRBxFxpfyNEZoHT9sRCulfmAhUExw4OQR3yZP27W4RYnYHCK_80FT6TFkDMbBKy_IKoLWjKrhYTzo30-91isOIo8_MttfoTDESG76iFLHbP2r9o-uyN9-8si9uDnUq81sowAQqH_jqEEW37LykxbqlGkbnQCYqN-XnAojd4wCdm_61eu8pd5vGKt_0vc13olFKMoBr_RUAH5p04g4cvaqVO1Q5HlY63UWP_OT0XB_r3SlhxRajnBKWEBAABkoYGRXZsILZ5ufR26r2eCFM09srQguzgd1Wbje_sLW73whfv6ZxkEQ-ibDAfH0hbMF6LNFF6RiNp7tyfnBCttKoWppc0UsNk2JWmXHmfdFOYYSlAWdnZvL9SxCPEo6Ilpqg7PXexM-HjOV4fT6FIFhwHIGFDjnYi1NX-13d23mRVOq1QNozu-7AN1b9IshM0KE6ZabuuTNiLIeZoU18e0SxupOWFpjbu--D4NJ-qBQg0K2T_Wcmlne4Ht6fD2bLELPlnfPkI9FQXC2PLirdoPgoQnFHL36w_wqY-zvaUfUMoPk_7B_QCf8CMNxD5__wDj3z-Vrf_pJe2XOu54fWxQ5Z9bH-HZCmGCV8vmQ1DLVIKVA9tNaJBwi0-NYK2lDor8KjvNmj8Fmd0Rt3wJHcc3H-SZl9Vl7IjX_UlAcsfaUatu7zM5fzvQ7v7B9vMHkXzZMXlCHjm1y4t6acO219w5SaxxenoMtfDfNhsUSc6dFZMdE_VmB6L5oVTzsVyLUiywg_VA6IEzw6B8b7x4F3wccsrRCBj6NOIxAA7T7bGu2e5yMgXwm55NaDnQ6PfCQ4OpPGCjxjNlHgFoz_Hi-EUmfowN5pabowylx_r6j_hCsh3iH27wbMiBwEysLTDEKV0SMu6ScTdPY7O_Dnqb0euek74kwfnNifCaqg3ceTBZ3jHJodsoTj-am-qeusDjI6t6xWq9KgVKWj3QNqO26oiqXGndOptc_h-xVaQBmrVv2uzitlEMPTfW-TZlC7t3iBx4mly82SodVJRcXnBupmMqyiHml6pcYvj02PXZqc6ONphaAW7AhApzrCK6J1anJ9pvYXz6KiFjmpiFdcIFv8lHi3AQ-4QQaYKYMvbm2Db7stHwZMRDdUOeKAx1Nl4pn8aCYr50dHRt-HnZeujBX6yswDKkncZyGgm4m-1FCMwKH93xE6DFXBYWYxir-icLADSMkVvmaVj5QavRM8QcknRHytXNjSg9WVGlXC1hvm8h9ZTcFUM1_QbanxOLwdnUh2mL_N0M2Dgc139mky4-JJpnO0YbRsuKG52I5_91IFYKq9VZ8dHiE22eInr411cgR-soWOME-806JbgZ3lUmBHuBTS7CPDPrLsY4h9DLOPEfYxyj6S-Ndd6O_RTKgV6Ya66Lx9JFXJKO7bh7OLqUrC__ZzYku2i95pPJQeSalu4yG1NKx0a-yUw_LmmVQ6lRzxchxDi4tDqS7NEeDxpulEKpMZ7oo5Ak3p9C3-3kRqON09t-JrTIrA26ZG0qn0Yldu-do6uwTcV6ezycrhpyyKd7S8jCRHk0qW_5TLirmsGIZyK5eR0k6_5ayaqqTPxeKxJUMrx3KW0VDjsRUVFBJ_xm7jX-9ZiFnL6oq6EMvBV0MtN25CZ8Y1mfpYiC3UvoT2daX2b7q-4nRh4GlFsVxFqZrwixWHTLC_NuQ-AkKvGuN6o2bFcqlsivqI5W7HbsZycjo1PJAYBk6mhhOZ0ZFUdigeuxVDYzKQGR5JZkeyCfgYGkp_GY99Tu_NDIyMjiZHh5KZ4dHkyHAiGY-pFNJdZn-Yif4-05f_B-wKF3k)

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
 C_A["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>A · принятое поручение</b><br/>• Launch Prompt указывает точный OPS Task<br/>• Связь с первой схемой<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#web-v2' target='_top'>К веб-схеме</a></div></div>"]:::transfer
 C_AGENTS["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>1. Проектный AGENTS.md</b><br/>• Состояние проекта, правила и ограничения<br/>• Bootstrap и границы полномочий<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/AGENTS.md#3-context-loading-rules' target='_blank'>AGENTS</a></div></div>"]:::repo
 C_TASK["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>2. Initial OPS Task</b><br/>• TS-A: спецификация внутри Task<br/>• TS-B: Task со ссылкой на Brief<br/>• docs/codex/tasks/<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#6-как-chatgpt-собирает-задачу-codex' target='_blank'>OPS</a></div></div>"]:::repo
 C_ROUTE_NEEDED{"Задача требует<br/>выбора маршрута?"}:::decision
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
 C_ROUTER["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>3. reasoning-patterns</b><br/>• Самый лёгкий достаточный маршрут<br/>• Сопоставить метку маршрута с точным путём файла<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/reasoning-patterns/SKILL.md' target='_blank'>reasoning-patterns</a></div></div>"]:::repo
 C_READ_ROUTE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>4. Один выбранный route-файл</b><br/>• Прочитать тактику выбранного маршрута<br/>• Далее проверить предварительный выбор<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/reasoning-patterns/SKILL.md#route-file-resolution-rule' target='_blank'>reasoning-patterns</a></div></div>"]:::repo
 C_DOWNSTREAM["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>5. Подробности задания</b><br/>• Stage Brief для TS-B — после файла маршрута<br/>• Другие артефакты, указанные в задании<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#authoring-order-и-loading-order' target='_blank'>OPS</a></div></div>"]:::repo
 C_CONFIRM{"Задание и правила<br/>согласованы?"}:::decision
 C_STOP["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Остановиться и вернуть вопрос</b><br/>• Конфликт контракта, границ задачи или правил<br/>• Недостающие данные и препятствия<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#13-stop-conditions' target='_blank'>OPS</a></div></div>"]:::review
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
 C_L2["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L2 · план и итерации</b><br/>Последовательная реализация в согласованных границах<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L2_plan_iterations.md' target='_blank'>L2</a></div></div>"]:::repo
 C_L3["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L3 · независимые проверки</b><br/>Аудит, Review и разбор рисков<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L3_self_consistency.md' target='_blank'>L3</a></div></div>"]:::repo
 C_L4["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L4 · сравнение вариантов</b><br/>Архитектурные альтернативы и их последствия<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L4_shallow_tree_of_thoughts.md' target='_blank'>L4</a></div></div>"]:::repo
 C_L5["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L5 · глубокое ветвление</b><br/>• Разрешённые прототипы и ветви<br/>• Явное согласование и ExecPlan<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L5_deep_tree_of_thoughts.md' target='_blank'>L5</a></div></div>"]:::repo
 C_L0 ~~~ C_L3
 C_L1 ~~~ C_L4
 C_L2 ~~~ C_L5
 end
 style C_ROUTES fill:#101820,stroke:#b6a0e5,color:#edf4ff
 end
 style R3 fill:#101820,stroke:#b6a0e5,color:#edf4ff
 subgraph R4["R4 · ИСПОЛНЕНИЕ · процедуры, контекст и тип задачи"]
 direction LR
 C_RULES["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>6. Подключить нужные процедуры</b><br/>• Skills по характеру операции<br/>• Правила ExecPlan для объёмной или длительной реализации<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/AGENTS.md#available-repo-scoped-skills' target='_blank'>AGENTS</a></div></div>"]:::repo
 C_CONTEXT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>7. Нужные документы и код</b><br/>• Только относящийся к задаче контекст<br/>• Проверить реальное состояние репозитория<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/AGENTS.md#3-context-loading-rules' target='_blank'>AGENTS</a></div></div>"]:::repo
 C_EXECPLAN["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>ExecPlan · ход большой задачи</b><br/>• Границы задачи, прогресс, открытия и решения<br/>• docs/codex/plans/<br/>• Обновлять по ходу исполнения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/PLANS.md#execplan-file-location' target='_blank'>ExecPlan</a></div></div>"]:::memory
 C_MODE{"Характер<br/>поручения"}:::decision
 R4_TO_C_SKILLS["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R7 · Семь skills</b></div>"]:::continuation
 R4_TO_C_WRITE["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R6 · Исполнить согласованную задачу</b></div>"]:::continuation
 R4_TO_C_READONLY["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R5 · Read-only анализ / аудит</b></div>"]:::continuation
 R4_TO_C_DISPATCH["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R8 · Родительский агент готовит ограниченное поручение</b></div>"]:::continuation
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
 C_READONLY["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Read-only анализ / аудит</b><br/>• Исследовать факты и риски<br/>• Запись — только запрошенный отчёт<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/audit-only/SKILL.md' target='_blank'>audit-only</a></div></div>"]:::repo
 C_REPORT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Результат read-only задачи</b><br/>• Выводы, подтверждения и необходимый отчёт<br/>• docs/codex/reports/<br/>• Без искусственного handoff с изменениями<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/report-writing/SKILL.md#file-report-vs-chat-report' target='_blank'>report-writing</a></div></div>"]:::transfer
 R5_TO_C_B["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R6 · B · результат в Command Center</b></div>"]:::continuation
 C_READONLY --> C_REPORT
 C_REPORT --> R5_TO_C_B
 end
 style R5 fill:#101820,stroke:#b6a0e5,color:#edf4ff
 subgraph R6["R6 · ИЗМЕНЕНИЯ · реализация, проверка и возврат"]
 direction LR
 C_WRITE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Исполнить согласованную задачу</b><br/>• Код, тесты и документация по заданию<br/>• Большую работу вести ограниченными частями<br/>• Отмечать прогресс и результаты<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#63-принцип-сборки' target='_blank'>OPS</a></div></div>"]:::repo
 C_VALIDATE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Проверить кандидата</b><br/>• Проверки по Task и правилам проекта<br/>• Результаты проверок и причины пропусков<br/>• Самопроверка и необходимое ревью кода<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/review-code/SKILL.md#4-mandatory-workflow' target='_blank'>review-code</a></div></div>"]:::review
 C_FIX{"Нужен Fix внутри<br/>текущего задания?"}:::decision
 C_HANDOFF["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Repo change handoff</b><br/>• Границы задачи, база сравнения и точный набор изменений<br/>• status с untracked, diff, stat и diff --check<br/>• Проверки, сводка, риски и препятствия<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#71-repo-change-handoff' target='_blank'>Stage Plan</a></div></div>"]:::transfer
 C_B["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>B · результат в Command Center</b><br/>• Специалист передаёт артефакты в веб-чат<br/>• Review, Fix или приёмка на первой схеме<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#web-v2' target='_top'>К веб-схеме</a></div></div>"]:::transfer
 R6_TO_C_STOP["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R2 · Остановиться и вернуть вопрос</b></div>"]:::continuation
 R6_TO_C_DISPATCH["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R8 · Родительский агент готовит ограниченное поручение</b></div>"]:::continuation
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
 C_SK_AGENTS["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>subagent-routing</b><br/>Поручения субагентам и объединение результатов<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md' target='_blank'>subagent-routing</a></div></div>"]:::infra
 C_SK_ROUTE ~~~ C_SK_DOCS
 C_SK_AUDIT ~~~ C_SK_REPORT
 C_SK_REVIEW ~~~ C_SK_AGENTS
 end
 style C_SKILLS fill:#101820,stroke:#99adbe,color:#edf4ff
 end
 style R7 fill:#101820,stroke:#99adbe,color:#edf4ff
 subgraph R8["R8 · МНОГОАГЕНТНАЯ РАБОТА · поручения и консолидация"]
 direction LR
 C_DISPATCH["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Родительский агент готовит ограниченное поручение</b><br/>• Один вопрос, границы задачи и нужный контекст<br/>• Ограничения и ожидаемый результат<br/>• Отдельный путь отчёта, если нужен<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md#dispatch-mode' target='_blank'>subagent-routing</a></div></div>"]:::repo
 C_CONSOLIDATE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Родительский агент объединяет замечания</b><br/>• Проверить подтверждения и разобрать противоречия<br/>• Сохранить идентификаторы, убрать повторы<br/>• Выбрать следующий шаг в границах задачи<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md#consolidation' target='_blank'>subagent-routing</a></div></div>"]:::review
 C_LENSES["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Несколько субагентов code_reviewer</b><br/>• Независимые направления проверки<br/>• У каждого своё поручение и путь отчёта<br/>• Результаты объединяет родительский агент<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md#multi-focus-code-review' target='_blank'>subagent-routing</a></div></div>"]:::infra
 R8_TO_C_POOL["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R9 · Независимые субагенты</b></div>"]:::continuation
 R8_TO_C_MODE["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R4 · Характер поручения</b></div>"]:::continuation
 R8_TO_C_FIX["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R6 · Нужен Fix внутри текущего задания?</b></div>"]:::continuation
 C_DISPATCH --> R8_TO_C_POOL
 C_CONSOLIDATE -. "После анализа до исполнения" .-> R8_TO_C_MODE
 C_CONSOLIDATE -. "После проверки кандидата" .-> R8_TO_C_FIX
 C_LENSES -. "Организация review" .-> C_DISPATCH
 end
 style R8 fill:#101820,stroke:#ed9bae,color:#edf4ff
 subgraph R9["R9 · НЕЗАВИСИМЫЕ СУБАГЕНТЫ · выбрать по задаче"]
 direction LR
 subgraph C_POOL["Независимые субагенты"]
 direction TB
 C_AR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>architecture_auditor</b><br/>• Слои, ответственность и границы<br/>• Только чтение<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/architecture_auditor.toml' target='_blank'>TOML</a></div></div>"]:::repo
 C_TR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>test_auditor</b><br/>• Покрытие и безопасность тестов<br/>• Только чтение<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/test_auditor.toml' target='_blank'>TOML</a></div></div>"]:::repo
 C_DR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>docs_auditor</b><br/>• Документация и реализация<br/>• Только чтение<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/docs_auditor.toml' target='_blank'>TOML</a></div></div>"]:::repo
 C_CR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>code_reviewer</b><br/>• Независимое направление проверки<br/>• Ровно один отчёт о ревью<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/code_reviewer.toml' target='_blank'>TOML</a></div></div>"]:::repo
 C_AR ~~~ C_DR
 C_TR ~~~ C_CR
 end
 style C_POOL fill:#101820,stroke:#b6a0e5,color:#edf4ff
 R9_TO_C_CONSOLIDATE["<div style='width:150px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>R8 · Родительский агент объединяет замечания</b></div>"]:::continuation
 C_POOL --> R9_TO_C_CONSOLIDATE
 end
 style R9 fill:#101820,stroke:#b6a0e5,color:#edf4ff
 subgraph R10["R10 · ДОПОЛНЕНИЕ · локальная инфраструктура"]
 direction LR
 C_CLI["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>PowerShell / launcher</b><br/>• Create, Initialize, UpdateAll<br/>• Подключение и обновление проектов<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/scripts/command-center.ps1' target='_blank'>PowerShell</a></div></div>"]:::infra
 C_MANAGED["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Общие файлы проекта</b><br/>• Управляемые блоки AGENTS<br/>• .agents / .codex / reasoning<br/>• Общие ignore-правила<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/scripts/command-center.ps1#L945-L989' target='_blank'>PowerShell</a></div></div>"]:::infra
 C_GUARD["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Опциональный Guard</b><br/>• Восстановить управляемые файлы в зарегистрированных проектах<br/>• Без Commit и push<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/scripts/command-center.ps1' target='_blank'>PowerShell</a></div></div>"]:::infra
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

### Веб-процесс и Library · [Веб-редактор 1](https://mermaid.live/edit#pako:eNrlXG1zE1eW_iu3lA98cWNbNthWCFOyLGzv2JZLEoHMsqVqSS2r15Ja1WphnExS2B5gppzFgYWabHbCQDK7fDXECsL4pWp_QesvzC_Zc869t9_lJICCi3zAtG73uW_nueftnns_i5WMshZLxBRFudYoGY2KvpK41mCspq4bbSvBtNoq_TSM1QQr1dRWSy9hQcVoWJfUul5bT7Ckqau1IdZSGy2lpZl6RX6Q0z_VEmz0PP6Giqhixpqm1tKg6rLWtKqXdLNl8fK6Zq5o6fKK1kqwilprabwYegJ1NlZylqla2gq0t5BZmk3n8oXlZH6Of7Oqac10wzLXl2A0mUbeaCaYZbZFDQ0oXK6pJa2uNaxkTV9p4EOCLWWW0tTVmrFWqqqmlXC_zzXVEjSaYGNxXmiqjVWncHxSDEUtl6lgVHxV1tUVU60vB8vXTLXZhJIretmqJlj8_Agvb7WLs_Cqmtetmraomit6Q3SCMQtHMSl_FQ3LMupACpTELKfXLD8NH0FNK1gTu1JIL-Wzn_zrtZh9335o32P_94L1Nuxju9O7bXftXfuV3e1t9DaZ3WWpqmrNLudZyqjX1UaZpWBeNPNa7N-gwrJuaiVLNxq8_iuF-aU81Az1Xijr11nLWq9pH51ZowHFx0eaNz60tBuWouL8JmpaxfpwrapbmtKCSdMSDcOsq7UPjeuaiR1XcEISamN9raqZ2pmLF4oXobed3k3o25-gl_v2Lva2t8PsQ-jyAb3qwDMUXRguwvfm8MV_3vyO2f8Lxa96Xw4xoNu193ubve0hZu_ZR_Zxb6v3F0mEo7V_gEp26fft3rZbxfe9TfuodwdeOB8fiwb3qH14h9N2ZB_gzyP7Ofx7yYCqYx-Iirxz4pkHU1-pWjA8lVVNrfLRmaplNVuJ4eEV3aq2i2dLRn3449X2dfi4MVziTFBKxASl2S7W9NJwsWYUh-sqvM9Z6opWACA3CsumYRklo3a2Xv5gLK5AhyKmTglP3RlmAcY066MzhSLUs3rmIlXKsNILw-rFC8MwDPEXUJBIJNa0IjE_l09m858Bpr7tbdk_4iwAqKC9I6j8AKq-SdOyC9P_Jc0HdIH4QvOOXboJr7ZY7z9g1nZheuHr312LfQ4tlLWS3gKYUTN_SGczA0MYH-uIWBBH9jOEA_aY2S9wpnrbUAy99gPsawBTp7cDALstoeYHEg6RZn8DBtp1CR8BAglDSMY5YHcYFR7Bz32cCe_0wC_v9LxrWCktfKGMKHZXQXnBO6nQyJ8B32GhvS6ctEbZL7EAXbNplFiP7a_sezBzT2Ha_4tRMbKLVhxNHPRETnin92eJ6z4S61I2uZgeMJyunuWAuklrbd_LxF0_kO73tj2Q49Q4kg1n-RIUA4vW7kTIujAAAzPk6cO7hdG4C5g7MJiXCoIbgLRDInr_TQRSenmArNWahLsj6GbXPuSyfp8UCgzCN9t-Jv_dVRwoYDZIWu5JVoIC-QXsvo9LjlT2oVBrRx7G3_GpNuiIUE27Qkv-FrTSQiYzWBAoYPgSEoD1PiMB-OTj-2MY1Au_TkG1scntLWIRx8sm0D4ntdnBFSEYxbFDmgHXxSsAjVPLEVdP-7BqtpEcOe7B3_u7xGeT-TSYHLNg9gsWbJAV9txZJqGJoYVrPwdJe0zTyLl1FGVqLGayWLv9iCs3YRZ_GZCk3JhxV3_H_gEYQiOIqnRmFqqcESVsBXrO-_kN9hPVvk9xSXMAJExvB9kd2c9k_nJ2Pv_J4Azvv9JSfEUDJsyhpr-FAoqbKTDwmyRccOh-xetfBE_ISsDvYebAvxpOsmGWvqG3LHB96LFZM0z-DAhqGi2tDI_JVktricdm04Sulj118m7B3x0xZf4eMDJFNsjC-pHW1i6uO6DBZUKCW4pKoCXGveP1cn5MUc0SsqhktYEHv3h96I2KqXIDJ3N5aSaZn88sDdjKGSVtuAfWx47rAiEc_OZsQBd6oL2NWpMMXfq7QVykRfqCgHZEmmLHFZSiykOiBDNwKZ_zgQLo9riuQ0jcEfrkBVe72yioAYZ3WWY5p5CU2EM3rrf1rtWiNKtHFcXUmoZSMdqNsopG6-vjIGROL2fJNgJj5CEopof2A7Cqn9pfCYsmaEIcklwSQnvLXSx9jOrk5Zn5AUYBvoXmkYU7yDWSQGDxChikjLJ2gyXbZd3yI-0RfLgnPwWyHebyHJ2sZxwaXSg9oOG5jj7XuWCmcQAHlLHXVItCrP0ybIy7LaPeJ_Uf5R7-nZQ3iC2W1a7r2hoTjSFuoTkpwMLK5D3S9JapNloVzeTASqXSywNEVoQ4OiLL-iYPHAV0GQm4Vyir3NAGWu88TPDqp_jO4fICgAWg5HrRrfyv8JOsYqjJFztxI1cbZClCY7g2Q8D9tYAA4rOQAtmbzhZSmZn0VRAtmXwmlVkgRaagLLf3lVJVtVaalsKjKjQiUsI-yatgpPlGGCPQxM8Ax1I6PeMNP-0yNxAhli1JhygLKjeXXEZTL6-2VlmuqjY1ljXaMF4iy-eUpFyn8DwdVUM-lxwYLql9HpJCv8ixdgKyDzsfdDW5hbvLA5ZHwo7l2hkDEfAfFyaAe1SEvA6H_j_7wvdET_PYIxilQHvnSBxTHEMag9zHCMVnJKKhi6-LuensfPrSIPk-Lfjuhph3RVxo2tS1SpjdezT3zwQkfL5DpESTxGWj1Bqm9TdM5kehiPW3hk8F89S2VSWvQDHMMlDbXfC61bJT8Lrsy-emB-gzCePkgNFUKkW1tAoejLPKfKz7nji1C4sG7OfeXXIjO86KkzbsBnNCDLS9sIFeFGACmfoyipUWNPSe83B5IZkaXARXRG0wGEXqlmvggIwTxh_uLr0E_m1HxX2whr-4Pj0P53fkjhRW5XVRlo01zcxVtVqtjwVLi_mSfgMAtaC2G6Uqesv1puXFCHxzwMhS2Ozdg0effH_n8nhcqWD3lRp1X2lS918XBIPTvaR4A-sQeRVp6YfEsYg67Enzzcc--3nvFkps7rT0C_I5kDkkfS0aE8v_FsoXEen6FTgKXmMOGErhBGQi-afXR5WGtubhnGU0z1y0v2EUiUPzj_tcgS5HMhUrjHJXs-n85ewS37B-BJL1Pm0DfYe84a4R2CPoPjlC1GePvKAyWFtuVK2P5zo4dTAttoACBr_gvcSN_XXY__QLG_CkaEsZJrMKrDIqFZznLpoyPM51p3eP79wTPPegGS6knD0GrJOHaUxNLStGo7aueE279w1MiJ6P59NXBsZa6Zyjn3FIa77rrnQZm99zdl28MoL8jWFuy5FHKPUBmdQ8HiDCYkCNG017PjdxRq9Uhjx8HwoZ3_22nr_nlf5IcuYH2csDCoWKnjLA2nMpq7o02wCodxxgmIgrJs03qI8GWg8tpay3mkZLf70IGa-MYPJxOjszn6IUhse-CHxUbozwKHGRRSzr3paQSxGe4qX5q4MzVx6FY3fSVAjkLHikpSd4ReOjuBpuxd0Vqk7sW_duMZGw8CMJKIJNwKHwBsi-RSA6cV0vgB35JPUZ7yWfs_cXYamFTO5ydoDWKnmAyBduUkp7NUIBBqOjt4Vy2OT7W4jyHZ_lQfE7wDhpJ0K5QEg3MvbuC4wJGHYYd02p0FHRQ85uEoCNb1TfEWts_-RwKze9cLi02UALNWorKLyJ8K4hdl6J4gkP_L8OwoSiS80ll2Z5FOyh3KmLDgxGT8vvIsXVUnJhcIj9B4YnpFonIUCTUJbWzU-EXB0BR5VQPMdxxPCLIWEGedbEK49YtPe5ADugDLVNsflDTYU7ViZlC92z2i3-f99oVyB8D2JuA97foh1_-yVB9DnX7MdS9fqw0Lv7rhE6yjefSsCGFU0RzHgDaBKMCpnfIzZ9UyuCkwTAe1zPcIRGKV3gVAREU5nFxQFuOGHqq8557QgbYNU9B0VZrW5YGsutN0rh7U2_yMrNJamiN5Nc7t4po3WNu2G3RCaSjA93_UkOvPlmu1WNyijzGdfC4GMg7PeozB0pdP99FZ2gmtMzA94j9yajBM0xjgdur_MADgXoj8PBALTMES63hKWH-ng7nF_2koNgn8kgBO52UwzqAMzT05Dm8JZ52SdzdDG9mKFk94X56Wwy-wkFdI4pm3eHG75bEcFXsm2hY_YzBT0iNHj6xAxynyylBqcfn3gY7VhzfDeA1nqk7AgGIL3pON7igNOy7dt-9DuD7qvvfgKcvxaoxImEAj-RULhimKtgrBcAJZbmg9mk0gLJXDWNhv4p5VEodaOs1cIAE1UwqiIaY3UQ9ea6H2CZK0vpbA6DU08pr2gblx83ondlxBb0WD_8LA9O6ixnM_-STuULM2lQv_Mi0OIHx1PEDSNjEXnZxZBx18nj2edKysN8Ei3PvGmkfc5NnCYEnBvD-PK_w7wXyhp4deTJ1ctvhoArhWQ2NTe4wDNUPp8H7oHDGOKaP1EhnPDWDfnl3sX9SAQFN4UhKlJ8pMfADWI0HA6Fr_crnjX4-Twd9-XIvTk3lxeSA8yRw3MK1ESIl99Enu0QVuKtKOkeVPXc9hNZ_h7tIDJDpGlx-lgY56q-0AR-vTkDM4sDY19mOZ2lQLWwJkJM_K5v8r8IwLo5UR3PObQTFO7PMgRPH0tHFaOpmaRmC5w3b2FlzrAvvvhCLFFH8oqyzKJj9F0pTCdz6cGmh0l3jstM8l2f0Qavc1DLF6iPTMcRkhaDZxwkd2iRivwxJ5OcslOFcbxBsTYnstEnLObJ1Xwh4hF0KpENW_WmB1AdsT3MYxr-iMWm2GWSLh8nfU6d9qYPdZ3wElvQi6Zqrp86MI6OKC21oik13j-l3rb65NH-Qjxenl6Yzw1O9dv30DRHEUKBLsHRUOgUCuXMh2DmxNXJuPM7-1z2bLl7aVLxE5B9hgJmD0DxKzqe40lB7HoSUaJyIXhHQwD2ORHU-r4If4lMGWzNPR4jDkcCDPci18NvBnCZ7Ew6O-C01yiA8fASbR1KdpFJ4gmwBuOz3kQ1Id0wjVUGlsJ-kQdvQS3L_nnzAe5A8dRFkUlxCA76XSbEGMfHl6cOCFPA-pqlKxW9pqGNA9zgkdTWm0Ihn00u5S4NFA10EKmDm3THjlahU2QiTEspznxHgcnYSD9rSGaeUhDzNt_u8aStdcMHU91aHgjJtGUfizCWEwpxQpIHEX62fXD6BAPuKZZw1tcVrLChrVFKtFIyGpbeaL8VKZFNpzIfDxIZ7n4uZ7s8dx2wDDwn2YUTSnDYiDj-48tQ2ZPKQ2JhUzCbe6mhk0R-E8hnRGUWh5gbLhxiM47XT_uVHr_RK7siNBjP0yKE7rmBczpGFrLjf4OAy10e4Ol5cd1H4LSL60uRPSBdpN5WUBOdfIZa2DA-U9srp-72y8cTFaKhLCL5EiRel4_OCsjEICc_6_j0heZPE6JCofv0VVB3_JjaI0wneQgW6T37f-DvA_tr-2_w_xPQNV-LHPnn_ESYm2zQ5bIDz6zJtIXedjAKu5AlLM-lF5YHKDvlNTpzWg3cYzff77F7QgVTd8WOA_WcO2J_4hvGdLOMqOStQUOcyalSn8KsE8Dv8JNPJx8znbs8PeD8Os1kc-2iO3PhdGgKhfE8lhec2zSlvrOilDjo3f15e16EKbqpwJs3m8zUXDJfyP1-fmEhN1BAstyqXqu13Dm9T-b-nymwTIGNrnD-jriodG3620Jq3ey_e-aahv3Oo8oLo5iiXJQXCLlXCWHpH2HtP8Cdkz-Km3_Cr79FU5V_QJe5OJcEiVrdQnpy2kovO5eEiDK8KsK5M0KU4QUDzk0DviYT3gsfSCnwTji1eCmcMeCVAs7dAp63iaAq6IoDHXhdASd1uuwl9Yx-ZtZ3GQBTzjL44IlUS6SgfqQd_Y7IIA3ekMPO0phFRe7JcVHVU4xGOAeu_ec8RV9BcTnVuBM_Myu769PoPp0ZGKNLwo_zQR8ZJaRAH7a4pcgp6KxxgMS7OyK4wk-OuqeTJQzw3J_naKkoxqOEzpnCEA9dIu9rDyd4LoF7sFB8gsf4-Af5XDLq7TR_S4fK3ONlok_53LQ8aChK6OSLPMcUKqMnUcpbSwo-_ncgk1pclBG8EgOMpITIxBF51rss7nBX5MuLBniGtSfZWpSLlFpveq2cr8d9UuGxRTq_7UN1gPhvJN935DUOfACBHa-T6B_Q0ZuOcwIunPtqd4VMmb8qs3ZDmAlU6oOd2EJ17yDx53ftuEi5LCSCeBatiFQ-b1pfQPyII-u4gwIGFm-oy3iyUgiHgSocLFNalpugJWWmSNbyZW6FF-Ql_UZwkvyfembEPhJ9olwtT9qWHK_bVy68Cap9Lkjrytxr9PwPHUxiJoZUELNpUcVjR0x1BNLDO2rhGiSKqYp_SDfPaTmUKx-ugQ9I1OCk90T0FR7EHFCYzw34yVJKL-DF9CjKca_D2fSQy59Hpr1RatGDr4JB376T4UWu9yo3t-s4u-ExPiQNBm7NgVycGNAlI8AhldGrwGgcrAhJ1Dek0PWtdDeswLElAiC-OJkjoNxX4tl5g06sx58Vw_Hv6HE17EyA0FI-gkcUFcBtH6G_nSMAgswnJD2ET4KKn_VTpOQPCSqe6r0nzvbIrEmS4s9EMsahcyyU9hI6FFkXsi3AS7q3dUarsDWtyCpgFSY-GJ2MV8bVoZZlGqta4oOJc8V4ZWQIvEHDTHyglSvjlcqHXkruxkni82OTcc0hPq-VJtSTiOVpPkE-Hh-Lj0465Nr5YvF8_ARyNA0E6dhIfHx8wiEtnldHtHMnkpKTLtodiU-MjbjtlqeKqnYCMdmzgjY-ORYfKzq0U1NquXgSrUxhdZoeOzda-ckhkyMgb3CVkz0CvBo5kVMeSi4cX4cSL42JJozqrYeQH9_rQxoxxx5SsRMQSRqFKg-pkC-vQ8oXWiRlFF-BEjzA1RxRl7WK2q5ZzEHgRClelvQK9-BGz06CBxcbiq2YejmWwIuIh2J1DZw2_Bn7DK_0vRazqlodxEACHk2t3L6hlFVzVaGWr8WuNT4H-qba-INh1GUVptFeqcYSdDfyUKzdLKuWNsMvHHY-Ad9LM1NGu2HFEvGpKaojlvgsdgN-jk-dHT83PgFInJiYOjcxOTEUW8evxs7GJ89NTcXHJiZGxicmPx-KfUqtjp-Nj8RHRgG7kxPnp8amxoZiGphuhrnI74ymq6M__3_cfk6I)

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
 W_INTENT["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Верификация намерения</b><br/>• Цель, факты, допущения и границы<br/>• Уточнения перед началом новой темы<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#32-верификация-намерения' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_START{"Нужно сформировать<br/>цель и карту этапов?"}:::decision
 W_ZERO["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage 0 · собрать замысел</b><br/>• Идея, цель, границы и риски<br/>• Определение проекта и карта этапов<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#3-stage-0-и-старт-работы' target='_blank'>Stage Plan</a></div></div>"]:::web
 end
 subgraph W_STAGE["РАБОЧИЙ STAGE · вопросы и решения"]
 direction TB
 W_FRAME["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage X.0 · рамка этапа</b><br/>• Выбрать Stage и сверить намерение<br/>• Цель, границы и вопросы этапа<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#4-рабочий-порядок' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_STEP["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Step · один текущий вопрос</b><br/>• Перед обсуждением сверить намерение<br/>• Варианты, ограничения и основания<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#32-верификация-намерения' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_LOOP["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Step-loop · уточнение</b><br/>• Разобрать детали и противоречия<br/>• Продолжать до закрытия вопроса<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#4-рабочий-порядок' target='_blank'>Stage Plan</a></div></div>"]:::web
 W_GATE{"Gate · условие<br/>закрытия Step выполнено?"}:::decision
 W_MORE{"Остались вопросы<br/>текущего Stage?"}:::decision
 W_DG{"Decision gate<br/>Какое решение принять?"}:::decision
 W_MATURITY["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Зрелость архитектурного решения</b><br/>• Статусы: N/A / Existing / Exploring / Proposed / Assessed / Approved<br/>• Состояние решения отслеживается в течение Stage<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#63-architecture' target='_blank'>Stage Plan</a></div></div>"]:::infra
 W_FOUNDATION["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage 1 · для нового проекта</b><br/>• Принятый каркас репозитория и проектный AGENTS<br/>• Создание через обычную OPS-задачу<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#33-stage-1--repo-foundation' target='_blank'>Stage Plan</a></div></div>"]:::infra
 end
 subgraph W_PREP["ПЕРЕДАЧА · ограниченное поручение"]
 direction TB
 W_AUDIT["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Необязательный Codex Audit</b><br/>• Отдельная задача без изменения продукта<br/>• Проверить репозиторий, границы задачи или риски<br/>• После Review вернуться в Decision gate<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#4-рабочий-порядок' target='_blank'>Stage Plan</a></div></div>"]:::transfer
 W_ACCEPT["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Принятый контракт</b><br/>• Согласовать смысл, границы задачи и результат<br/>• Зафиксировать допустимые изменения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#6-как-chatgpt-собирает-задачу-codex' target='_blank'>OPS</a></div></div>"]:::transfer
 W_NEED{"Нужна работа<br/>Codex?"}:::decision
 W_SHAPE{"Task Shape Router<br/>TS-A или TS-B?"}:::decision
 W_TSA["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>TS-A · самостоятельный Task</b><br/>• Полная постановка внутри OPS Task<br/>• Границы задачи, ограничения и проверки<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#63-принцип-сборки' target='_blank'>OPS</a></div></div>"]:::transfer
 W_BRIEF["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>TS-B · сначала Stage Brief</b><br/>• Подробный принятый контракт<br/>• docs/codex/stage_briefs/<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#authoring-order-и-loading-order' target='_blank'>OPS</a></div></div>"]:::transfer
 W_TSB["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Затем brief-backed OPS Task</b><br/>• Управляющее задание с точной ссылкой<br/>• docs/codex/tasks/<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#authoring-order-и-loading-order' target='_blank'>OPS</a></div></div>"]:::transfer
 W_PLACE["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Разместить и проверить файлы</b><br/>• Размещение артефактов через PowerShell<br/>• Отдельный Fixed Launch Prompt с точным путём OPS Task<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#64-fixed-launch-prompt' target='_blank'>OPS</a></div></div>"]:::transfer
 W_A["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>A · задание в репозиторий</b><br/>• Последовательный вход Codex<br/>• Продолжение на второй схеме<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#repo-v1-new' target='_top'>К локальной схеме</a></div></div>"]:::repo
 end
 subgraph W_RETURN["ВОЗВРАТ · Review, исправления и завершение"]
 direction TB
 W_B["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>B · результат Codex</b><br/>Изменения и проверяемый handoff либо отчёт и подтверждения для read-only-задачи<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#repo-v1-new' target='_top'>К локальной схеме</a></div></div>"]:::repo
 W_REVIEW["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Review относительно задания</b><br/>• Task / Brief и фактический кандидат<br/>• Diff, отчёт, проверки и риски<br/>• У каждого замечания явный исход<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#72-review-findings-disposition' target='_blank'>Stage Plan</a></div></div>"]:::review
 W_VERDICT{"Решение специалиста<br/>по результату Review"}:::decision
 W_FIX["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Ограниченный Fix</b><br/>• Исправить реализацию в рамках прежнего контракта<br/>• Новый кандидат и повторный Review<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#72-review-findings-disposition' target='_blank'>Stage Plan</a></div></div>"]:::review
 W_CLOSURE["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Подготовить завершение</b><br/>• Оценить влияние на документацию и AGENTS<br/>• Согласованные обновления, архив и очистка<br/>• Проверить итоговое состояние репозитория<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#76-завершение-stage' target='_blank'>Stage Plan</a></div></div>"]:::repo
 W_CHANGED{"Есть изменения<br/>репозитория?"}:::decision
 W_FINAL["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Финальный staged handoff</b><br/>• Согласованный набор файлов, подготовленный к коммиту<br/>• Финальный diff, status, stat и проверки<br/>• После всех действий по завершению<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#71-repo-change-handoff' target='_blank'>Stage Plan</a></div></div>"]:::repo
 W_FINAL_OK{"Финальная приёмка<br/>специалистом"}:::decision
 W_COMMIT["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Commit и оговорённый Remote Sync</b><br/>• Проверить SHA и итоговое состояние репозитория<br/>• При необходимости выполнить push и сверить локальный и удалённый SHA<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#76-завершение-stage' target='_blank'>Stage Plan</a></div></div>"]:::repo
 W_CLOSED["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Stage закрыт</b><br/>• Итоги и точка продолжения сохранены<br/>• Перейти к следующему Stage<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#76-завершение-stage' target='_blank'>Stage Plan</a></div></div>"]:::web
 end
 subgraph W_MEMORY["LIBRARY · память управляющего веб-чата"]
 direction TB
 W_SYNC["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Сохранить значимое состояние</b><br/>• Решения<br/>• Результаты<br/>• Замечания<br/>• Точка продолжения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#8-synchronization-model' target='_blank'>Working State</a></div></div>"]:::memory
 subgraph W_OWNERS["Четыре владельца"]
 direction TB
 W_PD["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>PROJECT_DEFINITION.md</b><br/>• Что строим и для кого<br/>• Требования и границы<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#53-project_definitionmd' target='_blank'>Working State</a></div></div>"]:::memory
 W_ARCH["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>ARCHITECTURE.md</b><br/>• Принятые решения и контракты<br/>• Ответственность компонентов<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#54-architecturemd' target='_blank'>Working State</a></div></div>"]:::memory
 W_PLAN["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>STAGE_PLAN.md</b><br/>• Карта этапов и их состояние<br/>• Переходы и значимые итоги<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#52-stage_planmd' target='_blank'>Working State</a></div></div>"]:::memory
 W_OM["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>OPERATION_MEMORY.md</b><br/>• Текущий вопрос и рабочие факты<br/>• Замечания и точка продолжения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#51-operation_memorymd' target='_blank'>Working State</a></div></div>"]:::memory
 W_PD ~~~ W_PLAN
 W_ARCH ~~~ W_OM
 end
 W_BASE["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Проверенная база и кандидат</b><br/>• Полностью прочитать текущую версию файла<br/>• Проверенное зеркало /tmp и точечный diff<br/>• Потерянный /tmp восстановить из Library<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#10-safe-library-mutation' target='_blank'>Working State</a></div></div>"]:::memory
 W_PUBLISH["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Безопасное обновление Library</b><br/>• Повторно сверить актуальность базы<br/>• Опубликовать и точно проверить новую версию<br/>• Только затем убрать предыдущую версию<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#10-safe-library-mutation' target='_blank'>Working State</a></div></div>"]:::memory
 W_ORDER["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>При обновлении нескольких файлов</b><br/>• Сначала профильные владельцы<br/>• OPERATION_MEMORY — в последнюю очередь<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#9-multi-file-state-changes' target='_blank'>Working State</a></div></div>"]:::memory
 W_TRANSFER["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Пакет переноса при смене чата</b><br/>• Текущая позиция, ссылки и вопросы<br/>• Доступ к сохранённым владельцам<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#12-recovery-and-new-chat-continuation' target='_blank'>Working State</a></div></div>"]:::memory
 W_RECOVER["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Новый чат · восстановление контекста</b><br/>• Подтвердить пространство проекта<br/>• Прочитать OM, Stage Plan, Definition и Architecture<br/>• Сверить новый ввод и свежие факты<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#12-recovery-and-new-chat-continuation' target='_blank'>Working State</a></div></div>"]:::memory
 W_RESUME["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Вернуться в рабочую точку</b><br/>• Сверить намерение и текущую позицию<br/>• Продолжить открытый вопрос или Review либо перейти к следующему Stage<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Command_Center_Working_State_Protocol.md#12-recovery-and-new-chat-continuation' target='_blank'>Working State</a></div></div>"]:::memory
 end
 subgraph W_EXTRA["ПО НЕОБХОДИМОСТИ · связанные инструменты"]
 direction LR
 W_HELPER["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>ChatGPT Helper</b><br/>Работа с веб-интерфейсом ChatGPT<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/chatgpt-helper' target='_blank'>Проект</a></div></div>"]:::infra
 W_HUB["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Reviewer Hub</b><br/>Отдельный рецензент с проектной памятью<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/reviewer-hub' target='_blank'>Проект</a></div></div>"]:::infra
 W_CHAT_SKILLS["<div style='width:240px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Chat Skills</b><br/>Внешняя библиотека процедур управляющего чата</div>"]:::infra
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

### Локальный Codex · [Веб-редактор 2](https://mermaid.live/edit#pako:eNrdXG1z20aS_iso-oO_EBJFUm9M4itaor2q0KJKpBPfna5YEDkUUSIJFgBadt7Kstbx3tkV2Um2LpVdy5ds3berWlmWYsp6q9pfAP6F_JLr7hkAAwKSHCWUlP1gmQBmBjPdPd1Pvww-jVWMKotlYqqqLrQqRqumL2UWWorS0O4bHTujsMYyXRrGckapNDTL0it4A-5TO0Vpm8xi0LLK2nb9hm5aNr_fZOYSy1WXmJVRalrDYvx2C94319AqrMladrahL7XwR0aZLczmeItlxtq5lm3en4WmhVbJaGcU2-xQ_5rRsm9oTb1xP6NkTV1rxBVLa1mqxUy95jYo6p-wjDIyRtcNY6VS10w747--2NYqemspo6SS_KaptZa9m-kJsS6tWqUbI6JVVdeWTK05139_xdTabbjzsV616xklmUzw-1Zn8SY8qpd0u8FuaeaS3hKTUBQbFzXhXi0atm00oSv0JEZ4s1ZK16ERjLSEIylT5euFQunfF2LOX5wN53vnGfz_f84LZ0P5xxvFOXIOe6vOnrPjbDuHzpaz2XsIv_d6T52D3hNnV3G2eo_gwbYyBUS4txD7Dxi6qpusYutGi79pqpyF0d-v6ncVy77fYB9cXaFVJROJ9r33bHbPVjXkWabBavZ7K3XdZqoFlGOZlmE2tcZ7xl1m4uxVpEpGa91fqTOTXb32_uK1LJ9k74HThQmtw-QOnR0-6we9td5jmOsBPNp5f3gRmpvD135-8KOS1zqtSl2ZM41m21Z6a85bZ9N5A8uB5Tk7vYcKDgN9-QoLc0WlpFnLXnfnB1j0OnR4qvRW8V078PotePEuXAM1dpx9vKD28qqllZr6Ut2GBWhK3WS1D67WbbttZYaHl3S73lkcqhjN4Y-WO3ehcWsYLppaq6pWQKSZqbY7iw29MrzYMBaHmxo8n5vPFXOzpWxppjA71KxeWWGL6t0RtcVWrio2SAizP7haBtm4es35HtgF03ulevMEwmjX3h-GWYq_wMFMJmOD9Fo1ZnLu3YThiwNj4ciQ4rwECgLjnLdAeU51_lJYT4BzQHoQR2LPOmcsZ77bdzPOrzdhnV2Q2k3F6Srw9DXdgw6uRPTWvTGvG4ZtwYLb1NZv-WXvCQkSDHMAf_dJJLrnx1ePAldSKihRekvD0FBPqGanwSyJvYsN0DZXr_Eu0Sw1WdsgdpayxQ8HxszkkDLT0m1Qov6-kRlYKqrZDGwT2jVfApX_CCSF7Ue_11E8D2DbPsT9HNx00PF6hm5h70PcaasgKHvQGTcesGhTuW7qrOb1qBoVaxgt0b1hG7pZw-fFOFh4eQoYkZsvTxWmc3fKc_OFUmGqkEdejqmkbd6qoIrtpbat4mqcV7D6B1z5qM4b-LENJHncW1Np_mFGwytO4fJ84XYpV57N5aZz05-Cbv9vd1CgE9EX1ABoPnghkQU02hOYxSHOQgFZ3wT1-SdSobCp_mUh9jmMXWUV3QKt7o8_PzA5Sg0pJtMso4XS3tZsIHTL6lcFm84-t0F7vefOa6BrFy-2hYrYDGjx4JoCCoXbOOyBWgOI8xRbA2VApayFiIE6Xxp5HxUOSuxz-AnSvOnsot45L1kb0pbgiTVsLeuNhjUcptlw8cOZPEpeWIiiCHyyTOWy05zxA-N7GozBBrAQrLnCZVLoY85FE_AjU10yB-WBbAiqaM57tM7IUjQLXc7JwHhoFUCP9LPXH-9baIe4xzMxW2TohYAc0RbaJkREN_tRkdhOl08QrnAi1vQGUwFmG40OQjUyKb-BjEwXPp4tlkBSbg1MRkYRMCDmJK68QlbS9gXrLVSnsPCyeBRtIBC3EKgi9sDYoElRfn7wrQRypR18kmTgLZAegh_YBphPHUHWek_iHqL0BBeabQUm53QvhTHSOnbdMJG7hlmF3k7XQxh04yyGZ6owe2Nm_pZkc1yg1u3DZkQCMn-v8ZJ-IQIHikVZnGKpMDcwmXI2hAU4oEnQJoc76zRrvvE5MHmqENQnjdBbDWqg7-HBAQjCHimchwphkwOytpsePJUApuKbenwNEiVII3_oF9wBE4btq95_cpJuyyLWdbXSETpC1HTLQ7oXLWojKdUCJwSRbFVHhWP9IuG6q7MVkALWqgZdV7JG6JvkEz8_-CY_Su5gYOMiikdY81oI4hsONoFaRGdU0tDmGMc1nxiYxOUTrusKrsw-d1u3gXm7LuMkp1XYNs58kMk9aI4ahgwOv-VL0rlhDwlge2ZiOJ8ocypGQo584hTtkR8ZHMFHiOBvSRoOEd1xvHiEysc58ImNe-0V-n2gAv4Uoi7hv3VQVoT-UIygDUnX_vlp9WjSj5SbesU0ym0gdjT5R04jf3Jw5E-KeBJRm7QVoSbchXxDSuJ-fNCJ-EFabpP07BvJd1SijAnyqfcooHfh8aOL5VSSeFQG-pkaKcNodiVPY1dqcOxKEbsOgNBvhGO0CuTe56ZGBsRvZc49A-yzjYyNK_OktBVX0b7heFghtLxKpnHrYpmQKlusUSuDRbJ0y2atyv1oLqRO40J6cFxIIxdA8XNIcOCGMxXX7yC49JBoKfHgQe-RcEkQka4ReCG-kckQu-6AtlUXXRWxGx8Fwr3nDyCi2ZQuW3WtAfQp2yZjZaNWBtDagbces2nSp7FrdHDs4vgDNBBsg1dkpA85s3aIlnuR4Wjnfyj8DDoNMMtzH88dCTt1SGw6Emxyx-r6_f9OooFvilSAAnzn7rHKHNDoYrk5Wq4y1n5HVo6exsqE8sUXX5AiFOjBvU4Lc-Zej0aBx9yd3BTmPb5zfgCTs-H8BUz_n-Hfd86faduhjtv2fXvSWggZTkp1zN_O5wYXKx9zXV-YyR64AY_dcAQ4J85PQcH5kjYxbP7ek6AnTBEC2uoK6IlNzzvZQcCsUDxMtsqBAIsfWHfFyfWm0RXv_ReGwUgWdz1_Zhv_kww45UlCBvz8sJMfV9fuanpDW6Q4SNtQrYrRZlWVR1DOGFwH77eUu1MamACMgwC8kHmNAOkt3NhH1cK9nS53PLeDSuZHjmjxkUIqhYdN1smV3OW-7lsZ6e54_ivZkVU5avoyFBBzOSpYzFVRX6qGO6fw9A0JxCF1Xv-951NQi8zls7MD47m301An8WSr5J_QVpPiCEGufxNMZ0nt4i6Ke02WZ7W3Gudy8RY1BpocHv3gdimUNZO0O0JZkV2hd27wmBzaOwpEPPV0Dcbs1hTCf25iTR73HMOkyDCSBQbExQXweGjDqBAeD4uCZz0jhaHJmoZ5n8ThVmE6h8Gv_w1qVg7N-vLSvfWozEouO12Yzf_rwORpnmlV1Wg17iskGkINK8MYyxToPShE36F0BN0x3PFexFOICYf1ksHA-N8R3obWGGcloOrpIJRFbqm4dInIOYZjHveeC21z_pFzrVPVbSLPCakTv9EpyuHj-ZkBZkuQM95OEno42gVe632lyInFcOByO66QpK56RqTPtPiO9pHLPjfU_pU_1HNXMdErpRDbGoeuIlAfTsl74ZTHOHXosO4FVLhWgY6YlXssxK9fe7m6CpD0mvBysOGTy5H1TalekQqCnSNM-_J0K-yYs4TZP8rmZ6azg5StsI2nmOMBZee2yXncjMjA-VEBLiiUsg_F_nneVCrckL2hEA-DAYdDxCliwC7VZBz4TTAZK0cX_FSxG7X3JsiLQ9AEIXR9xMG-CMWSJG3BDL4SYOoCU7oYRqFCAD-Fl1ZxCM0Go6OuGOYy8jAqeed1PSWuPlW-MXMHrRbHlrAflRv6vUA5Bs_WcCy4BqBxh6dPAxm3qLTNH7Kz04UbNwZozdqGUqlrrSWmwN-qUav9Agj0iufpQiEWgX0CFQQHQpc9UMhtIbUoHPpd73WWrdkdC4PEnZZtapVlVo2Dl1irxekRjopXiqpW6qyyfOzmiaMm3xKu3mZcsq8Xn-ihXGoZ0VB5zjRso2I0UCjHR7gfxZmhCmaExZKnYo8HU4His_ncXGF-cP5UWNtg3YkLj46F1V9TsSDC2SdxXiS2TUxA5v1EaRxPhsIKJgrn9EFqpKNpy6D6Oc6TQ2fcf6uC6ztSKYMgOBUl9gmoZEwvQoPhYoD4uo0hIE-JiQoEenjXooIocRmlyuQx3kFurg9MZK6L2FC_3DhbyhQnjDJFhOkvVxIlbxxwI__c2tEdErLneCNUTUCVA6Jok6CPNyKPr8e5opZyx12KwZB5w6K46PrUnX-S6tRQTI-kCwNw4wr_6VYxSzGzTRz8mFDZMWG94ocnFD6NTI7-aqk6odrN-auczw7ZJa8a6p-o5Exv1UzNJXz29vRMaWCEl105l-Ahh9eNor8SWjjS_P9OfdUAredzH83kPh6glEuINFDcIKNyAbhdrHSJgPcZMHaAvKVccXCSjMaRqTazbEl3_Oi79FsiERvMNF1gbryP4NL8TyB4YJWnEny6MFUcGMERsKmdNvhhkjT_EBV_4VUkxwRULojc0uxPIHdgje-gPo5F67-N-giiQInmvUdchr0E6m4gunm5oO_Z8G3QKB5_KOe3oDQgKlqJisXCAVq_7A9hI6hcI0f6tSvXGN3piowgGdGuVLoQhs7nWQrSx6D-dZ7AojBJTt8OCBlFClooowCo8R_xjRO0wv5TzuwouHvrdr40gznsv-KJPecb-PcM_mIW-0f498z5OwbUnoH7uAE3nrlgODLsxWOzxwDg6ZniXLY09YdBeuLR2XZfsLCy4pCLC7aLjCK_y_k_6YSBX8obD539Chbnyjn23RNSoxtRh83EdviJR06F-7EbsRWC8e7t4KGCI7cC2YsdUEXxDmFVb4Lwysu2ma5UdRADu1JXm4CTzrq1ROxbkv65QiGPwv-1e7DDyzaCO8fTjZTfRowTUckGt0O6C2TruEOsgzvtpJkVbF-xOyYrE143QtEDrPntihQt1QAFI0AE8p6GjzBGFwCA9Dz0tsZ5CQsPbQmRiVrykG00G2HpKBVu5U870zg43iDSjObJS4JzIlkuCvDJQaQSGsR_Pl_c1FowL3G5WCKv9OysmB4cKxCLRrPi2-NSld3IWuHLygF5gWfnwNTgOICzLXOXtz---aJfv3JLfCCy_Jty-WO4gFjK_h3yakZFAJMDydwpyCUvM3cxPAqQ4OxMys4LeDc9LzSYuJ6a93AelZMVC4NO9L4L8ApA-d46fSWB2C1S8hEn7qISyCdmSkSZ-GHAlIsa2C5CNQpcPA5uYMn1c1_S5cNSCZN7vJyqzcTZvD6ksOU-DKZ3_FZeQfSaOHi1K858UGy-L3YSTBpdNhyGte5GQ68eU-T0rjjMyxrnc7PFAZa7olIR2XxPSUcANuWXqCUe949QS1TZcpxa-hsvfviJYjivaR4kkc8jfA2RoA1j9VNqHKL22LE1yD4FLp2QNTsNW1drRqVjUVxU5Zz5tR51yPedmb0xj1-WAeu_EVW_HXVMDin7R9rZiMvwGK97QmKzH_bnuWKeys8MTL7nDJDXYp01Gsqw0qCv0vTJ75TJNJvF3Y9q6J_A79sUjcs2GkEo6ue3ZDk89Isx-60vr7w5x9iLVTH1NplQud1Q2xoJy4ZPmtPiLLeys9mbuekBHg2GfcnP27qpNr_cyK1eCuicv_mqBbexq3NeCYHsio_beB3EzgIZ4FADfniJskBZrZgGLMQwmRpxmvpCmXglP5keVfOTE5O_hp03b2fnB8rMI0rCH_LYsBdcudnRzL5vDX1N3lvoWDhCiCj-ysLBT_sTVH3Nc_2EgR70H0oMCJFIvEjlHlhPoFPNULtj1X_P29QFtFlFVa9535SSPi8l7uPHibyvFIl78qdsQt-2wTafkQ0ABf6Z92GaY9shonjIW_qfqpC-aOO-0_vUSeDZkBKONgk3ZSGmDPnTLfZ9MEUM2_dK_1I8Fx9PkD-k4E78ZQA6b3NZFEvGM0fRfXZ4eSyFd-mrP9iLB_IDp-RDtOsbqe_TBrw5fpHB-zSDWIF0CkqQ6yXVve4L60N7RRTDh2svBAl55YY8kksdPFwTesO3kQeQeMFixEEj7zXuyY3AMQ4-5pxpLJnMshS38DFwCsIbgcq75YM_YqZ4CMA7DeDSkO_p6Bl9JhX-hzpK5wMJ8nFPJVzjxYfx5-QO6Mm0l2OgNuK2W0kcKCsWz27M3HGrQ6WNlgl92cJn6A6GyBGh9k9GGkLag6I6tO_dxNX-r2n0Vvlb-j-qcejs-4LjSqQYNyiUtP7ALY9r9Ea_-JV8zkD0nb9byih673QzI1FreBGIyEeepuYj82Ku6DHdCzFzDHrTffzh7ww3TtAfN3B3ofeJG3kRWGQBHo2Qp_CxHG9CnkCfOHKU-xQuGvcGdaWLe5FiuI3wtzqEv2-eQCNA6e7W43DQxxKu1o625v4KpX7it79AmLqfetoTMfdNMS-qHaYaPm8wz7zR102nWU1ZYYtKDRynzJWRiWQtrcUt2zSWWebK-OhispaIV4yGYWausGotXau9J_fkZ4vczmOpiSTzOo-xyrh2Ume3VE50TydTyZEJrzsbW1wcS57QHcNVomsqkUynx72ui2Nago2e2JWO_4v3JpLjqYT_3urkosZO6EywQfRNTqSSqUWv7-SkVl08qa9bfe69OjU6Ujt1yQSpxLdQXVongFWJE1csdeRm_0xd0fScqaOocIzsGkUnqSsljqN7RnFH6klq5yyzJX_9F00W0OpykXpXWU3rNGzFe9V4JVl1-6ui7mFoAvyDWDy2ZOrVWAY_7xuPNRm4BHgZ-xS_jLsQs-usyRZiGfhpsmrnnlrVzGWV3rwQW2h9Dv3bWuvfDKPpDmHiEfVYhr43HI_xWphp_t1erwngW2ZOGZ2WHcukYJvgGLHMp7F7sYw6Pj4-NJoeTU1Mjk2OpRLp0XjsfiwzMp4eSk6MTqbHJ5JjyXRiPP15PPYJvRYeJJKJkRS0TydHUhMwHKOcwC3-XWX6vPLn_w_sAAQq)

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
 C_A["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>A · принятое поручение</b><br/>• Launch Prompt указывает точный OPS Task<br/>• Связь с первой схемой<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#web-v1-new' target='_top'>К веб-схеме</a></div></div>"]:::transfer
 C_AGENTS["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>1. Проектный AGENTS.md</b><br/>• Состояние проекта, правила и ограничения<br/>• Bootstrap и границы полномочий<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/AGENTS.md#3-context-loading-rules' target='_blank'>AGENTS</a></div></div>"]:::repo
 C_TASK["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>2. Initial OPS Task</b><br/>• TS-A: спецификация внутри Task<br/>• TS-B: Task со ссылкой на Brief<br/>• docs/codex/tasks/<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#6-как-chatgpt-собирает-задачу-codex' target='_blank'>OPS</a></div></div>"]:::repo
 C_ROUTE_NEEDED{"Задача требует<br/>выбора маршрута?"}:::decision
 C_ROUTER["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>3. reasoning-patterns</b><br/>• Самый лёгкий достаточный маршрут<br/>• Сопоставить метку маршрута с точным путём файла<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/reasoning-patterns/SKILL.md' target='_blank'>reasoning-patterns</a></div></div>"]:::repo
 C_READ_ROUTE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>4. Один выбранный route-файл</b><br/>• Прочитать тактику выбранного маршрута<br/>• Далее проверить предварительный выбор<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/reasoning-patterns/SKILL.md#route-file-resolution-rule' target='_blank'>reasoning-patterns</a></div></div>"]:::repo
 C_DOWNSTREAM["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>5. Подробности задания</b><br/>• Stage Brief для TS-B — после файла маршрута<br/>• Другие артефакты, указанные в задании<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#authoring-order-и-loading-order' target='_blank'>OPS</a></div></div>"]:::repo
 C_CONFIRM{"Задание и правила<br/>согласованы?"}:::decision
 C_STOP["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Остановиться и вернуть вопрос</b><br/>• Конфликт контракта, границ задачи или правил<br/>• Недостающие данные и препятствия<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#13-stop-conditions' target='_blank'>OPS</a></div></div>"]:::review
 end
 subgraph C_ROUTES["L0–L5 · маршруты организации работы"]
 direction TB
 C_L0["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L0 · прямое действие</b><br/>Простая локальная задача<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L0_direct.md' target='_blank'>L0</a></div></div>"]:::repo
 C_L1["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L1 · короткий план</b><br/>Небольшая задача с ясными шагами<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L1_micro_plan.md' target='_blank'>L1</a></div></div>"]:::repo
 C_L2["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L2 · план и итерации</b><br/>Последовательная реализация в согласованных границах<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L2_plan_iterations.md' target='_blank'>L2</a></div></div>"]:::repo
 C_L3["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L3 · независимые проверки</b><br/>Аудит, Review и разбор рисков<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L3_self_consistency.md' target='_blank'>L3</a></div></div>"]:::repo
 C_L4["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L4 · сравнение вариантов</b><br/>Архитектурные альтернативы и их последствия<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L4_shallow_tree_of_thoughts.md' target='_blank'>L4</a></div></div>"]:::repo
 C_L5["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>L5 · глубокое ветвление</b><br/>• Разрешённые прототипы и ветви<br/>• Явное согласование и ExecPlan<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/docs/codex/reasoning/L5_deep_tree_of_thoughts.md' target='_blank'>L5</a></div></div>"]:::repo
 C_L0 ~~~ C_L3
 C_L1 ~~~ C_L4
 C_L2 ~~~ C_L5
 end
 subgraph C_EXEC["ИСПОЛНЕНИЕ · родительский Codex"]
 direction TB
 C_RULES["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>6. Подключить нужные процедуры</b><br/>• Skills по характеру операции<br/>• Правила ExecPlan для объёмной или длительной реализации<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/AGENTS.md#available-repo-scoped-skills' target='_blank'>AGENTS</a></div></div>"]:::repo
 C_CONTEXT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>7. Нужные документы и код</b><br/>• Только относящийся к задаче контекст<br/>• Проверить реальное состояние репозитория<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/AGENTS.md#3-context-loading-rules' target='_blank'>AGENTS</a></div></div>"]:::repo
 C_EXECPLAN["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>ExecPlan · ход большой задачи</b><br/>• Границы задачи, прогресс, открытия и решения<br/>• docs/codex/plans/<br/>• Обновлять по ходу исполнения<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/PLANS.md#execplan-file-location' target='_blank'>ExecPlan</a></div></div>"]:::memory
 C_MODE{"Характер<br/>поручения"}:::decision
 C_READONLY["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Read-only анализ / аудит</b><br/>• Исследовать факты и риски<br/>• Запись — только запрошенный отчёт<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/audit-only/SKILL.md' target='_blank'>audit-only</a></div></div>"]:::repo
 C_WRITE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Исполнить согласованную задачу</b><br/>• Код, тесты и документация по заданию<br/>• Большую работу вести ограниченными частями<br/>• Отмечать прогресс и результаты<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/OPS_CENTER_CODEX_PROTOCOL.md#63-принцип-сборки' target='_blank'>OPS</a></div></div>"]:::repo
 C_VALIDATE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Проверить кандидата</b><br/>• Проверки по Task и правилам проекта<br/>• Результаты проверок и причины пропусков<br/>• Самопроверка и необходимое ревью кода<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/review-code/SKILL.md#4-mandatory-workflow' target='_blank'>review-code</a></div></div>"]:::review
 C_FIX{"Нужен Fix внутри<br/>текущего задания?"}:::decision
 C_HANDOFF["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Repo change handoff</b><br/>• Границы задачи, база сравнения и точный набор изменений<br/>• status с untracked, diff, stat и diff --check<br/>• Проверки, сводка, риски и препятствия<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/Stage_Plan_Protocol.md#71-repo-change-handoff' target='_blank'>Stage Plan</a></div></div>"]:::transfer
 C_REPORT["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Результат read-only задачи</b><br/>• Выводы, подтверждения и необходимый отчёт<br/>• docs/codex/reports/<br/>• Без искусственного handoff с изменениями<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/report-writing/SKILL.md#file-report-vs-chat-report' target='_blank'>report-writing</a></div></div>"]:::transfer
 C_B["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>B · результат в Command Center</b><br/>• Специалист передаёт артефакты в веб-чат<br/>• Review, Fix или приёмка на первой схеме<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/PRESENTATION.md#web-v1-new' target='_top'>К веб-схеме</a></div></div>"]:::transfer
 end
 subgraph C_SKILLS["7 SKILLS · подключаемые процедуры"]
 direction TB
 C_SK_ROUTE["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>reasoning-patterns</b><br/>Маршрут и точный файл<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/reasoning-patterns/SKILL.md' target='_blank'>reasoning-patterns</a></div></div>"]:::infra
 C_SK_AUDIT["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>audit-only</b><br/>Исследование без изменений<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/audit-only/SKILL.md' target='_blank'>audit-only</a></div></div>"]:::infra
 C_SK_REVIEW["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>review-code</b><br/>Проверка кода и diff<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/review-code/SKILL.md' target='_blank'>review-code</a></div></div>"]:::infra
 C_SK_TEST["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>write-tests</b><br/>Тесты в разрешённых границах<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/write-tests/SKILL.md' target='_blank'>write-tests</a></div></div>"]:::infra
 C_SK_DOCS["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>docs-update</b><br/>Согласованная документация<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/docs-update/SKILL.md' target='_blank'>docs-update</a></div></div>"]:::infra
 C_SK_REPORT["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>report-writing</b><br/>Сохранённый анализ<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/report-writing/SKILL.md' target='_blank'>report-writing</a></div></div>"]:::infra
 C_SK_AGENTS["<div style='width:195px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>subagent-routing</b><br/>Поручения субагентам и объединение результатов<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md' target='_blank'>subagent-routing</a></div></div>"]:::infra
 C_SK_ROUTE ~~~ C_SK_DOCS
 C_SK_AUDIT ~~~ C_SK_REPORT
 C_SK_REVIEW ~~~ C_SK_AGENTS
 end
 subgraph C_MULTI["МНОГОАГЕНТНАЯ РАБОТА · по необходимости"]
 direction TB
 C_DISPATCH["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Родительский агент готовит ограниченное поручение</b><br/>• Один вопрос, границы задачи и нужный контекст<br/>• Ограничения и ожидаемый результат<br/>• Отдельный путь отчёта, если нужен<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md#dispatch-mode' target='_blank'>subagent-routing</a></div></div>"]:::repo
 subgraph C_POOL["Выбрать подходящих независимых субагентов"]
 direction TB
 C_AR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>architecture_auditor</b><br/>• Слои, ответственность и границы<br/>• Только чтение<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/architecture_auditor.toml' target='_blank'>TOML</a></div></div>"]:::repo
 C_TR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>test_auditor</b><br/>• Покрытие и безопасность тестов<br/>• Только чтение<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/test_auditor.toml' target='_blank'>TOML</a></div></div>"]:::repo
 C_DR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>docs_auditor</b><br/>• Документация и реализация<br/>• Только чтение<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/docs_auditor.toml' target='_blank'>TOML</a></div></div>"]:::repo
 C_CR["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>code_reviewer</b><br/>• Независимое направление проверки<br/>• Ровно один отчёт о ревью<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.codex/agents/code_reviewer.toml' target='_blank'>TOML</a></div></div>"]:::repo
 C_AR ~~~ C_DR
 C_TR ~~~ C_CR
 end
 C_CONSOLIDATE["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Родительский агент объединяет замечания</b><br/>• Проверить подтверждения и разобрать противоречия<br/>• Сохранить идентификаторы, убрать повторы<br/>• Выбрать следующий шаг в границах задачи<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md#consolidation' target='_blank'>subagent-routing</a></div></div>"]:::review
 C_LENSES["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Несколько субагентов code_reviewer</b><br/>• Независимые направления проверки<br/>• У каждого своё поручение и путь отчёта<br/>• Результаты объединяет родительский агент<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/.agents/skills/subagent-routing/SKILL.md#multi-focus-code-review' target='_blank'>subagent-routing</a></div></div>"]:::infra
 end
 subgraph C_INFRA["ДОПОЛНЕНИЕ · локальная инфраструктура"]
 direction LR
 C_CLI["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>PowerShell / launcher</b><br/>• Create, Initialize, UpdateAll<br/>• Подключение и обновление проектов<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/scripts/command-center.ps1' target='_blank'>PowerShell</a></div></div>"]:::infra
 C_MANAGED["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Общие файлы проекта</b><br/>• Управляемые блоки AGENTS<br/>• .agents / .codex / reasoning<br/>• Общие ignore-правила<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/scripts/command-center.ps1#L945-L989' target='_blank'>PowerShell</a></div></div>"]:::infra
 C_GUARD["<div style='width:200px;text-align:left;white-space:normal;overflow-wrap:anywhere'><b>Опциональный Guard</b><br/>• Восстановить управляемые файлы в зарегистрированных проектах<br/>• Без Commit и push<br/><div style='text-align:right'><a href='https://github.com/Vkuvalin/command-center-public/blob/main/scripts/command-center.ps1' target='_blank'>PowerShell</a></div></div>"]:::infra
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

Stage 0 помогает сформировать замысел и верхнеуровневый план. В начале рабочего Stage уточняются вопросы этого этапа; каждый Step проходит обсуждение и собственную контрольную точку. Decision gate сводит решения завершённых Step, проверяет их совместимость и выбирает дальнейший путь. Для нового проекта подготовка каркаса репозитория относится к Stage 1 и проходит тот же процесс постановки и проверки.

Library сопровождает работу на всём пути. Сохранённые решения и состояние используются при продолжении; новый чат сверяет их с текущим вводом и свежими фактами. Актуальность кода при необходимости проверяется отдельным аудитом репозитория.

L0–L5 определяют организацию работы: прямое действие, план, итерации, независимые проверки или сравнение вариантов. Skills задают процедуры конкретных операций. Субагенты получают задачи с чёткими границами и возвращают результаты родительскому агенту Codex.

Создание задания и загрузка контекста имеют разный порядок: **управляющий веб-чат готовит Brief перед Task для TS-B; Codex читает Task, при необходимости выбирает маршрут и читает его файл, затем загружает Brief**. После чтения подробностей маршрут подтверждается, пересматривается либо работа останавливается при конфликте.

Локальная схема показывает процесс выполнения OPS-задачи; при прямом обращении к локальному агенту действуют правила соответствующего проекта.

<a id="artifacts"></a>

## Что передаётся и где сохраняется

| Артефакт | Место | Назначение |
|---|---|---|
| Определение проекта, архитектура, план этапов и оперативная память | ChatGPT Library, отдельное пространство проекта | Принятые основания и точка продолжения управляющего веб-чата |
| OPS Task | `docs/codex/tasks/` | Управляющее поручение, границы задачи, ограничения и ожидаемый результат |
| Stage Brief для TS-B | `docs/codex/stage_briefs/` | Подробный принятый контракт, на который ссылается Task |
| ExecPlan | `docs/codex/plans/`, когда требуется сохранённый план | Ход длительной локальной работы, прогресс, открытия и решения |
| Audit / Review report | `docs/codex/reports/`, когда требуется сохранённый отчёт | Выводы, замечания и основания для рассмотрения результата |
| Delta / финальный staged diff | `docs/codex/diff/` | Точный кандидат для соответствующего Review до Commit |
| Принятые изменения продукта | Код и постоянная документация репозитория; затем Git-история | Проверенная реализация и её зафиксированный состав |

Для задачи с изменениями пакет передачи результата (handoff) связывает **границы задачи, базу сравнения, фактический diff и выполненные проверки**. После Fix передаётся новый кандидат для повторной проверки. Финальный handoff с изменениями, подготовленными к коммиту, формируется после всех согласованных действий по завершению; специалист принимает именно это состояние перед Commit.

Для задачи без изменения продукта возвращаются результаты исследования и подтверждающие материалы. По каждому замечанию фиксируется результат рассмотрения: исправление, согласованный перенос, принятие риска или отклонение с обоснованием.

<a id="sources"></a>

## Исходные протоколы

<details>
<summary>Правила и ответственность файлов</summary>

| Источник | Ответственность |
|---|---|
| [Роль Command Center](Command_Center_Role.md) | Позиция управляющего инженерного чата |
| [Stage Plan Protocol](Stage_Plan_Protocol.md) | Stage / Step / Gate, Review / Fix и завершение |
| [OPS Protocol](OPS_CENTER_CODEX_PROTOCOL.md) | Создание задания, передача и анализ результата |
| [Working State Protocol](Command_Center_Working_State_Protocol.md) | Владельцы состояния в Library, обновление и восстановление |
| [Architecture Map](Architecture_Map.md) | Размещение артефактов и границы ответственности |
| [Architecture Reasoning Guide](Architecture_Reasoning_Guide.md) | Области архитектурного анализа |
| [AGENTS.md](AGENTS.md) | Шаблон проектного входа и обязательных локальных правил |

</details>

[README](README.md) · [Блочная компоновка](#version-v2) · [Прямые связи](#version-v1-new) · [Артефакты](#artifacts) · [Протоколы](#sources) · [К началу файла](#presentation-top)
