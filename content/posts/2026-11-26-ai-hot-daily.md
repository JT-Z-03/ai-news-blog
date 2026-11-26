---
title: "AI 热点日报 | 2026年11月26日"
date: 2026-11-26T00:00:00+08:00
publishDate: 2026-11-26T08:04:28+08:00
lastmod: 2026-11-26T08:04:28+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-26
description: 2026年11月26日 AI HOT 滚动精选，关注 Fireworks 接入混元 Hy4 Flash、Pydantic AI 发布 Pax、Anthropic 的 Rust 迁移验证，以及 Character.AI 出售中的用户数据争议。
aihot_ids: ["dvu6olan4q58k1evvnp8t60t2", "i5qr52169dlque8rb2sl4i5jo", "h1ja45355xx1xf9rqf89cv1if", "rnanzlnaqxdr2icjqw0qwv9la", "j0hoj1rlmltoft6okserijp25"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 4 条。本次取材截止北京时间 11 月 26 日 07:58。

---

## 模型与产品

### 进展：Fireworks 的无服务器 API 接入混元 Hy4 Flash

**迟到补充。** Fireworks 的上线公告标注 11 月 25 日，AI HOT 于北京时间 26 日收录。继[腾讯开放 Hy4 Flash 权重](/posts/ai-hot-2026-11-18/)后，Fireworks 将其接入按用量计费的 API，支持文本和图像输入。模型页列出的上下文上限约为 52.4 万 token。标准档每百万 token 的未缓存输入、缓存输入和输出价格分别为 0.07、0.003 和 0.281 美元。

🔗 [Fireworks 上线公告](https://fireworks.ai/blog/hy4-flash-on-fireworks) · [Fireworks 官方模型页](https://app.fireworks.ai/models/fireworks/hy4-flash) · [Fireworks 无服务器价格表](https://docs.fireworks.ai/serverless/pricing)

## 开发与研究

### 补充：Pydantic AI 发布终端编码智能体 Pax，Harness 进入公测

Pydantic AI 于北京时间 11 月 25 日 17:00 发布公告，AI HOT 于 26 日收录。Pax 基于 Pydantic AI Harness SDK，把编码、沙箱、MCP 和 Logfire 追踪做成可切换的插件。开发者也可以在同一套终端界面里加载自己代码库中的 Pydantic AI Agent。团队计划约一个月后发布 Harness 1.0。

🔗 [Pydantic AI 官方公告](https://pydantic.dev/articles/pax-harness-beta) · [Pax 官方文档](https://pydantic.dev/docs/ai/pax/)

### 补充：Anthropic 复盘如何验证 Messages API 的 Rust 迁移

Anthropic 的工程文章标注 11 月 25 日，AI HOT 于北京时间 26 日收录，并收录了平台工程负责人 Katelyn Lesse 的访谈。团队把新旧实现并行运行，在真实流量下对比请求处理结果，并将同一次模型输出回放给 Rust 实现以对比响应处理。迁移早期已有约 98% 的测试通过，实际流量中却只有约四分之一的输入处理结果一致。据团队公布的观测，迁移后单请求 CPU 用量在所测区域下降约 70%，所测 Claude Code 请求的首 token 中位耗时缩短约 20%。

🔗 [Anthropic 工程复盘](https://www.anthropic.com/research/migrating-api-to-rust) · [Katelyn Lesse 访谈原文](https://newsletter.pragmaticengineer.com/p/how-anthropic-builds-software-in)

## 行业动态

### 进展：美国多地总检察长反对 Character.AI 随平台出售私密聊天记录

**迟到补充。** 继[美国多地总检察长要求在 Character.AI 破产出售中保护用户数据](/posts/ai-hot-2026-10-15/)后，加州和伊利诺伊州总检察长办公室于美国当地 11 月 24 日披露，联盟已向破产法院提出异议，要求驳回包含私密聊天记录的出售方案。两地公告称，方案涉及超过 2,100 万个美国账号的聊天记录，其中超过 210 万个账号登记为未成年人。加州公告列出的拟议拍卖日期为 12 月 1 日。AI HOT 于北京时间 26 日收录 11 月 25 日的跟进报道。

🔗 [加州总检察长办公室公告](https://oag.ca.gov/news/press-releases/attorney-general-bonta-opposes-asset-sale-characterai-amid-child-safety-concerns) · [伊利诺伊州总检察长办公室公告](https://www.illinoisattorneygeneral.gov/news/story/attorney-general-raoul-challenges-plan-to-auction-off-characterai-users-private-chats-to-the-highest-bidder) · [TechCrunch 跟进报道](https://techcrunch.com/2026/11/25/state-ags-fight-character-ais-plan-to-auction-off-users-private-chats/)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
