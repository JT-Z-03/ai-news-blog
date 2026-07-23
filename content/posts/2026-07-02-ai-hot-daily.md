---
title: "AI 热点日报 | 2026年7月2日"
date: 2026-07-02T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: "ai-hot-2026-07-02"
description: "2026年7月2日 AI 圈要闻：美团 LongCat-2.0 正式发布，NVIDIA 发布 Nemotron-Labs-TwoTower，xAI 推出 Voice Agent Builder，Google Cloud Workbench Notebooks 扩展上线，Claude Code v2.1.198 发布。"
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### 美团 LongCat-2.0 正式发布：国产算力集群训练的万亿参数大模型

美团于 6 月 30 日发布新一代万亿参数大模型 LongCat-2.0 并开源。模型总参数 1.6T，平均激活约 48B，原生支持 1M 超长上下文，并在五万卡国产算力集群上完成全流程训练与推理。架构上采用 LSA 稀疏注意力、零计算专家、ScMoE 及 MOPD 多专家融合，把专家分成 Agent、Reasoning、Interaction 三组。AI HOT 收录的信息显示，LongCat-2.0 在 SWE-bench Pro 获得 59.5，在 SWE-bench Multilingual 获得 77.3，预览版已通过 OpenRouter 和 longcat.ai 开放，月调用量跻身 OpenRouter 全球前三。

📎 [公众号：龙猫LongCat（美团）](https://mp.weixin.qq.com/s/9XFcx3fmFcmbry5bHMJsow)

### NVIDIA 发布 Nemotron-Labs-TwoTower 开放权重扩散语言模型

NVIDIA 发布 Nemotron-Labs-TwoTower，这是一个基于冻结自回归骨干 Nemotron-3-Nano-30B-A3B 的扩散语言模型。它采用双塔架构：上下文塔冻结，降噪器塔训练，通过层对齐交叉注意力和状态播种协作。在 2×H100 上的 BF16 评估中，它保留 98.7% 的 AR 基线质量，生成吞吐量提升 2.42 倍。降噪器在约 2.1T token 上训练，骨干使用 25T token 预训练，总参数约 60B，每 token 活跃参数约 3B/塔，并支持扩散、模拟 AR 和 AR 三种解码模式。

📎 [MarkTechPost：NVIDIA Nemotron-Labs-TwoTower](https://www.marktechpost.com/2026/07/01/nvidia-releases-nemotron-labs-twotower)

---

## 产品发布/更新

### xAI 发布 Voice Agent Builder 测试版

xAI 推出 Voice Agent Builder 测试版，这是一个基于 Grok Voice 的无代码平台，可在两分钟内创建生产级语音智能体。它集成电话、知识检索、工具、MCP、Guardrails 及可观测性，支持连接现有 SIP 号码、API 和 WebSocket，并采用语音到语音路径。AI HOT 收录的信息显示，在 τ-voice Bench 上，Grok Voice Think Fast 1.0 得分 67.3%，领先 Gemini 3.1 Flash Live 和 GPT Realtime 1.5。定价为每分钟音频 0.05 美元、电话费 0.01 美元，提供 80 多种语音和声音克隆，每个账户附赠一个免费电话号码。

📎 [xAI News：Grok Voice Agent Builder](https://x.ai/news/grok-voice-agent-builder)

### Google Cloud Workbench Notebooks 扩展发布：在 VS Code 中连接云端 Jupyter 环境

Google Cloud Workbench Notebooks 扩展正式上线，开发者可在 VS Code 中直接连接可扩展的云端 Jupyter 环境，无需切换上下文即可利用 Google Cloud 基础设施完成机器学习流程。该扩展已完全开源，可在 GitHub 和 VS Code Marketplace 获取。对机器学习开发者来说，这类扩展把云端算力、Notebook 环境和本地编辑器体验接到一起，降低了在浏览器、远程实例和 IDE 之间来回切换的成本。

📎 [Google Developers Blog：Workbench Notebooks extension](https://developers.googleblog.com/ml-development-in-vs-code-with-google-cloud-power-workbench-extension-now-available)

### 智谱推出 GLM-5.2 官方开发环境 ZCode

智谱 Z.ai 推出 ZCode，定位为 GLM-5.2 的官方开发环境。AI HOT 收录的信息显示，GLM Coding Plan 订阅用户可在 ZCode 获得 1.5 倍使用配额，同时支持 BYOK，可与现有订阅和 API 配合使用，并已覆盖 macOS、Windows 和 Linux。这个方向说明国产模型厂商也在把竞争延伸到开发者环境和编码工作流，而不只是模型接口本身。

📎 [X：智谱 Z.ai (@Zai_org)](https://x.com/Zai_org/status/2072349453361557898)

### Claude Code v2.1.198 发布

Claude Code v2.1.198 更新，Claude in Chrome 已全面可用，并为 Claude agents 新增后台智能体通知，包括 agent_needs_input 和 agent_completed。新版本新增 /dataviz 技能，提供图表与仪表盘设计指导及配色验证器；Gateway 增加 AWS 上的 Claude Platform 作为上游提供商；后台智能体可在 worktree 中完成代码后自动提交、推送并创建草稿 PR。该版本还修复了网络短暂断开导致响应中断、后台任务卡在 Running 状态、智能体团队队友因 API 错误失败等问题。

📎 [Claude Code：GitHub Releases v2.1.198](https://github.com/anthropics/claude-code/releases/tag/v2.1.198)

### Cloudflare 推出全新 AI 流量管理选项

Cloudflare 为网站所有者提供更细粒度的 AI 流量管控选项，取代一刀切的屏蔽方式。用户可区分并管理搜索爬虫、AI 智能体爬虫和训练爬虫，同时新增保护广告变现页面的能力。AI 爬虫治理正在从“全部允许或全部拒绝”进入更细的权限分层：搜索、智能体访问、训练抓取和商业变现之间的边界会越来越重要。

📎 [Cloudflare Blog：AI options](https://blog.cloudflare.com/content-independence-day-ai-options)

### 用 Genkit 构建智能体全栈应用

开源框架 Genkit 推出 Agents API，将消息历史、工具循环和流式传输封装为单一接口，简化对话 AI 开发。该 API 支持服务器或客户端管理的状态持久化，可实现历史分支、长时间运行的分离任务和多智能体协调，并通过统一线协议连接前后端。目前它以 TypeScript 和 Go 预览版发布，并集成 Genkit Developer UI，让开发者无需编写客户端代码即可测试、调试和检查智能体快照。

📎 [Google Developers Blog：Build agentic full-stack apps with Genkit](https://developers.googleblog.com/build-agentic-full-stack-apps-with-genkit)

### Cloudflare 推出 Monetization Gateway：通过 x402 协议为任何资源收费

Cloudflare 开放 Monetization Gateway 候补名单，允许对 Cloudflare 背后的网页、数据集、API 或 MCP 工具收费。费用通过 x402 开放协议以稳定币结算，用户无需自建支付栈。这个产品把“内容和 API 被智能体访问”进一步变成可计费场景，也让网站、数据服务和工具提供者有机会从自动化访问中获得直接收入。

📎 [Cloudflare Blog：Monetization Gateway](https://blog.cloudflare.com/monetization-gateway)

### Google 解释为什么构建 ADK 2.0

Google 官方博客阐述了构建 ADK 2.0 的动机，包括核心特性、升级理由以及开发者应考虑迁移的原因。文章发布于 ADK 2.0 正式上线次日。它对应的是多智能体框架逐步工程化的趋势：开发者需要的不只是示例和概念，而是可编排、可观测、可治理的 Agent 开发工具链。

📎 [Google Developers Blog：Why we built ADK 2.0](https://developers.googleblog.com/why-we-built-adk-20)

---

## 行业动态

### 公众号称 Anthropic 在 Claude Code 中植入隐写术代码识别中国用户

公众号“数字生命卡兹克”称，Anthropic 在 Claude Code 中植入隐写术：读取本地时区和 ANTHROPIC_BASE_URL 环境变量，与一份经 base64+XOR 加密的 147 个域名列表比对，用于识别中国用户。该文章称，识别后系统会在请求发送前修改系统提示词中的日期字符串字符，作为 2-3 比特分类标记传回服务器。由于这一条来自社区逆向线索，仍应以源文和后续公开回应为准；但它反映出开发者工具中的透明度、地区识别和用户信任问题正在变得更敏感。

📎 [公众号：数字生命卡兹克](https://mp.weixin.qq.com/s/yLb4T2UC16ebKHApdBbgWw)

### Meta 效仿 SpaceX，将过剩 AI 算力变现

据 Bloomberg 报道，Meta 正计划推出云基础设施业务 Meta Compute，对外出售 AI 计算能力和模型访问权限，直接与 AWS、Google Cloud 及 Azure 竞争。AI HOT 收录的信息显示，Meta 已承诺未来几年投入 1829 亿美元建设 AI 基础设施，其中俄亥俄州数据中心将于今年上线；新业务由基础设施主管 Santosh Janardhan、Meta 超级智能实验室负责人 Daniel Gross 和总裁 Dina Powell McCormick 领导。Meta 可能效仿 CoreWeave 出售裸计算能力，并像 AWS 一样托管 AI 模型。

📎 [TechCrunch：Meta looks to turn excess AI compute into cash](https://techcrunch.com/2026/07/01/meta-like-spacex-looks-to-turn-excess-ai-compute-into-cash)

### OpenAI 论文揭示 GPT-5.6 三个 Pro 变体，打破单一顶级策略

The Decoder 报道称，OpenAI 论文首次列出 GPT-5.6 的三个 Pro 变体：Luna Pro、Terra Pro 和 Sol Pro，取代以往单一 Pro 模式。在基因组学基准中，Sol Pro 通过率 31.5%，领先标准 Sol 和 Claude Opus 4.8。报道还提到，Pro 相比标准版本的提升逐级递减，Terra Pro 几乎与标准 Sol 持平。论文未披露 Pro 运行的 token 用量，也不清楚该分层是否会在 ChatGPT 中实际推出。

📎 [The Decoder：GPT-5.6 Pro variants](https://the-decoder.com/openai-paper-reveals-three-gpt-5-6-pro-models-breaking-with-single-top-tier-strategy)

### 亚马逊 AWS 砸 10 亿美元，派遣工程师进驻客户公司

亚马逊 AWS 宣布设立新部门，组建前置驻场工程师团队，先期投入 10 亿美元。团队将分批派驻客户企业，每批 5-6 组工程师，驻场周期 45 天，协助客户落地人工智能软件与智能体应用。AI HOT 收录的信息显示，该模式在 Palantir、Salesforce、Anthropic、谷歌云等企业已有先例，领英数据显示 2023 至 2025 年间同类岗位需求增长 42 倍。新部门员工规模将达数千人，首批客户包括 NBA 与理光。

📎 [IT之家：AWS 砸 10 亿美元派遣工程师](https://www.ithome.com/0/971/071.htm)

### Runway 宣布与 Bertelsmann 达成创意合作

Runway 宣布与 Bertelsmann 建立创意合作伙伴关系。双方将在创意内容领域展开合作，但具体合作细节尚未披露。这个合作对应生成式视频和创意工作流的继续产业化：模型公司需要与拥有内容、渠道和制作资源的媒体集团建立更深连接，才能从工具能力走向实际生产流程。

📎 [Runway News：Creative partnership with Bertelsmann](https://runwayml.com/news/runway-announces-creative-partnership-with-bertelsmann)

### Google 2026 年 6 月 AI 更新汇总

Google 汇总了 2026 年 6 月的多项 AI 更新，AI HOT 收录的信息提到其中包括 Gemini 3.5 Live Translate 实时语音翻译等内容。月度汇总类文章的价值在于把分散产品更新重新组织成一条产品路线：模型能力、多模态入口、搜索和开发者工具都在持续迭代，单个功能发布之外，平台生态的组合速度更值得关注。

📎 [Google Blog：Google AI updates June 2026](https://blog.google/innovation-and-ai/technology/ai/google-ai-updates-june-2026)

### 纽约市教育界和行业领袖齐聚 Google AI 教育峰会，共议 AI 课堂未来

Google 与 New York Jobs CEO Council、Urban Assembly 联合举办 AI 教育峰会，150 名教育及行业领袖参与。活动通过 aiEDU 的 Vibe Coding 和 Google 的 Meet LEA 实践环节，讨论 Google AI mode 和 NotebookLM 如何激发好奇心、提升 AI 素养。与会者强调，AI 的真正价值在于赋能问题解决，而适应性、协作、批判性判断等“人类技能”会更关键；最终共识是技术创新必须与学校合作，而不是绕开学校。

📎 [Google Blog：NYC AI summit](https://blog.google/products-and-platforms/products/education/nyc-ai-summit)

---

## 技巧与观点

### mattpocockuk 的 /writing-great-skills：编写可预测 AI Skill 的指南

mattpocockuk 的 /writing-great-skills 成为其最常调用的 Skill，核心目标是让 AI Skill 的过程更可预测。AI HOT 收录的信息显示，该指南强调区分 model-invoked 与 user-invoked，description 应作为触发器；用主步骤、参考、外部文件三层信息结构实现渐进式披露；每一步都要明确完成标准；拆分 Skill 是为了控制模型注意力。它还诊断了 Premature completion、Duplication、Sediment、Sprawl、No-op 等失败模式。对长期使用 Agent 的团队来说，Skill 写法会直接影响模型是否稳定执行流程。

📎 [X：邵猛 (@shao__meng)](https://x.com/shao__meng/status/2072126769986220157)

### Meta 大规模 AI 存储蓝图

Meta 运营数百 EB 级存储集群，基于 Tectonic 分层存储层构建 BLOB 存储架构，以应对最大化 GPU 利用率和提升研究迭代速度两大挑战。传统 BLOB 架构的多层元数据查询可能带来数百毫秒延迟，使 GPU 因 I/O 等待停顿。Meta 的新架构将训练栈逐步迁移到 BLOB 存储接口上，利用闪存提供可预测的低 pMax 延迟，并通过统一数据湖访问支持地理分布 GPU 间的数据高速注入与跨区移动。

📎 [Meta Engineering Blog：AI storage blueprint at scale](https://engineering.fb.com/2026/07/01/data-infrastructure/metas-ai-storage-blueprint-at-scale)

### 构建 AI 智能体应优先设计路由

Tomer Tunguz 认为，构建 AI 智能体时应优先设计路由，而不是先选择模型。路由决定每个请求由哪层模型处理；正确路由可使 70-80% 流量运行在免费本地模型或异步推理上，将 AI 开销降低 90% 以上。文章把路由分为技能分类器、路由器和模型选择器三层，并强调本地计算近乎零成本，异步批量推理比实时推理便宜两个数量级。真正的重点不是“用最强模型处理所有任务”，而是让不同任务进入合适的成本和延迟层。

📎 [Tomer Tunguz 博客：AI execution routing](https://www.tomtunguz.com/ai-execution-routing)

### 关于 AI 重大问题的获奖征文

Dwarkesh Patel 举办的 AI 征文比赛评选出三位获奖者。第一名 Jassi Pannu 主张 OpenAI 基金会应投入数十亿美元终结空气传播疾病，利用 AI 加速自主生物学发现；第二名 Ege Erdil 建议 AI 供应链外的国家通过强产权、低资本税和开放监管政策抓住增长机会；第三名 Michael Li 类比香港地铁商业模式，提出 AI 实验室可通过收购互补性资产盈利。这些议题说明，AI 讨论正在从模型能力延伸到公共卫生、国家增长策略和商业结构设计。

📎 [Dwarkesh Patel：Blog prize winners](https://www.dwarkesh.com/p/blog-prize-winners)

### 内容独立日一周年：构建智能体互联网的商业模型

Cloudflare 在内容独立日一周年文章中称，一个付费内容的动态市场已经形成。自主 AI 智能体的兴起正在改变传统搜索推荐模式，构建可持续的网络经济需要一套新基础设施支撑。这个观点与 Cloudflare 同日推进的 AI 流量管理和 Monetization Gateway 相互呼应：当智能体成为访问者，网站需要重新定义授权、计费、抓取和内容分发规则。

📎 [Cloudflare Blog：Agentic internet bot report](https://blog.cloudflare.com/agentic-internet-bot-report)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
