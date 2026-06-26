---
title: "AI 热点日报 | 2026年6月25日"
date: 2026-06-25T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: "ai-hot-2026-06-25"
description: "2026年6月25日 AI 圈要闻：ChatGPT 测试双向语音模型 Bidi 1，Qwen-AgentWorld 开源，豆包推出专业版，OpenAI 与 Broadcom 发布推理芯片 Jalapeño。"
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### OpenAI ChatGPT 语音最大规模升级：双向 AI 语音模型 Bidi 1 已上线测试

OpenAI 尚未正式官宣，但部分用户已经在 ChatGPT 网页版和 App 的模型选择器里看到 Bidi 1。它的关键变化是“边听边说”：模型可以在持续输出时接收用户打断，并立刻切换到新指令。相比传统语音助手的一问一答，这更接近真人对话节奏，也说明语音交互正在从“识别语音输入”走向“实时协作界面”。

📎 [IT之家：ChatGPT 语音模型 Bidi 1](https://www.ithome.com/0/967/852.htm)

### Qwen-AgentWorld 开源：让 Agent 学会“先预测，再行动”

通义千问开源 Qwen-AgentWorld，目标是给智能体提供一个原生语言世界模型，让 Agent 在行动前先预测环境反馈。它覆盖 MCP、Search、Terminal、SWE、Web、OS、Android 七类场景，并通过真实交互轨迹训练。真正值得关注的是它把“环境模拟器”和“智能体基础模型”结合起来：如果模型能更便宜地试错，Agent 训练和评测就不必完全依赖真实环境。

📎 [公众号：通义实验室（千问）](https://mp.weixin.qq.com/s/NV9WGpGsfFz35jww5agM9g)

### Gemini 3.5 Flash 集成计算机使用能力

Google 把 Computer Use 作为内置工具集成进 Gemini 3.5 Flash，开发者可以用它构建跨浏览器、移动端和桌面环境的智能体。此前这类能力更像独立模型或专门功能，现在被放进主力 Flash 模型，意味着企业自动化正在向默认能力靠拢。它同时加入敏感操作确认、提示注入检测等保护，说明“会操作电脑”这类能力的安全边界已经成为产品核心。

📎 [Google Blog：Gemini 3.5 Flash computer use](https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-computer-use-gemini-3-5-flash)

### GPT-5.5 Instant 新版本，对话更有趣

OpenAI 推送新版 GPT-5.5 Instant，重点放在日常对话体验和复杂约束处理上。官方称它能更好理解问题背后的意图，并让购物、本地推荐等场景更连贯。这类“Instant”模型的价值不在于单次推理最强，而在于高频、低摩擦、低等待的默认体验；当默认模型变得更会聊天，用户对 AI 助手的日常期待也会继续抬高。

📎 [X：OpenAI (@OpenAI)](https://x.com/OpenAI/status/2069843083701915755)

---

## 产品发布/更新

### 豆包正式推出专业版

豆包专业版基于豆包 2.1 系列大模型上线，面向复杂办公和生产力任务。它接入可执行 Agent 任务的豆包 2.1 模型，支持操作本地电脑和浏览器、调用 Skills、执行定时任务、使用 Office 办公套件，甚至生成带后端数据库的在线应用。对字节来说，这不是一次简单订阅升级，而是在把豆包从聊天入口推向可执行工作台。

📎 [公众号：豆包（字节）](https://mp.weixin.qq.com/s/Sb-NMXTrWFQES1EDO_Gr2g)

### Figma 在 Config 2026 押注人类判断，画布 AI 能力却来自第三方

Figma 在 Config 2026 把设计画布扩展到代码、动画、3D 深度、着色器和生成式插件，并把 AI 提示词、工作流和插件协作纳入团队流程。值得警惕的是，它的 AI 能力仍依赖 Anthropic、OpenAI、Google 等外部模型。Figma 的优势在协作和设计语境，但当模型公司也能直接生成界面时，设计工具的护城河会从“能生成什么”转向“团队如何判断、复用和交付”。

📎 [The Decoder：Figma at Config 2026](https://the-decoder.com/figma-bets-on-human-judgment-at-config-2026-while-the-ai-powering-its-canvas-belongs-to-someone-else)

### 火山引擎推出 Agent Ready 基础设施，AgentKit 与 ArkClaw 企业版升级

火山引擎在 FORCE 大会推出 Agent Ready 基础设施，并升级 AgentKit 与 ArkClaw 企业版。AgentKit 强调 Identity、Runtime、Sandbox、Evaluation 等模块，解决企业 Agent 可靠、可控、可衡量的问题；ArkClaw 企业版则把 Agent 广场、技能中心、企业知识库和统一身份入口整合在一起。重点很清楚：企业不只需要一个聪明 Agent，更需要能管权限、跑长任务、做评估的基础设施。

📎 [公众号：火山引擎](https://mp.weixin.qq.com/s/83mrPAPgQRKhxLkoSvRgBQ)

### Notion 使用 Cursor SDK 嵌入编码智能体

Notion 通过 Cursor SDK 把编码智能体嵌入产品，用户可以在文档、讨论串或数据库任务中 @Cursor，让它完成规划、构建、测试、验证并自动创建 PR。这个案例的信号很强：编码 Agent 正在从独立 IDE 走进知识库和项目管理工具。对团队协作来说，未来的“需求文档”可能不只是描述工作，也能直接触发实现流程。

📎 [Cursor Blog：Notion uses Cursor SDK](https://cursor.com/blog/notion)

### Perplexity 推出 Computer for Counsel

Perplexity 推出面向法律工作的 Computer for Counsel，把研究数据库、文档工具和案件管理系统连接到 Computer 中，并可从 Midpage、LegalZoom、Docusign、NetDocuments 等服务提取可引用来源。法律行业对来源、流程和可追溯性的要求很高，这类垂直集成说明通用搜索问答正在向专业工作台迁移。

📎 [X：Perplexity (@perplexity_ai)](https://x.com/perplexity_ai/status/2069866668671766804)

### Mistral AI 为 Connectors 推出多项安全与可控新能力

Mistral AI 为 Connectors 增加更细粒度的管理能力，包括按工作空间控制连接器访问、带连接器范围的 API key、多账户连接器、Connectors Debugger，以及在 Vibe Code 和 Workflows 中复用连接器。连接器是企业 AI 落地的关键入口，也是权限风险的集中点。Mistral 这次升级的重点不是“接得更多”，而是让连接后的数据和工具更可控。

📎 [Mistral AI：More control over Connectors](https://mistral.ai/news/more-control-over-connectors)

### FFASR 排行榜发布：真实远场条件下 ASR 评测

Treble Technologies 与 Hugging Face 推出 FFASR 排行榜，专门评测真实远场声学条件下的语音识别表现。传统近场测试很难反映混响、噪声和麦克风距离带来的问题，而真实会议室、客厅和移动设备场景往往正卡在这里。这个榜单的价值在于把 ASR 从“干净音频里识别得准”推进到“复杂空间里依然可用”。

📎 [Hugging Face Blog：FFASR leaderboard](https://huggingface.co/blog/ffasr-leaderboard)

### OpenAI 与 Broadcom 发布面向 LLM 推理的定制芯片 Jalapeño

OpenAI 与 Broadcom 联合推出 Jalapeño，这是一款面向大语言模型推理优化的定制 AI 芯片，目标是提升 AI 系统的性能、效率和规模。随着模型服务规模扩大，推理成本已经成为头部公司的核心约束。OpenAI 继续深入芯片层，说明大模型竞争正在从模型架构延伸到供应链、算力效率和硬件定制能力。

📎 [OpenAI：Jalapeño inference chip](https://openai.com/index/openai-broadcom-jalapeno-inference-chip)

---

## 行业动态

### 在与 Anthropic 的纠纷中，NSA 失去了对 Mythos 的访问权限

AI HOT 收录的这条消息称，美国国家安全局因与 Anthropic 的纠纷失去了对 Mythos 系统的访问权限。即使公开信息有限，这件事仍值得关注：当政府机构和前沿模型公司之间围绕模型访问、合规和风险控制产生冲突，AI 能力不再只是采购工具，而会变成政策、合同和国家安全之间的复杂接口。

📎 [The New York Times：NSA lost access to Anthropic tool](https://www.nytimes.com/2026/06/23/us/politics/nsa-lost-access-anthropic-tool.html)

---

## 论文研究

### DFlash：块扩散草稿模型实现最高 15 倍吞吐量提升

UC San Diego 团队提出 DFlash，用轻量块扩散草稿模型做投机解码。它一次前向推理生成整块 token，再由目标模型并行验证，在保证输出无损的前提下提升吞吐。AI HOT 摘要显示，在多种模型上平均无损加速超过 6 倍，在 NVIDIA Blackwell 上对 gpt-oss-120b 的吞吐量最高提升 15 倍。对推理成本敏感的团队来说，解码效率仍是大模型工程的关键战场。

📎 [MarkTechPost：DFlash speculative decoding](https://www.marktechpost.com/2026/06/24/dflash-speculative-decoding-drafts-whole-token-blocks-in-parallel-for-up-to-15x-higher-throughput-on-nvidia-blackwell)

### 思考即回忆：推理如何解锁 LLM 中的参数化知识

Google Research 研究发现，Chain-of-Thought 推理不仅能处理复杂推导，也能帮助模型回忆简单事实。研究认为原因有两点：推理 token 给模型提供计算缓冲，相关事实也会在推理过程中起到启动效应。这个结论提醒我们，推理模式并不只是“解释过程”，它可能直接改变模型能否调用自身参数中的知识。

📎 [Google Research：Thinking to recall](https://research.google/blog/thinking-to-recall-how-reasoning-unlocks-parametric-knowledge-in-llms)

---

## 技巧与观点

### 里德·霍夫曼称 SpaceX“不是一家人工智能公司”，xAI 则是“彻底的灾难”

Reid Hoffman 在播客中批评 SpaceX 与 xAI，称 SpaceX 不是 AI 公司，xAI 则面临创始团队流失和模型竞争压力。他还批评美国政府以出口管制为由强制 Anthropic 下架部分模型。抛开人物立场，这条消息反映的是资本市场和政策环境都在重新定义“AI 公司”：有算力、有产品、有模型、有组织稳定性，缺一项都可能被质疑。

📎 [Fortune：Reid Hoffman on SpaceX and xAI](https://fortune.com/2026/06/24/reid-hoffman-spacex-musk-openai-anthropic-gen-z-mistake)

### 字节跳动技术副总裁洪定坤：AI Coding 的实践与探索

洪定坤在火山引擎 FORCE 大会上分享字节 AI Coding 实践，其中一个重要判断是：只看 AI 生成代码比例会误导团队。TRAE 团队代码超 90% 由 AI 生成，但人均需求吞吐率只提升 60%；主流 Coding 模型组合代码正确率超过 80%，但可交付性仍只有 40 到 60 分。真正影响效率的不是“代码是否由 AI 写”，而是指标、基建、评测和协作流程能否一起跟上。

📎 [公众号：火山引擎](https://mp.weixin.qq.com/s/mdmaAyUIvxE8WT_GEbF2wQ)

### AI 被认为会取代工程岗位，但新数据显示工程是 2025 年最具韧性的岗位

SignalFire 追踪大量公司和员工数据后发现，工程岗位在 2025 年表现出较强韧性：大型科技公司总招聘较 2019 年下降，但工程岗降幅更小，早期初创公司的工程招聘还在增长。这与“AI 会快速取代工程师”的直觉形成反差。更现实的判断可能是，AI 改变工程师的产出方式，但短期内也放大了对能驾驭复杂系统人才的需求。

📎 [TechCrunch：Engineering jobs and AI resilience](https://techcrunch.com/2026/06/24/ai-was-supposed-to-kill-engineering-jobs-but-new-data-suggests-theyre-the-most-resilient)

### OpenRouter 零数据留存实践：97 款新模型，流量占比近半

OpenRouter 分享零数据留存实践，称自 1 月以来新增 97 款支持 ZDR 的模型，相关 token 量增长 4.3 倍，约占全部路由流量一半。ZDR 可以在账户、护栏和单次请求三个层面控制，让企业在多个模型供应商之间路由时降低数据留存风险。随着模型路由成为常态，隐私策略也会从合规说明变成产品选择条件。

📎 [OpenRouter：When zero means zero](https://openrouter.ai/blog/insights/when-zero-means-zero)

### NVIDIA NeMo AutoModel：一行代码加速 Transformer MoE 模型微调

NVIDIA NeMo AutoModel 基于 Transformers v5，加入 Expert Parallelism、DeepEP 融合调度和 TransformerEngine 内核。AI HOT 摘要显示，在 MoE 微调中它相比原生 v5 可将训练吞吐量提升 3.4 到 3.7 倍，并降低 GPU 内存占用。对训练大规模 MoE 的团队来说，这类“少改代码但大幅提升吞吐”的工具，会直接影响微调成本和实验速度。

📎 [Hugging Face Blog：NVIDIA NeMo AutoModel](https://huggingface.co/blog/nvidia/accelerating-fine-tuning-nvidia-nemo-automodel)

### MiniCPM-V 4.6 在 Apple Core AI 上高速运行

面壁智能转发展示了 MiniCPM-V 4.6 在 Apple Core AI 上的设备端运行效果，强调不到 2B 参数也能跑出令人印象深刻的速度。多模态模型正在向端侧和高效部署推进，意义不只是“模型更小”，而是让相机理解、离线助手、隐私敏感应用获得更低延迟和更少云端依赖。

📎 [X：面壁智能 OpenBMB (@OpenBMB)](https://x.com/OpenBMB/status/2069676334381728106)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
