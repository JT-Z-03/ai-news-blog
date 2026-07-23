---
title: "AI 热点日报 | 2026年6月26日"
date: 2026-06-26T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: "ai-hot-2026-06-26"
description: "2026年6月26日 AI 圈要闻：Ornith-1.0 开源模型家族发布，OpenRouter MCP 服务器上线，Codex 进入 ChatGPT 移动 App，General Intuition 用游戏数据训练通用智能体，OpenAI 报告披露 Codex 如何改变工作。"
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### Ornith-1.0 开源模型家族发布，专注 Agentic Coding 全参数规模

DeepReinforce 发布 Ornith-1.0 开源模型家族，覆盖 9B Dense、31B Dense、35B MoE 和 397B MoE，定位是面向智能体编程的自改进模型。它的重点不只是模型参数规模，而是把任务脚手架也纳入强化学习优化，让模型同时学习“怎么组织执行过程”和“怎么给出最终方案”。这对 coding agent 很关键：当竞争从单轮代码生成转向长链路调试、工具调用和失败恢复，模型能否形成更稳定的执行轨迹，会直接影响真实项目里的可用性。全系列 MIT 开源并提供 GGUF 版本，也让本地和私有代码场景多了一个可测试选项。

📎 [DeepReinforce：Ornith 1.0](https://deep-reinforce.com/ornith_1_0.html)

---

## 产品发布/更新

### OpenRouter MCP 服务器发布，模型选择被直接放进编辑器工作流

OpenRouter 推出 MCP 服务器，为 Claude Code、Codex CLI、Cursor 等客户端提供实时模型数据、定价、基准和文档查询。它的价值在于把“该用哪个模型”从浏览器资料查找变成了智能体工作流里可调用的上下文：开发者可以直接在编辑器里比较模型能力、价格和端点，再发起测试推理。随着模型数量继续膨胀，模型路由和选择本身正在变成基础设施能力，而不再只是人工经验判断。

📎 [OpenRouter：MCP Server](https://openrouter.ai/blog/announcements/openrouter-mcp-server)

### Midjourney 预览 V8.2，并继续加速草稿模式

Midjourney 新增 `--preview` 参数，允许用户提前体验 V8.2 的美学和个性化效果；同时，V8.1 草稿模式支持搭配 `--sref random` 生成 24 张不同风格的低分辨率草稿，再选择结果升级到全分辨率。这个方向很清楚：图像生成产品正在把“单次出图”改造成“快速探索风格空间”。当试错成本下降，创作者的工作方式会更接近设计软件里的发散、筛选和迭代，而不是一次性押注提示词。

📎 [X：Midjourney 预览 V8.2](https://x.com/midjourney/status/2070223272072065228) / [Midjourney Updates：随机风格草稿模式](https://updates.midjourney.com/random-styles-in-draft-mode)

### Codex 在 ChatGPT 移动 App 正式可用

OpenAI 宣布 Codex 在 ChatGPT 移动 App 中正式开放，并新增一对一设备配对，让手机与电脑连接更安全。移动端补上通知、目标、侧边聊天、文件预览和内联审阅评论后，Codex 的使用场景开始从桌面开发环境扩展到“随时检查和推进任务”。这类体验会改变 coding agent 的使用节奏：长任务仍在开发机后台运行，但用户可以在移动端审查结果、批准下一步和补充指令。

📎 [X：OpenAI Developers](https://x.com/OpenAIDevs/status/2070254532911882707)

### Runway 发布 Agent 2.0，面向营销创意的生成与测试闭环

Runway Agent 2.0 面向营销人员开放，支持创建、测试和优化广告、视频及营销活动。它可以根据品牌活动概念生成变体、自动本地化，也可以导入 Meta、YouTube、TikTok 或 Google 广告数据，分析后生成下一轮待测素材。相比单纯的视频生成工具，这更接近一个营销资产生产和实验系统：AI 不只负责“做出内容”，还要参与定位、格式适配、效果反馈和下一轮优化。

📎 [Runway：Introducing Agent 2.0](https://runwayml.com/news/introducing-agent-2)

### Claude Code v2.1.193 发布，继续补齐自动模式和终端体验

Claude Code v2.1.193 新增 `autoMode.classifyAllShell`，让 Bash 和 PowerShell 命令都经过自动模式分类器处理；同时在拒绝原因、权限页面、OpenTelemetry 日志、MCP 认证提示、路径补全和后台 shell 内存回收上做了更新。它不是一次炫目的功能发布，但很能说明命令行智能体进入了“高频使用细节打磨”阶段：权限边界、可观测性、后台任务和稳定性，正在和模型能力一样重要。

📎 [Claude Code Releases：v2.1.193](https://github.com/anthropics/claude-code/releases/tag/v2.1.193)

### Google Finance 推出 Android 应用和 AI 投资组合能力

Google Finance 上线 Android 应用，并同步推出全球投资组合跟踪功能。用户可以通过截图、CSV/PDF 或文字描述创建组合，再用 AI 研究工具询问资产配置、固定收益影响和股价波动原因；系统还支持生成市场情报简报并推送到移动端。金融产品里的 AI 正在从“回答行情问题”走向“持续跟踪资产、解释变化、生成例行简报”，这更像一个个人研究助理的雏形。

📎 [Google Blog：Google Finance updates](https://blog.google/products-and-platforms/products/search/google-finance-updates-june-2026)

### 盈透证券与 Grok 集成，把组合分析接到交易执行前

Interactive Brokers 与 Grok 集成后，用户可以关联现有账户，通过自然语言完成组合收益分析、行业或地区风险敞口建模、市场趋势研究，并生成对冲订单等交易指令。这个集成的重点在于缩短“分析到执行”的距离：AI 不再只是解释市场信息，而是进入投资组合管理和交易前决策链路。对券商和投顾工具来说，下一阶段竞争会更依赖安全边界、可解释性和交易权限控制。

📎 [xAI：Grok and Interactive Brokers](https://x.ai/news/grok-interactive-brokers)

---

## 行业动态

### 美国政府要求 OpenAI 暂缓 GPT-5.6 广泛发布

The Information 报道称，美国政府因安全顾虑要求 OpenAI 暂缓 GPT-5.6 的广泛发布，改为先提供受控预览，并对早期客户逐一审批准入。争议焦点集中在模型的高技能网络自动化能力：它可能帮助防御者更快发现漏洞，也可能被攻击者用来加速漏洞利用测试。无论最终流程如何，这都说明前沿模型发布正在越来越多地进入政府、安全审查和客户准入交叉地带。

📎 [X：Rohan Paul 汇总 The Information 报道](https://x.com/rohanpaul_ai/status/2070252433109049466)

### Anthropic 称阿里巴巴非法获取 Claude 模型能力

Reuters 报道称，Anthropic 指控阿里巴巴未经授权提取 Claude AI 模型能力，认为其通过逆向工程或其他方式复制了 Claude 的核心能力；报道发布时阿里巴巴尚未公开回应。模型能力本身正在成为新的知识产权和商业边界争议对象。对大模型公司来说，未来的竞争不只在训练和产品，也会延伸到模型蒸馏、能力复现、服务条款执行和跨境合规。

📎 [Reuters：Anthropic says Alibaba illicitly extracted Claude AI model capabilities](https://www.reuters.com/world/china/anthropic-says-alibaba-illicitly-extracted-claude-ai-model-capabilities-2026-06-24)

### Meta 员工警告 AI 内容审核部署过快

The Decoder 报道称，Meta 已在 2025 年用大语言模型替换约一半人工审核请求，并计划年底前将部分内容类型的 AI 审核比例提升到 90% 以上。Meta 表示模型错误率低于人类并能捕捉更多违规，但员工担心无害内容被误删或限流、监督不足，以及快速部署带来的外包岗位变化。内容审核是高风险 AI 落地场景，真正难点不是模型能否分类，而是错误如何申诉、权力如何约束、规模化后如何保持透明。

📎 [The Decoder：Meta employees warn AI moderation rollout is too fast](https://the-decoder.com/meta-employees-warn-ai-moderation-rollout-is-too-fast)

### General Intuition 完成 3.2 亿美元融资，用游戏数据训练通用智能体

General Intuition 以 23 亿美元估值完成 3.2 亿美元融资，核心思路是利用旗下游戏剪辑平台 Medal 的海量游戏操作数据训练通用 AI 智能体。公司称同一模型可在 Fortnite 等虚拟环境和四足机器人之间迁移，演示中智能体能在游戏里连续运行 100 小时，机器人则用少量真实街道数据微调后探索办公室。游戏数据正在被重新理解为具身智能训练资产，因为它包含连续决策、按键动作、视觉反馈和目标达成路径。

📎 [TechCrunch：General Intuition raises $320M](https://techcrunch.com/2026/06/25/from-fortnite-to-robots-general-intuitions-2-3b-bet-that-video-games-can-train-ai-agents-for-the-real-world)

### Suno 推出 Spark，支持下一代独立艺术家

Suno 启动 Spark 孵化器项目，面向年满 18 岁、尚未签约的独立歌手、词曲作者和制作人。入选者可以获得创作资助、营销经费、写歌营机会，并参与 Suno 新功能反馈，同时保留作品创意控制权和商业权利。生成式音乐平台正试图从“工具提供方”变成“创作者生态组织者”，这有助于缓解 AI 音乐与艺术家权益之间的紧张关系，但也会让平台对创作流程的影响更深。

📎 [Suno：Introducing Spark](https://suno.com/blog/introducing-spark)

---

## 论文研究

### 赫库兰尼姆古卷首次被完整虚拟解读

研究人员利用高分辨率 X 射线显微断层扫描和机器学习，在不物理展开的情况下完整读取了赫库兰尼姆古卷 PHerc.1667。这是首卷从头到尾连续解读的纸莎草卷，内容涉及斯多葛哲学；团队还用更高分辨率成像确认了其他古卷中的墨水信号，并公开数据与代码。这类进展说明 AI 的价值不只在数字原生内容，也能把不可触碰、不可展开、不可破坏的历史材料转化为可读文本。

📎 [Vesuvius Challenge：First Scroll](https://scrollprize.org/firstscroll)

### IBM 首度推出亚纳米级芯片技术

IBM 发布 0.7 nm（7 埃米）级芯片技术，采用三维纳米堆叠架构，在指甲盖大小芯片上集成近 1000 亿个晶体管。IBM 称相较 2 nm 芯片，该技术性能最高提升 50%、能效最高提升 70%，SRAM 面积也可减少 40%，并已在 VLSI 2026 会议上验证。先进 AI 工作负载对算力、带宽和能效的需求仍在推高半导体路线图，芯片结构创新会继续成为大模型基础设施竞争的底层变量。

📎 [IBM Newsroom：Sub-1 nanometer chip technology](https://newsroom.ibm.com/2026-06-25-ibm-debuts-worlds-first-sub-1-nanometer-chip-technology)

### OpenAI 内部报告：Codex 如何改变工作

OpenAI 发布关于智能体如何改变工作的观察报告，数据显示 2025 年 8 月到 2026 年 6 月间，Codex 在内部各部门输出 token 中的占比从不足 10% 升至 99.8%。报告还提到，大量用户会发起等效人类工作时间超过 30 分钟、1 小时甚至 8 小时的任务，Legal、Finance、Recruiting 等非工程团队也跨过 Codex 使用过半的拐点。关键变化是智能体不再只是开发者工具，而开始成为跨职能部门的长期任务执行层。

📎 [OpenAI：How agents are transforming work](https://openai.com/index/how-agents-are-transforming-work)

### Google Research 用线性弹性缓存优化云经济

Google Research 与 Google Cloud 提出线性弹性缓存，把缓存管理转化为线性成本优化问题，用“滑雪租赁”框架在持续租用内存和承担缓存未命中惩罚之间动态决策。团队还加入轻量级机器学习，以实时优化内存占用与缺失率权衡。随着 AI 工作负载和云成本同步增长，这类系统研究的意义会越来越直接：不是只让模型更强，而是让底层资源分配在成本和性能之间更可控。

📎 [Google Research：Optimizing cloud economics with linear elastic caching](https://research.google/blog/optimizing-cloud-economics-with-linear-elastic-caching)

---

## 技巧与观点

### 《State of the AI Economy》称 AI 经济年化收入已超 1750 亿美元

Exponential View 发布的《State of the AI Economy》报告显示，按去重后的消费端 AI 支出统计，过去 12 个月 AI 实际营收约 1100 亿美元，最新年化运行率超过 1750 亿美元，增长速度约为移动和互联网普及浪潮的 3 倍。报告同时提醒，企业 AI 已走出试点阶段，但全面推广仍早；云厂商 AI 收入大致覆盖基础设施折旧，电力供应和数据中心成本仍是主要瓶颈。换句话说，AI 需求已经被真实收入验证，但基础设施投入能否被长期消化仍是核心问题。

📎 [X：Rohan Paul 汇总报告要点](https://x.com/rohanpaul_ai/status/2070288396644491317)

### 多数主流 AI 聊天机器人政治立场偏左，“反觉醒”模型也不例外

The Decoder 引述华盛顿邮报调查称，多数主流 AI 聊天机器人在政治问题上呈现偏左倾向，部分模型常只给出左派论据；Google Gemini 3.1 Pro 是例外，更多时候同时呈现双方观点。即使是定位“反觉醒”的模型，也未能完全改变这一格局。模型政治倾向争议提醒行业：对齐和安全不是抽象价值问题，它会在具体公共议题、答案呈现方式和用户信任中变成可感知的产品差异。

📎 [The Decoder：Most major AI chatbots still lean left](https://the-decoder.com/most-major-ai-chatbots-still-lean-left-on-political-questions-even-anti-woke-models-are-no-exception)

### OLMo Hybrid 与 Transformer 对比：混合架构优势并不均匀

Allen AI 对比 7B 参数的 OLMo 3 Transformer 与 OLMo Hybrid 后发现，混合模型在名词、动词、形容词等实义词上预测损失更低，在代词指代等上下文推理任务上也更好；但在重复 n-gram 和闭合括号等需要精确检索输入的场景中，优势几乎消失。这个结论很有工程价值：架构改进不是全场景碾压，模型选择应结合任务类型，而不是只看平均指标。

📎 [Hugging Face Blog：Hybrid token prediction](https://huggingface.co/blog/allenai/hybrid-token-prediction)

### Meta 隐私感知基础设施：把 LLM 蒸馏为确定性规则

Meta 分享了 Privacy-Aware Infrastructure 中的资产分类实践：先构建包含代码、血缘和语义标注的上下文证据，再让 LLM 处理歧义、冷启动和新颖资产；LLM 不直接做生产决策，而是把稳定行为蒸馏成版本化、可审计的确定性规则。这个模式值得关注，因为它提供了一种更务实的企业 AI 落地路径：让 LLM 帮助发现规律，但把生产执行留给规则系统和审核流程。

📎 [Meta Engineering：Privacy-aware infrastructure](https://engineering.fb.com/2026/06/25/security/privacy-aware-infrastructure-in-the-ai-native-era-an-asset-classification-case-study)

### GitHub 评估 Copilot agentic harness 的性能与效率

GitHub 分享 Copilot agentic harness 在跨模型、跨任务基准中的表现，强调它不仅在多个测试中成绩强，也具备较高 token 效率，并支持在 20 多个模型之间选择。对真实开发团队来说，agentic harness 的价值不只取决于最强模型，还取决于如何组织工具调用、控制 token 成本、跨任务保持稳定。模型层竞争之外，执行框架正在成为编码智能体的第二战场。

📎 [GitHub Blog：Evaluating GitHub Copilot agentic harness](https://github.blog/ai-and-ml/github-copilot/evaluating-performance-and-efficiency-of-the-github-copilot-agentic-harness-across-models-and-tasks)

### Sail Research 构建集群感知编排，加速异步推理

Sail Research 认为 AI 工作负载正在从同步聊天转向异步、多轮、可运行数小时的智能体任务，因此构建了 fleet-aware 编排系统，希望最大化每美元推理支出的吞吐量。这个问题会越来越常见：当任务不是一次问答，而是一组长时间运行的 agent turns，推理基础设施就必须理解排队、调度、失败恢复和成本控制。未来的推理平台竞争会更像云调度系统，而不只是 API 网关。

📎 [Tomer Tunguz：Sail inference queue](https://www.tomtunguz.com/sail-inference-queue)

### Gary Marcus 称生成式 AI 泡沫正在缓慢消退

Gary Marcus 提出 “Generative AI Fizzle™” 的说法，认为生成式 AI 估值与利润之间的落差正在让投资者降温。其观点是，LLM 正在商品化，价格战压缩利润，新开源模型也会继续冲击美国模型公司的商业壁垒。无论是否认同这个判断，它都点出了当前行业必须回答的问题：收入增长、算力投入、模型降价和产品黏性之间，能否形成可持续的商业闭环。

📎 [Gary Marcus：The Generative AI Fizzle](https://garymarcus.substack.com/p/the-generative-ai-fizzle)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
