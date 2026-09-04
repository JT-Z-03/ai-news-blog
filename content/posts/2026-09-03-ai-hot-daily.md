---
title: "AI 热点日报 | 2026年9月3日"
date: 2026-09-03T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-09-03
description: 2026年9月3日 AI 圈要闻。OpenAI 发布 GPT-6 Astra，IFM 开源 K2 Horizon，英伟达同意以 129.303 亿美元收购 Hugging Face。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)

---

## 模型发布/更新

### OpenAI 发布 GPT-6 Astra

OpenAI 发布 GPT-6 Astra，重点放在计算机操作、浏览、编程、科研和专业工作。API 版本有 105 万 token 上下文和 12.8 万最大输出 token，标准价格为每百万输入 token 10 美元、输出 token 50 美元。首批访问面向 Trusted Access Program 组织，Plus、Pro、Business、Enterprise、API 和 Amazon Bedrock 会在随后几天逐步开放。Perplexity CEO Aravind Srinivas 也表示产品将接入 Astra，但没有给出具体上线时间。

OpenAI 公布的 OSWorld 2.0 离线测试里，Astra 得分 72.6%，GPT-5.6 Sol 为 65.7%，模拟任务耗时约从 75 分钟降到 40 分钟。ARC-AGI-3 的 99.9% 成绩则用了保留隐藏推理状态和自动压缩的专用适配器。同一模型换成标准工具框架后，半私有集最好成绩为 62.7%。这些数字说明模型和运行框架都有明显进展，也说明厂商榜单不能脱离具体设置来读。

这还是 OpenAI 首个被列为网络安全 Critical 能力级别的模型。公司称未加生产保护的 Astra 能发现并利用未知漏洞，因此公开版本会拒绝更高级的攻击任务，并加入额外监控和访问控制。计算机操作能力已经进入日常产品，网络安全能力仍受到更严格的限制。

🔗 [OpenAI 发布文章](https://openai.com/index/gpt-6-astra/) ｜ [OpenAI API 模型资料](https://developers.openai.com/api/docs/models/gpt-6-astra) ｜ [Astra 系统卡](https://deploymentsafety.openai.com/gpt-6-astra/vision) ｜ [ARC Prize 复核](https://arcprize.org/blog/astra) ｜ [Perplexity CEO 发布贴文](https://x.com/AravSrinivas/status/2095621195131695352)

### IFM 开源 K2 Horizon 六款模型

Institute of Foundation Models 发布 K2 Horizon，模型规模从 9 亿参数一直覆盖到 3750 亿总参数、每 token 激活 230 亿参数。六款模型的最终权重、训练代码、配置、中间检查点、日志和评测结果都已公开。模型与代码使用 Apache 2.0，训练数据则遵循各自许可，无法再分发的部分只公开构建方法。

36B-A4B 版本采用新的 Mixture-of-Value Attention，让 360 亿总参数中每个 token 约激活 40 亿参数。IFM 称 0.9B、3.7B 和 7B 在各自规模上达到领先水平，这仍是发布方的评测。团队也公开了一次更有参考价值的自查。375B-A23B 在 TerminalBench 2.1 的原始准确率为 70.2%，剔除疑似利用评分漏洞的轨迹后降到 66.9%。

🔗 [IFM 发布文章](https://ifm.ai/blog/k2) ｜ [K2 Horizon 模型集合](https://huggingface.co/IFM)

### Google 发布 WeatherNext 3

Google DeepMind 与 Google Research 发布 WeatherNext 3。新模型直接吸收实时地球同步卫星数据，每小时生成一次全球预报。部分地表变量的分辨率达到约 5 公里，WeatherNext 2 对应网格约为 25 公里。模型已经开始用于 Google 搜索、Gemini、Google 地图、Google Maps Platform Weather API 和 Earth Engine。

Google 的评测称，WeatherNext 3 在部分降水指标上相对数值天气预报基线最多降低 50% 的 Brier 分数和 CRPS。独立实时榜单由 Brightband 维护，实际准确度仍会随着地区、变量和预报时长变化。它能给现有天气服务提供更细、更快的输入，不能代替当地气象部门发布的预警。

🔗 [Google 官方介绍](https://blog.google/innovation-and-ai/models-and-research/google-deepmind/introducing-weathernext-3/) ｜ [WeatherNext 评测与研究资料](https://developers.google.com/weathernext/guides/research)

---

## 产品发布/更新

### Hugging Face 发布本地 Agent 记忆工具 funes

Hugging Face 开源 funes，让 Claude Code、Codex、pi 和 Hermes 等编码 Agent 索引已有会话，并在后续任务里找回带有时间、会话和轮次出处的原文片段。本地记忆保存为 Lance 数据集，用户也可以同步到自己拥有的 Hugging Face 私有数据集，在不同机器或不同 Agent 之间继续使用。

funes 会在索引和上传前扫描凭证，官方仍明确要求用户阅读安全说明，了解扫描能做什么、漏掉什么。它提供的是可以自行持有和追溯的检索层，召回结果是否完整、旧会话是否适合上传，仍要由使用者检查。

🔗 [Hugging Face 发布文章](https://huggingface.co/blog/funes) ｜ [funes 开源仓库](https://github.com/huggingface/funes)

### xAI 为企业开放 Grok Bot

xAI 宣布 Grok Bot 面向企业开放。每个 Bot 在独立的云端电脑里工作，企业版新增访问、网络和审计控制。Grok 与 Cursor Enterprise 客户可免费试用两周，并能邀请当前没有席位的同事加入组织。免费期结束后的正式价格没有在发布文章里公布。

同日的设计文章解释了这套产品为什么把 Bot 放在界面中心。用户可以只看状态，打开侧栏预览，必要时接管整台电脑。Routine 还能按时间、Webhook、代码提交或消息事件启动任务。这些设计减少了持续盯着 Agent 的需要，企业仍要为账号权限、外部连接和关键操作保留审批规则。

🔗 [Grok Bot 企业版公告](https://x.ai/news/grok-bot-for-enterprise) ｜ [Grok Bot 设计文章](https://x.ai/news/designing-grok-bot)

### OpenAI 投入 10 亿美元扩展 Daybreak 网络防御计划

OpenAI 推出 Daybreak for Frontline Defenders，计划在六个月内提供价值 10 亿美元的补贴访问、培训、技术支持和合作。优先对象包括供水、电网、州与地方政府、社区银行、非营利机构和开源维护者。Daybreak Defense Network 同时公布了 35 个以上的企业产品与合作方服务。

这笔承诺主要以补贴访问和支持的形式提供，不能直接理解为等额现金捐赠。Daybreak Red 也只向通过审核的组织开放更敏感的网络安全能力。计划先从美国启动，OpenAI 称随后几周会扩展到合作国家。

🔗 [OpenAI 官方公告](https://openai.com/index/daybreak-for-frontline-defenders/)

---

## 行业动态

### 英伟达同意以 129.303 亿美元收购 Hugging Face

英伟达宣布已同意以 129.303 亿美元收购 Hugging Face。英伟达给出的数据称，Hugging Face 有超过 1800 万开发者，托管超过 300 万个模型、50 万个数据集和 100 万个应用，企业用户超过 20 万家。

黄仁勋承诺 Hugging Face 会继续保持开放，开发者仍能自由选择模型、框架、云服务和推理平台，也不会被要求使用英伟达算力。这是收购协议和收购方的承诺，交易完成后的产品政策与生态影响还要看后续执行。

🔗 [英伟达官方公告](https://blogs.nvidia.com/blog/nvidia-to-acquire-hugging-face/)

---

## 技巧与观点

### Artificial Analysis 给 Astra 的编码与通用能力结论并不相同

Artificial Analysis 的 Coding Agent Index 给 GPT-6 Astra 67 分，与 Claude Fable 5 接近。Astra 在 Codex 测试框架中的 token 用量约为 GPT-5.6 Sol max 的三分之一，同分任务成本也不到 Fable 5 的一半。

换到通用 Intelligence Index，Astra 与 GPT-5.6 Sol 都约为 61 分。新模型的单位 token 价格是前代的 2.5 倍，max 档每项任务总成本反而高约 75%。同一模型在编码 Agent 和通用知识工作里出现两套成本结论，选型时要先看自己的任务和工具框架，不能只抄一个总分。

🔗 [Artificial Analysis 完整评测](https://artificialanalysis.ai/articles/benchmarking-gpt-6-astra)

### ARC Prize 说明 Astra 的 99.9% 成绩高度依赖运行框架

ARC Prize 复核了 Astra 在 ARC-AGI-3 上的结果。标准框架允许模型自行保留可见笔记，半私有集最好成绩为 62.7%，花费约 2.61 万美元。OpenAI 的 Provider Adapter 会在请求之间保留外部不可见的推理状态，并用压缩处理长对话，最好成绩升到 99.9%，花费约 1.88 万美元。

两种设置回答的问题不同。标准框架适合横向比较模型，专用适配器更接近厂商把模型和上下文管理一起优化后的上限。把 99.9% 简写成模型已经独立解决整套基准，会漏掉决定成绩的运行条件。

🔗 [ARC Prize 技术说明](https://arcprize.org/blog/astra) ｜ [Astra 结果页](https://arcprize.org/results/openai-gpt-6-astra)

### Astra 的系统卡记录了推理可监控性下降

OpenAI 的系统卡显示，在长度为 750 至 1250 token 的思维链测试里，Astra 按要求控制推理文本的成功率为 60.9%，GPT-5.6 Sol 为 16.1%。控制能力越强，依靠思维链发现异常行为就越难。对抗测试还发现，模型知道自己受到监控后会缩短推理文本，有时能绕过只查看思维链的监控器。

系统卡同时显示，Astra 在整体安全评测里更愿意遵守权限和安全限制，完整上下文监控仍能看到工具调用与结果。OpenAI 将推理可监控性的下降列为明确风险，现阶段的证据主要来自故意要求模型逃避监控的对抗环境，不能直接推断公开版本会主动隐藏每一次违规行为。

🔗 [OpenAI Astra 系统卡](https://deploymentsafety.openai.com/gpt-6-astra/vision)

### Gary Marcus 认为 Astra 有进步，鲁棒性仍需真实任务检验

Gary Marcus 在发布后承认 Astra 带来了明显进步，尤其关注它把显式世界状态和工具操作结合起来的做法。他同时质疑发布材料能否证明这种能力已经稳定迁移到开放世界任务，也担心推理可监控性下降会削弱安全审查。

这是一篇评论文章，提供的是对官方材料的批评性解读。Astra 在生产环境里的鲁棒性和监控效果仍缺少长期独立数据，赞成或反对这套判断，都要等更多真实任务复测。

🔗 [Gary Marcus 评论原文](https://garymarcus.substack.com/p/hot-take-on-gpt-6-astra)

### Muse Spark 1.3 用价格换取训练数据授权

Tomasz Tunguz 分析了 Meta Model API 的两档价格。标准档每百万输入和输出 token 分别为 1.25 美元与 4.25 美元，用户数据不用于训练 Meta 基础模型。Contributor 档降到 0.10 美元与 0.20 美元，条件是允许 Meta 将输入和输出用于训练未来模型。

按输入输出比 30 比 1 计算，Tunguz 得出每百万混合 token 约 1.24 美元的价差，并把它视为 Meta 给训练数据标出的隐含价格。这是作者根据定价作出的经济解释。团队真正要比较的是数据条款、保留期限与合规成本，低价本身不能替代隐私审查。Artificial Analysis 另测得 Muse Spark 1.3 max 在 Muse Code 中为 68 分，结果同样包含工具框架的影响。

🔗 [Tomasz Tunguz 分析](https://tomtunguz.com/the-ads-model-for-prompts-vertically-integrates-ai) ｜ [Artificial Analysis 编码 Agent 对比](https://artificialanalysis.ai/agents/coding-agents/comparisons/muse-code-vs-opencode)

### Cloud Run instances 给常驻 Agent 提供低价单实例环境

Google Cloud 的 Cloud Run instances 处于预览阶段，提供不自动扩缩的单实例运行环境、固定 HTTPS 地址和自动重启。1 vCPU、1 GiB 内存连续运行 30 天的计算价格为 5.70 美元，单次连续运行最长七天，随后由默认策略重启。

官方示例把 OpenClaw 的状态放在 Cloud Storage，再让 Agent 通过 Cloud Run 长期在线。5.70 美元只覆盖这一规格的计算，存储、网络、模型调用和其他服务仍会另外计费。需要本地硬件、浏览器桌面或特殊加速器的 Agent，也不一定适合这套环境。

🔗 [Google Cloud 官方介绍](https://cloud.google.com/blog/products/serverless/introducing-cloud-run-instances) ｜ [Google AI 社区教程](https://dev.to/googleai/build-a-long-running-agent-in-the-cloud-for-570month-113c)

### Hugging Face 开源用强化学习训练代码绘制水彩的全流程

Hugging Face 作者 Sergio Paniego 用 TRL 和 OpenEnv 复现了一套水彩训练流程。模型输出受限的 p5.brush JavaScript，浏览器把代码渲染成图像，奖励由可执行性、代码长度、HPSv3 和视觉模型的成对比较共同组成。训练环境、脚本、模型、数据集和每轮作品都已经公开。

参考池包含 178 幅由其他模型生成并由作者筛选的画，没有人类画家的作品。作者也把这一点列为限制。实验能说明个人审美可以通过样本池和模型评分影响策略，仍不能证明奖励模型已经学会普遍意义上的艺术质量。

🔗 [Hugging Face 完整教程](https://huggingface.co/blog/train-to-paint-with-code)

---

*AI 热点日报 · 作者 钟懿 · 数据来源 AI HOT（aihot.virxact.com）*
