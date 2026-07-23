---
title: "AI 热点日报 | 2026年6月29日"
date: 2026-06-29T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: "ai-hot-2026-06-29"
description: "2026年6月29日 AI 圈要闻：Grok 4.5 在 SpaceX 和 Tesla 私测，新浪开源 VibeThinker-3B，Wayfinder Router 推出确定性模型路由，CEO-Bench 测试 AI 长期创业决策，AI 玩《文明VI》暴露感知与执行短板。"
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### Grok 4.5 在 SpaceX 和 Tesla 私测，马斯克称性能接近 Opus

Elon Musk 称，Grok 4.5 基于 1.5T V9 基础模型，并在补充训练中加入 Cursor 数据，目前已在 SpaceX 和 Tesla 进入私测。他表示，初步评估显示其性能接近、甚至可能超过 Opus，强化学习仍在继续提升模型，Grok Build 工具链也在完善。这个消息还没有完整技术报告支撑，但它值得关注：xAI 正在把模型迭代直接放进马斯克体系内的真实业务场景里验证，下一步竞争不只是榜单表现，也会看模型能否服务航天、汽车、工程和企业内部工作流。

📎 [X：Elon Musk (@elonmusk, xAI)](https://x.com/elonmusk/status/2071184354756477041)

### 新浪开源 VibeThinker-3B，强调推理可压缩、事实知识难压缩

新浪发布并开源 VibeThinker-3B。AI HOT 收录的信息显示，这个 3B 参数模型基于 Qwen2.5-Coder-3B，经 SFT、强化学习、自蒸馏等多阶段后训练，在 AIME26 等数学和编程基准上接近远大于自身的模型，LiveCodeBench 表现也超过多个 20B 以下模型；但在知识密集型 GPQA-Diamond 上明显落后。真正有意思的是它背后的判断：逻辑推理可能依赖少数可压缩模式，而广泛世界知识仍需要更大参数承载。对小模型路线来说，这区分了“可以压缩的能力”和“压缩后会损失的知识”。

📎 [The Decoder：Sina's open model VibeThinker-3B](https://the-decoder.com/sinas-open-model-vibethinker-3b-aims-to-show-reasoning-compresses-well-but-factual-knowledge-doesnt)

---

## 产品发布/更新

### Wayfinder Router 推出确定性模型路由，面向本地和托管 LLM 混合使用

Wayfinder Router 是一个在本地模型和托管大语言模型之间做查询路由的工具。它不依赖额外模型调用，而是分析提示词长度、标题、列表、代码、数学证明和硬约束等结构特征，在微秒级给出路由决策，并支持 OpenAI 兼容 API、Ollama、Anthropic、Groq、vLLM 等接口。它切中的问题很现实：当团队同时使用本地模型、便宜模型和高能力闭源模型时，路由器不能本身又带来高延迟、高成本和随机性。确定性路由会成为 AI 成本控制和隐私部署里的基础组件。

📎 [GitHub：wayfinder-router](https://github.com/itsthelore/wayfinder-router)

### Adrafinil：只在 AI Agent 工作时阻止 Mac 睡眠的菜单栏工具

Adrafinil 是一款 macOS 菜单栏应用，只在 Claude Code、Codex、Cursor、Gemini CLI、Aider、Hermes、OpenCode、Cline、Pi 等 AI coding agent 有活跃会话时阻止系统睡眠；没有 agent 工作时，合盖后 Mac 会正常睡眠。它通过各 agent 的 Hook 系统调用 CLI，并提供引用计数、温度阈值强制释放、空闲释放和进程嗅探等机制。这个小工具反映了一个很具体的新需求：AI coding agent 的任务常常需要长时间后台运行，但用户又不希望整台电脑一直被无差别唤醒。

📎 [GitHub：Adrafinil](https://github.com/kageroumado/adrafinil)

---

## 论文研究

### CEO-Bench 测试 500 天创业经营，仅三个 AI 模型盈利超过起始资本

普林斯顿大学推出 CEO-Bench 基准测试，让 AI 智能体在模拟环境中经营订阅软件公司 NovaMind 500 天，起始资金为 100 万美元。AI HOT 收录的结果显示，14 个测试模型中，只有 Claude Fable 5、Claude Opus 4.8 和 GPT-5.5 在最佳运行中超过起始资本；一个不调用语言模型的简单规则启发式方法也拿到 1576 万美元，超过除前三名外的所有模型。这个结果很值得警惕：长期经营不是单轮问答，模型需要稳定策略、预算控制、产品节奏和风险管理；如果连简单规则都能赢过多数模型，说明“长期自主决策”离可靠商用还有距离。

📎 [The Decoder：CEO-Bench startup survival test](https://the-decoder.com/only-three-ai-models-finished-above-starting-capital-in-a-500-day-startup-survival-test)

---

## 技巧与观点

### 四大 AI 对战《文明VI》，暴露感知与执行短板

英国前首相府数据科学家 Liam Wilkinson 搭建 76 个 MCP 工具，让 Claude Opus 4.6、GPT-5.4、Gemini 3.1 Pro 等四个模型在《文明VI》中进行 23 场对局。最戏剧性的案例是 Claude 扮演葡萄牙时，因法国文化胜利逼近而花 50 回合研发核弹并攻击图卢兹，但法国最后仍以外交胜利获胜。AI HOT 收录的分析指出，模型主动检查全局状态的比例只有 1-2%，计划后 10 回合内执行率也只有 48-66%。这说明在复杂环境里，模型的瓶颈未必是“聪不聪明”，而是能否持续感知局势、保持计划并按步骤执行。

📎 [IT之家：四大顶级 AI 对决《文明VI》](https://www.ithome.com/0/969/570.htm)

### Interconnects 盘点开放模型生态，Zyphra、Cohere 和 Poolside 扩展版图

Nathan Lambert 在 Artifacts 22 中观察到，开放模型生态正在从少数公司扩展到更广泛的全球参与者。纯模型公司、主权 AI 玩家、科技巨头和产品公司都在训练不同目标的模型：有的追求通用能力，有的服务本地部署、行业需求或产品内嵌的小模型。文章还提到 NVIDIA Nemotron-3-Ultra-550B-A55B-BF16 采用 LatentMoE 架构并使用 OpenMDW 许可证，Cohere 也以 Apache 2.0 开源旗舰模型。对开发者来说，开放模型市场正在变成一个需要持续比较许可、部署、成本、生态和任务适配度的工程选择题。

📎 [Nathan Lambert：Artifacts 22](https://www.interconnects.ai/p/artifacts-22-zyphra-cohere-and-poolside)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
