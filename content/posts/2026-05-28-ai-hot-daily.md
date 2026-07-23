---
title: "AI 热点日报 | 2026年5月28日"
date: 2026-05-28T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: "ai-hot-2026-05-28"
description: "2026年5月28日 AI 圈要闻：Cognition 估值 260 亿美元成最大独立智能体实验室、Runway 推出 MCP 服务器、Qwen3.5 创下 580 tokens/s 推理纪录、教皇发布 AI 通谕警告"
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 今日头条

### Cognition 估值 260 亿美元，成为全球最大独立智能体实验室

Cognition 完成超 10 亿美元融资，估值达 260 亿美元，由 Lux Capital、General Catalyst 等领投。年化收入 4.92 亿美元，企业使用量年初以来增长超 10 倍。两年前推出 Devin，定位为首个 AI 软件工程师，背后有 Peter Thiel 重磅投资。公司宣称拥有多项领先优势，包括首个编码智能体、顶级代码审查能力等。

📎 [swyx @ X](https://x.com/swyx/status/2059717021944926238)

### 教皇 Leo XIV 发布 AI 通谕，警告人工智能触及权利与自由

教皇 Leo XIV 发布题为《Magnifica Humanitas》的通谕，强调 AI 的使用绝非纯粹技术问题，当其进入影响人类生活的过程时，便触及权利、机会、地位与自由。Anthropic 联合创始人 Christopher Olah 出席发布会，引发科技界广泛关注和讨论。

📎 [The Verge](https://www.theverge.com/ai-artificial-intelligence/937933/pope-ai-encyclical-tech-industry-reactions)

---

## 模型发布/更新

*（5月28日数据无本分类条目）*

---

## 产品发布/更新

### Runway 推出 MCP 服务器，AI 智能体可直接生成图像与视频

Runway 正式推出 MCP 服务器，允许 Claude、ChatGPT、Cursor 等兼容 MCP 的 AI 智能体在对话界面中直接生成图像与视频。接入 Gen-4.5、Seedance 2.0、GPT Image 2、Kling 3.0 及 Nano Banana Pro 等多款 SOTA 模型。通过 runwayml.com/mcp 添加并登录现有账户即可使用，无需单独申请 API 密钥。

📎 [Runway](https://runwayml.com/news/mcp)

### Claude Code v2.1.152：/code-review --fix 可直接应用修复建议

本次更新亮点：`/code-review --fix` 现在能将审查建议直接应用到工作目录；技能与斜杠命令支持通过 frontmatter 的 `disallowed-tools` 移除模型工具；新增 `/reload-skills` 命令可不重启会话重新扫描技能目录；`SessionStart` 钩子现可返回 `reloadSkills: true` 并支持通过 `hookSpecificOutput.sessionTitle` 设置会话标题；新增 `MessageDisplay` 钩子事件以变换或隐藏助手消息。

📎 [GitHub Releases](https://github.com/anthropics/claude-code/releases/tag/v2.1.152)

### OpenAI 产品支持私有 MCP 服务器安全连接

团队可在内部网络保留 MCP 服务器，同时 ChatGPT、Codex 和 Responses API 通过仅出站 HTTPS 进行连接，实现安全隔离。

📎 [OpenAI Developers @ X](https://x.com/OpenAIDevs/status/2059703536825565499)

### xAI Grok 编程智能体登陆 Kilo IDE 平台

SuperGrok 或 X Premium+ 订阅用户可在 Kilo IDE 扩展或 CLI 中使用 grok-build-0.1，享受高速智能体编程体验。

📎 [xAI @ X](https://x.com/xai/status/2059666227115819149)

### Perplexity 开源 Unigram 分词器，CPU 占用降低 5-6 倍

重新构建的 Unigram 分词器可将 CPU 占用降低 5-6 倍。配合小型重排序器和嵌入模型，GPU 运行时间仅为个位数毫秒。

📎 [Perplexity @ X](https://x.com/perplexity_ai/status/2059664738087469511)

### FastVideo Dreamverse：7 秒生成 30 秒 1080p 视频

HaoYi AI Lab 开源 FastVideo Dreamverse，基于单张 NVIDIA B200 GPU 和 LTX-2 模型实现实时视频生成的氛围引导工具。

📎 [Sky Computing Lab @ X](https://x.com/haoailab/status/2059695648103112946)

---

## 行业动态

### 黄仁勋展示英伟达台湾新园区，计划每年投资 1500 亿美元

就在竞争对手 AMD 宣布将向台湾 AI 领域投资超过 100 亿美元一周后，英伟达展示了新的台湾园区扩张计划。

📎 [Rohan Paul @ X](https://x.com/rohanpaul_ai/status/2059689400267939925)

### 我国将加快研究推进人工智能健康发展综合性立法

📎 [IT之家](https://www.ithome.com/0/955/758.htm)

### 高通与字节跳动达成 AI ASIC 芯片合作，采购量达数百万颗级别

📎 [IT之家](https://www.ithome.com/0/955/674.htm)

### 阿里云入选 Omdia 智能体 AI 市场雷达领导者

Omdia 认可阿里云是首个将整个平台围绕智能体范式进行构建的云服务商。

📎 [阿里云 @ X](https://x.com/alibaba_cloud/status/2059509714854007181)

### 阿里云成为 PyTorch 基金会白金会员

📎 [阿里云 @ X](https://x.com/alibaba_cloud/status/2059453607075004835)

### OpenAI 发布 2026 年选举保障计划

📎 [OpenAI](https://openai.com/index/election-safeguards-2026)

---

## 论文研究

### Qwen3.5 创下 580 tokens/s 推理速度纪录

Qwen3.5 在 TokenSpeed 推理引擎上针对智能体工作负载达到 580 tokens/s 的创纪录速度，由通义千问推理团队、NVIDIA 及 Mooncake 团队共同实现，采用 FlashAttention-4 优化。这一里程碑标志着开源大语言模型推理性能的边界得到推动。

📎 [通义千问 @ X](https://x.com/Alibaba_Qwen/status/2059674574397313277)

### ITBench-AA：所有前沿大模型在 SRE 任务中得分均低于 50%

Artificial Analysis 和 IBM 推出的 ITBench-AA SRE 基准测试显示，所有前沿大模型得分均未超过 50%。Claude Opus 4.7 以 47% 领先，GPT-5.5 得 46%，Qwen3.7 Max 得 42%。关键发现：模型推理轮次差异近 3 倍，但更长的轨迹并不转化为更高准确率。开源模型 Gemma 4 31B（Reasoning）以每任务 $0.14 的成本获得 37% 得分，优于成本更高但得分更低的闭源模型。

📎 [Hugging Face Blog](https://huggingface.co/blog/ibm-research/itbench-aa)

### Google Research 发布零信任聚合隐私分析方案

结合零信任原则与可信执行环境（TEE）的透明性，通过密码学与硬件保护的结合，确保系统仅能获取群体的匿名化聚合洞察。

📎 [Google Research Blog](https://research.google/blog/private-analytics-via-zero-trust-aggregation)

---

## 技巧与观点

### 用好 Coding Agent，关键是两头——尤其是开头

用最强模型（如 GPT-5.5、Claude Opus 4.7）分别在 Codex、Claude Code、Cursor 的 Plan 模式下生成设计方案，选择最优并借鉴其他版本。复杂计划可拆分为多个 Phases 并明确验证标准，形成 Markdown 文档。执行时按 Phases 进行并辅以人工审核纠偏。Code Review 用 GPT-5.5 审核代码质量与设计符合度即可。应避免多个智能体交叉 Review，否则可能导致代码越改越多。

📎 [宝玉 @ X](https://x.com/dotey/status/2059773942500298934)

### Anthropic 和 OpenAI 找到了产品市场契合点

Anthropic Enterprise（$20/席位/月 + API 费用）和 OpenAI Codex（按 API token 用量计费）标志着两家公司进入商业化收割阶段。同时发布的新模型 GPT-5.5（4月23日）和 Opus 4.7（4月16日）的 API 定价也显著高于前代版本。

📎 [Simon Willison](https://simonwillison.net/2026/May/27/product-market-fit)

### Anthropic 发布 AI 智能体零信任安全框架

前沿大语言模型将漏洞利用周期从数月压缩至数小时。三层零信任架构（基础、高级、优化级）及八阶段实施流程，覆盖提示注入、工具投毒、记忆投毒等特有威胁。

📎 [Claude Blog](https://claude.com/blog/zero-trust-for-ai-agents)

### 用大语言模型保障源代码安全：六步循环

核心流程：威胁建模 → 沙箱隔离 → 漏洞发现 → 验证 → 分类 → 修复。漏洞发现现已易于并行化，瓶颈转移到验证与处理阶段。截至 2026 年 5 月 22 日已披露 1,596 个开源漏洞，其中 97 个已修补。

📎 [Claude Blog](https://claude.com/blog/using-llms-to-secure-source-code)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*