---
title: "AI 热点日报 | 2026年7月27日"
date: 2026-07-27T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-07-27
description: 2026年7月27日 AI 圈要闻：Kimi K3 开源并公布 2.8T MoE 架构，PerceptionBench 发布，Open Secure AI Alliance 成立，Anthropic 澄清开源权重立场。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### Kimi K3 开源：2.8T MoE 模型与技术报告

Kimi 发布其最强模型 Kimi K3。该模型采用 2.8T 参数的 MoE 架构，具备原生视觉理解能力和 100 万 token 上下文窗口，新架构将每单位计算所获得的智能提升至此前的 2.5 倍。除模型权重外，团队还开源了高性能注意力内核、MoE 通信库和大规模智能体运行环境基础设施。

🔗 [X：Kimi.ai](https://x.com/Kimi_Moonshot/status/2081760186235289764)

### Kimi K3 上线 Modal，支持无损加速推理

Modal 成为 Kimi K3 的首发合作伙伴，并针对 K3 架构训练了定制 DFlash 投机推理器，在不损失模型质量的前提下提升推理速度。

🔗 [X：Kimi.ai](https://x.com/Kimi_Moonshot/status/2081767591887122564)

---

## 产品发布/更新

### Kimi 发布视觉感知基准 PerceptionBench

Kimi 发布 PerceptionBench，从前沿模型在 42 个现有基准中的失败模式出发，将视觉感知拆解为 10 种原子能力，并构建 3000 道验证题。每道题只考察一种感知能力，不要求额外推理或外部知识。

🔗 [X：Kimi.ai](https://x.com/Kimi_Moonshot/status/2081813202514681878)

### SGLang 和 Miles 为 Kimi K3 提供发布当日支持

SGLang 和 Miles 为月之暗面开源的 2.8T 参数 Kimi K3 提供首日支持，分别覆盖推理和强化学习训练。K3 采用 69 层 KDA 线性注意力与 24 层 MLA 交错的混合架构，在 SGLang 上单卡 batch-1 解码速度约为每秒 113 token，结合 DSpark 推测解码后可达约每秒 423 token。

🔗 [LMSYS Blog](https://www.lmsys.org/blog/2026-07-27-kimi-k3-day0-support)

---

## 行业动态

### Google AI Overviews 在搜索结果中的出现率升至 43%

新数据显示，Google AI Overviews 在搜索结果中的出现率一年内从 15% 升至 43%，AI Mode 月访问量也从 1.26 亿增至 2.79 亿。与此同时，用户正在从短关键词转向更长、更自然的对话式查询。

🔗 [TechCrunch](https://techcrunch.com/2026/07/27/googles-ai-search-is-rapidly-becoming-the-default-new-data-shows)

### 多家行业领袖成立 Open Secure AI Alliance

NVIDIA、Microsoft、Hugging Face、IBM 等数十家机构联合成立 Open Secure AI Alliance，计划通过开源模型、工具和框架，推动构建可审查、可定制的 AI 安全防御体系。

🔗 [NVIDIA Blog](https://blogs.nvidia.com/blog/open-secure-ai-alliance)

### Cognizant 与 Anthropic 扩大合作

Cognizant 成为 Claude Partner Network 的全球首要合作伙伴，并将 Claude 嵌入 Flowsource 等平台。Cognizant 已有超过 3 万名员工完成 Claude 培训；双方为一家生物制药公司构建的智能合约系统，将合同审核时间最多缩短 40%，信息提取准确率超过 88%。

🔗 [Anthropic Newsroom](https://www.anthropic.com/news/cognizant-anthropic)

---

## 论文研究

### Apple 提出 GH-ESD：发现实例级视觉任务中的系统性错误

Apple 机器学习研究团队提出 GH-ESD（Grounded Hypothesis-Driven Error Slice Discovery），用于发现目标检测与分割等实例级视觉任务中的错误切片。该方法以假设为驱动，重点识别由上下文关系和空间视觉模式导致、且在语义连贯子集上反复出现的系统性失效。

🔗 [Apple Machine Learning Research](https://machinelearning.apple.com/research/gh-esd)

---

## 技巧与观点

### 用 AI Skill 自动生成可协作的 HTML PPT

Vista 基于 bento PPT 改造了一款 Skill，输入内容或主题即可自动生成可编辑、可在线演示并支持协作的 HTML PPT。作者推荐使用 Kimi K3 或 Opus 4.8+ 等前端审美能力较强的模型。

🔗 [X：Vista](https://x.com/vista8/status/2081568902241513786)

### GitHub Copilot 发布 Harness 工作流

GitHub Copilot 推出 Harness 工作流，让开发者通过单一 AI 工具完成原型设计、规划、实现和代码审查，减少在多种 AI 开发工具之间切换造成的效率损耗。

🔗 [GitHub Blog](https://github.blog/ai-and-ml/github-copilot/the-harness-is-all-you-need-mostly)

### 用 Claude 和 Python 构建技能驱动的金融分析智能体

一篇教程基于 Anthropic 的 financial-services 仓库，用纯 Python 复现技能驱动架构：解析 SKILL.md 构建可搜索的技能注册表，并创建可复用的 SkillAgent，将金融分析流程注入 Anthropic Messages API，支持迭代式工具调用。

🔗 [MarkTechPost](https://www.marktechpost.com/2026/07/27/designing-skill-driven-financial-analysis-agents-with-claude-python-mcp-connectors-and-automated-deliverables)

### OpenAI 称越来越多员工用 ChatGPT 处理其他岗位的工作

OpenAI 分析超过 80 万条工作相关 ChatGPT 消息后发现，43.5% 的岗位特定查询涉及另一种职业，营销与工程任务的交叉最明显。用户正用 AI 处理合同审查、数据分析和网站故障排查等过去通常由专家完成的工作，这一趋势在缺少专业团队的小公司尤其突出。

🔗 [The Decoder](https://the-decoder.com/openai-says-more-workers-are-using-chatgpt-to-do-other-peoples-jobs)

### GitHub Copilot app 入门：多 Agent 会话与 Canvas 预览

GitHub Copilot app 将 AI 编码工具扩展为多 Agent 会话工作区，允许用户同时管理多个任务并保留各自上下文。用户还可以通过 Canvas 在浏览器中预览界面并直接点选修改，以及使用 Agent Merge 处理 PR 审查反馈和合并冲突。

🔗 [GitHub Blog](https://github.blog/ai-and-ml/github-copilot/github-copilot-app-for-beginners-getting-started)

### Leader.skill：把模糊需求转化为可长程执行的目标

作者开源了 Leader.skill，用“目标七问”方法将模糊需求转化为 Agent 可独立执行数小时的目标任务书，覆盖目的、完成态、反作弊和边界等维度。

🔗 [公众号：数字生命卡兹克](https://mp.weixin.qq.com/s/AwOk3di8m6eVeIUjzNftgg)

### Anthropic 澄清开源权重模型立场

Anthropic CEO Dario Amodei 表示，公司从未主张全面禁止开源权重模型，并认为不具备危险能力的开源权重模型属于公共产品。他提出对华芯片出口管制、打击工业级知识蒸馏，以及对所有足够强大的模型实施强制安全测试三项措施。

🔗 [Anthropic Newsroom](https://www.anthropic.com/news/position-open-weights-models)

### OpenRouter 新增图像生成模型专用接口

OpenRouter 为图像生成模型推出专用接口，图像理解仍沿用原有聊天补全接口，两类任务共用同一套 API Key 和计费体系。平台同时公布了完整接口约定，并修复此前出现的 “no endpoints found” 错误。

🔗 [OpenRouter](https://openrouter.ai/blog/tutorials/image-generation-models)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
