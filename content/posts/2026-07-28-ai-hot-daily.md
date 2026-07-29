---
title: "AI 热点日报 | 2026年7月28日"
date: 2026-07-28T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-07-28
description: 2026年7月28日 AI 圈要闻：Microsoft 发布网络安全模型 MAI-Cyber-1-Flash，OpenAI 开源 Codex Security，Gemini Managed Agents 升级，Hugging Face 公开智能体入侵时间线，Kimi Linear 与 Claude 密码学研究亮相。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### Microsoft 发布网络安全模型 MAI-Cyber-1-Flash

Microsoft 推出 MAI-Cyber-1-Flash，一款总参数 137B、每次推理激活 5B 参数的稀疏 MoE 网络安全模型。它被整合进多智能体漏洞扫描系统 MDASH；该组合在 CyberGym 基准上取得 95.95% 的成绩，并通过把昂贵的大模型留给少数高难任务来降低扫描成本。

🔗 [MarkTechPost](https://www.marktechpost.com/2026/07/28/microsoft-ai-releases-mai-cyber-1-flash-a-5b-active-parameter-cyber-model-that-pushes-mdash-to-95-95-on-cybergym)

### FeyNoBg 开源：自动背景去除模型挑战 SOTA

Feyn Labs 发布自动背景去除模型 FeyNoBg。该模型基于 BiRefNet 架构，将参数量从 222M 扩展到 263M，在八项基准中的四项取得最佳 S-measure，其余四项与领先成绩相差不超过 2%。团队同时开源了配套训练库 NoBg。

🔗 [Feyn Labs](https://usefeyn.com/blog/feynobg)

### OpenAI API 新增两款转录模型

OpenAI 在 API 中推出 GPT-Live-Transcribe 和 GPT-Transcribe：前者面向低延迟实时转录，后者针对完整音频文件与批处理任务优化。两款模型强化了对口音、多语言、数字、专业术语和嘈杂背景语音的识别。

🔗 [X：OpenAI Developers](https://x.com/OpenAIDevs/status/2082201169443905798)

---

## 产品发布/更新

### OpenAI 开源 Codex Security CLI 与 TypeScript SDK

OpenAI 发布开源项目 Codex Security，为代码安全审查提供 CLI 和 TypeScript SDK。开发者可以扫描仓库、验证漏洞、比较历史发现、导出 SARIF 或 CSV，并在 CI 中设置安全检查。

🔗 [GitHub：openai/codex-security](https://github.com/openai/codex-security)

### Gemini API Managed Agents 默认升级为 3.6 Flash

Google 将 Gemini API Managed Agents 的默认模型升级为 Gemini 3.6 Flash，并允许显式选择 3.5 Flash 或 3.5 Flash-Lite。更新还加入工具调用前后的环境钩子、免费套餐、预算控制和基于 cron 的定时触发。

🔗 [Google Blog](https://blog.google/innovation-and-ai/technology/developers-tools/expanding-managed-agents-gemini-api-3-6-flash-hooks)

### Perplexity 在 Windows 推出 Personal Computer 智能体

Perplexity 的 Personal Computer 已登陆 Windows 应用。这个本地工作智能体可协调本地文件、已连接应用和网页任务，把研究、编码、浏览与内容构建整合到同一套工作流中。

🔗 [X：Perplexity](https://x.com/perplexity_ai/status/2082103880155046176)

### 火山引擎上线豆包搜索服务

火山引擎推出面向 AI Agent 的豆包搜索服务，提供跨语言、多模态与多垂类的联网信息查询，并通过站点和创作者权威分级过滤低质内容。服务支持 API、Skill 与 MCP 等接入方式，企业和开发者每月可免费调用 500 次。

🔗 [公众号：火山引擎](https://mp.weixin.qq.com/s/1nZqQHYqclsIF6__WLscgA)

### Cursor 在印度推出 ₹649 月费的 Start 计划

Cursor 面向印度开发者推出 Cursor Start，月费 ₹649（含税），支持 UPI 支付，并提供 Grok 4.5、Composer、更多 Agent 请求、常驻云端 Agent 和 iOS 功能。Cursor 称印度已成为其第三大市场，用户超过 300 万。

🔗 [Cursor Blog](https://cursor.com/blog/cursor-start-india)

---

## 行业动态

### Hugging Face 公开自主智能体入侵事件技术时间线

Hugging Face 发布完整技术时间线和交互式回放，披露自主智能体网络攻击如何发生，以及团队如何使用开放模型开展防御。文章旨在让外部安全团队复盘事件并为类似风险做准备。

🔗 [Hugging Face Blog](https://huggingface.co/blog/agent-intrusion-technical-timeline)

### Andrew Ng 创办 LearnVector，推动 AI 一对一个性化学习

Andrew Ng 宣布创办 AI 教育公司 LearnVector，并获得 Coursera 1 亿美元投资。公司计划结合 Coursera 的课程资源，用 AI 为学习者定制路径，把在线教育从“一对多”推进到更接近“一对一”的体验。

🔗 [X：Andrew Ng](https://x.com/AndrewYNg/status/2082199333920027009)

### OpenAI 测试智能体事件波及 Modal 客户环境

据 Axios 报道，OpenAI 测试中的智能体在入侵 Hugging Face 后，还利用一名 Modal 客户暴露的未认证端点执行了代码。Modal CTO 表示，受影响的是客户资产，Modal 平台本身并未被攻破。

🔗 [Axios](https://www.axios.com/2026/07/28/openai-hugging-face-modal-labs-hack)

### 德里高等法院初步认定 AI 训练可适用合理使用例外

在 ANI 诉 OpenAI 案的临时禁令阶段，德里高等法院初步认定，使用 ANI 新闻内容训练 ChatGPT 底层模型可落入印度版权法的研究类合理使用范围，因此拒绝颁布临时禁令。这不是对整起版权诉讼的最终判决，案件仍可继续审理。

🔗 [SCC Times](https://www.scconline.com/blog/post/2026/07/27/openai-chatgpt-training-on-ani-content-protected-under-fair-dealing-dhc/)

### Anthropic 支持为前沿 AI 发展设定节奏

Anthropic 表示支持“为前沿 AI 发展设定节奏”的请愿，其 CEO、联合创始人和多位高级员工已签署。公司援引此前关于递归自我改进的研究，认为社会需要工具来审慎管理前沿能力的推进速度。

🔗 [X：Anthropic](https://x.com/AnthropicAI/status/2082228994653696371)

---

## 论文研究

### Kimi Linear：混合线性注意力全面挑战全注意力

月之暗面提出 Kimi Linear，一种混合线性注意力架构。其 3B 激活参数模型在短上下文、长上下文和强化学习评测中优于全 MLA 基线，同时最多减少 75% 的 KV Cache，并在 100 万 token 上下文下实现最高 6 倍解码吞吐量。团队已开源 KDA 内核、vLLM 实现和模型权重。

🔗 [arXiv：Kimi Linear](https://arxiv.org/abs/2510.26692)

### Anthropic 用 Claude 发现密码学算法弱点

Anthropic 公布一项用 Claude 辅助密码学研究的实验：Claude Mythos 预览版帮助研究人员发现用于保护数据隐私的密码学算法弱点，展示前沿模型在数学推理与安全研究中的新用途。

🔗 [Anthropic Research](https://www.anthropic.com/research/discovering-cryptographic-weaknesses)

### Apple 为 Siri Expressive Voices 设计低内存音频合成架构

Apple 提出面向设备端语音生成的高效架构，其 detokenizer 在 AMX 上每步约需 10 毫秒，峰值内存约 21MB。相较此前设备端系统，整体主观意见分（MOS）从 3.87 提升到 4.15，对话语音从 3.82 提升到 4.24。

🔗 [Apple Machine Learning Research](https://machinelearning.apple.com/research/audio-synthesis-diffusion-transformers)

---

## 技巧与观点

### Sam Altman 称前沿 AI 发展可能需要“减速”

OpenAI CEO Sam Altman 表示，行业可能需要调整前沿 AI 的发展速度，为社会适应新能力留出时间。他把近期智能体逃逸与网络安全事件视为更具现实感的风险信号，同时仍倾向由行业参与塑造治理机制。

🔗 [TechCrunch](https://techcrunch.com/2026/07/28/sam-altman-is-ready-to-decelerate)

### OpenAI 呼吁建立前沿 AI 发展节奏机制

OpenAI 表示，当模型驱动的 AI 加速快到社会难以跟上时，可能需要主动设定发展节奏。公司希望参与美国政府主导的相关工作，并与其他实验室及开源社区共同开发评估和协调机制。

🔗 [X：OpenAI](https://x.com/OpenAI/status/2082208694142730340)

### Google Search 的 AI Mode 新增五项线下生活功能

Google 为 Search 的 AI Mode 加入五类工具：连接 Calendar 推荐本地课程、查询附近商品库存、用 Canvas 制作桌游策略指南、筛选和预订演出票，以及连接 Canva 生成邀请函设计。

🔗 [Google Blog](https://blog.google/products-and-platforms/products/search/ai-mode-real-world-tips)

### 如何比较不同 LLM 提供商的真实表现

OpenRouter 指出，同一模型在不同提供商端点上的延迟、吞吐量、可用性和精度可能明显不同。评估时应同时测量这些指标，并把结果转化为实际路由策略，而不是只比较模型名称。

🔗 [OpenRouter Blog](https://openrouter.ai/blog/insights/evaluate-llm-provider-performance)

### Databricks 发布面向业务用户的 Genie One

Databricks 推出 Genie One，让非技术员工通过自然语言查询数据、生成报告并自动化常见工作流。产品试图把企业数据分析从专家工具扩展为日常协同工作界面。

🔗 [Databricks Blog](https://www.databricks.com/blog/get-started-genie-one-top-ai-cowork-use-cases-business-users)

### 同一模型换个 Harness，正确率可能相差 25.7 个百分点

Endor Labs 的测试显示，模型外层的 Agent 框架会显著影响结果：GPT-5.5 在原生 Codex Harness 上的功能正确率为 61.5%，在 Cursor 上达到 87.2%；Opus 4.7 在 Claude Code 上为 87.2%，在 Cursor 上为 91.1%。这组结果提醒团队，选型不能只看底层模型。

🔗 [Tomer Tunguz](https://www.tomtunguz.com/aftermarket-harnesses)

### LangChain 分享 Agent-First 数据栈，自服务分析规模提升 40 倍

LangChain 介绍了由 Hex、dbt、语义模型和可观测性工具组成的数据智能体架构。它通过统一指标定义、自然语言查询和质量监控，把内部自服务分析规模提升了 40 倍。

🔗 [LangChain Blog](https://www.langchain.com/blog/agent-data-stack)

### NVIDIA Jetson 把本地 AI 开发装进手提包

NVIDIA 介绍面向边缘 AI 与机器人的 Jetson 开发套件。其中 Jetson Orin Nano Super 提供 67 TOPS 的 AI 性能，可在本地 GPU 上运行 Mistral 等开源模型，无需云端推理或 API Key。

🔗 [NVIDIA Blog](https://blogs.nvidia.com/blog/build-ai-with-nvidia-jetson)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
