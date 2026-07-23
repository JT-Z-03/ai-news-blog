---
title: "AI 热点日报 | 2026年7月6日"
date: 2026-07-06T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-07-06
description: 2026年7月6日 AI 圈要闻：美团 LongCat-2.0 完全开源，扎克伯格谈千兆瓦级 AI 集群与数千亿美元资本投入，NVIDIA Kyber NVL144 延迟至 2028，欧盟理事会快速推动 Chat Control 2.0 等。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### 美团 LongCat-2.0 完全开源（MIT 许可），1.6T MoE 模型开放权重与推理代码

美团宣布 LongCat-2.0 完全开源（MIT 许可），公开模型权重与推理代码。该模型采用 MoE 架构，总参数量 1.6T，每 token 激活约 48B，支持 1M token 上下文。技术亮点包括 LongCat Sparse Attention、Zero-Compute Experts 动态激活 33B-56B 计算，以及 MOPD 按任务路由 Agent、Reasoning、Interaction 三组专家。Benchmark 成绩包括 Terminal-Bench 2.1 70.8、SWE-bench Pro 59.5、SWE-bench Multilingual 77.3、FORTE 73.2、RWSearch 78.8、BrowseComp 79.9，并已原生集成 Claude Code、OpenClaw、Hermes Agent 等工具，支持 GPU 与 NPU 部署。

📎 [X：美团 LongCat (@Meituan_LongCat)](https://x.com/Meituan_LongCat/status/2073768940078317713)

---

## 行业动态

### 扎克伯格：建千兆瓦级 AI 集群，集中精英与资本

Mark Zuckerberg 表示，Meta 正在建设名为 Prometheus 的 AI 集群，首个单一集群规模超过 1GW，并称相关投入是“数千亿美元”级别。他强调自己的职责是集中顶尖人才、资本和基础设施。

📎 [X：Rohan Paul (@rohanpaul_ai)](https://x.com/rohanpaul_ai/status/2073834219659534816)

### NVIDIA Kyber NVL144 延迟超 12 个月至 2028

SemiAnalysis 称，Jensen Huang 在 GTC 展示 Kyber NVL144 仅三个月后，该项目已出现重大延迟，时间表推迟超过 12 个月至 2028 年。相关分析还提到 NVIDIA 的 NVL72x2 背靠背机架架构被取消，导致 Rubin Ultra 的扩展域受限。

📎 [X：SemiAnalysis (@SemiAnalysis_)](https://x.com/SemiAnalysis_/status/2073874671498387899)

### 欧盟理事会通过快速通道强制推行“聊天管控”（Chat Control 2.0）

欧盟理事会通过书面程序快速推进一项新法规，要求科技公司对加密通信进行无差别扫描，以填补过渡性规定 4 月 3 日到期后的法律漏洞，并向欧洲议会施压。批评者认为该做法试图绕过民主监督。草案将在夏季休会前以紧急程序提交议会表决；理事会称扫描限于必要范围，处理的数据须在检测后 12 个月内不可撤销地删除。

📎 [Hacker News 热门（buzzing.cc 中文翻译）](https://www.heise.de/en/news/Chat-Control-1-0-EU-Council-forces-messenger-scans-via-fast-track-11353659.html)

---

## 技巧与观点

### Anthropic Claude Design 反向工程提示词开源更新

Anthropic 旗下 Claude Design 的反向工程系统提示词在 GitHub 以 MIT 许可证开源，包含 20 章提示词和 14 项技能，覆盖内容纪律、美学、无障碍（WCAG、语义 HTML、键盘导航）、交互状态和系统思维等。近日项目针对 Fable 5/Opus 4.7+ 系列校准，新增自主决策条款：小决定直接执行并记录，不再询问。项目支持 Claude Code、Claude.ai 和 Codex 变体。

📎 [GitHub：Trystan-SA/claude-design-system-prompt](https://github.com/Trystan-SA/claude-design-system-prompt)

### LlamaIndex 发布 legal-kb：基于 Index v2 的智能体检索参考应用

LlamaIndex 发布 legal-kb，一个基于 Index v2（LlamaParse Platform）的法律文档知识库参考应用。它采用 Retrieval Harness 模式，为 Agent 提供 retrieve、findFiles、readFile 和 grepFile 四个文件系统风格工具，分别用于混合语义检索、文件名搜索、按偏移读取原始内容和正则定位。Agent 需先调用 findFiles 确定文件清单，再使用其他工具定位内容。底层基于 Vercel AI SDK 6 的 ToolLoopAgent，可选 OpenAI 或 Anthropic 模型，并支持用户自带 API key。

📎 [MarkTechPost（RSS）](https://www.marktechpost.com/2026/07/05/llamaindex-legal-kb-agentic-retrieval-over-index-v2-with-retrieve-find-read-and-grep-tools)

### 三周前，我不小心创办了一家小公司

一位父亲为患有自闭症的非语言儿子开发了一款沟通应用，在言语治疗室等候区展示时，非语言儿童的母亲和治疗师被触动。他意外发现产品市场匹配，决定腾出时间让更多孩子使用。这款应用专为理解语言困难的儿童设计，与传统 AAC 设备不同，后者主要面向身体障碍但语言理解正常的成人。

📎 [Hacker News 热门（buzzing.cc 中文翻译）](https://extelligence.substack.com/p/i-accidentally-started-a-small-business)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
