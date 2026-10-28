---
title: "AI 热点日报 | 2026年10月27日"
date: 2026-10-27T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-10-27
description: 2026年10月27日 AI HOT 要闻。OpenAI 发布 GPT-6.1 Terra，Replit 开放企业代码库贡献，Apple 公布创作工具更新与 M6 MacBook Pro；Cloudflare 披露已修复的跨请求数据暴露事故。
---

> 数据来源 [AI HOT](https://aihot.news/)，按北京时间 10 月 27 日整理并核对原始来源。本期收录 8 条，区分已开放能力、后续更新计划、厂商测试结果和修复后的安全披露；重复转述与日期无法确认的内容不计入本期。

---

## 模型发布/更新

### OpenAI 发布 GPT-6.1 Terra，降低电脑操作任务的使用成本

OpenAI 在北京时间 27 日凌晨宣布 GPT-6.1 Terra，主打屏幕理解、跨应用操作与写作。模型已向 ChatGPT Work 和 Codex 的 Plus、Pro、Enterprise、Edu 用户开放，开发者也可通过 OpenAI API 使用 `gpt-6.1-terra`。

标准 API 每百万 Token 的价格为输入 1 美元、缓存输入 0.05 美元、输出 5 美元，比 GPT-5.6 Terra 和 GPT-6.1 Sol 的标准价格低 50%。OpenAI 报告，在其中等推理强度的 Agents’ Last Exam 测试中，Terra 与 GPT-6 Astra 表现相当，每 Token 价格约为十分之一；这些是特定评测下的厂商结果，不能直接换算为所有任务的成本或完成率。

🔗 [OpenAI：模型能力、定价与开放范围](https://openai.com/index/introducing-gpt-6-1-terra/)

🔗 [OpenAI：官方发布公告](https://x.com/OpenAI/status/2114780711664398349)

---

## 产品发布/更新

### Replit Cloud Agents 让非工程人员向公司代码库提交经过测试的修改

Replit 宣布，面向现有代码库的 Cloud Agents 已向 Pro 与 Enterprise 客户开放。设计、产品和客服等人员可以用自然语言提出修改，智能体定位代码、更新预览，并向 GitHub 或 GitLab 提交拉取或合并请求。

官方称，智能体可在隔离的云端沙箱中操作应用、测试修改，并将截图与视频附在请求中，工程师仍负责审查和决定发布。管理员配置的共享环境可供团队复用；将审查反馈沉淀为团队技能的记忆功能仍处于早期开放阶段，技能更新须由工程师批准后生效。

🔗 [Replit：Cloud Agents 的贡献、测试与审查流程](https://replit.com/blog/anyone-can-bring-ideas-to-company-codebase)

### Gamma 汇总 Gamma 5、导出和预览等更新

Gamma 在九月至十月更新日志中介绍 Gamma 5：用户可以输入一句话、文档、PDF、图片或旧演示稿，由智能体组织调研、设计与编辑流程；还可连接 Slack、Notion、Granola 等二十多种工具引入上下文。

日志同时列出点数余额与耗尽提示、PowerPoint 导出对多语言字体和公式等元素的保留改进，以及更贴近竖版文档、社交帖子和 4:3 幻灯片的预览。这是多项更新的汇总，不能据此认定所有功能均在当天首次推出；生成质量和导出效果仍需结合实际文件验证。

🔗 [Gamma：九月至十月官方更新日志](https://meetgamma.canny.io/changelog/whats-new-in-gamma-septemberoctober-2026)

### Apple 公布 Creator Studio 更新计划，文档工具将加入智能助手与 MCP

Apple 公布 Creator Studio 的下一轮更新：Final Cut Pro for Mac 将整合 MotionVFX 特效与 Content Hub 视频素材，Pixelmator Pro 加入基于描述的局部生成填充；Keynote、Pages 和 Numbers 将提供理解文档上下文的智能助手，并通过 MCP 支持外部 AI 工具读取、编辑和执行自动化操作。

上述更新计划于 11 月提供，现有订户可免费更新。智能助手仍为测试版，仅支持美国英语，并要求支持 Apple Intelligence 的设备与对应 27 系系统；MCP 要求 macOS 27 或更高版本。公告中的后续更新计划与当天可用功能须分别看待。

🔗 [Apple：Creator Studio 功能计划与设备、语言限制](https://www.apple.com/newsroom/2026/10/apple-creator-studio-adds-powerful-new-ai-features-and-even-more-creative-tools/)

### Apple 发布 M6 版 14 英寸 MacBook Pro

Apple 发布搭载 M6 的 14 英寸 MacBook Pro，配备 12 核 CPU、12 核 GPU，统一内存从 16GB 起步、最高可选 32GB。公司称，相对 M5，部分端侧 AI 工作负载最高快 25%，并支持本地运行大语言模型。

新机计划于 10 月 28 日开启预购、11 月 6 日发售，美国起售价为 1,999 美元。性能增幅来自 Apple 在特定配置与任务下的测试，不能直接代表所有模型的推理速度；本地模型能否运行仍取决于其大小、内存占用与工作负载。

🔗 [Apple：M6 MacBook Pro 规格、测试条件与发售安排](https://www.apple.com/newsroom/2026/10/apple-introduces-the-new-14-inch-macbook-pro-with-m6/)

---

## 行业动态

### OpenAI 扩大与 Oracle 合作，规划将业务应用与数据接入 ChatGPT

OpenAI 宣布扩大与 Oracle 的合作。Oracle 正开发 AI Workspace，计划通过 ChatGPT 连接其应用与数据，让员工在组织权限与审批范围内查询信息、完成业务流程；双方还介绍了 AI Security Mesh、面向中小企业的组合方案，以及使用 Codex 等工具构建应用的 App Composer。

公告同时说明，美国 Oracle 客户可通过 Oracle Marketplace 采购 OpenAI API、Codex 和 ChatGPT Work，并使用符合条件的 Oracle Universal Credits。采购渠道与正在开发的应用集成处于不同阶段，不能把合作规划统一写成已向所有客户全面开放。

🔗 [OpenAI：Oracle 合作范围与产品进展](https://openai.com/index/oracle-apps-in-chatgpt/)

### Cloudflare 与 SGLang 披露已修复的跨请求数据暴露事故

Cloudflare 与 SGLang 协调披露了 Workers AI 的一次跨请求数据暴露事故。Cloudflare 称，8 月 27 日至 9 月 9 日间，GLM-5.3 模型有 155 条响应包含其他客户近期请求的数据，受影响提示均超过 681,280 Token。公司已于 9 月 9 日修复并恢复服务，未发现蓄意利用证据，其他 Workers AI 模型未受影响。

事故涉及上下文窗口与 KV 缓存池容量不匹配，以及预填充与解码分离部署中未正确终止被拒绝的请求，使解码阶段读取了此前请求留下的缓存。双方同时披露了其他缓存生命周期加固，适用版本与后端各有范围。本次新闻是修复后的协调披露，不能据此认定所有使用 SGLang 的服务都发生过跨客户泄露。

🔗 [Cloudflare：事故范围、调查与修复](https://blog.cloudflare.com/kv-cache-exposure-remediation/)

🔗 [SGLang：机制说明、上游修复与部署建议](https://www.lmsys.org/blog/2026-10-26-cf-security)

---

## 技巧与观点

### a16z 讨论企业如何让智能体接上组织知识

Ben Horowitz 与 Michael McGuiness 从 Databricks 的数据库演进讨论企业智能体。文章认为，只有接入共享的业务定义、数据、权限与反馈，智能体才能承担公司内部的真实任务；Lakebase 的隔离分支等能力则为试验提供了条件。

作者将企业积累的定义、权限、评估案例和例外处理视为可延续的组织知识，主张企业在更换模型供应商时保留这些经验。这是投资方 a16z 对其投资企业及未来组织形态的观点分析，不能据此认定相关自动化效果已普遍实现。

🔗 [a16z：Databricks 与企业组织形态的讨论](https://www.a16z.news/p/databricks-and-the-future-of-the)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
