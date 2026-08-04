---
title: "AI 热点日报 | 2026年8月3日"
date: 2026-08-03T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-08-03
description: 2026年8月3日 AI 圈要闻：Qwen3.8-Max 发布并预告开放权重，Cloudflare 推出智能体运行时与账单用量 API，微软开源 Orchard 智能体训练框架，欧盟《人工智能法案》透明度义务开始适用。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### Qwen3.8-Max 发布，开放权重计划下周提供

Qwen 发布旗舰模型 Qwen3.8-Max，称其为家族迄今最强、面向编码与专业协作的新模型。官方披露模型共有 2.4T 参数、每个 token 激活 95B 参数，并计划在下周放出 Qwen3.8-Max 与 Qwen3.8-27B 的开放权重；因此目前更准确的说法是“已发布模型并预告开放权重”，而不是权重已经开源。

🔗 [Qwen 官方博客](https://qwen.ai/blog?id=qwen3.8)

### 商汤发布 SenseNova U1.5-Lite-Preview

商汤发布 SenseNova U1.5-Lite-Preview。这是一款基于 NEO-Unify 架构的轻量级原生统一多模态模型，采用 8B-MoT 参数设计；商汤称其图像生成与编辑质量可对标商业闭源模型，实际表现仍需更多独立测试验证。

🔗 [X：商汤 SenseTime (@SenseTime_AI)](https://x.com/SenseTime_AI/status/2084288424236782073)

---

## 产品发布/更新

### Cloudflare 推出 Billable Usage API

Cloudflare 为自助账户推出 Billable Usage API，一个端点即可按产品和计费周期返回用量与成本。它覆盖账户内所有按用量计费的 Cloudflare 产品，包括 Workers、R2、D1、Workers AI、Vectorize、Images 与 Stream，并使用与 FinOps FOCUS 规范相近的字段，方便接入自动化成本看板。

🔗 [Cloudflare Blog](https://blog.cloudflare.com/billable-usage-api)

### OpenRouter 推出 Ori Eval，降低任务级模型评估门槛

OpenRouter 推出 Ori Eval，主张把“哪个模型最好”改写成“哪个模型最适合这项任务”。它会调用 OpenRouter API 处理代码库中的任务并评估结果，让团队更快建立贴合自身工作负载的模型评测。

🔗 [X：OpenRouter (@OpenRouter)](https://x.com/OpenRouter/status/2084301100078027143)

### Cloudflare 预览 @cloudflare/computer 智能体运行时

Cloudflare 发布 `@cloudflare/computer` 早期预览版。它为每个智能体提供虚拟文件系统和执行运行时，由平台按任务在 isolate、容器沙箱或浏览器之间调度；开发者可以把工作空间挂到 Durable Object 上，保留文件变更记录与更细粒度的操作控制。

🔗 [Cloudflare Blog](https://blog.cloudflare.com/cloudflare-computer)

### GPT-Live 重构实时语音架构，支持边说边听

OpenAI 联合创始人 Greg Brockman 介绍 GPT-Live 的实时音频新架构：系统可以在输出语音时继续监听用户，并让更深入的推理与工具调用不中断音频流。OpenAI 称其为 ChatGPT 规模下从客户端到模型重建的一套全双工语音栈。

🔗 [X：Greg Brockman (@gdb)](https://x.com/gdb/status/2084405421041963356)

### 微软开源 Orchard 智能体训练框架

微软研究团队开源 Orchard，用统一环境层支撑智能体的数据采集、监督微调、强化学习与评估。框架包含面向软件工程、GUI 操作和个人助理的 Orchard-SWE、Orchard-GUI 与 Orchard-Claw 三套训练配方，重点是让不同任务复用沙箱生命周期、工具执行和评测基础设施。

🔗 [Orchard 论文（arXiv）](https://arxiv.org/abs/2605.15040) ｜ [X：Microsoft Research (@MSFTResearch)](https://x.com/MSFTResearch/status/2084364547142418722)

### Cloudflare Workers 与 Containers 支持入站 TCP 和 gRPC

Cloudflare 在私有测试阶段为 Workers 增加 `connect(socket)` 处理器，可接收 Spectrum 提供的入站 TCP 套接字，再转发至 Durable Objects 或 Containers。新能力还支持容器中的全双工双向 gRPC，以及 Workers 侧的一元和服务端流式 gRPC；gRPC-Web 请求可由 Cloudflare 自动转换。

🔗 [Cloudflare Blog](https://blog.cloudflare.com/grpc-workers)

### Data Commons on Spanner Graph 正式可用

Google Cloud 宣布 Data Commons on Spanner Graph 正式可用，并预览新版 Data Commons Platform。前者把来自联合国、世界银行、美国人口普查局等公共数据源的知识图谱带到 Spanner Graph，后者进一步帮助企业把私有知识与公共数据统一到同一图谱中。

🔗 [Google Cloud Blog](https://cloud.google.com/blog/products/databases/unify-public-and-private-data-with-data-commons-on-spanner-graph)

### Databricks Variant 正式可用，加速半结构化数据摄取

Databricks 宣布 Variant 数据类型全面可用，用于更高效地摄取和查询 JSON、XML、CSV 等半结构化数据。Variant 已接入 Auto Loader、Spark Declarative Pipelines、Agent Bricks 与 AI Functions，并试图在保留原始结构灵活性的同时减少预先建模和反复改 ETL 的成本。

🔗 [Databricks Blog](https://www.databricks.com/blog/ingest-semi-structured-data-faster-and-more-efficiently-variant-now-generally-available)

---

## 行业动态

### 欧盟《人工智能法案》透明度义务开始适用

欧盟《人工智能法案》第 50 条透明度规则自 2026 年 8 月 2 日起适用：提供者需要让用户知道自己正在与 AI 交互，并为合成内容加入机器可读标记；部署者还需披露深度伪造，以及未经人工审阅、涉及公共利益的 AI 生成文本。违规罚款最高可达 1500 万欧元或企业上一财年全球营业额的 3%。对于 8 月 2 日前已投放市场的生成式 AI 系统，只有内容标记与检测义务获得有限宽限，期限至 2026 年 12 月 2 日。

🔗 [欧盟委员会：AI 系统透明度规则速览](https://digital-strategy.ec.europa.eu/en/factpages/quick-facts-transparency-rules-ai-systems)

### Databricks 完成收购 Panther

Databricks 宣布完成对安全数据平台 Panther 的收购，将 Panther 已有的 SOC 工作流和软件化检测引擎，与 Lakewatch 的开放安全湖仓底座整合。其目标是在开放、统一的数据架构上长期保存安全遥测，并支持检测、调查与响应工作负载。

🔗 [Databricks Blog](https://www.databricks.com/blog/databricks-completes-acquisition-panther-accelerating-security-lakehouse-era)

---

## 论文研究

### Apple 系统拆解多模态大模型的偏好对齐

Apple 研究团队独立分析多模态大模型偏好对齐的各个环节，将方法分为离线对齐（如 DPO）和在线对齐（如 online-DPO），并发现二者结合在部分场景中可以提升表现。团队还提出 Bias-Driven Hallucination Sampling（BDHS），无需额外人工标注或外部模型即可构造多模态偏好数据，并在多项基准上取得与既有方法相当的结果。

🔗 [Apple Machine Learning Research](https://machinelearning.apple.com/research/alignment-multimodal-llms)

---

## 技巧与观点

### AirLLM 让 70B 模型可在单块 4GB GPU 上推理

开源项目 AirLLM 通过把模型按层拆分、在推理时逐层装载，显著降低显存占用。项目方称 70B 模型无需量化、蒸馏或剪枝即可在单块 4GB GPU 上运行；代价是需要足够的磁盘空间，而且权重装载会成为主要性能瓶颈，因此“能运行”不等于拥有常规 GPU 推理的速度。

🔗 [GitHub：lyogavin/airllm](https://github.com/lyogavin/airllm)

### Palantir 业绩大增，Karp 批评前沿模型厂商攫取合作伙伴“生产资料”

Palantir 第二季度营收约 19 亿美元，同比增长 93%，净利润约 11 亿美元。CEO Alex Karp 在股东信中称公司的业务带有“马克思主义的明暗线”，并批评部分大模型厂商有意或无意地占有合作伙伴的“生产资料”。他的核心主张是企业应保有自己的数据、提示词、编排与上下文，而不是被单一模型平台锁定。

🔗 [Palantir：Q2 2026 业绩材料](https://investors.palantir.com/files/earnings.pdf) ｜ [TechCrunch](https://techcrunch.com/2026/08/03/after-killer-quarter-palantir-ceo-alex-karp-calls-ai-industry-marxist)

### Kimi Work 发布幻灯片制作教程

Kimi 发布 Kimi Work 幻灯片教程，展示从研究与结构梳理，到图表、SmartArt 和整体视觉设计，再到可编辑文件下载的一体化流程。官方称其中的研究与内容组织由 Kimi K3 驱动。

🔗 [X：Kimi.ai (@Kimi_Moonshot)](https://x.com/Kimi_Moonshot/status/2084245860339298423)

### Claude 连接器可在 Claude Code 与 Artifacts 中复用

Anthropic 团队成员 Thariq 提醒：在 Claude 中连接 Gmail、日历、Slack 等连接器后，Claude Code 以及其中发布的 Artifacts 也可以调用这些连接器。实际可用范围仍取决于套餐、组织权限和用户授权，涉及敏感数据时应检查 Artifact 的共享范围与连接器权限。

🔗 [X：Thariq (@trq212)](https://x.com/trq212/status/2084387303959740449) ｜ [Claude 帮助中心：Artifacts](https://support.claude.com/en/articles/9487310-what-are-artifacts-and-how-do-i-use-them)

### EA：生成式 AI 进入实时游戏，关键是“行为正确”

EA 首席战略官 Mihir Vaidya 认为，游戏内 AI 不仅要“看起来真实”，还必须在 60 帧/秒、成千上万玩家同步和低延迟条件下可靠运行。他反对把所有系统都交给概率模型，主张采用神经符号架构，把生成能力与确定性、控制和可靠性结合起来；在篮球规则或赛车物理等核心系统里，“行为正确”比单纯生成逼真更重要。

🔗 [Runway News：EA AI Summit 访谈](https://runwayml.com/news/company-news/electronic-arts-ai-summit-2026)

### Google Agent Skills 团队公开技能库的构建与治理流程

Google Agent Skills 团队披露，其开源技能库始于 Google Cloud Next 2026 前的一次跨职能冲刺，发布后获得超过 1.5 万个 GitHub Star。为控制规模化后的质量，每项技能都要遵循标准目录结构，并经过 linter、链接检查、AI 辅助清单以及提交时和每周持续运行的评估。

🔗 [Google AI 团队：DEV Community](https://dev.to/googleai/behind-the-scenes-how-we-build-test-and-scale-google-agent-skills-1am5)

### Gary Marcus：Astra 的数学成果可能更像“选题与验证”突破

Gary Marcus 引述 Anthropic 数学家 Levent Alpöge 的自述：他使用已经公开的 Fable 模型，在 24 小时内对 OpenAI Astra 公布的十项结果完成了约一半的独立复现尝试。Marcus 据此质疑，Astra 的关键进展是否主要在于找到适合搜索与验证的开放问题，而非模型能力出现普适跃迁；这一判断来自当事人与评论者的公开说法，仍需等待更完整的方法披露和数学界审阅。

🔗 [Gary Marcus：Two critical updates re: Astra and mathematics](https://garymarcus.substack.com/p/two-critical-updates-re-astra-and)

### Paramount CTO：AI 的“iPhone 时刻”尚未到来

Paramount 首席技术官 Phil Wiser 把 AI 列入人类史上最重要的五大技术趋势，但认为真正推动大众采用的“iPhone 时刻”还没有出现。他主张先等待依赖条件成熟，再用清晰的“aha 时刻”推动业务采用；同时警告大公司若过度分析，也可能错过未来 5 至 10 年的窗口。Paramount 已在三年前向内部员工开放 Runway 工具，并以业务成果而非 token 消耗量衡量成效。

🔗 [Runway News：Paramount CTO 访谈](https://runwayml.com/news/customers/paramount-nyc-summit-2026)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
