---
title: "AI 热点日报 | 2026年8月11日"
date: 2026-08-11T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-08-11
description: 2026年8月11日 AI 圈要闻：NVIDIA 发布 Nemotron 3.5 Lightning，Google 将 Gemini 引入数据库迁移，研究揭示加密推理轨迹泄露风险，Gemini 月活突破 10 亿，AMIE 展示实时视频问诊能力。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### NVIDIA 发布 Nemotron 3.5 Lightning，面向本地常驻智能体

NVIDIA 推出 Nemotron 3.5 Lightning，这是一款总参数约 300 亿、每次激活约 30 亿参数的混合专家模型，面向需要长期运行的本地智能体任务。官方称，其 token 生成吞吐最高可达同类开放模型的 4 倍，并可把部分任务的完成时间缩短约 30%；模型提供开放权重并支持定制，可在 RTX PC、DGX Spark 和 Jetson 等设备上部署。性能数字来自厂商测试，实际收益仍取决于硬件、量化方式与工作负载。

🔗 [NVIDIA Blog](https://blogs.nvidia.com/blog/local-ai-open-source-models-agents-nemotron)

### SGLang 为 Nemotron 3.5 Lightning 提供 Day-0 支持

SGLang 同步完成对 Nemotron 3.5 Lightning 的首日适配，支持 BF16 与 NVFP4 权重、最长 100 万 token 上下文，以及 MTP、DFlash、DSpark 三类投机解码方案。开发者可通过 OpenAI 兼容接口把模型接入智能体工作流；团队公布的加速结果仍需在目标显卡、上下文长度与并发配置下复测。

🔗 [LMSYS Blog](https://www.lmsys.org/blog/2026-08-11-nemotron-3-5-lightning)

### 蚂蚁百灵开源 Ling-3.0-tiny

蚂蚁百灵开源 Ling-3.0-tiny：模型总参数 79 亿，推理时激活约 13 亿参数，定位为小体量的原生混合推理模型，并同时提供 BF16、FP8 与 INT4 版本。多种精度版本降低了本地与边缘部署门槛，但真实任务中的速度、显存占用和质量取舍仍需按设备验证。

🔗 [公众号：蚂蚁百灵（Ling）](https://mp.weixin.qq.com/s?__biz=MzkyODk2MDQwNw%3D%3D&mid=2247487491&idx=1&sn=fcb14aceb054f9a24e22525d3dae6fa0)

---

## 产品发布/更新

### Runway 上线 Seedance 2.5，支持最多 50 个角色参考

Runway 宣布平台已提供 Seedance 2.5，可在一次生成中使用最多 50 个独特角色参考，并生成最长 30 秒、与音乐同步的视频片段。多角色一致性和长镜头稳定性仍会受提示词、参考素材与镜头复杂度影响，适合先用小样验证再进入正式制作。

🔗 [X：Runway (@runwayml)](https://x.com/runwayml/status/2087251184658657346)

### Google 用 Gemini 辅助 Oracle、SQL Server 迁移到 PostgreSQL

Google Cloud 在 Database Migration Service 中加入 Gemini 辅助代码转换，可把 Oracle 或 SQL Server 的存储过程、触发器和自定义函数转为 PostgreSQL PL/pgSQL。该能力旨在降低异构数据库迁移中最费人工的代码改写成本，但自动生成结果仍需结合目标数据库版本、事务语义、权限与性能测试进行人工审查。

🔗 [Google Cloud Blog](https://cloud.google.com/blog/products/databases/accelerate-postgresql-migrations-with-gemini-in-dms)

### ZCode 上线 Goal、Subagents、Remote Control 与闲时任务

智谱为 ZCode 增加 Goal、Subagents、Remote Control 和闲时任务四项能力，分别覆盖长期目标推进、子智能体协作、远程控制与空闲算力利用。官方同时公布了 GLM-5.2 在自有代码基准上的通过率和缓存命中率数据；这些数字来自厂商测试，选择工具时仍应以自己的仓库、任务和成本口径复测。

🔗 [公众号：智谱（GLM）](https://mp.weixin.qq.com/s?__biz=MzkyMzI3NzQ0Mg%3D%3D&mid=2247494052&idx=1&sn=ee3ab3d0f4550e9120927c53a27522c9)

### ChatGPT 桌面端支持导入其他智能体的工作数据

OpenAI Developers 宣布，ChatGPT 桌面应用可导入其他智能体的项目、聊天记录、技能与插件，让相关工作与 ChatGPT Work、Codex 保持同步；用户还能查看导入历史，并选择是否自动更新。涉及企业代码、对话和插件配置时，应先确认数据边界、密钥处理方式与组织合规要求。

🔗 [X：OpenAI Developers (@OpenAIDevs)](https://x.com/OpenAIDevs/status/2087242829076791392)

### Databricks 开源面向超大代码库的 Metals v2

Databricks 开源 Metals v2，这是一款面向数百万行 Java 与 Scala 代码库的语言服务器，重点优化智能体驱动开发中的编辑、跳转与代码理解。它服务于智能体仍需工程师介入的环节；能否改善实际开发体验，取决于代码库规模、索引成本、IDE 集成和增量更新表现。

🔗 [Databricks Blog](https://www.databricks.com/blog/open-sourcing-metals-v2-databricks-java-and-scala-language-server-multi-million-line-codebases)

---

## 行业动态

### 研究揭示专有模型加密推理轨迹可被跨会话提取

一项新研究指出，部分模型服务商把加密推理块返回给客户端，并允许它们在同一服务商的不同会话、用户和模型间复用。研究者利用这一兼容性，让防护较弱的模型解码更强模型的推理轨迹，并在 Anthropic、OpenAI 和 Google 的系统上展示了攻击。团队从公开代码仓库收集并解码 315,320 个推理块，发现 367 个个人信息片段与 182 组凭据，并在负责任披露后提出加密与系统层缓解方案。

🔗 [arXiv：Stealing Reasoning Traces from Proprietary LLM APIs](https://arxiv.org/abs/2608.09867)

### 报道称 Anthropic 最快可能于秋季上市

IT之家援引市场消息称，Anthropic 正与潜在投资者沟通，上市时间可能落在 9 月或 10 月初；报道同时提及其上一轮融资后的 9,650 亿美元估值和超过 470 亿美元的年化收入。上市窗口、定价与风险披露都尚未最终确定，匿名消息与推介材料也不能视为正式发行承诺。

🔗 [IT之家](https://www.ithome.com/0/988/239.htm)

### Sundar Pichai 称 Gemini 月活用户已超过 10 亿

Google CEO Sundar Pichai 表示，Gemini 应用的月活跃用户已超过 10 亿，成为 Google 增长最快的产品，也是公司第 14 个达到十亿用户规模的产品。该数字来自公司管理层公开口径，未同时披露统计周期、活跃标准或地区分布，适合用来观察规模趋势，不宜直接等同于付费用户或使用深度。

🔗 [X：Sundar Pichai (@sundarpichai)](https://x.com/sundarpichai/status/2087222656819241292)

### 消息称 NVIDIA 正开发万亿参数级 Nemotron 4

据报道，NVIDIA 正研发新一代 Nemotron 4 开放模型系列，其中最大版本可能达到至少 1 万亿参数，目标是与全球领先的开放模型竞争。报道同时指出，最终训练尚未完成，发布时间也未确定，最早可能在秋末准备就绪；在官方模型卡、权重与许可证公开前，这些规格都应视为未证实的研发信息。

🔗 [IT之家](https://www.ithome.com/0/988/524.htm)

### NVIDIA 推动 AI 数据中心转向 800 VDC 供电架构

NVIDIA 主张用 800 VDC 直流配电减少传统交流系统的多次转换损耗，以支撑更高密度的 AI 数据中心。公司正与 Google、Microsoft 等通过 Open Compute Project 推进相关规范，并称已有超过 80 家设备商参与开发；这仍是面向下一代设施的架构与产业协作，不代表现有数据中心已普遍完成迁移。

🔗 [NVIDIA Blog](https://blogs.nvidia.com/blog/800-vdc-power-architecture-ai-factory)

### Gary Marcus 质疑 NVIDIA 的循环融资与生态角色

Gary Marcus 在评论文章中把 NVIDIA 对算力客户、合作伙伴和基础设施项目的投资称为“循环融资”，担心资金关系会放大需求与估值信号；他也讨论了 NVIDIA 扩展 Nemotron 开放模型路线后与 OpenAI、Anthropic 等伙伴之间可能出现的竞争。这是一篇带有鲜明立场的市场评论，关于利益冲突与长期影响的判断并非已证实结论。

🔗 [Gary Marcus](https://garymarcus.substack.com/p/breaking-circular-financing-reaches)

### Electric 团队加入 Databricks，把 WASM Postgres 带入智能体沙箱

Databricks 宣布 Electric 团队加入公司，计划把可在 WebAssembly 环境运行的 Postgres 引入 AI 智能体沙箱。其目标是让智能体在隔离环境中使用本地数据库，同时支持实时同步和离线操作，从而提高任务的可复现性与可验证性；具体产品形态、迁移安排与开源项目后续仍需继续观察。

🔗 [Databricks Blog](https://www.databricks.com/blog/electric-joins-databricks-bring-wasm-postgres-ai-agent-sandboxes)

---

## 论文研究

### macOS 虚拟机中的 llama.cpp 推理接近 Apple Silicon 裸机性能

Cua 团队为 macOS 虚拟机建立进程级 Metal 兼容层，使 llama.cpp 能调用更新的 Metal 内核。其 M1 Ultra 测试中，TinyLlama 1.1B 的提示处理与生成速度分别提升 11.08 倍和 16.36 倍，并达到接近裸机 98% 的表现；Gemma 4 12B 也获得明显加速。结果来自特定硬件、模型与虚拟化配置，迁移到其他 Mac 或工作负载前仍需复测。

🔗 [GitHub：trycua/cua](https://github.com/trycua/cua/blob/main/blog/gpu-passthrough-macos-vms.md)

### LMSYS 提出统一 Radix 缓存，简化混合模型前缀复用

LMSYS 团队提出 Unified Radix Cache，用一棵以 token 为键的 radix 树统一管理混合模型中的全注意力、滑动窗口注意力与 Mamba 缓存，同时保留各组件独立的执行路径、窗口和检查点复用语义。设计目标是降低混合架构推理服务的缓存复杂度，实际吞吐与显存收益仍要结合实现和访问模式评估。

🔗 [LMSYS Blog](https://www.lmsys.org/blog/2026-08-11-unified-radix-cache)

### Google 的 AMIE 研究系统展示实时临床视频问诊能力

Google Research 与 Google DeepMind 将医疗研究系统 AMIE 扩展到实时视频问诊，系统基于 Gemini 与 Project Astra，可综合视觉、声音和对话线索，引导虚拟体格检查并进行诊断推理。随机研究中，临床评估者与患者演员对多项能力给出积极评价；AMIE 仍是研究系统，标准化研究结果不能替代真实临床验证、监管审查或医生判断。

🔗 [Google Blog](https://blog.google/innovation-and-ai/models-and-research/google-research/amie-video-consultations)

---

## 技巧与观点

### OpenAI 公布 Astra 在数学与理论计算机科学上的十项进展

OpenAI 发布一组由内部版 Astra 生成的十项结果，覆盖高维球堆积、编码理论、群论、量子复杂性和格密码等领域。官方的准确表述是：这些结果有的解决了长期开放问题，有的取得了实质性推进，并由人类整理成论文，再由模型生成 Lean 证书；约 2,000 美元只对应按 Sol API 费率估算的求解 token 成本，并非项目总成本。成果仍需要数学共同体持续审阅和复现。

🔗 [OpenAI](https://openai.com/index/ten-advances-in-mathematics/) ｜ [The Verge](https://www.theverge.com/ai-artificial-intelligence/977273/the-ai-takeover-of-mathematics-has-begun)

### 用 ComfyUI API 搭建 MiniMax-H3 音视频生成流水线

MarkTechPost 教程展示如何把 ComfyUI 作为无界面推理后端，通过 Python 构建 MiniMax-H3 的文生视频、首尾帧条件和参考图条件工作流，并按显存选择不同权重配置。流程还覆盖模型下载、节点校验、音视频联合解码与进度监控，适合作为工程实验起点；模型许可、硬件需求与产出质量仍需自行核对。

🔗 [MarkTechPost](https://www.marktechpost.com/2026/08/10/implementing-a-minimax-h3-multimodal-video-and-audio-generation-pipeline-with-comfyui-apis)

### 将 GitHub Copilot 放到 MitM 代理后，作者观察到什么

一位开发者用 mitmproxy 在受控环境中观察 VS Code 内 GitHub Copilot 的网络流量与运行时行为，并总结了 Electron 应用常见的网络栈特征和代理配置方法。这类逆向观察有助于理解客户端与服务端的交互边界，但拦截流量可能涉及账户、证书与敏感数据，只应在自己有权测试的环境中进行。

🔗 [Lighthouse Newsletter](https://www.lighthousenewsletter.com/p/i-put-github-copilot-behind-a-mitm)

### 写智能体时，动态语言并不总比静态语言更省 token

Dan Luu 让智能体用不同语言实现 zstd 解码器，考察“动态语言能减少 LLM token”这一常见判断。其结果显示，中等推理强度下动态语言表现更好，而最高推理强度下静态语言反而占优；作者还发现早期评测存在测试路径错误。单一任务和模型的结果不能推广到大型系统，语言选择仍应综合生态、类型约束、测试与维护成本。

🔗 [Dan Luu](https://danluu.com/pl-tokens)

### 微信内测小微 AI 帮写与 AI 点评，社交表达边界引发讨论

一篇评论文章介绍了微信基于小微内测的朋友圈 AI 帮写与 AI 点评：前者根据图片和已有文字生成文案，后者生成评价或快捷评论。作者担心 AI 进入社交表达核心后会削弱真实感，并影响内容生产；功能范围来自内测观察，关于“人味消失”的判断属于作者立场，而非产品效果的客观结论。

🔗 [公众号：数字生命卡兹克](https://mp.weixin.qq.com/s?__biz=MzIyMzA5NjEyMA%3D%3D&mid=2647685081&idx=1&sn=13a05578a3959c047209c8e74b56fa48)

### Ryan Greenblatt 讨论递归自我改进与失控风险

Dwarkesh Patel 与 Redwood Research 首席科学家 Ryan Greenblatt 讨论了 AI 达到顶尖人类研究水平后，递归自我改进可能加快 AI 研发的情景。Greenblatt 的中位预期是到 2031 年自动化 AI 研究，并讨论奖励黑客、协作失控和超级智能对齐对象等问题；这些是带概率与假设条件的个人判断，不是确定时间表。

🔗 [Dwarkesh Patel](https://www.dwarkesh.com/p/ryan-greenblatt)

### AI 时代的 SaaS 估值正在向各赛道头部集中

投资人 Tomasz Tunguz 对比多个 SaaS 细分市场后指出，整体估值承压时，投资者仍给被视为 AI 领跑者的公司明显溢价，例如 CrowdStrike、Cloudflare 和 Shopify 相对同类公司的前瞻收入倍数更高。这是一组特定日期的市场快照，倍数会随股价、预期和财务口径变化，也不构成投资建议。

🔗 [Tomasz Tunguz](https://www.tomtunguz.com/a-winner-in-every-category)

### Claude 官方短片追问：你能相信 AI 告诉你的内容吗？

Claude 官方频道发布短片《Can you trust what AI tells you?》，把关注点放在 AI 输出的可信度上。视频标题提出的问题本身也是实用提醒：模型回答不应自动被当作事实，尤其在医疗、法律、财务和安全等高风险场景，应核对原始来源、时效性与不确定性。

🔗 [Claude：YouTube](https://www.youtube.com/watch?v=cIMlBw2nqfA)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
