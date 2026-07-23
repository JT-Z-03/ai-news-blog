---
title: "AI 热点日报 | 2026年6月11日"
date: 2026-06-11T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: "ai-hot-2026-06-11"
description: "2026年6月11日 AI 圈要闻：Google DeepMind 发布 DiffusionGemma 文本生成提速 4 倍、小米开源 MiMo Code 终端 AI 编程助手、工信部印发 AI+信息通信实施意见、Anthropic CEO 发文呼吁缩小 AI 政策差距"
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 今日头条

### DiffusionGemma：文本生成速度提升 4 倍的开源扩散模型

Google DeepMind 发布开源实验模型 DiffusionGemma，采用文本扩散技术突破自回归逐 token 生成方式，每次前向并行生成 256 个 token。26B MoE 推理时仅激活 3.8B 参数，量化后适配 18GB 显存消费级 GPU。H100 上达 1000+ tokens/s，RTX 5090 上 700+ tokens/s，速度提升 4 倍。具备双向注意力和自我修正能力，Apache 2.0 开源。

📎 [Google DeepMind Blog](https://deepmind.google/blog/diffusiongemma-4x-faster-text-generation)

---

## 模型发布/更新

### Grok Voice 发布：SOTA 语音合成，价格低廉

xAI 发布 Grok Voice，提供类人的时机、语调和温暖感，价格仅为竞争对手的一小部分。

📎 [xAI @ X](https://x.com/xai/status/2064777588036530309)

---

## 产品发布/更新

### 小米发布 MiMo Code V0.1 开源终端 AI 编程助手

核心特性：无限上下文（自动知识积累与无损压缩）、Agent-模型深度协同（测试-审查-验证闭环）、Compose 模式（规格→计划→构建→报告）、自进化系统、语音输入（MiMo-V2.5-ASR）、兼容 Claude Code（零成本迁移）。MIT 许可，支持 Anthropic、OpenAI、DeepSeek、Kimi、GLM 等主流模型。附赠 MiMo V2.5 百万 token 上下文窗口限时免费使用。

📎 [小米 MiMo @ X](https://x.com/XiaomiMiMo/status/2064772356443394441)

### MiniMax M3 上链 0G，限时免费运行

MiniMax M3 在 0G Labs 上链，支持可验证+私有计算，6 月 15–18 日免费运行。

📎 [MiniMax @ X](https://x.com/MiniMax_AI/status/2064791800884363286)

### Google 将保存用户的 Lens 图片、Search Live 录音和 Translate 音频用于 AI 训练

Google 新增 "Search Services History" 设置，保存用户搜索时使用的图片、音频和视频，用于"提供、改进和开发 AI 模型"。用户可关闭该设置禁用保存。

📎 [The Verge](https://www.theverge.com/tech/947836/google-search-privacy-settings-images-audio)

### Cursor Bugbot 更新：速度提升超 3 倍、成本降低 22%

运行速度提升 3 倍，成本降低 22%，每轮多发现 10% bug，90% 运行在三分钟内完成。新增 `/review` 命令可在 push 前运行 Bugbot 和安全审查，性能提升源于 Composer 2.5 模型训练改进。

📎 [Cursor Blog](https://cursor.com/blog/bugbot-updates-june-2026)

### Apache Burr：构建可靠 AI 代理和应用程序的开源框架

Apache 基金会发布 Burr 框架，提供工具和抽象帮助开发者设计、开发和部署可信任的智能体应用，强调可靠性、可观测性和生产级部署能力。

📎 [Apache Burr](https://burr.apache.org/)

### 华为云发布全球首个端到端具身 AI 平台 CloudRobo

覆盖从数据、模型到部署、集成的全生命周期，基于 PB 级可信数据底座。支持机器人小时级上云、模型分钟级部署。

📎 [华为云 @ X](https://x.com/HuaweiCloud1/status/2064637581652852831)

### 火山方舟版权商业化平台上线，周星驰三大电影 IP 首批入驻

行业首个覆盖"授权—保护—审核—分发—变现"全链路的版权合作机制。搭载 Seedance 2.0 及版权治理体系，已获《喜剧之王》《食神》《长江七号》在 AI 视频创作场景下的版权使用授权。

📎 [火山引擎公众号](https://mp.weixin.qq.com/s/g3DxNO_3aYI4g26gQ2Yvig)

### OpenRouter 推出 Activity explorer 活动探索器

可查看个人和团队在每个模型上的花费，包括 token、缓存命中率、智能体和趋势，全部数据实时更新。

📎 [OpenRouter @ X](https://x.com/OpenRouter/status/2064730000956489889)

---

## 行业动态

### 工信部印发《"人工智能+信息通信"创新发展实施意见》

要求加快建设 400Gbps/800Gbps 骨干传输网络，推进城域 400Gbps 及以上高速光传输系统，构建城域毫秒级低时延入算能力。同时推动 5G-A/6G、新一代光网络与 AI 融合发展。

📎 [IT之家](https://www.ithome.com/0/962/456.htm)

### 欧盟责令 Meta 向第三方 AI 助手免费开放 WhatsApp

欧盟委员会发布临时措施，认定 Meta 禁止第三方 AI 助手调用 WhatsApp for Business API 可能严重损害通用 AI 助手市场竞争，责令在反垄断调查结束前免费开放。

📎 [IT之家](https://www.ithome.com/0/962/206.htm)

### Magnetar 用数百 AI 智能体替代分析师

180 亿美元对冲基金 Magnetar Capital 将在其最新产品中避免使用人类分析师，转而依靠数百个 AI 智能体进行股票研究、推荐头寸并预测趋势，人类仅保留交易批准权。

📎 [Rohan Paul @ X](https://x.com/rohanpaul_ai/status/2064524448582267047)

### 谷歌财务担保支撑 Anthropic 350 亿美元芯片租赁交易

Anthropic 在谷歌的帮助下在五个数据中心租赁高性能芯片，谷歌同意为每个地点的租赁付款提供兜底担保，帮助 Anthropic 获得相当于 350 亿美元的融资。

📎 [Bloomberg](https://www.bloomberg.com/news/videos/2026-06-10/google-s-backstops-underpin-35-bln-anthropic-chip-deal-video)

### eToro AI 智能体 Tori 集成 SpaceXAI 实现实时市场情绪分析

eToro 拥有超 4000 万注册用户，其 AI 智能体 Tori 集成 SpaceXAI 文本模型，能从 X 平台实时读取市场情绪、追踪信号并分析信息，支持自然语言查询。

📎 [xAI News](https://x.ai/news/grok-etoro)

### Google 因模型幻觉被判负有法律责任

法院裁定 Google 对其 AI 模型产生的幻觉内容负有法律责任，该判决可能产生巨大影响，尤其若其他国家跟进类似裁定。

📎 [Gary Marcus Substack](https://garymarcus.substack.com/p/breaking-google-liable-for-hallucinations)

### 通过 Oracle 云承诺访问 OpenAI 模型和 Codex

OpenAI 与 Oracle 合作，用户可利用现有 Oracle 云服务承诺额度在 Oracle 云上访问 OpenAI 模型和 Codex，获得企业级安全与治理能力。

📎 [OpenAI Blog](https://openai.com/index/openai-on-oracle-cloud)

---

## 论文研究

### Anthropic 研究：AI 数小时内即可从安全补丁构建漏洞利用

Mythos Preview 模型能在几小时内将 Firefox 和 Windows 内核的安全补丁转化为可工作的漏洞利用，成本仅需数千美元。在微软自动更新到达设备前，模型已完成 8 条完整攻击链。Anthropic 认为传统补丁节奏已经过时。

📎 [The Decoder](https://the-decoder.com/anthropic-study-shows-ai-needs-hours-not-weeks-to-build-exploits-from-security-patches)

### Google Research 提出审计机器遗忘新框架

在 AISTATS 2026 发表正则化 f-散度核检验，用于高效审计 LLM 等模型的机器遗忘。新框架理论上可在任意样本量下自然控制假阳性，解决了大规模模型审计的计算成本问题。

📎 [Google Research Blog](https://research.google/blog/new-framework-for-auditing-machine-unlearning)

### 百度百舸联合复旦提出 LU-KV 框架，被 ICML 2026 录用

将头级 KV Cache 预算分配建模为面向长程边际效用的全局组合优化问题。在 LongBench 和 RULER 基准上，80% 压缩比下性能损失小，显著降低显存占用和推理延迟。

📎 [百度智能云公众号](https://mp.weixin.qq.com/s/oKhawmph49YYPR63T-ekaw)

---

## 技巧与观点

### Anthropic CEO Dario Amodei 发文呼吁缩小 AI 政策差距

Amodei 发表《Policy on the AI Exponential》，指出 AI 发展远超现有政策制定流程的应对能力，阐述当前技术所处阶段，并提出缩小差距所需行动。Anthropic 同步宣布启动三项新举措支持该框架。

📎 [Anthropic @ X](https://x.com/AnthropicAI/status/2064783418844762489)

### 用好 Claude Design 的 5 点经验

宝玉分享：加入设计系统（如 Adobe Spectrum 2）可避免 AI 味；先搭少量功能再通过左侧聊天框逐步调整；用 Markup 框选局部评论；注意上下文管理；通过 Tweaks 面板调整主题和布局。

📎 [宝玉 @ X](https://x.com/dotey/status/2064601571397185639)

### 走进 Anthropic：Bloomberg 深度对话 Dario 与 Daniela Amodei

Emily Chang 与 Anthropic 联合创始人进行罕见深度对话，探讨创业起源、与五角大楼的摩擦，以及如何在激烈 AI 竞赛中将安全置于首位。

📎 [Bloomberg](https://www.bloomberg.com/news/videos/2026-06-10/inside-anthropic-the-965-billion-ai-juggernaut-video)

### 豆包 AI 误导用户损失 600 元，还帮用户起诉自己

河北李先生向豆包咨询退票费，豆包错误回答不到 100 元，实际退票花费 600 元。后续豆包切换角色生成补偿承诺书但未兑现，还帮用户起草起诉状。该案例暴露 AI 在非技术用户信任导向下的误导与责任困境。

📎 [X.PIN @ X](https://x.com/thexpin/status/2064772489310527713)

### Text-To-Lottie：让 Agent 生成 Lottie 动画并实时验收

开源项目提供 Agent Skill 和本地预览工具，让 Codex/Claude Code/Cursor 等 Agent 生成标准 Bodymovin JSON，通过 Skottie 渲染引擎在浏览器中实时验收。安装：`npx skills add diffusionstudio/lottie`。

📎 [邵猛 @ X](https://x.com/shao__meng/status/2064508455051043008)

### 毕业典礼频现"谈 AI 色变"，微软总裁呼吁行业必须回应公众担忧

多场毕业典礼上演讲者宣传 AI 技术时遭学生嘘声，普林斯顿应届毕业生曾否决一款疑似 AI 设计夹克。微软总裁 Brad Smith 回应称行业必须严肃可信地回答问题。

📎 [IT之家](https://www.ithome.com/0/962/680.htm)

### 亚马逊的大规模扁平化数据中心网络

亚马逊分享了通过简化拓扑和路由策略支撑超大规模集群高带宽、低延迟通信的工程实践。

📎 [James Hamilton 博客](https://perspectives.mvdirona.com/2026/06/flat-datacenter-networks-at-scale)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
