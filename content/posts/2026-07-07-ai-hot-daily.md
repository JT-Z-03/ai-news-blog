---
title: "AI 热点日报 | 2026年7月7日"
date: 2026-07-07T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-07-07
description: 2026年7月7日 AI 圈要闻：Meta 发布 Muse Image 和 Muse Video，MIRA 可玩多人世界模型 20 FPS 实时生成，中国拟限制外国访问最强 AI 模型，苹果研究：单个神经元即可绕过 LLM 安全对齐等。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### Meta Superintelligence Labs 推出 Muse Image 和 Muse Video

Meta Superintelligence Labs 发布首个媒体生成模型 Muse Image 和 Muse Video。Muse Image 是目前最先进的图像生成模型，能精确遵循指令、精准编辑、多参考构图，并利用 Instagram 社交上下文。它还具备智能体工具使用能力并集成 Muse Spark。用户可通过 Meta AI 应用、网页、Instagram Stories 和 WhatsApp 试用，初始限于部分国家。Muse Video 基于相同预训练基础，实现高视觉保真度并原生支持音频。

📎 [X：AI at Meta (@AIatMeta)](https://x.com/AIatMeta/status/2074577662840832382)

---

## 产品发布/更新

### MIRA：可玩多人世界模型，20 FPS 实时生成"火箭联盟的梦"

MIRA 是一个可玩、多人的世界模型，被形容为"火箭联盟的梦"。它基于 10k 小时公开机器人收集的数据训练，学习四玩家游戏动态，根据按键实时生成画面，帧率达 20 FPS。模型由 General Intuition 与 Kyutai Labs 联合构建，Epic Games 提供协作。Ethan Mollick 称从最早的扩散 DOOM 玩过来，多人 20 FPS 效果出色。演示、技术报告及开源代码已公开，在 ICML Booth 111 现场展示。

📎 [X：Ethan Mollick (@emollick)](https://x.com/emollick/status/2074348274136346871)

### Rowboat：开源、本地优先的桌面 AI 助手

Rowboat 是一个开源、本地优先的桌面 AI 助手，将邮件、会议、Slack 等数据索引为 Obsidian 风格的知识图谱，提供持久上下文记忆。内置邮件客户端、浏览器、会议记录器、代码模式（可调用 Claude Code 或 Codex 代理），并支持按事件或定时运行的背景代理。用户可通过 MCP 协议接入 Exa 搜索、GitHub 等外部工具。所有数据以纯 Markdown 格式本地存储，无供应商锁定，支持 Ollama/LM Studio 本地模型或使用 API 密钥的托管模型。

📎 [GitHub：rowboatlabs/rowboat](https://github.com/rowboatlabs/rowboat)

### Grok Imagine 更新：支持 15 秒视频

Grok Imagine 更新。15 秒 Imagine 视频现已可用。

📎 [X：Elon Musk (@elonmusk, xAI)](https://x.com/elonmusk/status/2074378653501128833)

### Claude Cowork 向移动端和网页端开放

Claude Cowork 正在向移动端和网页端开放，让会话和文件跨设备同步。Beta 版将在未来几周内首先面向 Max 用户推出。Cowork 可让 Claude 跨文件、日历、邮件、即时通讯等工具完成复杂任务，其中超过 90% 的使用场景并非软件开发，而是日常知识工作（业务运营和内容创作）。工作可跨设备跟随用户：在桌面端开始任务，从手机查看进度；关闭笔记本后 Claude 可继续后台运行，支持定时任务。当需要用户决策时，Claude 会将问题推送到手机。

📎 [Claude：Blog（网页）](https://claude.com/blog/cowork-web-mobile)

### Gemini API Managed Agents 新增后台执行、远程 MCP 与自定义函数等能力

Google 为 Gemini API 的 Managed Agents 新增后台执行、远程 MCP 服务器集成、自定义函数调用与凭证刷新功能。后台执行通过传入 `background: true` 异步运行任务，立即返回 ID 供轮询状态或流式获取进度。Managed Agents 可直接连接远程 MCP 服务器，无需自定义代理中间件，并能与内置沙箱工具（如 Google 搜索、代码执行）混合使用。

📎 [Google Blog：AI（RSS）](https://blog.google/innovation-and-ai/technology/developers-tools/expanding-managed-agents-gemini-api)

### NotebookLM 短视频概览正式上线

短视频概览功能已正式在移动端和网页端面向所有英语用户全面上线。

📎 [X：NotebookLM (@NotebookLM)](https://x.com/NotebookLM/status/2074551227594264799)

### Hugging Face Storage 成为 SkyPilot 一级后端：零出站费跨云存储

Hugging Face Storage 现为 SkyPilot 的一级后端。用户通过 `hf://` URL 和现有 HFTOKEN 即可将 Hugging Face Bucket 挂载到 SkyPilot 任务中，支持 MOUNT 或 COPY 模式。SkyPilot 可将任务调度到 20+ 云、Kubernetes、Slurm 及本地集群的任意可用 GPU 上。Hugging Face 不收取出站及 CDN 费用，存储价格 $12–18/TB/月。

📎 [Hugging Face：Blog（RSS）](https://huggingface.co/blog/skypilot-hf-storage)

### Claude Code v2.1.203 发布

本次更新新增登录过期警告和手动权限模式标记，并将附加工作目录加入 MCP roots/list。修复了 macOS 下内存检测误报、后台会话 token 过期永久不可用、上下文指示器每轮重分析导致 CPU 和内存回归等问题。二进制体积减少约 7 MB，启动内存减少约 7 MB。

📎 [Claude Code：GitHub Releases（RSS）](https://github.com/anthropics/claude-code/releases/tag/v2.1.203)

---

## 行业动态

### 中国拟限制外国访问最强 AI 模型

中国计划限制外国访问其最强 AI 模型，近期与阿里巴巴、字节跳动、Z.ai 等企业会谈，拟将先进模型（含未发布）留在中国国内。商务部主导、国家发改委参与，表明此举属出口管制而非平台监管。目标涵盖闭源和开源模型，不仅限 API 访问，还包括可下载权重。同时讨论将模型泄漏视为国家安全犯罪，并限制外国资本投资中国 AI 初创。若实施，外国公司将失去低成本模型访问权。

📎 [X：Rohan Paul (@rohanpaul_ai)](https://x.com/rohanpaul_ai/status/2074512389526237609)

### Ethan Mollick：开放权重模型供给难持续

Ethan Mollick 认为，前沿开放权重模型的流动不会无限期持续，甚至不会持续更长时间。

📎 [X：Ethan Mollick (@emollick)](https://x.com/emollick/status/2074497401578996154)

### 微软为降成本在 Copilot 中用自研 MAI 模型替换 OpenAI 和 Anthropic 模型

微软正用自研 MAI 模型替换 Copilot 产品中的 OpenAI 和 Anthropic 模型以降低支出。MAI 模型已在 Excel 和 Outlook 中每周处理数万次请求，但占比仍小。Build 大会上发布推理模型 MAI-Thinking 1，声称编码媲美 Sonnet 4.6 和 Opus 4.6，但基准测试大幅落后。AI 负责人承认目标是削减并消除对 Anthropic 的支出。

📎 [The Decoder：AI News（RSS）](https://the-decoder.com/copilot-goes-cheap-as-microsoft-phases-out-openai-and-anthropic-models-to-cut-costs)

### 美国首批自主地面车辆在乌克兰参战

美国自动驾驶车辆公司 Forterra 宣布，过去九个月已向乌克兰战场部署超过 100 辆基于 Polaris ATV 的 Lancer 自主地面车辆。这些车辆可携带 750 公斤货物，加装 Starlink 天线实现远程操控，已执行 1100 多次任务，行驶 2500 英里，运送 777,440 磅物资，完成 52 次伤员撤离。目前车辆主要采用远程操作，因自主系统尚无法实时识别并应对敌方威胁。

📎 [TechCrunch：AI（RSS）](https://techcrunch.com/2026/07/07/the-first-american-autonomous-ground-vehicles-are-fighting-in-ukraine)

---

## 论文研究

### 苹果研究：单个神经元即可绕过大型语言模型的安全对齐

苹果研究人员发现，安全对齐由两类神经元调控：拒绝神经元控制有害知识是否表达，概念神经元编码有害知识本身。在七个模型（1.7B 至 70B 参数）中，仅需抑制单个拒绝神经元即可绕过安全对齐，回答有害请求；或放大单个概念神经元，从无害提示诱导出有害内容。整个过程无需训练或提示工程。

📎 [Apple Machine Learning Research（RSS）](https://machinelearning.apple.com/research/single-neuron-safety-alignment)

### Weblica：面向视觉网页智能体的可扩展可复现训练环境

苹果研究团队提出 Weblica 框架，通过 HTTP 级缓存保存网页稳定视觉状态并保留交互行为，结合大语言模型基于真实网站与核心导航技能合成环境，构建可复现、可扩展的训练环境。最佳模型 Weblica-8B 在多个网页导航基准上超越同等规模的开源模型。

📎 [Apple Machine Learning Research（RSS）](https://machinelearning.apple.com/research/weblica-visual-web-agents)

### DynaMiCS：带性能约束的大语言模型动态混合微调

DynaMiCS 是一种动态混合优化器，将多领域微调建模为带性能约束的优化问题。它通过短领域特定探测运行估计跨领域效应斜率矩阵，再基于概率单纯形优化计算混合权重，在提升目标领域性能的同时将约束领域损失维持在参考水平以下。

📎 [Apple Machine Learning Research（RSS）](https://machinelearning.apple.com/research/dynamics-fine-tuning-llms)

---

## 技巧与观点

### Elvis Saravia 通过 HITL 和 DialAgent 提升 agentic loops 可靠性

Elvis Saravia 介绍使用 human-in-the-loop（HITL）来提升 agentic loops 的可靠性。他所有 Claude 和 Codex agent 会话都通过 @DialAgent MCP 服务器，该服务器为 agent 提供专属号码，支持语音、SMS、iMessage 作为原生工具。当循环/自动化处理 PR 或新功能时，agent 会通过简短电话将决策升级给人类。

📎 [X：Elvis Saravia (@omarsar0, DAIR.AI)](https://x.com/omarsar0/status/2074506169352180108)

### FDE 爆发：AI 公司 12 个月承诺 97.5 亿美元部署工程

AI 公司在 12 个月内合计承诺 97.5 亿美元用于建设前部署工程（FDE）团队。三种结构模型浮现：资产负债模型（微软、亚马逊）、独立实体模型（OpenAI Deployment Company 融资 40 亿美元、Anthropic 从黑石等融资 15 亿美元）、合作伙伴生态系统模型（Google Cloud 承诺 7.5 亿美元合作伙伴基金）。瓶颈从模型能力转向部署。

📎 [Tomer Tunguz 博客（VC 分析）](https://www.tomtunguz.com/the-10b-fde-boom)

### YC CEO 声称每日用 AI 部署 3.7 万行代码，开发者审查发现前端代码大量臃肿低效

Y Combinator CEO Garry Tan 在 X 上宣称，他与 AI 编码代理每天在五个项目中部署 37000 行代码，并保持连续 72 天发布记录。波兰开发者深入审查 Tan 网站前端代码，发现大量臃肿与低效问题：页面加载 169 次请求、总计 6.42MB 数据（对比 Hacker News 仅 7 次 12KB）；包含 28 个测试文件、78 个未使用的 JavaScript 控制器等。

📎 [Fast Company](https://www.fastcompany.com/91520702/y-combinator-garry-tan-agentic-ai-social-media)

### Liquid AI 开源 Antidoom：基于最终 Token 偏好优化的推理模型死循环修复方法

Liquid AI 开源了 Antidoom，一种基于 Final Token Preference Optimization (FTPO) 的针对性修复方法，用于减少推理模型中的 doom loop（死循环）问题。在 LFM2.5-2.6B 上，循环率从 10.2% 降至 1.4%；Qwen3.5-4B 上从 22.9% 降至 1%。整套流程可在数小时内完成。

📎 [MarkTechPost（RSS）](https://www.marktechpost.com/2026/07/07/liquid-ai-antidoom-doom-loops-ftpo)

### 在网络不稳定的地区，小型 AI 模型正逐渐普及

2019 年，Adebayo Alonge 因服务器远在美国致 RxScanner 单次扫描超 5 分钟，工程师 2 小时内将 AI 模型缩小至可在 Android 手机本地运行，此后 RxScanner 能在无宽带、缺电地区验药。世界银行报告显示，全球最穷国家仅 0.7% 互联网用户用过 ChatGPT。行长认为小 AI 是为缺乏算力与电力的地区提供生命救助服务的关键。

📎 [IEEE Spectrum](https://spectrum.ieee.org/small-language-models-ai-pharmaceuticals)

### Krea 2 身份保留功能上线

Krea 2 的身份保留功能已发布，配套模型和 ComfyUI 节点也已上线。

📎 [X：Krea AI (@krea_ai)](https://x.com/krea_ai/status/2074589965653303321)

### 人们如何使用 Claude Cowork

基于 2026 年 5 月 11-31 日 120 万次匿名会话样本，Claude Cowork 最大用途为业务流程与运营（33.4%），如整理报告、核对表格；其次为内容创作与文案（16.4%），如起草稿件、制作幻灯片；软件开发仅占 8.7%。用户多用它处理跨团队衔接性任务。

📎 [Claude：Blog（网页）](https://claude.com/blog/how-people-are-using-claude-cowork)

### 在 Claude Code 中选择 Claude 模型与努力级别

Claude Code 提供模型（model）和努力级别（effort）两种设置。模型选择决定能力范围；努力级别控制读取文件数、验证步骤及多步任务的推进深度。若 Claude 已掌握上下文但仍出错，应换更强大模型；若因跳读文件或未运行测试而出错，则应提高努力级别。

📎 [Claude：Blog（网页）](https://claude.com/blog/claude-model-and-effort-level-in-claude-code)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
