---
title: "AI 热点日报 | 2026年6月18日"
date: 2026-06-18T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: "ai-hot-2026-06-18"
description: "2026年6月18日 AI 圈要闻：MolmoMotion 开源语言引导 3D 运动预测、Grok 4.3 登陆 Amazon Bedrock、Vercel 发布开源智能体框架 Eve、OpenAI 发布生命科学评测基准 LifeSciBench"
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 今日头条

### MolmoMotion：语言引导的3D运动预测模型

MolmoMotion 基于 Molmo 2 骨干网络，输入视频帧、物体上的 3D 点标记和自然语言动作指令，预测未来数秒内这些点的 3D 轨迹。项目同时提供自回归版 MolmoMotion-AR 与流匹配版 MolmoMotion-FM，并一并开源 MolmoMotion-1M 数据集和 PointMotionBench 基准，覆盖 116 万段视频与 2700 个人工验证片段，面向具身智能和视频理解任务提供更完整的运动建模能力。

📎 [Hugging Face：Blog（RSS）](https://huggingface.co/blog/allenai/molmomotion)

---

## 模型发布/更新

### Grok 4.3 在 Amazon Bedrock 正式可用

6 月 17 日，xAI 宣布 Grok 4.3 已全面登陆 Amazon Bedrock。该模型支持 100 万 token 上下文和可配置推理强度，在文档理解、客服工具调用等评测中排名靠前，定价为输入每百万 token 1.25 美元、输出每百万 token 2.50 美元，重点强调低幻觉率与高性价比。

📎 [xAI：News（网页）](https://x.ai/news/grok-amazon-bedrock)

---

## 产品发布/更新

### Vercel 发布开源 AI 智能体框架 Eve：每个智能体就是一个文件目录

Vercel 开源 Eve 智能体框架，采用“文件系统优先”设计，把模型、指令、工具、技能、连接和子智能体都映射到目录结构中。框架内置持久执行、沙箱计算、人机审批、安全连接、多通道接入和追踪评估等能力，定位为生产级智能体基础设施。

📎 [MarkTechPost（RSS）](https://www.marktechpost.com/2026/06/17/vercel-releases-eve)

### Omnigent 开源：AI 智能体团队元框架

Omnigent 将 Claude Code、Codex、Cursor、Pi 以及自定义智能体组织进同一个实时会话，定位为“让智能体协同工作的元框架”。项目由 Databricks AI 团队开源，强调多智能体协作而非单一助手模式。

📎 [X：Yuchen Jin (@Yuchenj_UW)](https://x.com/Yuchenj_UW/status/2067273020352380950)

### Google 发布 99 美元 Gemini 智能音箱

Google 推出首款围绕 Gemini 打造的智能音箱 Google Home Speaker，售价 99.99 美元，支持自然语言、多步指令、打断纠错和连续对话。更高级的 Gemini Live 与摄像头摘要功能需订阅 Google Home Premium。

📎 [TechCrunch：AI（RSS）](https://techcrunch.com/2026/06/17/google-bets-on-gemini-to-reinvent-the-smart-home-speaker)

### Wolfram 语言与 Mathematica 15 发布：内置 AI 助手、符号音乐等新能力

Wolfram 发布 Mathematica 15 和新版 Wolfram 语言，在每个 notebook 中内置 AI 助手，并加入符号音乐、大规模时间序列处理、分类数据计算、ModelFit 超函数、侧边栏和视觉主题等更新，继续把符号计算与 AI 工作流绑定得更紧。

📎 [Stephen Wolfram：Blog（网页）](https://writings.stephenwolfram.com/2026/06/launching-version-15-of-wolfram-language-mathematica-built-in-useful-ai-lots-of-new-core-functionality)

### 阿里云发布 HappyOyster 1.0：一句话生成可实时交互的数字世界

阿里云发布开放式世界模型 HappyOyster 1.0，支持多模态输入、音视频联合生成以及生成过程中的实时交互。官方主打“实时导演”和“世界探索”两类玩法，试图把世界模型从被动生成推进到可操控、可漫游的交互体验。

📎 [IT之家（RSS）](https://www.ithome.com/0/965/652.htm)

### Claude Design 更新：跨项目保持品牌一致，并与 Claude Code 协同

Claude Design 新增跨项目统一设计系统、画布拖拽对齐、桌面侧边栏入口和独立网页端，并强调与 Claude Code 的协同工作流。Anthropic 表示新版本在错误率、token 消耗和团队设计一致性上都有明显改善。

📎 [Claude：Blog（网页）](https://claude.com/blog/claude-design-stays-on-brand-for-daily-work)

### Claude Design 与 Replit 联动，设计直接变应用

Replit 宣布已支持把 Claude Design 中的设计稿直接发送到 Replit 构建可运行应用，进一步把设计和代码生成流程连成一体。

📎 [X：Replit (@Replit)](https://x.com/Replit/status/2067328501003497684)

### Strands Robots SDK：用单一智能体打通 Hugging Face Hub 到物理机器人

AWS 开源 Strands Robots SDK，把 LeRobot 栈封装为 AgentTools，支持从模拟到真实机器人之间平滑切换。开发者既能记录数据并上传 Hugging Face Hub，也能在相同代码路径下切换策略推理和多机器人广播控制。

📎 [Hugging Face：Blog（RSS）](https://huggingface.co/blog/amazon/strands-lerobot-hub-to-hardware)

---

## 行业动态

### Anthropic 与 DeepMind CEO 呼吁 G7 组建 AI 联盟排除中国

Dario Amodei 与 Demis Hassabis 在 G7 闭门会议上呼吁建立由美国主导的 AI 联盟，并以先进模型和硬件访问权作为规则工具。这一表态被视为全球 AI 治理进一步走向地缘政治化的信号。

📎 [X：Kim (@kimmonismus)](https://x.com/kimmonismus/status/2067310431669223425)

### 泄露文件显示 OpenAI 年营收 130 亿美元，但亏损远超收入

泄露文件显示，OpenAI 2025 年营收约 130.7 亿美元，但研发、推理、销售与营销等成本合计远高于收入，运营亏损约 209.2 亿美元。文件还提到 ChatGPT 周活已超过 9 亿、付费用户约 5000 万，显示其规模增长与资金消耗同步放大。

📎 [Ars Technica](https://arstechnica.com/ai/2026/06/leaked-financial-docs-show-openai-is-losing-billions-of-dollars-a-year)

### 消息称 OpenAI 一季度现金消耗达 37 亿美元，超过同期收入一半

另一则披露称，OpenAI 在 2026 年第一季度现金消耗约 37 亿美元，而同期收入约 57 亿美元，继续凸显顶级模型公司在算力、人才和产品化上的高投入压力。报道同时提到 OpenAI 已秘密递交 IPO 申请。

📎 [IT之家（RSS）](https://www.ithome.com/0/965/335.htm)

### 中国加紧筹建世界人工智能合作组织

中国正推进世界人工智能合作组织筹建工作，目标是围绕多边治理、弥合数字鸿沟和促进 AI 普惠发展建立国际合作机制，初步考虑将总部设在上海。

📎 [IT之家（RSS）](https://www.ithome.com/0/965/248.htm)

### 谷歌发布 Agentic Resource Discovery（ARD）开放规范

Google 发布 ARD 规范，用于在 Web 上发布、发现和验证 AI 工具、技能与智能体。它以 catalog 与 registry 为核心原语，并加入加密验证和身份信任机制，方便企业在自有域名下公开机器可读的能力目录。

📎 [Google Developers Blog](https://developers.googleblog.com/announcing-the-agentic-resource-discovery-specification)

### Databricks 继续拉大对 Snowflake 的增长差距

Databricks 最新年化经常性收入达到 69 亿美元，同比增长 80%；同期 Snowflake 约为 53 亿美元、增长 34%。AI 相关业务已占 Databricks ARR 的四分之一，显示“数据平台 + AI”叙事正在持续兑现商业化收入。

📎 [Tomer Tunguz](https://www.tomtunguz.com/databricks-widens-lead)

### Claude Opus 4.8 Build Day 黑客马拉松获奖项目揭晓

Anthropic 公布 Opus 4.8 Build Day 获奖作品，前三名分别聚焦历史建筑 3D 重建、合成市民选举模拟与手机照片转 3D 物体生成，集中展示了大模型在多步骤研究、自动验证和创作工具上的组合能力。

📎 [Claude：Blog（网页）](https://claude.com/blog/meet-the-winners-of-our-claude-opus-4-8-build-day-hackathon)

### Anthropic 在首尔开设办公室，并宣布多项韩国生态合作

Anthropic 启用首尔办公室，并宣布与 NAVER、Nexon、LG CNS、Hanwha Solutions、Samsung SDS 等韩国企业合作。合作重点集中在 Claude Code、Claude Cowork 和企业部署，说明其正在加速亚洲本地生态扩张。

📎 [Anthropic：Newsroom（网页）](https://www.anthropic.com/news/seoul-office-partnerships-korean-ai-ecosystem)

---

## 论文研究

### NVIDIA GEAR 实验室发布 ENPIRE：8 个 Codex 智能体自主控制机器人完成物理实验

ENPIRE 让 8 个 Codex 智能体并行控制 8 台机器人执行物理实验任务，并通过 GPU、token 预算和多层安全机制约束系统行为。研究重点不只是“让机器人完成任务”，而是验证多智能体并行探索在真实世界科研中的效率优势。

📎 [X：Jim Fan (@DrJimFan)](https://x.com/DrJimFan/status/2067283904986517866)

### 用 SGLang-JAX 在 TPU 上优化 Ling-2.6-1T：Pallas 核隐藏 MoE 数据移动开销

SGLang-JAX 团队为 Ling-2.6-1T 设计了 Fused MoE V2 内核，把 scatter、专家 FFN 和 gather 融合进一个 Pallas 核中，使预填充延迟下降 53%，解码延迟下降约 15%，并在部分基准上实现 TPU 相对 H200 GPU 的吞吐领先。

📎 [LMSYS：Blog（Chatbot Arena 团队）](https://www.lmsys.org/blog/2026-06-17-ling-2-6-tpu)

### LifeSciBench 发布：面向真实生命科学任务的 AI 评测基准

OpenAI 联合 173 位生命科学研究者推出 LifeSciBench，覆盖 750 个真实研究任务和 19020 条细化评分标准，重点考察模型在证据处理、分析和实验设计中的实际科研能力，而非仅测试结构化问答表现。

📎 [OpenAI](https://openai.com/index/introducing-life-sci-bench)

### Google 医学推理系统 AMIE 新研究：从单次诊断走向长期疾病管理

Google 在《自然》发表新研究，展示 AMIE 如何从单轮问诊拓展到长期疾病管理。系统结合共情对话和深度管理推理，并能引用大规模临床指南；盲测结果显示，其在管理推理和计划一致性上可与初级保健医生匹配甚至更优。

📎 [Google Blog：AI（RSS）](https://blog.google/innovation-and-ai/models-and-research/google-research/amie-for-disease-management-in-nature)

### OpenAI 与 Molecule.one 合作：GPT‑5.4 自主优化 Chan‑Lam 偶联反应

OpenAI 将 GPT‑5.4 接入 Molecule.one 的化学智能体 Maria，用于优化 Chan‑Lam 偶联反应。模型能主动识别高价值底物和更合适的氧化剂方案，两轮实验后显著提升平均产率与高产反应占比。

📎 [OpenAI](https://openai.com/index/ai-chemist-improves-reaction)

---

## 技巧与观点

### Matt Pocock 开源 skills v1：将技能描述 Token 成本降低 63%

Matt Pocock 开源 skills v1，把技能拆分为模型可调用和用户可调用两类，并新增多项工程流程技能。核心卖点是把 prompt 从静态长文转为结构化技能调用，从而压低 token 成本并提升流程纪律性。

📎 [X：阿易 AI Notes (@AYi_AInotes)](https://x.com/AYi_AInotes/status/2067327021005656135)

### baoyu-design 新增本地动画视频导出

baoyu-design 新增动画视频导出能力，采用无头 Chromium 逐帧截图并交给 ffmpeg 编码，以 2 倍 DPR 渲染后回缩到 1080p，强调帧级精确和细节保真，适合本地生成演示动画和可编辑 PPT 资产。

📎 [X：宝玉 (@dotey)](https://x.com/dotey/status/2067039941960327204)

### Google 分享 A2UI 与 MCP Apps 三种集成架构

Google 对比了 A2UI 和 MCP Apps 的优缺点，并给出三种混合集成模式，核心目标是在“宿主原生渲染的一致性”与“Web 自定义界面的灵活性”之间找到工程平衡。

📎 [Google Developers Blog](https://developers.googleblog.com/a2ui-and-mcp-apps)

### 预训练还不够“苦涩”

CMU 文章重新审视 Richard Sutton 的“苦涩教训”，指出如今的大模型预训练虽然依赖通用架构、海量数据和简单目标，但训练目标的选择仍然高度依赖人类在循环外手工调整，因此真正的“自动化优化”还远未完成。

📎 [CMU：Machine Learning Blog](https://blog.ml.cmu.edu/2026/06/17/pre-training-isnt-bitter-enough)

### 博客现状，2026 年中

Nathan Lambert 回顾 Interconnects 的发展，明确博客未来继续聚焦前沿模型演进、开放模型生态和研究支撑机构建设，同时公开了咨询合作关系与商业现实，强调独立分析写作的长期可持续性仍是一个经营问题。

📎 [Nathan Lambert：Interconnects（RSS）](https://www.interconnects.ai/p/state-of-the-blog-mid-2026)

### 特朗普向 Anthropic 提出不可能的要求

Gary Marcus 借 Anthropic 争议继续批评生成式 AI 安全护栏的根本局限，认为基于 next-token prediction 的大语言模型很难承担严格安全控制责任，这并非 Anthropic 一家的问题，而是整个行业的结构性难题。

📎 [Gary Marcus：The Road to AI We Can Trust（RSS）](https://garymarcus.substack.com/p/breaking-trump-asks-the-impossible)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
