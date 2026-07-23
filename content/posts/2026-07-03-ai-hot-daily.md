---
title: "AI 热点日报 | 2026年7月3日"
date: 2026-07-03T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-07-03
description: 2026年7月3日 AI 圈要闻：支付宝阿宝 AI 助手正式开放公测，Google Health API 推出 CLI 工具 ghealth，Kimi K2.7 Code 已在 GitHub Copilot 上正式发布，阿里巴巴发布 Page Agent 开源 JavaScript 库，昆仑万维天工 3.2 发布 Skywork Tags，Claude Enterprise 新增用量与成本分析功能，Microsoft 成立"Frontier Company"斥资 25 亿美元派驻 6000 名 AI 工程师，快手可灵AI获20.28亿美元注资估值180亿美元，OpenAI提议美国政府持股5%估值426亿美元等。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 产品发布/更新

### 支付宝阿宝 AI 助手正式开放公测

支付宝阿宝 AI 助手今日正式开放公测，iOS 和安卓用户可在应用商店或支付宝 App 搜索"阿宝"或"蚂蚁阿宝"直接体验。开通后右滑进入新版，以对话方式安排办事，例如说出"查公积金"，阿宝会自动匹配对应小程序和服务入口，用户点击确认即可完成。支付宝承诺所有资金变动与支付环节均需用户本人确认，扫码、转账等功能已预留入口。

📎 [IT之家（RSS）](https://www.ithome.com/0/971/469.htm)

### Google Health API 推出 CLI：ghealth 是针对 Fitbit 数据的开源工具

ghealth 是一款封装 Google Health API v4 的开源命令行工具，以单个 Go 二进制文件发布（Apache 2.0 协议）。它提供 40 种已验证的数据类型（包括步数、心率、睡眠、体重、血氧饱和度、心率变异性等）的结构化 JSON 输出。工具采用 Agent 优先设计，具备确定性退出码、--dry-run 和 --raw 标志，并附带两个 SKILL.md 文件供 AI 智能体使用。用户需自行创建 OAuth 凭据，通过 PKCE S256 认证。数据来源覆盖 Fitbit、Pixel Watch 及连接的第三方设备。

📎 [MarkTechPost（RSS）](https://www.marktechpost.com/2026/07/02/the-google-health-api-got-a-cli-ghealth-is-an-open-source-tool-for-your-fitbit-air-data)

### Senior SWE-Bench：评估 AI 智能体作为高级工程师的基准测试

Senior SWE-Bench 是一个开源基准测试，用于评估 AI 智能体完成高级软件工程师级别任务的能力。任务分功能开发与 Bug 修复两类：功能任务指令类似自然语言消息，采用验证智能体基于专家配方自动生成行为测试；Bug 任务要求根据日志、profiling 等运行时信息深入调查。排行榜显示，Claude Opus 4.8 搭配 Mini-SWE-Agent（max effort）通过率 24.0%，Claude Sonnet 5 为 19.4%，GPT-5.5 为 16.0%，最强前沿模型在超 75% 任务中未能达到高级工程师级别的正确性与品味。

📎 [Hacker News 热门（buzzing.cc 中文翻译）](https://senior-swe-bench.snorkel.ai/)

### Kimi K2.7 Code 已在 GitHub Copilot 上正式发布

Kimi K2.7 Code 开源权重模型已在 GitHub Copilot 中正式可用，成为 Copilot 模型选择器首个可选的开源权重模型，为编程工作流提供更低成本选择。该模型由 GitHub 托管于 Microsoft Azure，按供应商列表价格以用量计费。逐步向 Copilot Pro、Pro+ 和 Max 计划用户推送，用户可在 Visual Studio Code 1.127.0 或更新版本、Visual Studio 17.14.6 或更新版本、JetBrains 1.9.1-251 或更新版本、Xcode、Eclipse 等 IDE 及 Copilot CLI、GitHub.com、GitHub Mobile 等平台使用。

📎 [Hacker News 热门（buzzing.cc 中文翻译）](https://github.blog/changelog/2026-07-01-kimi-k2-7-is-now-available-in-github-copilot)

### 阿里巴巴发布 Page Agent：开源 JavaScript 库实现网页 DOM 自然语言操控

阿里巴巴发布 Page Agent，一个开源的 JavaScript 客户端库，嵌入网页后可通过自然语言指令直接操作 DOM 元素。与 Playwright、Puppeteer 等外部浏览器自动化工具不同，Page Agent 不依赖截图或多模态模型，而是将实时 DOM 脱水压缩为 FlatDomTree 文本映射，让纯文本模型精准执行点击、表单填写等操作。它继承用户 cookies 和会话，无需独立后端，并支持任意 OpenAI 兼容端点的模型（示例使用 `qwen3.5-plus`）。项目采用 MIT 许可证。

📎 [MarkTechPost（RSS）](https://www.marktechpost.com/2026/07/02/meet-alibabas-page-agent-a-javascript-in-page-gui-agent-that-controls-web-interfaces-with-natural-language-through-the-dom)

### 昆仑万维天工 3.2 发布 Skywork Tags，AI 智能体加入工作群聊

昆仑万维天工 3.2 发布 Skywork Tags，将 AI 智能体以团队成员身份接入 Slack、飞书、钉钉、Discord、Telegram 等即时通讯工具。团队可在原有工作群中 @Skywork 参与讨论，无需切换窗口或迁移数据。共享版 Agent 持续吸收多样上下文后表现反超精心调教的个人版，团队最终完全改用共享版。

📎 [公众号：昆仑万维（天工）](https://mp.weixin.qq.com/s/OqL6ID-mAel8XN-slYgXOA)

### Claude Enterprise 新增用量与成本分析及支出管控功能

Claude Enterprise 推出更丰富的管理分析工具和成本控制功能。仪表板现可按群组和用户分析用量与成本，支持按 SCIM 群组筛选，展示制品创建、文件编辑、技能和连接器对应的成本。Claude Code 管理控制台新增"使用量"和"价值"选项卡，分别显示活跃开发者、会话次数、常用命令，以及生产力提升估算、每次提交成本和年度价值估算。分析聊天支持自然语言查询并返回可导出图表。

📎 [Claude：Blog（网页）](https://claude.com/blog/giving-admins-more-visibility-and-control-over-claude-usage-and-spend)

---

## 行业动态

### Microsoft 成立"Frontier Company"，斥资 25 亿美元派驻 6000 名 AI 工程师到企业客户现场

Microsoft 新设业务部门"Frontier Company"，拨款 25 亿美元，将 6000 名行业与工程专家派驻企业客户现场，"共同设计、共同创新、部署并持续改进 AI 系统"。该部门由 Rodrigo Kede Lima 领导，旨在超越"前部署工程"模式，成为"最大、以结果为导向的工程组织"。Microsoft 将自己定位为 OpenAI 和 Anthropic 的"平台中立"替代方案。

📎 [The Decoder：AI News（RSS）](https://the-decoder.com/microsoft-launches-2-5-billion-frontier-company-to-embed-6000-ai-engineers-inside-enterprise-clients)

### Anthropic 与五角大楼控权之争：Claude 军事用途护栏分歧

WSJ 法庭文件显示，Anthropic CEO Dario Amodei 与五角大楼副部长 Emil Michael 数月邮件往来，核心分歧在于 Claude 的军事用途护栏。Anthropic 要求禁止全自主武器及某些监控用途，五角大楼则希望 Claude 可用于所有合法国家安全场景。Michael 称若分歧太大不愿"强行推动"。随后五角大楼将 Anthropic 列为供应链风险，阻止合作伙伴在国防部项目中使用其模型。

📎 [X：Kim (@kimmonismus)](https://x.com/kimmonismus/status/2072718147279335507)

### OpenAI 提议美国政府持股 5% 估值 426 亿美元

据 Financial Times 和 CNBC 报道，OpenAI 提议向美国政府提供公司 5% 的股份，按近期 8520 亿美元估值计算，价值约 426 亿美元。OpenAI CEO Sam Altman 表示，此举是与公众分享 AI 发展红利的最佳方式。

📎 [X：Testing Catalog (@testingcatalog)](https://x.com/testingcatalog/status/2072585845542969583)

### 花旗、Adobe 等企业限制员工使用 AI 旗舰模型以控制成本

据 404 Media 获取的内部资料，Atlassian、Adobe、亚马逊等六家企业正限制员工使用 AI 工具，要求改用能力较低的大模型避免成本失控。至少一家企业月度 AI 开销增至三倍，超 1500 万美元。花旗银行因 GitHub 改为按量计费，于 6 月 24 日禁用 Claude Opus 4.6、4.7 及 GPT-5.5 等旗舰模型。Adobe 于 6 月 30 日终止 Claude 无限制使用协议。

📎 [IT之家（RSS）](https://www.ithome.com/0/971/937.htm)

### 快手可灵 AI 获初始投资者 20.28 亿美元注资，投后估值 180 亿美元

快手在港交所公告，21 名初始投资者同意以 138.24 亿元人民币（20.28 亿美元）现金注资北京可灵，后者将持有可灵 AI 相关资产。同日 15 名额外投资者追加出资 52.235 亿元人民币（7.6639 亿美元），认购总上限为 204.471 亿元（30 亿美元），对应北京可灵扩大后注册资本的 16.67%。投后估值 180 亿美元。快手预计未来 12 个月内启动可灵 AI 赴港上市。

📎 [IT之家（RSS）](https://www.ithome.com/0/971/954.htm)

### 谷歌 AI 建设导致 2025 年用电量增长 37%

2025 年，谷歌年度用电量同比上涨 37%，创历史最大增幅。数据中心全年消耗超 4200 万兆瓦时，超过新西兰、丹麦、尼日利亚等国总用电量。自 2019 年以来，谷歌总用电量已增长超 250%。用电激增主要来自 Google Cloud、YouTube 视频流及支撑 AI 产品和服务的数据中心建设与运营。

📎 [Ars Technica：AI（RSS）](https://arstechnica.com/ai/2026/07/googles-ai-buildout-drove-37-increase-in-electricity-use-in-2025)

---

## 论文研究

### 关于 Mythos 和网络安全的讨论并非炒作

关于 Mythos 和网络安全的讨论并非炒作。（正如任何使用 Fable 进行自主工作的人可能已经认识到的那样。）

📎 [X：Ethan Mollick (@emollick)](https://x.com/emollick/status/2072778376494895139)

### 多智能体团队阻碍专家发挥

在自我组织的多智能体 LLM 系统中，团队无法有效利用专家成员的专业知识。在多个基准测试中，即使明确告知专家身份，团队表现仍落后于最佳成员（专家智能体）的独立能力，性能损失最高达 41.1%。失败主因是未能有效利用专家意见，而非识别专家。

📎 [Apple Machine Learning Research（RSS）](https://machinelearning.apple.com/research/multi-agent-teams-experts)

### RL 微调 VLM 的鲁棒性与思维链一致性研究

强化学习（RL）微调被扩展至视觉语言模型（VLM）。研究发现，简单的文本扰动——误导性标题或错误思维链（CoT）——会显著降低模型鲁棒性和置信度，且开源模型衰退更明显。闭源模型呈现类似失败模式，但鲁棒性和推理一致性更强。

📎 [Apple Machine Learning Research（RSS）](https://machinelearning.apple.com/research/robustness-chain-thought-consistency)

### VideoFlexTok：可变长度粗到细视频分词

VideoFlexTok 提出一种可变长度 token 序列的视频表示方法，采用粗到细结构——首个 token 捕捉语义和运动等抽象信息，后续 token 添加精细细节，生成流解码器支持任意 token 数量的视频重建。相比传统 3D 网格分词，该结构允许根据下游需求调整 token 数。

📎 [Apple Machine Learning Research（RSS）](https://machinelearning.apple.com/research/videoflextok)

---

## 技巧与观点

### browser-use 发布开源 AI 视频剪辑 Skill「video-use」

browser-use 团队推出面向 Codex、Claude Code 等 AI 编码智能体的开源 Skill「video-use」，让 LLM 通过 ElevenLabs Scribe 将音频转写为约 12KB 文本（含逐词时间戳、说话人分离、事件标记），仅在决策点调用 timeline_view.py 生成 PNG 帧图。技术流水线包括转写、打包、生成 JSON 格式 EDL、ffmpeg 渲染及最多 3 轮自评估。

📎 [X：邵猛 (@shao__meng)](https://x.com/shao__meng/status/2072644710523691110)

### Emil Kowalski 发布设计工程师 Skills，让 AI 编码工具具备 UI 动画审美

Emil Kowalski 将多年 UI/动画原则沉淀为三个 Skill，使 Codex、Claude Code、Cursor 等 Coding Agents 具备资深设计工程师的审美判断。核心规则：动画必须有理由；每天 100+ 次的高频操作禁用动画；UI 动画控制在 300ms 内；只动画 transform 和 opacity。

📎 [X：邵猛 (@shao__meng)](https://x.com/shao__meng/status/2072484635955900792)

### Fable 5 在 RLI 基准中达成 16.1% 自动化率，较八个月前提升六倍

Remote Labor Index（RLI）衡量 AI 智能体完成 240 个付费自由职业项目（总值 14.4 万美元）的专业质量比例。最新结果显示，Fable 5 自动化率达 16.1%，是八个月前最佳系统 2.5% 的六倍多，也超过 Opus 4.8（8.3%）和 GPT-5.5（6.3%）。

📎 [The Decoder：AI News（RSS）](https://the-decoder.com/ai-agents-can-now-complete-16-percent-of-freelance-jobs-at-pro-quality-up-from-2-5-percent-eight-months-ago)

### Fable 5 仅 4.44 美元搭建 Rube Goldberg 机器

用 Fable 5 构建的鲁布·戈德堡机械，仅需 4.44 美元。

📎 [X：OpenRouter (@OpenRouter)](https://x.com/OpenRouter/status/2072738704922439689)

### 千问团队朱达：C 端 Agent Harness 的"多快好省"工程哲学与主动服务探索

千问团队 2026 年 1 月上线通用复杂任务 Agent（千问 App 胶囊入口），总结"多快好省"方法论：支持信息搜集、研究分析等任务；执行时间降至初始 1/3；通过搜索范式与上下文管理优化交付质量；Token 消耗仅为海外产品 1/10。团队探索从被动响应转向主动服务。

📎 [公众号：千问 APP（阿里）](https://mp.weixin.qq.com/s/l70iUM0bIpG9EdV9Px7QPQ)

### Agent 辅助的 SGLang 开发：初步探索

SGLang 团队将 LLM 服务、分布式运行时、GPU 内核、扩散管道等工作流编码为可执行的 SKILL.md 文件、脚本、基准合约和审查循环。现有技能包括：SGLang .claude/skills（CUDA 调试、内核集成、性能分析等）、SGLang diffusion .claude/skills（扩散模型添加与调优）等。

📎 [LMSYS：Blog（Chatbot Arena 团队）](https://www.lmsys.org/blog/2026-07-02-agent-assisted-sglang-development)

### 借用夜晚：将闲置推理 GPU 回收用于研究

Runway 开发了名为 deckard 的容量控制器，在生产推理集群与研究集群间动态重分配 GPU。生产流量在北美工作日上午 9 点 ET 达峰，晚 8 点 ET 跌至不足一半。控制器基于预计算的时间窗口提前扩容和回收，每次集群间转移耗时 20–60 分钟。利用排队论确定目标利用率，避免接近 85% 后的队列发散。

📎 [Runway：News（网页）](https://runwayml.com/news/borrowing-the-night-reclaiming-idle-inference-gpus-for-research)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
