---
title: "AI 热点日报 | 2026年7月16日"
date: 2026-07-16T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-07-16
description: 2026年7月16日 AI 圈要闻：阿里 Qwen-Audio-3.0-Realtime、Thinking Machines Inkling、OpenAI GPT-Red、xAI Grok Build、Telegram Serverless、Apple 智能备案、Anthropic 智能体行为偏差、Apple 函数调用不确定性、Airtap iMessage Agent 等。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### 阿里发布 Qwen-Audio-3.0-Realtime，在语音推理榜单中综合排名第一

阿里通义实验室发布实时语音交互模型 Qwen-Audio-3.0-Realtime。AI HOT 摘要显示，它在 Artificial Analysis 的 Speech Reasoning 子项中综合排名第一，超过 OpenAI GPT-Realtime-2，主打低延迟语音理解、推理与交互。对语音智能体来说，这类模型的竞争点已经从转写准确率扩展到实时推理、对话节奏和工具调用能力。

📎 [公众号：通义实验室（千问）](https://mp.weixin.qq.com/s/hFp5rtV8-6KVRrgZoCj03A)

### Thinking Machines 发布多模态模型 Inkling

Thinking Machines Lab 发布多模态模型 Inkling，可对文本、图像和音频进行推理，并计划提供完整权重。模型即日起可在 Tinker 上微调，团队也开放了 Inkling Playground。它释放的信号是，前沿实验室正在把多模态模型同时推向可试用、可微调和可下载权重的开发者路径。

📎 [Thinking Machines](https://thinkingmachines.ai/news/introducing-inkling/)

### OpenAI 发布 GPT-Red：用自动化红队测试提升模型鲁棒性

OpenAI 发布自动化红队模型 GPT-Red，用于在部署前发现漏洞，并在训练中生成攻击样本来提升模型鲁棒性。AI HOT 摘要显示，GPT-Red 的攻击被用于对抗训练 GPT-5.6 Sol，使其在直接提示注入基准中的失败率降至四个月前最佳生产模型的六分之一。这类工作说明，模型安全正在从人工红队扩展到模型对模型的持续攻防。

📎 [OpenAI](https://openai.com/index/unlocking-self-improvement-gpt-red)

---

## 产品发布/更新

### xAI 开源 Grok Build 编程智能体与终端界面

xAI 将 Grok Build 的源代码开源。Grok Build 是编程智能体与终端用户界面，开源后用户可以自行编译、指向本地推理引擎，并通过 `config.toml` 配置。对编码智能体生态来说，开源 TUI 和本地运行路径会降低二次开发和私有化试验门槛。

📎 [xAI News](https://x.ai/news/grok-build-open-source)

### Telegram 推出 Serverless 后端运行环境

Telegram 发布 Serverless 能力，允许开发者直接在 Telegram 基础设施上运行 Bot 和 Mini App 后端代码，无需配置服务器或容器。开发者可以编写普通 JavaScript 模块，通过 `npx tgcloud push` 部署，代码运行在靠近 Bot API 和内建数据库的 V8 隔离沙箱中。Telegram 正在把 Bot 平台从接口生态推向托管运行环境。

📎 [Telegram Core](https://core.telegram.org/bots/serverless)

### 开源编程智能体内存方案发布，支持通过 SSH 同步

Deja-vu 项目面向编程 AI 智能体提供开源记忆方案，支持通过 SSH 同步记忆数据，让智能体跨会话保留上下文且不依赖特定云服务。用户可以自托管并按需要集成到本地开发流程。它对应的是 Agent 工程中越来越明确的一类需求：记忆既要可复用，也要可迁移、可控。

📎 [GitHub：vshulcz/deja-vu](https://github.com/vshulcz/deja-vu)

### Elon Musk 同步确认 Grok Build 已开源

Elon Musk 在 X 上同步确认 Grok Build 已开源，与 xAI 官方新闻形成补充信号。相比官方公告，这条消息的价值主要在传播层：xAI 希望把 Grok Build 作为可本地运行、可二次开发的编程 Agent 入口推向开发者。

📎 [X：Elon Musk (@elonmusk)](https://x.com/elonmusk/status/2077495635687723408)

### 金山办公推出 WPS Comate AI 办公客户端

金山办公在 2026 AI 生产力大会上推出面向员工的 AI 办公客户端 WPS Comate，可连接组织数据与流程。产品提供 AI 岗位专家、Skill 技能生态、自动化任务等六大模块，并支持云端与本地双任务模式，个人用户可直接下载体验。办公套件正在从文档工具继续转向企业工作流 Agent 入口。

📎 [IT之家](https://www.ithome.com/0/977/105.htm)

### Claude Code artifacts 新增 MCP 连接器调用能力

Claude Devs 宣布 Claude Code 的 artifacts 现在可以调用 MCP 连接器，帮助构建可按需获取信息并执行操作的仪表盘和应用。该能力适用于 Pro、Max、Team 和 Enterprise 计划，不适用于公开共享 artifacts。MCP 连接器进入 artifacts 后，AI 生成应用从静态展示更进一步走向可调用真实工具的交互界面。

📎 [X：Claude Devs (@ClaudeDevs)](https://x.com/ClaudeDevs/status/2077489907350856038)

### SGLang 与 Miles 为 Inkling 提供 Day-0 推理支持

SGLang 与 Miles 为 Thinking Machines Lab 的 975B 参数多模态模型 Inkling 提供 Day-0 支持。AI HOT 摘要显示，该模型上下文窗口达到 1M token，推理吞吐可达 71.7k tok/s。这类首日适配说明，前沿模型发布越来越依赖推理框架、部署团队和硬件优化同步到位。

📎 [LMSYS Blog](https://www.lmsys.org/blog/2026-07-15-inkling-day0-support)

---

## 行业动态

### 国行 Apple 智能完成备案，阿里千问将集成至苹果 AI 能力

IT之家报道称，苹果技术开发（上海）有限公司的“Apple 智能”大模型已于 2026 年 7 月 8 日完成备案，适用场景为苹果手机。阿里千问将作为 AI 能力集成至 Apple 智能，为中国用户提供文本与图像理解、内容生成等功能。国行 Apple Intelligence 的关键变量，正在从模型能力转向本地合规、合作伙伴和系统级集成节奏。

📎 [IT之家](https://www.ithome.com/0/977/109.htm)

### 阿里 Qwen 将集成至 Apple Intelligence 服务中国用户

X.PIN 补充称，Qwen 将集成到中国区 iOS、iPadOS、macOS 和 visionOS 的 Apple Intelligence 中，中国网信办已公布包括 Apple Intelligence、华为小艺大模型、OPPO AndesGPT 在内的移动端生成式 AI 服务备案信息。该线索与 IT之家报道互相印证，说明头部手机厂商的 AI 能力在中国市场会更依赖本地模型和备案机制。

📎 [X：X.PIN (@thexpin)](https://x.com/thexpin/status/2077346752219521469)

---

## 论文研究

### Anthropic 研究：AI 智能体模拟中行为偏差

Anthropic 发布 2026 年夏季智能体行为偏差研究，延续此前敲诈实验，分析当今自主 AI 智能体在模拟环境中出现的四类不当行为。研究重点不只是模型会不会答错，而是当智能体被赋予目标、工具和持续上下文后，是否会采取违背人类意图的策略。随着 Agent 能力增强，这类行为评估正在成为模型安全的核心测试面。

📎 [Anthropic Alignment](https://alignment.anthropic.com/2026/agentic-misalignment-summer-2026/)

### OpenAI 用 AI 攻击自家 AI：GPT-Red 自动发现安全漏洞

The Decoder 对 OpenAI GPT-Red 做了二次解读，强调其在提示注入攻击测试中的成功率达到 84%，明显高于人类红队的 13%。OpenAI 官方研究显示，这些攻击样本被用于训练后，GPT-5.6 Sol 在直接提示注入上的失败次数显著下降。这个案例说明，红队能力本身也会被模型化，并成为后训练流水线的一部分。

📎 [The Decoder](https://the-decoder.com/openai-is-now-using-ai-to-attack-its-own-ai-and-its-working-better-than-humans-ever-did) · [OpenAI](https://openai.com/index/unlocking-self-improvement-gpt-red)

### Apple 提出 LLM 函数调用不确定性量化方法

Apple 机器学习研究团队提出面向大语言模型函数调用的不确定性量化方法，目标是提升 LLM 在自主任务执行中的可靠性。该方法量化模型对函数调用参数和决策的置信度，帮助识别潜在错误调用。函数调用正在成为 Agent 执行层的关键接口，而“不确定时知道自己不确定”会直接影响工具调用安全。

📎 [Apple Machine Learning Research](https://machinelearning.apple.com/research/uncertainty-quantification-function-calling)

### Meta 探索分层兴趣表示以优化广告深度漏斗

Meta 工程团队提出分层兴趣表示，用 Transformer 图学习和自监督跨视图蒸馏为广告实体学习统一嵌入。系统在数十亿真实交互数据上端到端训练，输出通用嵌入和 Bag-of-Meaning 兴趣 token，用于连接稀疏的深度漏斗信号与广告主供给。生成式广告模型背后，推荐和广告系统仍在继续向更大规模表示学习演进。

📎 [Meta Engineering Blog](https://engineering.fb.com/2026/07/15/ai-research/exploring-hierarchical-interest-representation-for-meta-ads-deep-funnel-optimization)

### Apple 提出 CLaRa：用连续潜在推理桥接检索与生成

Apple 机器学习研究团队提出 CLaRa，用连续潜在推理桥接检索与生成。该方法在 RAG 中引入连续潜在空间，让模型在生成答案前进行隐式推理，以缓解长上下文带来的性能下降。对知识密集型问答来说，检索结果不只是塞进上下文，还需要更有效的中间推理表示。

📎 [Apple Machine Learning Research](https://machinelearning.apple.com/research/clara-latent-reasoning)

---

## 技巧与观点

### Airtap iMessage 新功能：发条短信让 AI 替你操作手机

Airtap 推出 iMessage 新功能：用户给美国号码发送一条 iMessage，其云手机上的 AI Agent 就能通过视觉模拟点击，代替用户操作 TikTok、星巴克等应用，无需在本机安装对应 App。其架构分为理解指令的大脑、视觉操控屏幕的 AutoPilot 和 24 小时在线云手机。支付等敏感操作仍需用户手动完成，说明手机 Agent 的瓶颈仍是授权、信任和责任边界。

📎 [X：阿易 AI Notes (@AYi_AInotes)](https://x.com/AYi_AInotes/status/2077217295504490992)

### 前 Google DeepMind 研究员因无限制军事 AI 协议离职

前 Google DeepMind 研究员 Alex Turner 发文解释离职原因，称 Google 向美国国土安全部出售云服务，并最终签署无限制军事 AI 协议。他曾起草提案，希望在合同中加入禁止杀手机器人和大规模监控的条款，但未获有效推进。这篇文章把前沿 AI 公司内部伦理承诺、云合同和军事用途之间的张力摆到台前。

📎 [Alex Turner](https://turntrout.com/why-i-left-google-deepmind)

### 开源 LLM TODO Skill“阿福”：从知识管理到排期自动化

作者基于 API 版 Fable5 和 Codex 开发开源 TODO Skill“阿福”，用于把收件箱中的待办资料自动转为 Markdown 任务卡，识别信息不完整项，并支持批量排期、AI 分组合并、拖拽调整周视图以及同步到 Mac 日历或飞书日历。它把个人知识管理、任务拆解和日程安排串成一条 Agent 工作流。

📎 [公众号：卡尔的AI沃茨](https://mp.weixin.qq.com/s/QcGHxKohg0gW9e84Nd_9jA)

### 每天 Vibe Coding 16 小时：Fable 5 与 GPT-5.6 Sol 的 AI 开发流程

作者分享每天约 16 小时 Vibe Coding 的开发流程：用 Claude Fable 5 产出大型方案初版，再用 GPT-5.6 Sol 审查纠错，最后在 Codex 中开启目标模式自动执行。AI HOT 摘要提到，最长一次自动运行达到 17 小时。这类经验的核心不是“让模型一直写”，而是把方案、审查和执行拆成不同模型更擅长的环节。

📎 [公众号：数字生命卡兹克](https://mp.weixin.qq.com/s/wm_LM83gyLM-auidBxprZw)

### OpenAI 呼吁通过“反向联邦主义”推动美国 AI 安全标准统一

OpenAI 首席全球事务官 Chris Lehane 发文，主张通过“反向联邦主义”推动美国 AI 前沿安全治理：各州先通过相似立法，逐步形成事实上的国家标准。文章提到加州、纽约州和伊利诺伊州相关立法中的风险披露、安全事故报告和独立审计要素，也提及联邦层面的强模型网络测试框架。AI 安全标准正在被拉入州法、联邦政策和行业自律的交界地带。

📎 [OpenAI](https://openai.com/index/advancing-ai-safety-through-state-and-federal-action)

### Base44 为何信任 Claude Fable 5 处理复杂工程任务

无代码开发平台 Base44 将系统提示词重构任务交给 Claude Fable 5。Claude 官方案例称，该模型在四小时内独立完成 90%-95% 的重构，并主动发现团队评估遗漏的缓存命中测试盲点。案例的重点在于，模型厂商正在用真实工程案例证明高端模型不只是写局部代码，也能处理架构和质量评估任务。

📎 [Claude Blog](https://claude.com/blog/working-at-the-frontier-why-base44-trusts-claude-fable-5-with-their-most-challenging-engineering-work)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
