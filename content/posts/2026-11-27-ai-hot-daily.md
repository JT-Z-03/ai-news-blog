---
title: "AI 热点日报 | 2026年11月27日"
date: 2026-11-27T00:00:00+08:00
publishDate: 2026-11-27T08:07:21+08:00
lastmod: 2026-11-27T22:10:19+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-27
description: 2026年11月27日 AI HOT 滚动精选，关注 Karpathy 的交互地图、支付宝 SkillPay 实测、Antigravity 进度汇报技巧、Sage-Interaction 全双工模型，以及 MiniMax 转发请求的隐私调查进展。
aihot_ids: ["gc4qp85ij5qzhu53qzkg8quqj", "cdkswjz368inpelrz3f52rekx", "v5fxjqr2vapkk9vn1j9a8ke96", "tiqf353lek6sib8ktn8uvc6nc", "l9md8ugx8e2zlm5g1tuqthmaw"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 5 条。本次取材截止北京时间 11 月 27 日 22:05。

---

## 开发与研究

### 补充：Karpathy 用 Claude Code 将美国公开数据做成交互地图

Andrej Karpathy 于北京时间 11 月 26 日公开作品，AI HOT 于 27 日凌晨收录。按他的介绍，他用 Claude Code 桌面端和 Opus 5.5 将 31 个公开来源的数据整理到 25 公里尺度的六边形网格上，地图覆盖地形、经济产出和就业等信息。演示把统计数据转换成类似《文明》的地图指标，例如用金币产量代表 GDP。读者可以在 19 种专题视图间切换，也可以按县查看数据。

🔗 [Karpathy 发布原帖](https://x.com/karpathy/status/2125779541952246039) · [作者的交互地图](https://karpathy.ai/usaciv/)

### 在 Antigravity 中用 GEMINI.md 约定进度汇报

**11月27日 22:10 补充。** 数字生命卡兹克于北京时间 11 月 27 日分享了一条使用技巧。在 `GEMINI.md` 中约定，智能体开工前先简短说明，遇到新发现、变更方向或阻塞时再同步进度，连续执行数步也可报一次。Google 文档确认 Antigravity 会读取该文件作为工作区规则。

🔗 [数字生命卡兹克原帖](https://x.com/Khazix0918/status/2126294658431201385) · [Google Antigravity 官方文档](https://antigravity.google/docs/learn/prompting)

### 补充：InternLM 开放可边对话边处理后台任务的 Sage-Interaction

**11月27日 22:10 补充。** InternLM 于 11 月 23 日发布 Sage-Interaction，公开模型权重和实时语音演示。这个基于 MiniCPM-o 4.5 的 90 亿参数模型可持续处理音视频，在用户插话后继续对话。耗时任务交给后端执行，结果回来后再接入对话。OpenBMB 于 11 月 27 日点评这一项目，AI HOT 当晚收录其原帖。

🔗 [InternLM 发布说明](https://github.com/InternLM/Sage-Interaction) · [官方模型卡](https://huggingface.co/internlm/Sage-Interaction) · [OpenBMB 原帖](https://x.com/OpenBMB/status/2126308118741323853)

## 行业动态

### 数字生命卡兹克实测支付宝 SkillPay 的购买与上架

**11月27日 14:06 补充。** 数字生命卡兹克于 11 月 27 日发文，记录了在 Codex 中购买买断制和周期付费 Skill 的体验，也演示了创作者如何上传自制 Skill、提交审核并分享购买入口。支付宝官网说明，买断会交付 Skill 明文，周期付费只提供当期使用权且到期不自动续费。开发者提交的 Skill 须通过安全检测后才能上架。

🔗 [数字生命卡兹克原文](https://www.sohu.com/a/1106962934_121675819) · [支付宝 SkillPay 官方说明](https://skillpay.alipay.com/)

### 进展：Dragos 在推理服务隐私调查中点名 MiniMax

**11月27日 22:10 补充。** 继 [Dragos 公布推理服务链调查](/posts/ai-hot-2026-11-21/)后，该公司研究负责人 HD Moore 在路透社 11 月 26 日的报道中确认，MiniMax 是此前调查中未具名的开发商。MiniMax 11 月 24 日公告称，其安全系统曾记录并访问部分经转发的请求中的链接，涉及被标记为零数据留存的请求。公司表示已在确认涉及的企业流量路径上停用该流程并删除相关链接，在所核查的请求中未发现完整提示词或模型回复被披露给第三方的证据。Atlas Cloud 表示已停止向 MiniMax 官方 API 转发请求。AI HOT 于 11 月 27 日收录后续消息。

🔗 [路透社采访（Investing.com 刊载）](https://www.investing.com/news/economy-news/exclusivedata-from-chinese-ai-firm-minimax-accessed-by-unidentified-parties-researcher-says-5052087) · [MiniMax 官方说明](https://www.minimax.io/blog/update-on-url-access-in-forwarded-api-requests-20261124) · [Atlas Cloud 通报](https://www.atlascloud.ai/blog/ai-updates/security-and-privacy-commitment)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
