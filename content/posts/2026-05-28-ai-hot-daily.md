---
title: "AI 热点日报 | 2026年5月28日"
date: 2026-05-28T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["AI 热点"]
slug: "ai-hot-2026-05-28"
description: "今日 AI 圈十大热点：Runway 发布 MCP 服务器、Claude Code v2.1.152 更新、OpenAI 私有 MCP 支持、Cognition 逆势融资等"
---

# AI 热点日报 | 2026年5月28日

> 数据来源：AI HOT（aihot.virxact.com），北京时间 08:00 更新

---

## 📦 产品发布

### Runway 发布 Model Context Protocol 服务器
Runway 正式推出 Runway MCP 服务器，将 AI 视频生成能力以 MCP 协议对外暴露，支持 Claude、ChatGPT、Cursor 等主流 AI 助手调用。Gen-4.5、Seedance 2.0、GPT Image 2、Kling 3.0 等模型均通过 MCP 统一接口对外提供服务。
📎 原文：[Runway 官方公告](https://runwayml.com/news/mcp)

### Claude Code v2.1.152 更新来袭
新版 Claude Code 新增 `/code-review --fix` 修复建议模式，支持在前台直接修复问题；新增 `disallowed-tools` frontmatter 配置；`/reload-skills` 修复；`SessionStart` 字段支持 `reloadSkills: true`。
📎 原文：[Claude Code GitHub Releases](https://github.com/anthropics/claude-code/releases/tag/v2.1.152)

### OpenAI 私有 MCP 服务器正式上线
支持团队在自有网络内托管 MCP 服务器，通过 ChatGPT、Codex、Responses API 访问，使用 HTTPS 加密传输。
📎 原文：[OpenAI Developers @ X](https://x.com/OpenAIDevs/status/2059703536825565499)

### FastVideo Dreamverse 开源：7 秒生成 30 秒 1080p 视频
辉岳 AI 实验室开源 FastVideo Dreamverse，基于 NVIDIA B200 GPU 和 LTX-2 模型，实现 7 秒内生成 30 秒 1080p 高清视频。Repo：https://github.com/hao-ai-lab/FastVideo/tree/main/apps/dreamverse
📎 原文：[Sky Computing Lab @ X](https://x.com/haoailab/status/2059695648103112946)

### Grok 宣布SuperGrok 开源、Kilo IDE 13 美元/月
@ kilocode 官方宣布 SuperGrok 正式开源，面向 X Premium+ 用户；同时发布 Kilo IDE，定价 13 美元/月。
📎 原文：[xAI @ X](https://x.com/xai/status/2059666227115819149)

### Perplexity 推出 Unigram：本地运行 CPU 推理
Perplexity 发布 Unigram，本地运行 AI 推理，支持 CPU 模式，5-6GB 显存即可运行。
📎 原文：[Perplexity @ X](https://x.com/perplexity_ai/status/2059664738087469511)

### OpenCode × MiMo V2.5 限时免费
OpenCode 联手 MiMo V2.5，限时提供免费使用：1M 上下文 + reasoning + text + image 全家桶。
📎 原文：[opencode @ X](https://x.com/opencode/status/2059696100626297225)

---

## 🏢 行业动态

### OpenRouter 完成 1.13 亿美元 B 轮融资
AI 模型路由平台 OpenRouter 宣布完成 1.13 亿美元 B 轮融资，由 NVentures、ServiceNow Ventures 领投，a16z、Menlo Ventures 等跟投。
📎 原文：[OpenRouter 官方公告](https://openrouter.ai/announcements/series-b)

### Cognition 逆势成为全球最大独立 Agent 实验室
AI 编程 Agent 公司 Cognition 完成新一轮融资，估值达 34.92 亿美元，Devin 创造者正式超越竞争对手。
📎 原文：[swyx @ X](https://x.com/swyx/status/2059717021944926238)

### 教皇发布 AI 伦理通谕，科技圈热议 Leo XIV 文件
梵蒂冈发布 Leo XIV 文件（Magnifica Humanitas），引发 Anthropic CTO 等科技圈人士高度关注，讨论 AI 与人类尊严边界。
📎 原文：[The Verge](https://www.theverge.com/ai-artificial-intelligence/937933/pope-ai-encyclical-tech-industry-reactions)

---

## 🔬 论文研究

### ITBench-AA 首发：SRE 任务下前沿模型准确率不足 50%
Artificial Analysis 联合 IBM 发布首个企业 IT 任务基准 ITBench-AA，Claude Opus 4.7 准确率 47%，GPT-5.5、Qwen3.7 Max 均未过 50%。
📎 原文：[Hugging Face Blog](https://huggingface.co/blog/ibm-research/itbench-aa)

### Qwen3.5 刷新 Token 生成速度纪录
Qwen3.5 在 TokenSpeed 评测中达到 580 tokens/s，超越所有开源模型。
📎 原文：[IT之家](https://www.ithome.com/0/956/293.htm)

---

## 💡 技巧与观点

### Anthropic 详解：用 LLM 保护源代码安全
Claude 官方博客深度解析如何用 LLMs 保障代码安全，覆盖 21,596 个真实 CVE 漏洞案例，从输入过滤到输出审计。
📎 原文：[Claude Blog](https://claude.com/blog/using-llms-to-secure-source-code)

### Coding Agent 成熟度报告：GPT-5.5 + Claude Opus 4.7 双寡头格局形成
dotey 发布深度报告，指出 Coding Agent 领域已形成 OpenAI + Anthropic 双寡头，Claude Code、Codex、Cursor 分列前三。
📎 原文：[dotey @ X](https://x.com/dotey/status/2059773942500298934)

### Simon Willison：Anthropic 和 OpenAI 已找到 PMF
AI 开发者 Willison 撰文认为两家头部公司已通过企业级 API 实现产品-市场契合，Anthropic Enterprise 20 万美元/年的定价已被市场接受。
📎 原文：[Simon Willison](https://simonwillison.net/2026/May/27/product-market-fit)

---

*每日 AI 热点追踪 · 作者：钟懿 · 欢迎订阅*