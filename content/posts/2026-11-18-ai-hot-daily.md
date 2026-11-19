---
title: "AI 热点日报 | 2026年11月18日"
date: 2026-11-18T00:00:00+08:00
publishDate: 2026-11-18T08:05:01+08:00
lastmod: 2026-11-19T14:49:52+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-18
description: 2026年11月18日 AI HOT 滚动精选，关注 Hy4 flash 开放权重、微软 Ignite、Replit Missions、Claude Docs 工程复盘及英伟达财报。
aihot_ids: ["jr7fqw95e5ihuevr1rzib208l", "z9zhvfj8o8zp2yp433eizf3uk", "k036fkz6s64y292ovwq2qrx39", "yznmu3humymvshagrka95k1n1", "ekt4wsp34savbuzq0vafnlhpw", "ujx1ebv207quqahxh2ypzibqd", "jir2e9szcxw5vfemfzyr07518", "a48izcq1y2jqtjr66xjvwqkak", "jj0ftew61l69qvcrmww6gcxjt", "snkvsiff90slvj17hf9i5u4do", "vgopllkh4so1p1q01nefg1364", "io0nmdphe40k919fuw1h28kg3", "ei7hom06r7wgtedvkl2eqbofp"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 12 条；本次取材截止北京时间 11 月 19 日 14:43。

---

## 模型与开发

### Gemini API 增加多模态文件切片能力

**11月18日 22:08 补充。** Google 在 Gemini API 更新日志中介绍多模态文件处理与切片：开发者可直接传入 Microsoft Office 和 OpenDocument 文件，并在提示词或函数响应中指定文档页码、工作表、单元格范围及音视频时间区间等，只处理所需内容。

🔗 [Google Gemini API 更新日志](https://ai.google.dev/gemini-api/docs/changelog#11-18-2026)

### 补充：OpenAI 发布 GPT-6.2 Astra 和 Sol

**11月18日 08:05 补充，原文发表于 11 月 17 日。** OpenAI 发布面向复杂专业工作的 GPT-6.2 Astra 和面向日常工作的 GPT-6.2 Sol，称两者可通过 ChatGPT Work、Codex 和 API 使用。公司表示，两款模型在网络安全能力评估中达到其准备框架的 Critical 门槛，因此部署了更严格的高风险请求防护。该消息由 AI HOT 于 11 月 18 日收录。

🔗 [OpenAI 官方介绍](https://openai.com/index/introducing-gpt-6-2-astra-sol/) · [系统卡](https://deploymentsafety.openai.com/gpt-6-2-astra-sol)

### 补充：微软发布 MAI 系列新模型

**11月18日 08:05 补充，原文发表于 11 月 17 日。** Microsoft AI 在 Ignite 期间介绍七款新模型，包括编码模型 MAI Code 2、Code 2 Flash 和语音到语音模型 MAI Realtime 1。微软同时介绍 Licensed Weights 方案，供有特定部署需求的客户使用模型权重。该消息由 AI HOT 于 11 月 18 日收录。

🔗 [Microsoft AI 官方介绍](https://microsoft.ai/news/microsoft-ignite-2026/)

**11月19日 14:49 补充，主题演讲原文发表于 11 月 17 日。** 同一场 Ignite 大会上，微软还介绍了 Copilot Workspaces，让团队成员与各自的智能体共享项目上下文，功能已向 Frontier 用户开放。用于关联 AI 使用量、支出与业务结果的 Agent 365 Business Analytics 也开始在 Frontier Public 推出。

🔗 [Microsoft Ignite 主题演讲](https://blogs.microsoft.com/blog/2026/11/17/ignite-2026-building-the-frontier-ecosystem/) · [Copilot 产品公告](https://www.microsoft.com/en-us/copilot/blog/2026/11/17/copilot-at-microsoft-ignite-expanding-whats-possible-with-intelligence-built-for-work/)

### 补充：Google AI Studio 扩展 Android 全栈开发能力

**11月18日 14:09 补充，原文发表于 11 月 17 日。** Google 介绍 AI Studio 的 Android 开发更新：Build agent 可在用户确认后配置 Firestore 数据库、登录和 Firebase AI Logic，并支持模拟器音频及截图反馈。生成的应用可发布到个人 Google Play 库，供用户在自己的设备上安装。该消息由 AI HOT 于 11 月 18 日收录。

🔗 [Google 开发者博客](https://developers.googleblog.com/build-full-stack-android-apps-with-gemini-in-google-ai-studio/)

### 进展：腾讯混元开放 Hy4 flash 权重

**11月19日 14:49 补充。** 腾讯混元在[此前发布 Hy4 flash](/posts/ai-hot-2026-11-16/) 时预告了权重开放。11 月 18 日，腾讯开放了指令版、FP8 量化指令版和预训练 Base 版的权重，均采用 Tencent Hy License。

🔗 [腾讯混元官方仓库](https://github.com/Tencent-Hunyuan/Hy4-flash) · [官方模型卡](https://huggingface.co/tencent/Hy4-flash)

### 补充：Replit 推出按目标协作的 Missions

**11月19日 14:49 补充，官方博客标注 11 月 17 日，发布元数据对应北京时间 11 月 18 日 02:00。** 用户在 Missions 中给出目标、验收标准、预算及需要审批的动作，Replit 协调多个智能体分工完成规划、开发、测试和迭代。Replit 同时开源了用 Missions 构建的应用监控工具 DataCat，供团队自行部署。

🔗 [Replit 发布公告](https://replit.com/blog/introducing-replit-missions) · [DataCat 源码](https://github.com/replit/datacat)

### 补充：Anthropic 复盘 Claude Docs 上线前的故障测试

**11月19日 14:49 补充，原文发表于 11 月 17 日。** Anthropic 工程师复盘了 [Claude Docs](/posts/ai-hot-2026-09-17/) 上线前的两周测试。团队在预发布环境用 Claude 循环执行压测、读取遥测数据并验证修复，难以撤销的改动仍由人审批。工程师称，上线首周约 20 亿次请求中出现 60 次服务器错误。

🔗 [Claude 开发者博客](https://claude.dev/blog/chaos-loop-claude-docs-launch/)

## 产品应用

### 补充：Gemini 扩展任务功能

**11月18日 08:05 补充，原文发表于 11 月 17 日。** Google 介绍 Gemini Tasks 的新功能，可协助处理预约、账单和购物等任务；功能开放范围和实际执行仍取决于地区及具体服务。该消息由 AI HOT 于 11 月 18 日收录。

🔗 [Google 官方介绍](https://blog.google/innovation-and-ai/products/gemini-app/tasks-in-gemini-free-new-features/)

### 补充：Suno 推出 Visuals 生成图片和视频

**11月18日 08:05 补充，原文发表于 11 月 17 日。** Suno 发布 Visuals，可围绕歌曲生成图片或最长 15 秒的视频，支持网页、iOS 和 Android；视觉生成积分需另行购买。该消息由 AI HOT 于 11 月 18 日收录。

🔗 [Suno 官方介绍](https://suno.com/blog/introducing-visuals)

## 安全与治理

### 补充：恶意 agent-framework 版本曾被发布到 PyPI

**11月18日 08:05 补充，原文发表于 11 月 17 日。** 安全公司 Wiz 报告，Microsoft agent-framework 的 1.26.1 和 1.26.2 版本曾被植入窃取凭据的恶意代码，随后从 PyPI 下架。Wiz 表示事件根因尚未确认；使用过受影响版本的团队应参照研究报告排查。该消息由 AI HOT 于 11 月 18 日收录。

🔗 [Wiz 安全研究](https://www.wiz.io/blog/malicious-version-of-microsofts-agent-framework-published-to-pypi)

## 行业动态

### 补充：ElevenLabs 宣布收购日本语音 AI 公司 Kotoba

**11月18日 14:09 补充，原文发表于 11 月 16 日。** ElevenLabs 宣布收购日本语音 AI 公司 Kotoba，计划结合其日语语音研究拓展相关产品。公司表示交易预计于 2026 年第四季度晚些时候完成，仍须满足监管审批及交割条件。该消息由 AI HOT 于 11 月 18 日收录。

🔗 [ElevenLabs 公告](https://elevenlabs.io/blog/kotoba)

### 进展：英伟达公布第三财季业绩

**11月19日 14:49 补充，财报原文发表于美国当地时间 11 月 17 日。** 本站[此前报道](/posts/nvidia-leadership-succession/)了英伟达 CEO 交接及即将举行的财报电话会。英伟达随后公布 2027 财年第三财季营收 1158 亿美元，同比增长 103%。其中数据中心营收 1076 亿美元，同比增长 110%。公司同时披露 Vera Rubin NVL72 已开始出货。

🔗 [英伟达官方财报](https://nvidianews.nvidia.com/news/nvidia-announces-financial-results-for-third-quarter-fiscal-2027)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
