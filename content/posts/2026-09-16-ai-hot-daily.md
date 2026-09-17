---
title: "AI 热点日报 | 2026年9月16日"
date: 2026-09-16T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-09-16
description: 2026年9月16日 AI 圈要闻。Google 发布 Gemini 3.8 Live 系列并梳理多语言进展；ChatGPT 测试赞助智能体广告；Grok Build 加入跨会话记忆；Perplexity 披露数据库迁移预期，Arena 更新图像转网页榜单。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)，按北京时间 9 月 16 日整理，并核对链接原文。本期关注语音模型的任务执行、智能体的长期记忆与商业入口，以及工程成本和榜单成绩背后的适用条件。

---

## 模型发布/更新

### Gemini 3.8 Live 系列发布，语音对话与后台任务并行

Google 发布 Gemini 3.8 Live 和 Gemini 3.8 Live Extended Thinking。前者侧重规模与成本效率，后者面向更复杂的多步推理；两款模型都强调在对话继续进行时处理后台工具调用。官方公告发布于北京时间 9 月 16 日凌晨。

Google 表示，3.8 Live 能结合实时视觉信息，在对话中自动切换支持的语言；Extended Thinking 则可一边推理、一边用语音说明任务进度。官方报告后者在 Artificial Analysis 的 Speech to Speech Quality Index 上获得 82.6 分，这一结果对应特定评测，不能替代实际业务中的延迟、成本和任务完成率测试。

两款模型开始向 Gemini API 和 Google AI Studio 推出，企业入口仍包含私有预览；消费端及 Workspace 的开放范围也因产品和订阅不同而异，不能理解为全部用户同时获得所有功能。

🔗 [Google：Gemini 3.8 Live 与 Extended Thinking 发布公告](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-8-live-gemini-3-8-live-extended-thinking/)

---

## 产品发布/更新

### ChatGPT Ads 测试赞助智能体，接入 HubSpot 与 Shopify

OpenAI 宣布测试 Sponsored Agents：用户点击 ChatGPT 广告后，可以选择与明确标注商业赞助关系的智能体继续交流。该对话与用户原本的聊天分开，官方也明确区分了赞助智能体和 ChatGPT 的独立回答。目前测试仅面向美国部分广告主。

广告管理端同时增加自然语言创建、更新和分析广告活动的能力，并接入 HubSpot 与 Shopify。美国 Shopify 商家可使用新应用，其他已开放 ChatGPT Ads 的国际市场计划从 9 月 23 日开始提供。

这次更新把广告从展示入口延伸到互动咨询。对商家而言，需要分别核对投放市场、工具接入条件与赞助标识，而不是把测试公告当作全球全面开放。

🔗 [OpenAI：ChatGPT Ads 新体验与开放范围](https://openai.com/index/reimagining-advertising-with-ai/)

### Grok Build 加入记忆，让项目约定跨会话延续

Grok Build 的新记忆功能会在每轮任务完成后于后台记录值得长期保留的项目约定、决策和事实，后续会话开始相关工作前再读取这些笔记。记忆以 Markdown 文件保存，分别设有项目范围和全局偏好范围。

用户可通过 `/memory` 浏览记忆，通过 `/dream` 将近期笔记整理成主题文件。官方说明，当前对话中的指令优先于记忆；任务临时状态、尚未确定的结论和秘密信息不属于其设计上要保留的内容。

功能已面向新会话提供，需要新建会话后开始积累。它的实际价值是减少重复解释测试命令、代码约定等背景，但错误笔记仍需检查和修正，不能把自动记录等同于永久正确的项目事实。

🔗 [SpaceXAI：Memory in Grok Build](https://x.ai/news/grok-build-memory)

### Google 汇总多语言进展，覆盖规模与单项能力须分开看

Google 在北京时间 9 月 16 日发布的文章中表示，其技术与产品合计覆盖超过 300 种语言，对应全球约 86% 人口。文章梳理了原生语音、社区数据合作、端侧翻译和无障碍交互等方向，并介绍支持 55 种语言、可在设备端运行的 TranslateGemma 系列。

这里的 300 多种语言是跨产品与技术的总体口径，并非单个模型对全部语言都提供相同功能和质量。文章也以成果回顾为主，不宜将提到的每款模型都写成当天首次发布。

值得关注的是覆盖之外的可用性：离线运行、低资源语言的数据建设，以及对口音、语境和非标准语音的支持，决定了语言工具能否进入更多人的日常生活。

🔗 [Google：AI for everyone in every language](https://blog.google/innovation-and-ai/technology/ai/ai-for-every-language/)

---

## 行业动态

### Perplexity CEO 披露 CobbleDB 迁移预期，节省金额仍是估计

Perplexity CEO Aravind Srinivas 在北京时间 9 月 16 日凌晨表示，两名工程师与数百个持续运行的 Computer 智能体，用两个月构建了用于网页内容读取的自研数据库核心基础设施；他预计迁移后每年最多节省一亿美元。这是公司负责人对未来成本的估计，并非已经审计确认的年度收益。

配套的 CobbleDB 技术文章此前已发布。文中报告，热存储迁移后的批量读取中位延迟从 31.4 毫秒降至 5.60 毫秒，同时明确说明，这属于不同时段真实流量的前后比较，而非对同一批请求进行的受控实验。

本条记录的是负责人此次披露与传播的进展，不把它写成数据库当天首次出现。其性能结果也应限定在 Perplexity 的搜索读取负载，不能直接推导为对所有 DynamoDB 应用都更便宜或更快。

🔗 [Aravind Srinivas：迁移与成本预期](https://x.com/AravSrinivas/status/2099957318935028173) · [Perplexity：CobbleDB 技术说明](https://www.perplexity.ai/zh/hub/blog/cobbledb)

---

## 技巧与观点

### Arena 更新图像转网页榜单，Astra 与 Fable 位列前二

Arena 在北京时间 9 月 16 日凌晨更新 Image-to-WebDev 榜单。官方公告列出，GPT-6 Astra（Max）以 1733 分位列第一，Claude Fable 5.1（Max）以 1710 分位列第二；Astra 相比 GPT-5.6 Sol（xHigh）高出 129 分。

这是图像转网页这一具体任务的榜单更新，不是模型首次发布，也不能直接代表通用编码、后端工程或完整产品交付能力。比较时应保留模型版本与推理档位，再结合自己的页面还原任务、运行结果和修改成本判断。

🔗 [Arena：Image-to-WebDev 榜单更新](https://x.com/arena/status/2099971741993050236)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.virxact.com）*
