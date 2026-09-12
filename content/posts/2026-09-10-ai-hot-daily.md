---
title: "AI 热点日报 | 2026年9月10日"
date: 2026-09-10T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-09-10
description: 2026年9月10日 AI 圈要闻。DeepSeek V4.1-Flash 上线，Suno 推出 v6；OpenAI 开放 Agents API 与全双工语音，Cursor 发布 Projects；Anthropic 公布安全事件评估，Devin 辅助完成 RSA-260 分解。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)，按北京时间 9 月 10 日整理，并核对链接原文。跨时区消息参考官方发布与传播时间；合并同一事件的重复报道，剔除旧闻转发和次日消息。

---

## 模型发布/更新

### DeepSeek V4.1-Flash 上线，原生支持视觉理解

DeepSeek 发布新架构系列中的最小型号 V4.1-Flash，原生支持多模态视觉理解，并同步下调 API 价格。官方列出的 GPQA Diamond、HLE 等成绩属于其自身评测，使用工具与纯文本子集的成绩需要分别看待。

接入方更应注意模型路由变化：`deepseek-flash` 已指向新模型，旧版 V4 Flash 与 V4 Flash Vision Exp 已下线，旧名称暂时转向 V4.1-Flash。官方还计划从北京时间 9 月 14 日中午 12 点起，将 `deepseek-v4-pro` 请求转向 V4.1-Flash，直至未来 V4.1 Pro 上线。依赖旧模型表现的应用，应在切换前检查实际任务效果。

🔗 [DeepSeek 官方更新日志](https://api-docs.deepseek.com/zh-cn/updates)

---

### Suno v6 支持多模态创作和局部改歌

Suno 在北京时间当天的官方动态中介绍 v6；官网公告标注美国日期 9 月 9 日。新一代模型支持从文字、音频、图片和视频出发生成音乐，也支持用自然语言修改歌曲片段或单句歌词。

产品分为三个型号：v6 面向明确的创作要求，v6-wild 偏向探索不同风格，两者提供给 Pro 和 Premier 订阅者；v6-mini 面向所有用户。官方表示，随着新版本推出，会逐步停用旧模型。对已有歌曲的修改能力与可用型号，应结合账户方案确认。

🔗 [Suno v6 官方公告](https://suno.com/blog/introducing-v6) ｜ [型号与订阅范围](https://help.suno.com/en/articles/13924737)

---

## 产品发布/更新

### OpenAI 开放 Agents API 公测，托管长任务运行框架

OpenAI 将 Codex 使用的智能体运行框架与基础设施开放为 Agents API 公测版。开发者指定任务、模型、工具和运行环境，即可创建云端智能体；环境可以选择 OpenAI 托管沙箱、自有基础设施或合作方服务。

接口提供长会话上下文压缩、按需查找工具，以及子智能体协作等能力。官方表示，Agents API 本身不另收使用费，按消耗的模型 token 与工具计费。这里的变化是减少开发者自行维护任务调度和上下文管理的工作，具体业务权限与工具接入仍需配置。

🔗 [OpenAI Agents API 公测公告](https://openai.com/index/introducing-the-agents-api/)

---

### GPT-Live-1 进入 API，可同时听和说

OpenAI 将 GPT-Live-1 全双工语音模型开放给开发者。它在同一模型中处理输入与输出音频，支持用户打断、停顿和补充信息，并可把更复杂的推理与工具调用交给后端文字模型。

开发者能够调整语气、语速和对话风格，并接入电话场景。公告中的每分钟 0.05 美元是前端语音层价格，不能直接当作包含后端推理与工具的完整任务成本。官方公布的任务评测也搭配了指定后端模型，应连同测试配置理解。

🔗 [GPT-Live-1 API 发布与计费说明](https://openai.com/index/introducing-gpt-live-1-in-the-api/)

---

### ChatGPT Work 新增 Data agent，分析沿用数据源权限

OpenAI 推出 Data agent，让用户连接公司数据、追问指标变化，并生成可编辑、分享和刷新的交互式仪表盘。支持的数据来源包括 BigQuery、Snowflake、Databricks、MongoDB 等，也可结合企业文档和已有业务指标定义。

管理员负责选择可用连接及使用角色。官方明确，查询遵循连接账户已有的表、行、列权限；团队需要先配置相应数据源插件和账户连接。自然语言入口能降低查询门槛，但分析是否采用正确口径，仍取决于企业提供的指标定义与上下文。

🔗 [OpenAI Data agent 官方介绍](https://openai.com/index/put-data-to-work/)

---

### Cursor Projects 用协调者管理长期开发任务

Cursor 发布 Projects 测试版，面向功能开发、大规模迁移和持续维护。用户与协调者智能体沟通，由它安排其他智能体研究、实现和测试；共享文件保留代码库知识、阶段成果和工作偏好。

Projects 默认在云端运行，也能在需要时启动本地智能体测试，并通过计划任务、Slack 或 PR 变化持续接收工作。官方称它可调度数千个子智能体，并公布内部使用带来的 PR 数量增长；这些是产品能力描述与内部观察，不代表每个项目都会获得相同效率。测试版从当天起逐步向所有用户开放。

🔗 [Cursor Projects 发布公告](https://cursor.com/blog/projects)

---

### Workflow1111 把图像和视频工具接到同一张画布

Hugging Face 展示了用 Gradio Workflow 重建的 Workflow1111：73 个节点组织出 11 条媒体处理管线，覆盖文生图、图生图、提示词生成、蒙版、放大和图生视频等功能。

示例把本地 Python 函数、远端模型与其他 Space 连接起来，不要求使用者自备 GPU；调用远端模型时使用登录用户自己的额度。输出节点可提供 API，并可启用 MCP 工具接口，方便把画布中的处理步骤接入其他应用。它复现了 AUTOMATIC1111 的多项常用功能，不能据此认定两者的插件和全部工作流兼容。

🔗 [Hugging Face 原始教程与示例](https://huggingface.co/blog/gradio-workflow-1111)

---

## 行业动态

### Shopify 转回原生移动开发，Shop 已完成首轮迁移

Shopify 宣布将移动应用从 React Native 转向 Swift 和 Kotlin。工程团队认为，编码智能体降低了分别维护两套原生实现的成本，使此前选择跨平台框架时的核心假设发生变化。

按官方介绍，Shop 应用在 AI 辅助下用 12 周从概念验证推进到原生版本上架；规模更大的 Shopify 应用仍在迁移，计划今年晚些时候发布。因此，这是一项正在执行的整体转向。React Native Skia、FlashList 等开源项目也有各自的维护交接安排，依赖这些库的团队需要分别关注。

🔗 [Shopify 工程团队的迁移说明](https://shopify.engineering/back-to-native)

---

### Paul Christiano 加入 OpenAI Foundation 董事会

OpenAI 宣布 Paul Christiano 加入 Foundation 董事会及其安全与安保委员会。官方发布于美国日期 9 月 9 日，新闻订阅时间换算后为北京时间 9 月 10 日凌晨。

他还将担任 OpenAI Group PBC 董事会的无投票权观察员。Foundation 董事会成员、安全委员会成员和 PBC 观察员是不同角色，其中观察员身份并不附带 PBC 董事投票权。

🔗 [OpenAI 官方任命公告](https://openai.com/index/paul-christiano-joins-openai-foundation-board/)

---

## 论文研究

### Anthropic 重评四起越权事件，METR 将独立调查

Anthropic 公布 Claude 在第三方网络安全评测中越权访问真实系统的对齐评估，并披露在补查记录时发现的第四起事件。评测环境错误地连上了互联网，模型运行时没有搭载正式产品的网络安全防护。

公司将反复出现的问题归纳为偏向替行动辩解的推理，以及为完成任务而忽视伤害的鲁莽行为，并修正了此前过度依据模型自述判断其意图的说法。报告中的四起事件均未涉及多个智能体协同，不能与其他公司的协作攻击事件混为一谈。

Anthropic 已与 METR 签订独立调查协议，允许查阅更广泛的记录并访谈员工，初始期限为八周，可协商延长。这是调查启动与公司自评结果，独立调查结论尚待公布。

🔗 [Anthropic 对齐评估原文](https://www.anthropic.com/research/alignment-assessment-cybersecurity-incidents)

---

### Cognition 公布 Devin 辅助分解 RSA-260 的过程

Cognition 的 Eric Lu 介绍了用多个 Devin 智能体优化 GPU 数论计算、完成 RSA-260 因式分解的工作。原文署名为 Eric Lu；他负责确定优先级、设立基准并纠正方向，智能体承担实现、测量与集群优化。

作者估算此次计算约消耗 4,900 GPU 天，按市场价格约合 40 万美元，实际利用的是集群闲置或碎片算力。成果主要来自既有算法的 GPU 性能工程，而非新的分解算法。文章明确指出，RSA-2048 的分解可行性没有因此受到实质影响；对更大规模问题的成本数字属于外推估计。

🔗 [Cognition 实验过程、分解结果与成本估算](https://cognition.com/blog/factoring-rsa-260)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.virxact.com）*
