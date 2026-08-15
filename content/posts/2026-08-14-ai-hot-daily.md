---
title: "AI 热点日报 | 2026年8月14日"
date: 2026-08-14T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-08-14
description: 2026年8月14日 AI 圈要闻：小红书开源 dots3-note Preview，智谱发布 GLM-5.3，Gemini 3.7 Flash 扩大开放，Claude Code v2.1.233 上线，Cursor 被 SpaceX 收购。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### 小红书开源 dots3-note Preview 多模态模型

小红书 dots 团队开源 dots3-note Preview，这是 dots3 系列首个开放权重模型，也是该系列目前最轻量的版本。模型采用混合专家架构，总参数约 2800 亿、单次激活约 160 亿，支持最高 512K 上下文，可处理文本、图像、视频和音频输入，并面向工具调用、长程智能体与代码任务优化。模型卡中的能力与评测数字来自项目方，实际部署仍需结合许可证、显存需求和目标任务复测。

🔗 [Hugging Face：dots-studio/dots3-note-prev](https://huggingface.co/dots-studio/dots3-note-prev)

### 智谱发布 GLM-5.3，强化编程与网络安全能力

智谱发布 GLM-5.3，在 GLM-5.2 基座上继续扩大后训练规模，重点增强编程、终端操作和网络安全任务。官方称其编程能力较上一版本提升约 50%，并公布 Terminal-Bench 3.0、CyberGym 等基准结果；模型权重计划在发布后两周内开放。上述排名和提升幅度均为厂商测试口径，等待权重开放后仍需第三方在一致环境中复现。

🔗 [AI HOT：GLM-5.3 发布](https://aihot.virxact.com/items/cmssir12d047oroffnpn5pcx1)

### Gemini 3.7 Flash 向 Pro 与 Ultra 用户全面开放

Google 将 Gemini 3.7 Flash 扩大开放至 Gemini 应用的 Pro 与 Ultra 用户，并让 Gemini Spark 使用这一模型。此次更新强调多步骤推理、跨文件与邮件处理，以及对 Workspace 工具的调用能力。它是在前一日模型发布基础上的产品侧 rollout，具体可见性仍可能受账号、地区和分批推送影响。

🔗 [Google DeepMind：Gemini 3.7 Flash](https://deepmind.google/blog/introducing-gemini-3-7-flash) ｜ [AI HOT：产品开放进展](https://aihot.virxact.com/items/cmst9yj3c05utrodz443l0odv)

### DeepSeek V4 Pro 登陆硅基流动

硅基流动上线 DeepSeek V4 Pro，提供 100 万 token 上下文，并面向编程、工具调用和智能体工作流提供 API 接入。平台还提供不同推理强度选项；调用价格会随渠道与时间调整，生产使用前应以控制台实时计费和限额为准。DeepSeek 官方资料显示，V4 Pro 为混合专家模型，总参数约 1.6 万亿、激活约 490 亿，采用 MIT 许可证开放预览权重。

🔗 [SiliconFlow](https://www.siliconflow.com/blog/deepseek-v4-now-on-siliconflow-million-token-context-intelligence) ｜ [DeepSeek API 文档](https://api-docs.deepseek.com/news/news260424/)

---

## 产品发布/更新

### Claude Code v2.1.233 增加 GitLab MR 与内存限制支持

Claude Code v2.1.233 为 `--worktree` 和智能体视图加入 GitLab Merge Request URL 支持，并新增可选的用户身份转发、Linux Bash 工具内存 cgroup 限制和 WebFetch 缓存时长配置。版本同时修复 MCP 重连、Linux 空闲高 CPU、Windows NT 设备路径绕过 UNC 校验等问题。涉及自动执行、代理网关或 Windows 凭据的团队应优先阅读完整变更记录并安排升级验证。

🔗 [GitHub Releases：Claude Code v2.1.233](https://github.com/anthropics/claude-code/releases/tag/v2.1.233)

---

## 行业动态

### OpenAI 与 Anthropic 的价格竞争进一步升温

Ars Technica 报道称，随着中国模型以更低价格进入更多海外工作负载，OpenAI 与 Anthropic 正通过降价和分层产品争夺 API 客户。价格战让团队重新比较单位 token 价格、任务完成率和路由策略，但低标价不等于更低的端到端成本，重试率、上下文长度、工具调用和服务稳定性同样关键。这是一篇行业分析，具体价格仍应以各厂商官方计费页为准。

🔗 [Ars Technica](https://arstechnica.com/ai/2026/08/openai-and-anthropic-in-price-war-as-chinese-ai-rivals-gain-ground/)

### SpaceX 完成对 Cursor 的收购

Cursor 宣布已被 SpaceX 收购，交易完成后将获得 SpaceX 的算力基础设施与工程资源支持，并继续推进代码模型和智能体产品。双方此前已公开合作训练模型，Cursor 也曾披露使用 SpaceX GPU 集群开展研究。公告未公开完整交易条款，产品路线、组织整合和客户数据边界仍需以后续说明为准。

🔗 [AI HOT：收购消息](https://aihot.virxact.com/items/cmst3joqo03pwro0658o4g1m3) ｜ [Cursor：与 SpaceX 的模型训练合作](https://cursor.com/blog/spacex-model-training)

### Anthropic 介绍 Claude 文本水印机制

Anthropic 介绍面向未来 Claude 输出的文本水印方案，称其基于 SynthID-Text，在不明显改变文本质量或 token 用量的前提下嵌入统计信号，以配合欧盟《人工智能法案》的透明度要求。文本水印的检测效果会受到改写、翻译、截取和文本长度影响，因此它更适合作为来源判断的一项信号，而不是单独的真实性证明。

🔗 [AI HOT：Claude 文本水印机制](https://aihot.virxact.com/items/cmstc3u8j02xhro0xf5o1ouas)

### 印尼首个大学 AI 中心在日惹落成

印度尼西亚通信与数字事务部、Indosat、NVIDIA 与加查马达大学在日惹启用 NVIDIA AI Technology Center。项目被介绍为印尼首个设在大学内的 AI 中心，将围绕课程、研究和产业项目培养本地 AI 人才。长期效果仍取决于课程覆盖、算力开放程度、师资与学生实际参与规模。

🔗 [AI HOT：印尼大学 AI 中心](https://aihot.virxact.com/items/cmst7s3xg02x3rodz3uvww36c)

---

## 技巧与观点

### Hugging Face 观察 2026 年夏季开源模型生态

Hugging Face 的生态观察称，2026 年 1 月至 8 月，Hub 模型仓库数量从约 243 万增至 296 万，但下载量高度集中：大量仓库下载有限，少数头部模型获得绝大多数使用。报告还比较了不同地区实验室的开放模型规模，以及 AMD、NVIDIA 等硬件厂商发布仓库的数量。统计结果受时间窗口、仓库口径和下载指标影响，更适合判断生态结构，而不是直接代表模型质量或实际用户数。

🔗 [AI HOT：2026 年夏季开源模型生态观察](https://aihot.virxact.com/items/cmst4z2qp05boro06ce7kxtgd)

### Claude Code 会话如何提高 token 使用效率

Claude Code 官方文档建议在切换无关任务时使用 `/clear`，避免旧上下文持续进入后续请求；长任务则可在自然分界点使用 `/compact`。提示缓存依赖稳定的请求前缀，切换模型会重建对应缓存，连接或断开 MCP 服务也可能导致缓存失效。优化时应同时观察输入、输出、缓存写入与缓存读取 token，而不是只看上下文窗口大小。

🔗 [Claude Code：成本管理](https://code.claude.com/docs/en/costs) ｜ [Claude Code：提示缓存](https://code.claude.com/docs/en/prompt-caching)

### 蚂蚁百灵与 ASystem 打通单机 Agentic RL 闭环

蚂蚁百灵与 ASystem 团队展示了在一台 DGX Spark 上完成智能体强化学习后训练闭环：使用 Ling-3.0-tiny、AReno 和井字棋环境，通过 GSPO 训练约 400 步。团队报告奖励从约 -0.5 上升到 0.4、响应长度稳定在约 850 token。该结果来自单一任务和项目方设置，说明流程可跑通，但不能直接外推到复杂智能体任务的泛化能力。

🔗 [AI HOT：单机 Agentic RL 后训练实践](https://aihot.virxact.com/items/cmssf79uf05rwrod09r9ocb2w)

### OpenRouter 发布视觉输入 API 指南

OpenRouter 的视觉指南说明，可通过 Chat Completions API 在 `messages[].content` 中同时放入文本和 `image_url` 内容块。公开图片可直接传 URL，本地或私有图片可使用 Base64 data URL；单次可传图片数量及支持格式仍取决于模型与上游提供商。开发者还应检查请求体大小、图片分辨率、隐私和各模型的视觉计费方式。

🔗 [OpenRouter 文档：Image Inputs](https://openrouter.ai/docs/guides/overview/multimodal/image-understanding)

### OpenRouter 数据显示多数调用并不追逐 SOTA

投资人 Tomasz Tunguz 根据 OpenRouter 与 Artificial Analysis 数据分析称，约 84% 的 OpenRouter token 来自非最前沿模型；在 8 月 10 日当周，承担约八成调用量的六个模型，综合能力约为前沿水平的 77%，混合价格则低得多。这一结论只覆盖 OpenRouter 可见流量，不包含厂商第一方 API、企业私有部署和完整“Others”流量，因此更适合说明价格与性能的权衡，而非整个模型市场份额。

🔗 [Tomasz Tunguz](https://www.tomtunguz.com/model-release-exhaustion)

### Databricks 总结数据仓库中的 AI Functions 用例

Databricks 介绍如何在 SQL、Notebook、Lakeflow 管道和工作流中使用内置 AI Functions，对数据进行文档解析、实体提取、分类、情感分析和通用模型查询。这使分析师能在现有数据流程中处理非结构化内容，但生产部署仍要评估模型输出稳定性、数据权限、成本和人工复核机制。官方文档还说明该能力对 Serverless 计算和运行时版本有要求。

🔗 [Databricks 文档：AI Functions](https://docs.databricks.com/aws/en/large-language-models/ai-functions) ｜ [AI HOT：用例解析](https://aihot.virxact.com/items/cmstgucbq067zro0xkuon9ioi)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
