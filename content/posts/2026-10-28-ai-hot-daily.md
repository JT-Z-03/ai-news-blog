---
title: "AI 热点日报 | 2026年10月28日"
date: 2026-10-28T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-10-28
description: 2026年10月28日 AI HOT 要闻。Genie 4 开启研究预览，Liquid 发布 LFM3 开放权重模型，面壁开源 MiniCPM-OCR；Anthropic 披露药物研发早期进展，开发者分享 Claude Code 定制与计费方法。
---

> 数据来源 [AI HOT](https://aihot.news/)，按北京时间 10 月 28 日整理并核对原始来源。本期收录 9 条，涵盖模型发布、产品用法、研究进展与观点；日期按原始公告核实，研究预览、早期实验和作者判断分别说明。

---

## 模型发布/更新

### Google DeepMind 发布 Genie 4，目前仅向受信任测试者开放

Google DeepMind 发布世界模型 Genie 4，支持用键盘控制实时场景、用自然语言改变天气或加入人物和物体，并同步生成环境声、音乐与人物对话。模型结合 Gemini 的能力帮助维持场景连续性，生成的视频和音频均带有 SynthID 水印。

目前 Genie 4 仅向受信任测试者提供研究预览。面向 Google AI Ultra 用户的 Project Genie，以及 Gemini API、Google AI Studio 早期合作伙伴的访问仍待后续开放。官方列出的限制包括长时间场景的一致性、复杂物理和音频准确度，演示效果不能直接视为任意场景下的稳定表现。

🔗 [Google DeepMind 发布说明与开放范围](https://deepmind.google/blog/genie-4-a-new-generation-of-world-simulation/)

### Liquid AI 发布 LFM3，首批开放六款小型模型权重

Liquid AI 发布 LFM3 家族，以 LFM3-1.7B-Base 为共享骨干，首批提供六款约 2B 规模的模型，覆盖文本、视觉、音频、全模态及两个决策模型。开发者可从 Hugging Face 获取权重，也可通过 Liquid AI API 和 Playground 使用相关能力。

这套模型面向需要专门适配任务和部署环境的应用。官方文本模型卡提醒，小参数模型不适合复杂多步推理或智能体编程，知识密集型任务建议结合检索；实际端侧速度仍取决于硬件和推理配置。模型使用 LFM Open License v1.0，获取权重后仍须遵守对应许可。

🔗 [Liquid AI 模型家族与获取方式](https://www.liquid.ai/blog/lfm3)

🔗 [Liquid AI 官方发布公告](https://x.com/liquidai/status/2115128329003303107)

🔗 [文本模型卡与使用限制](https://huggingface.co/LiquidAI/LFM3-1.7B)

### 面壁智能开源 MiniCPM-OCR，将文档解析与识别质量评分分开

面壁智能开源 MiniCPM-OCR 系列。1.3B 的 MiniCPM-OCR 1.0 用于解析中文、英文文档与 PDF，覆盖文字、表格、公式等内容；2B 的 MiniCPM-OCR Jev 则接收图像区域及其 OCR 结果，输出 0 到 1 的质量分数，帮助找出需要复核的位置。

项目代码、文档和两款模型权重采用 Apache 2.0 许可，并提供 vLLM、SGLang、llama.cpp、Ollama 等部署说明。解析与质量评分可以配合使用，也可用 Jev 检查其他解析模型的结果；分数用于筛选复核对象，不能保证业务文档全部识别正确。

🔗 [MiniCPM-OCR 官方仓库、模型与许可](https://github.com/OpenBMB/MiniCPM-OCR)

🔗 [MiniCPM 官方发布记录](https://github.com/OpenBMB/MiniCPM-V/commit/f2de6299cf9626937e1adc017efba1d588353935)

---

## 产品发布/更新

### Gemini 官方介绍 SynthID 检测用法，范围限于 Google AI 水印

Gemini 官方介绍了内置 SynthID 检测的使用方法。用户上传图片、视频或音频，再询问内容是否由 AI 生成，即可检查文件中是否含有 Google AI 的隐形水印。这则公告介绍现有能力的用法，没有宣称当天首次上线。

官方帮助页要求登录账户，每次检查一个不超过 100MB 的文件。检测范围是 Google AI 水印，无法据此识别所有厂商的生成内容；多次编辑后的水印也可能无法检出，因此未检出不能证明作品由真人制作。

🔗 [Gemini 官方使用说明](https://x.com/GeminiApp/status/2115171788812669225)

🔗 [Google 帮助页与检测限制](https://support.google.com/gemini/answer/16722517?hl=en)

---

## 行业动态

### Anthropic 披露 Claude 参与药物研发的早期进展

Anthropic 公布与六家药物研发机构的合作进展，包括 Generate Biomedicines、Divergence Labs、BigHat Biosciences、Enveda、The Column Group 和 Bristol Myers Squibb。案例涉及分子设计、候选方案优化、生产文书审核与临床试验规划，公司也已启动自己的药物发现项目。

公告将实验方法和早期结果作为后续改进 Claude 的依据。多数项目仍处于临床前阶段，实验室或动物实验结果尚不能证明人体疗效，也不代表已有新药获批。Anthropic 计划继续扩大合作，并让模型参与更多实际研发环节。

🔗 [Anthropic 合作案例与技术报告入口](https://www.anthropic.com/research/early-progress-drug-development)

🔗 [Anthropic 官方发布公告](https://x.com/AnthropicAI/status/2115178675050307942)

---

## 技巧与观点

### Addy Osmani 分享 Claude Code Mods 入门方法

Addy Osmani 发布 Claude Code Mods 教程，介绍如何用 JavaScript 或 TypeScript 在会话中观察事件、改写行为和渲染界面。示例包括上下文用量提示、危险命令的操作预览，以及回合结束后的文件修改回放；Mods 本身已在数周前推出，这次更新是上手指南。

教程提醒，Mods 在本机以用户权限运行，没有沙箱隔离，可以读取文件、启动进程和访问网络。安装前应审阅来源与代码；示例中的命令预览也只是一层辅助检查，无法替代实际权限规则。接口可能随版本变化，开发时应参考当前版本生成的类型声明。

🔗 [Addy Osmani 原始教程与示例入口](https://x.com/addyosmani/status/2115326629488824753)

### OpenRouter 介绍 Claude Code 达到订阅用量上限后的 API 计费方案

OpenRouter 发布教程，说明如何让 Claude Code 使用 OpenRouter API Key，或通过 Ori Harness 启动按 Token 付费的会话。教程采用独立命令保留原有订阅入口，方便在订阅额度恢复后切回；API 请求的费用另行结算，不会恢复订阅额度。

这种方式仍受账户余额、密钥额度和组织预算约束。教程建议先设置花费上限，并以 OpenRouter 的实际用量记录核账，因为 Claude Code 界面估算的费用可能与最终账单不同。文中的短会话成本来自供应商自己的样本，不能作为任意项目的固定价格。

🔗 [OpenRouter 配置步骤、预算与计费说明](https://openrouter.ai/blog/tutorials/claude-code-usage-limit/)

### OpenAI 员工讨论 AI 进入企业组织结构的三种情景

Hemanth Asirvatham 与 Elliott Mokski 在 OpenAI 网站发表文章，讨论 AI 可能如何进入企业组织结构，包括为每位员工承担下属任务、与人类员工并列工作，以及处于人类管理者和执行人员之间负责协调。这些情景用来分析工作分配、管理流程与员工自主权的变化。

作者明确说明文章代表个人观点。文中没有给出企业都会保留现有岗位的保证，讨论也限于 AI 逐步进入组织的过渡阶段；企业规模、用工和薪酬如何变化，还取决于需求增长、人类能提供的价值和具体采用方式。

🔗 [原文及作者观点声明](https://openai.com/index/the-future-of-the-firm/)

### Azeem Azhar 从 Anthropic 招股文件讨论增长与算力承诺

Azeem Azhar 发布对 Anthropic S-1 的图表解读，认为公司已经展现出客户需求、现金流和融资能力，但能否持续保持足够增长、支付承诺采购的算力仍是关键问题。公开摘要还指出，新发布模型对当前收入的贡献较高。

这是作者对既有招股文件的分析，并非当天新增的上市申请，也不构成对未来盈利的保证。原文部分内容需要订阅，本期仅依据可公开核验的摘要整理，不补写付费图表中的数字或结论。

🔗 [Exponential View 公开摘要与原文](https://www.exponentialview.co/p/anthropics-s-1-in-charts)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
