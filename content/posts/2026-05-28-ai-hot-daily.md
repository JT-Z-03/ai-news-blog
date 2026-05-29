---
title: "AI 热点日报 | 2026年5月28日"
date: 2026-05-28T20:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: "ai-hot-2026-05-28"
description: "2026年5月28日 AI 圈要闻：Runway MCP服务器上线、Cognition估值260亿美元成最大独立智能体实验室、Qwen3.5创580tps推理纪录、Claude Code v2.1.152更新
---

# AI 热点日报 | 2026年5月28日

> 数据来源：AI HOT（aihot.virxact.com）

---

## 今日头条

### Cognition 成为全球最大独立智能体实验室

Cognition 宣布完成超 10 亿美元融资，估值达 260 亿美元，由 Lux Capital、General Catalyst 等领投。企业使用量自年初增长超 10 倍，年化收入增至 4.92 亿美元。公司两年前推出 Devin，定位为首个 AI 软件工程师，并得到 Peter Thiel 重大投资。

📎 [swyx @ X](https://x.com/swyx/status/2059717021944926238)

---

## 产品发布

### Runway MCP 服务器正式上线

Runway 推出 MCP 服务器，支持 Claude、ChatGPT、Cursor 等 AI 智能体在对话界面直接生成图像与视频，接入 Gen-4.5、Seedance 2.0、GPT Image 2、Kling 3.0 及 Nano Banana Pro 等 SOTA 模型。用户可通过 runwayml.com/mcp 添加服务器并登录现有账户使用，无需单独申请 API 密钥。

📎 [Runway 官方公告](https://runwayml.com/news/mcp)

### Claude Code v2.1.152 更新发布

新版核心改进：`/code-review --fix` 现在将审查建议直接应用到工作目录；技能与斜杠命令支持通过 frontmatter 的 `disallowed-tools` 移除模型工具；新增 `/reload-skills` 命令可不重启会话重新扫描技能目录；`SessionStart` 钩子支持 `reloadSkills: true`；新增 `MessageDisplay` 钩子事件以变换或隐藏助手消息。

📎 [GitHub Releases](https://github.com/anthropics/claude-code/releases/tag/v2.1.152)

### OpenAI 私有 MCP 服务器上线

支持团队在自有网络内托管 MCP 服务器，ChatGPT、Codex、Responses API 通过仅出站 HTTPS 连接。

📎 [OpenAI Developers @ X](https://x.com/OpenAIDevs/status/2059703536825565499)

### Grok 编程智能体登陆 Kilo IDE

xAI 宣布 Grok 编程智能体登陆 Kilo IDE，SuperGrok 或 X Premium+ 订阅用户可使用 grok-build-0.1，享受高速智能体编程体验，支持 IDE 扩展和 CLI。

📎 [xAI @ X](https://x.com/xai/status/2059666227115819149)

### Perplexity 开源 Unigram 分词器

Perplexity 开源重新构建的 Unigram 分词器，可将 CPU 占用降低 5-6 倍。配合小型重排序器和嵌入模型，GPU 运行时间仅为个位数毫秒。

📎 [Perplexity @ X](https://x.com/perplexity_ai/status/2059664738087469511)

### FastVideo Dreamverse 开源：7 秒生成 30 秒 1080p 视频

辉岳 AI 实验室开源 FastVideo Dreamverse，基于单张 NVIDIA B200 GPU 和 LTX-2 模型，实现 7 秒生成 30 秒 1080p 高清视频的实时视频生成。

📎 [Sky Computing Lab @ X](https://x.com/haoailab/status/2059695648103112946)

### OpenCode 与 MiMo V2.5 限时免费开放

📎 [opencode @ X](https://x.com/opencode/status/2059696100626297225)

---

## 行业动态

### 英伟达黄仁勋展示台湾新园区，计划年投资 1500 亿美元

黄仁勋展示英伟达新的台湾园区，就在竞争对手 AMD 宣布将向台湾 AI 领域投资超 100 亿美元一周后。

📎 [Rohan Paul @ X](https://x.com/rohanpaul_ai/status/2059689400267939925)

### 教皇发布 AI 通谕《Magnifica Humanitas》，警告人工智能触及权利与自由

教皇 Leo XIV 发布通谕，警告 AI 的使用绝非纯粹技术问题，当其进入影响人类生活的过程时，便触及权利、机会、地位与自由。Anthropic 联合创始人 Christopher Olah 出席发布现场，引发科技界广泛讨论。

📎 [The Verge](https://www.theverge.com/ai-artificial-intelligence/937933/pope-ai-encyclical-tech-industry-reactions)

### 我国加快推进人工智能综合性立法

📎 [IT之家](https://www.ithome.com/0/955/758.htm)

### 阿里云入选 Omdia 智能体 AI 市场雷达领导者

Omdia 认可阿里云在每一层的全栈能力，是首个将整个平台围绕智能体范式进行构建的云服务商。

📎 [阿里云 @ X](https://x.com/alibaba_cloud/status/2059509714854007181)

### 阿里云成为 PyTorch 白金会员

📎 [阿里云 @ X](https://x.com/alibaba_cloud/status/2059453607075004835)

---

## 论文研究

### Qwen3.5 创 580 tokens/s 推理速度纪录

Qwen3.5 在 TokenSpeed 推理引擎上，针对智能体工作负载达到 580 tokens/s 的创纪录速度，由通义千问推理团队、NVIDIA 及 Mooncake 团队共同实现，采用 FlashAttention-4 优化。

📎 [通义千问 @ X](https://x.com/Alibaba_Qwen/status/2059674574397313277)

### ITBench-AA：前沿大模型 SRE 任务得分均低于 50%

Artificial Analysis 和 IBM 推出的 ITBench-AA SRE 基准测试显示，所有前沿大模型均未超过 50%：Claude Opus 4.7 得 47% 领先，GPT-5.5 得 46%，Qwen3.7 Max 得 42%。关键发现：模型推理轮次差异近 3 倍，但更长轨迹并不转化为更高准确率。开源模型 Gemma 4 31B 以每任务 $0.14 成本获得 37% 得分，优于成本更高但得分更低的闭源模型。

📎 [Hugging Face Blog](https://huggingface.co/blog/ibm-research/itbench-aa)

### Google Research 发布零信任聚合隐私分析方案

📎 [Google Research Blog](https://research.google/blog/private-analytics-via-zero-trust-aggregation)

---

## 技巧与观点

### 编程智能体 PMF 已找到：Anthropic 和 OpenAI 进入收获期

Simon Willison 指出 Anthropic Enterprise 套餐（每席位 $20/月 + API 费用）和 OpenAI Codex（按 token 用量计费）代表两家公司正式进入商业化收获阶段，GPT-5.5 和 Opus 4.7 的 API 定价也显著高于前代。

📎 [Simon Willison](https://simonwillison.net/2026/May/27/product-market-fit)

### 用好 Coding Agent：关键是开头走对方向

核心方法：先用最强模型（GPT-5.5、Claude Opus 4.7）分别在 Codex、Claude Code、Cursor 的 Plan 模式下生成设计方案，选择最优并借鉴其他版本。对于复杂计划拆分为多个 Phases，明确要求与验证标准，执行时辅以人工审核纠偏。避免多个智能体交叉 Review 导致代码越改越多。

📎 [宝玉 @ X](https://x.com/dotey/status/2059773942500298934)

### Anthropic 发布 AI 智能体零信任安全框架

Anthropic 指出前沿大模型正将漏洞利用周期从数月压缩至数小时，提出三层零信任架构（基础、高级、优化级）及八阶段实施流程，涵盖提示注入、工具投毒、记忆投毒等特有威胁。

📎 [Claude Blog](https://claude.com/blog/zero-trust-for-ai-agents)

### 用 Claude 保障源代码安全：六步循环实践

核心流程：威胁建模 → 沙箱隔离 → 漏洞发现 → 验证 → 分类 → 修复。瓶颈已从发现转移到验证与处理阶段。截至 2026 年 5 月 22 日已披露 1,596 个开源软件漏洞，其中 97 个已修补。

📎 [Claude Blog](https://claude.com/blog/using-llms-to-secure-source-code)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*