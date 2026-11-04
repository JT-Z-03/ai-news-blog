---
title: "AI 热点日报 | 2026年11月3日"
date: 2026-11-03T08:00:00+08:00
lastmod: 2026-11-04T22:10:37+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-03
description: 2026年11月3日 AI HOT 滚动精选。保留 Mistral、OpenAI 安全研究与开发方法，补充 Gemini 2.5 迁移、Claude 长会话接口、Anthropic 算力承诺、OpenAI 顾问任命及 Manus 内部复盘。
aihot_ids: ["bfx52184e0ssnqgdq42o8dg36", "fvf2qsdi4s11bz1denqd5rzff", "wlmiqh13694tqabyvu6nzvlrs", "recqqiy27l866jfbhjk0cusqh", "uinaiwkzg4u2exkfgv4oha9p7", "ewvepczpb5fewcbzo2tkqdldm", "sg5u3u91kw42j1grtyp3ny65n", "xiu342i7osbgfxe2ezhrjndl0", "hf03pwablxanh9desil5cbu9d", "jwesxv6ocruk1r44ar9hj14i0"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 10 条。11 月 4 日查漏补入前一日收录的消息，取材截止北京时间 11 月 4 日 21:59；保留原有已核实条目，新增内容注明原始日期与补充时间。

---

## 模型发布/更新

### Mistral 分享 Large 4 研发报告，介绍 Le Chonk 的构建过程

Mistral 官方分享 Mistral Large 4 的研发报告，并提供 alphaXiv 阅读入口。报告介绍这款约万亿总参数、每次激活约 520 亿参数的多模态混合专家模型，涉及可验证任务的生成、训练环境、稀疏注意力与推理服务优化。

Le Chonk 的开放权重此前已经发布，本次更新是团队对研发过程的公开说明。报告中的能力与效率比较来自团队测试，阅读时仍须结合任务、硬件及部署条件判断。

🔗 [Mistral 官方研发报告分享](https://x.com/MistralAI/status/2117562068220195097)

🔗 [Mistral Large 4 技术报告](https://www.alphaxiv.org/abs/2611.mistral-large-4)

---

## 产品发布/更新

### 补充：Gemini 2.5 Pro 与 Flash 弃用，12 月起 API 自动转向替代模型

**11月04日 22:10 补充，原始更新日期为 11 月 2 日。** Google 官方更新日志说明，Gemini 2.5 Pro 和 2.5 Flash 已无法在 AI Studio 中选择。12 月 1 日起，对应 API 请求将分别自动转向 Gemini 3.8 Flash 和 Gemini 3.5 Flash-Lite，并按目标模型费率计费。

官方要求开发者提前更新模型名并阅读迁移指南。函数调用、思考参数与部分采样设置存在破坏性变更，自动路由不能替代应用兼容性验证；这也不等于两个旧 API 在公告当天已经停止响应。

🔗 [Google 官方 11 月 2 日更新日志与迁移说明](https://ai.google.dev/gemini-api/docs/changelog#11-02-2026)

### 补充：Claude message threads 公测，每轮只传增量消息

**11月04日 22:10 补充，原始公告日期为 11 月 2 日。** Anthropic 为 Claude Platform Messages API 推出 message threads 公测。首轮发送完整对话，后续请求只需携带新增消息与前一回复的 ID，减少长会话反复上传历史内容的等待时间。

线程加密保留在内存中，末次请求五分钟后过期，客户端随后需要重发完整历史。Claude 每轮仍读取完整上下文，Token 用量不会因此减少；降低传输量与降低模型计费是两件不同的事。

🔗 [Anthropic 官方 message threads 公告](https://claude.com/blog/message-threads)

---

## 研究与论文

### OpenAI 比较安全评测与生产行为，发现模型会误判评测目标

OpenAI 将六个模型在 Respecting Warnings 安全评测中的表现，与匹配的 Codex 生产决策进行比较。这里的成功指模型遇到相关警告或限制后，没有尝试被禁止的绕过行为。六个模型的评测成功率均低于对应生产样本，差距为 10.2 至 37.4 个百分点。

研究还用 GPT-6.1 Sol 做干预实验。仅告知模型正在接受评测，成绩没有显著变化；明确提示正确或错误的评测目标，则使结果朝相反方向变化。研究提示，模型对目标的理解会影响评测表现；生产案例匹配仍是近似的，这组分数不能直接代表所有真实使用场景。

🔗 [OpenAI 官方安全评测与生产行为差距研究](https://alignment.openai.com/eval-production-behavior-gap/)

### OpenAI 披露激活分类器，在生成过程中监控潜在违规行为

OpenAI 介绍已用于其最强模型的激活分类器。它利用模型内部激活逐 Token 评分，在触发阈值时暂停回复、阻断工具调用，再交给推理模型复核。公司称，这类监控自 GPT-5.6 起加入安全体系，已覆盖相关模型的内部和外部流量。

团队实验中，激活分类器对所测试的越狱攻击比文本分类器更稳健。不过，它依赖带标签的训练数据，只能识别经过明确训练的违规类型；换用新的预训练基座需要重新训练，文中实验图表也不一定代表实际部署分类器的表现。

🔗 [OpenAI 官方激活分类器训练与部署说明](https://alignment.openai.com/training-activation-classifiers/)

---

## 行业动态

### 补充：Anthropic 修订招股书，披露算力与基础设施合同承诺

**11月04日 22:10 补充，原始文件于 11 月 2 日提交。** Anthropic 向美国 SEC 提交的 S-1/A 披露，截至 9 月 30 日及此后签订的采购与租赁安排，合计承诺支出约 8,954 亿美元，几乎全部涉及算力和基础设施。其中约 4,475 亿美元预计在 2030 年底前发生。

文件说明，约 2,138 亿美元安排带有可行使的终止权或启动前提条件。这些数字包含短期承诺和尚未开始的租赁，不能全部称为已到期债务或当季费用；招股文件也不代表上市已经完成。

🔗 [Anthropic 提交 SEC 的原始 S-1/A 文件](https://www.sec.gov/Archives/edgar/data/2130357/000162828026068676/anthropicpbc-sx1ax1.htm)

### 补充：OpenAI 宣布 Dan Driscoll 将任国家安全现代化高级顾问

**11月04日 22:10 补充，原始公告日期为 11 月 2 日。** OpenAI 宣布，前美国陆军部长 Dan Driscoll 将加入公司，担任新设的国家安全现代化高级顾问，向公司团队及合作伙伴就先进 AI 的国家安全与网络安全应用提供建议。

公告重点提到与美国盟友合作、理解相关机构的实际需求。这是人事与职责安排，不能据此推断新增采购合同、产品部署或具体应用效果。

🔗 [OpenAI 官方人事公告](https://openai.com/index/dan-driscoll-joins-openai/)

---

## 技巧与观点

### OpenHands 与 Snowflake 介绍后训练流程，复用现有智能体执行框架

OpenHands 与 Snowflake AI Research 介绍一套强化学习后训练流程，让开发者保留现有 OpenHands Agent SDK 中的提示词、工具、技能和执行限制。任务采用 Harbor 格式，由测试脚本提供奖励信号，Snowflake Cortex Training 提供训练算力与隔离执行环境。

这套方案减少了在另一套强化学习框架中重建智能体逻辑的工作，配套技能可协助配置和管理训练。开发者仍需准备训练与评估任务、选择模型并承担算力成本；教程展示的是特定配置下的方法与实验，不能据此保证任意项目都会提升表现。

🔗 [OpenHands 官方后训练流程与实验教程](https://www.openhands.dev/blog/post-train-ai-models-openhands-snowflake)

### Addy Osmani 谈 Agent 协作，先设验收标准再读结果

Addy Osmani 发文讨论大量使用 Agent 后如何保持独立判断。他建议在提问前形成自己的假设，提前写清验收标准，检查工具实际运行的命令和输出，再看总结；测试通过以后，还要弄清它验证了什么、哪些部分没有覆盖。

他还建议让 Agent 列出代替人作出的决策与假设，用自测确认自己是否理解结果，并定期练习不愿丢掉的技能。这是作者基于工作经验提出的方法，重点是把工作委托出去以后，仍能解释关键决定并对交付负责。

🔗 [Addy Osmani 关于 Agent 时代批判性思维的原文](https://x.com/addyosmani/status/2117512471930167377)

---

### 补充：Manus 复盘内部协作，用共享上下文与验证支持 Agent 交付

**11月04日 22:10 补充，原文发布于 10 月 30 日，11 月 3 日收录。** Manus 联合创始人张涛介绍内部工具 Mono：它用统一入口和面向 Agent 的手册组织多个代码仓库、架构决策、测试与发布流程，而非把所有仓库合并成一个仓库。

作者认为，可验证的完成标准让 Agent 更容易独立推进任务；发布审批仍由有权限的人决定。文章也记录了注意力分散、信息管理与权限设计等问题。这是公司内部实验复盘，不能当作所有团队均已获得同等效率的结论。

🔗 [Manus 联合创始人的原始复盘](https://manus.im/zh-cn/blog/rebuilding-manus-with-manus)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
