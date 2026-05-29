---
title: "AI Hot Daily | 2026-05-28"
date: 2026-05-28T20:00:00+08:00
draft: false
tags: ["AI", "daily"]
categories: ["daily"]
slug: "ai-hot-2026-05-28"
description: "AI daily: Cognition $26B valuation, Runway MCP server launched, Qwen3.5 sets 580 tps record, Pope Leo XIV issues AI encyclical"
---

# AI Hot Daily | 2026-05-28

> Source: AI HOT (aihot.virxact.com)

---

## Top Story

### Cognition Valued at $26B, Becomes Largest Independent Agent Lab

Cognition raised over $1B at $26B valuation from Lux Capital and General Catalyst. Annual revenue hit $492M with 10x enterprise usage growth since start of year. Devin remains the flagship AI software engineer product backed by Peter Thiel.

📎 [swyx @ X](https://x.com/swyx/status/2059717021944926238)

### Pope Leo XIV Issues AI Encyclical Warning on Rights and Freedom

Pope Leo XIV published "Magnifica Humanitas," warning AI use is never purely technical and directly impacts rights, opportunity, status and freedom when it enters human life processes. Anthropic co-founder Christopher Olah attended the announcement.

📎 [The Verge](https://www.theverge.com/ai-artificial-intelligence/937933/pope-ai-encyclical-tech-industry-reactions)

---

## Product Updates

### Runway Launches MCP Server, Enabling Direct Image/Video Generation in AI Agents

Runway MCP server lets Claude, ChatGPT, Cursor and other MCP-compatible AI agents generate images and videos directly in chat interface. Supports Gen-4.5, Seedance 2.0, GPT Image 2, Kling 3.0 and Nano Banana Pro. Setup via runwayml.com/mcp, no separate API key needed.

📎 [Runway](https://runwayml.com/news/mcp)

### Claude Code v2.1.152: New /code-review --fix to Apply Fixes Directly

Key improvements: `/code-review --fix` now applies review suggestions directly to working directory; skills support `disallowed-tools` frontmatter config; new `/reload-skills` command rescans skill directory without session restart; `SessionStart` hook supports `reloadSkills: true`; new `MessageDisplay` hook to transform or hide assistant messages.

📎 [GitHub Releases](https://github.com/anthropics/claude-code/releases/tag/v2.1.152)

### OpenAI Private MCP Server: Internal Network Hosting with Outbound-Only HTTPS

Teams can keep MCP servers in internal networks while ChatGPT, Codex and Responses API connect via outbound-only HTTPS for secure isolation.

📎 [OpenAI Developers @ X](https://x.com/OpenAIDevs/status/2059703536825565499)

### xAI Grok Coding Agent Lands on Kilo IDE

SuperGrok or X Premium+ subscribers can now use grok-build-0.1 for high-speed agentic coding in Kilo IDE extension and CLI.

📎 [xAI @ X](https://x.com/xai/status/2059666227115819149)

### Perplexity Open-Sources Unigram Tokenizer, Cutting CPU Usage 5-6x

New Unigram tokenizer implementation combined with small reranker and embedding models keeps GPU runtime in single-digit milliseconds.

📎 [Perplexity @ X](https://x.com/perplexity_ai/status/2059664738087469511)

### FastVideo Dreamverse: 7 Seconds to Generate 30s 1080p Video

HaoYi AI Lab open-sources FastVideo Dreamverse on single NVIDIA B200 GPU plus LTX-2 model for real-time video generation atmosphere guidance.

📎 [Sky Computing Lab @ X](https://x.com/haoailab/status/2059695648103112946)

---

## Industry

### Nvidia Jensen Huang Showcases Taiwan Campus, Planning $150B Annual Investment

Just one week after AMD announced plans to invest over $10B in Taiwan AI, Nvidia revealed its own major Taiwan campus expansion.

📎 [Rohan Paul @ X](https://x.com/rohanpaul_ai/status/2059689400267939925)

### China to Accelerate AI Health Comprehensive Legislation

📎 [IT Home](https://www.ithome.com/0/955/758.htm)

### Qualcomm and ByteDance Partner on AI ASIC Chips, Millions of Units

📎 [IT Home](https://www.ithome.com/0/955/674.htm)

### Alibaba Cloud Named Omdia Agent AI Market Radar Leader

📎 [Alibaba Cloud @ X](https://x.com/alibaba_cloud/status/2059509714854007181)

### Alibaba Cloud Becomes PyTorch Foundation Platinum Member

📎 [Alibaba Cloud @ X](https://x.com/alibaba_cloud/status/2059453607075004835)

### OpenAI Publishes 2026 Election Safeguards Plan

📎 [OpenAI](https://openai.com/index/election-safeguards-2026)

---

## Research

### Qwen3.5 Sets 580 tokens/s Inference Speed Record

Qwen3.5 achieved 580 tokens/s on TokenSpeed inference engine for agent workloads through collaboration between Alibaba Qwen inference team, NVIDIA and Mooncake team using FlashAttention-4 optimization.

📎 [Alibaba Qwen @ X](https://x.com/Alibaba_Qwen/status/2059674574397313277)

### ITBench-AA: All Frontier Models Score Below 50% on SRE Tasks

ITBench-AA SRE benchmark from Artificial Analysis and IBM shows all frontier models under 50%: Claude Opus 4.7 at 47% leads, GPT-5.5 at 46%, Qwen3.7 Max at 42%. Key finding: 3x variation in reasoning rounds but longer traces do not convert to higher accuracy. Open-source Gemma 4 31B scores 37% at $0.14/task, outperforming more expensive closed models.

📎 [Hugging Face Blog](https://huggingface.co/blog/ibm-research/itbench-aa)

### Google Research Publishes Zero-Trust Aggregation Privacy Analysis

📎 [Google Research Blog](https://research.google/blog/private-analytics-via-zero-trust-aggregation)

---

## Insights

### Coding Agent Maturity: Dual Oligopoly Formed

OpenAI (GPT-5.5) + Anthropic (Claude Opus 4.7) dual oligopoly established, Claude Code, Codex and Cursor taking top three spots. Chinese models still one position behind in Coding Agent ecosystem building.

📎 [Baoyu @ X](https://x.com/dotey/status/2059773942500298934)

### Anthropic and OpenAI Found Product-Market Fit

Anthropic Enterprise ($20/seat/month + API) and OpenAI Codex (per-token pricing) mark both companies entering commercial harvest phase with new models priced significantly above predecessors.

📎 [Simon Willison](https://simonwillison.net/2026/May/27/product-market-fit)

### Anthropic Publishes AI Agent Zero-Trust Security Framework

Frontier LLMs compressing vulnerability exploitation cycle from months to hours. Three-tier zero-trust architecture proposed: basic, advanced, optimized, plus eight-stage implementation covering prompt injection, tool poisoning, memory poisoning threats.

📎 [Claude Blog](https://claude.com/blog/zero-trust-for-ai-agents)

### Securing Source Code with LLMs: Six-Step Cycle

Core process: threat modeling, sandbox isolation, vulnerability discovery, verification, classification, remediation. Discovery bottleneck has shifted to verification. 1,596 open source vulnerabilities disclosed as of May 22, 2026, with 97 already patched.

📎 [Claude Blog](https://claude.com/blog/using-llms-to-secure-source-code)

---

*AI Hot Daily · Author: Zhong Yi · Source: AI HOT (aihot.virxact.com)*