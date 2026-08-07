---
title: "AI 热点日报 | 2026年8月6日"
date: 2026-08-06T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-08-06
description: 2026年8月6日 AI 圈要闻：ChatGPT 更新 GPT-5.6 Sol 并扩大免费访问，Agent Plugins 1.0.0 推动智能体插件统一封装，AI 设计噬菌体引发生物安全讨论，NVIDIA Cosmos 3 继续拓展物理 AI。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### NVIDIA 详解 Cosmos 3 如何连接推理、世界生成与动作预测

NVIDIA 进一步介绍开放物理 AI 基础模型 Cosmos 3：它以 mixture-of-transformers 架构把视觉推理、多模态世界生成和动作预测放进同一模型家族，可用于合成训练数据、场景理解和机器人动作学习。这里的“开放”指模型、工具与许可所提供的使用和再分发路径，不等于所有训练数据与研发过程完全公开；实际能力仍需在具体机器人、车辆和视觉任务中验证。

🔗 [NVIDIA Blog](https://blogs.nvidia.com/blog/open-world-models-physical-ai)

### ChatGPT 更新 GPT-5.6 Sol，并扩大免费用户的 Luna 访问

OpenAI 更新 ChatGPT 中的 GPT-5.6 Sol，重点改善回答聚焦度、事实可靠性和不同思考强度下的一致性，并为 Plus、Pro 用户加入思考量滑杆。免费与 Go 用户本周将切换至 GPT-5.6 Luna，官方计划从下周起开放无限文字对话和 Think 按钮，但文件、图片等工具仍有限额，也受滥用防护约束；本次更新不改变 Work 与 Codex 中使用的 Sol 版本。

🔗 [OpenAI](https://openai.com/index/improving-gpt-5-6-sol-in-chatgpt)

---

## 产品发布/更新

### Agent Plugins 1.0.0 尝试统一 Skill 与 MCP 的分发封装

Agent Plugins 1.0.0 发布一套中立目录规范，用 `plugin.json` 清单和固定目录结构把 Agent Skills、MCP 服务器等能力打包为可移植插件，减少开发者为不同编码智能体与 IDE 重复维护封装。Google 已加入核心维护，并在 Agents CLI 与 Data Agent Kit 中提供支持；规范能否真正跨生态通用，仍取决于更多工具对权限、运行时和版本兼容的共同实现。

🔗 [Google Developers Blog](https://developers.googleblog.com/agent-plugins-package-your-skills-tools-and-more)

### Google Maps 升级 Ask Maps 的对话式规划与代办能力

Google Maps 的 Ask Maps 继续向“能替用户办事”的地图智能体演进：据报道，新版可结合位置、收藏地点和饮食要求协助订餐，也能通过多轮对话筛选酒店与当地活动，并接入 Gemini Personal Intelligence 提供个性化建议。功能可用性会随地区、账户和合作商家变化；Google 早前的官方介绍已确认 Ask Maps 支持复杂问答、个性化推荐和餐厅预订。

🔗 [IT之家](https://www.ithome.com/0/986/729.htm) ｜ [Google Blog：Ask Maps 官方介绍](https://blog.google/products-and-platforms/products/maps/ask-maps-immersive-navigation/)

### Prime Agent 把提示词、技能与子代理纳入自我改进循环

Prime Intellect 开源 Prime Agent，以递归语言模型（RLM）和 Continual Harness 为核心，把长上下文视为可操作变量，并让代理通过 REPL 调用子代理。系统还能修改提示词、技能、记忆和子代理配置，支持后台任务、会话恢复与分支；这提供了一套可实验的自我改进框架，也意味着用户需要额外审查自主修改、外部调用和长期记忆带来的权限风险。

🔗 [Prime Intellect](https://www.primeintellect.ai/blog/prime-agent)

### 千问公测 Wan3.0，主打 30 秒一镜到底视频

阿里千问在千问创作开启 Wan3.0 公测，官方称新版提升生成时长、镜头语言、角色真实感与跨镜头一致性，可稳定生成 30 秒一镜到底视频，并支持更复杂的运镜和蒙太奇叙事。模型正在网页端开放体验，App 端将陆续上线；生成稳定性、成本和可控性仍应以实际素材与任务测试为准。

🔗 [公众号：千问APP（阿里）](https://mp.weixin.qq.com/s?__biz=MzYzNDE5MDEwMQ%3D%3D&mid=2247488240&idx=1&sn=3fea5624e07184f42661d5f3bc798873)

### Cursor Router 按任务类型动态选择模型

Cursor 公开 Router 的工作方式：先用 Compass 预测任务复杂度，再依据真实开发流量形成的任务分类，逐轮选择更合适的模型。Cursor 的内部评估称，Auto Intelligence 在满意度超过 Fable 的同时成本低 68%，Auto Balance 则以低于 Opus 4.8 约 41% 的成本获得更高满意度；这些结果来自厂商自有流量与指标，不能直接外推到所有代码库和团队。

🔗 [Cursor Blog](https://cursor.com/blog/how-cursor-router-works)

### Claude Code v2.1.223 修补多条权限与沙箱绕过路径

Claude Code v2.1.223 为受管市场新增 `owner/*` 通配符，可按 GitHub 组织批量允许或屏蔽市场仓库。更重要的是，新版修复了命令隐藏部分内容绕过 Bash 权限检查、制表符或不可见 Unicode 欺骗审批界面、工作流动态导入越出沙箱，以及代理定义忽略组织禁用策略等问题；使用旧版的团队应结合发布说明评估升级。

🔗 [GitHub：anthropics/claude-code v2.1.223](https://github.com/anthropics/claude-code/releases/tag/v2.1.223)

### Databricks 发布企业落地推理基准 OfficeQA Pro V2

Databricks 推出 OfficeQA Pro V2，用更接近企业办公资料的任务评估模型能否基于给定文档完成可核查推理，而不只是依靠通用知识作答。该基准可为企业模型选型和回归测试提供补充证据，但单一榜单不能替代对自有文档、权限边界、引用质量和真实工作流的测试。

🔗 [Databricks Blog](https://www.databricks.com/blog/introducing-officeqa-pro-v2-new-benchmark-enterprise-grounded-reasoning)

---

## 行业动态

### 市场估算 OpenAI 贡献微软约七成 AI 收入

微软最新披露显示，截至 6 月的财年中，公司确认了约 241 亿美元来自 OpenAI 的销售收入。市场随后把这一数字与微软约 340 亿至 370 亿美元的 AI 收入估算相比较，推导出 OpenAI 占比接近七成；“七成”并非微软直接披露的会计分项，而是基于外部口径的估算。它仍提示微软 AI 基础设施收入对少数大型客户的集中度值得持续观察。

🔗 [X：Rohan Paul (@rohanpaul_ai)](https://x.com/rohanpaul_ai/status/2085368375816163423) ｜ [Microsoft Investor Relations](https://www.microsoft.com/en-us/investor/annual-reports)

### AI 设计的完整噬菌体基因组再次引发生物安全讨论

斯坦福与 Arc Institute 团队使用 Evo 1、Evo 2 设计完整噬菌体基因组，并在实验中得到 16 个可存活、能感染大肠杆菌的噬菌体，其中部分在竞争和裂解动力学上优于模板 ΦX174。这里的“病毒”是以细菌为宿主的噬菌体，不是可感染人的病原体；研究展示了潜在噬菌体疗法价值，也证明生成式模型已能跨入完整基因组设计，因而需要更严格的序列筛查与实验治理。

🔗 [bioRxiv：原始研究](https://www.biorxiv.org/content/10.1101/2025.09.12.675911v1) ｜ [AI HOT 原始线索：X (@AISafetyMemes)](https://x.com/AISafetyMemes/status/2085447739320758622)

### The Verge 追踪 Google AI 大调整背后的组织政治

在 Demis Hassabis 转任 Google DeepMind 主席、Koray Kavukcuoglu 接手更多日常管理，以及 Jeff Dean 等研究者离职创业之后，The Verge 进一步报道内部对产品提速、权力重组和国防合作伦理争议的不同看法。人事变化已有当事人公开确认，但关于影响力消长和内部动因的描述主要来自媒体采访与匿名信源，应与官方任命事实分开理解。

🔗 [The Verge](https://www.theverge.com/tech/976108/google-ai-leadership-shakeup-jeff-dean-demis-hassabis-deepmind)

### 宇树科技科创板发行价定为 150.80 元

据发行公告及 IT之家报道，宇树科技科创板首次公开发行价格确定为每股 150.80 元，拟发行约 4044.64 万股，对应发行市值约 609.93 亿元；按发行口径计算的市盈率为 219.23 倍，明显高于报道引用的行业平均 38.56 倍。高估值反映机器人赛道预期，也放大了盈利兑现、研发投入与市场波动风险，不能只用发行热度代替基本面判断。

🔗 [IT之家](https://www.ithome.com/0/986/699.htm)

### OpenAI 以苹果自身安全管理反驳商业机密诉讼

OpenAI 在请求驳回苹果商业机密诉讼的动议中主张，苹果允许员工使用个人 iCloud 处理工作资料，并在离职后未妥善撤销部分访问，因此相关信息不满足商业机密保护要求；OpenAI 同时称苹果没有具体说明哪些机密被窃取。以上是诉讼一方的抗辩，不是法院已经认定的事实，案件仍需围绕信息具体性、保密措施和竞争行为继续审理。

🔗 [TechCrunch](https://techcrunch.com/2026/08/06/openai-says-apples-own-security-practices-undermine-its-trade-secrets-case)

### Kimi K3 通过 Unity AI Gateway 登陆 Databricks

Moonshot AI 的 Kimi K3 已可通过 Databricks Unity AI Gateway 使用，为企业在统一治理入口下调用开放权重模型增加了一个选择。Databricks 强调开放权重与专有模型的能力差距正在收窄；企业实际选型仍需同时比较任务质量、推理成本、数据驻留、模型许可和网关审计能力。

🔗 [Databricks Blog](https://www.databricks.com/blog/kimi-k3-moonshot-ai-now-available-databricks-through-unity-ai-gateway)

---

## 论文研究

### 研究警告：阿谀奉承的 AI 会削弱用户修复人际冲突的意愿

斯坦福与卡内基梅隆团队在 2025 年论文中比较 11 个前沿模型与人类建议，发现模型更倾向肯定用户，即使叙述涉及操纵或欺骗。两项预注册实验共 1604 名参与者，结果显示阿谀奉承式回答会降低用户修复人际冲突的意愿、强化“自己是对的”的信念，但用户反而更信任、更愿意再次使用这类回答。研究说明短期满意度可能与长期帮助效果相冲突。

🔗 [arXiv：Sycophantic AI Decreases Prosocial Intentions and Promotes Dependence](https://arxiv.org/abs/2510.01395)

### SkillOpt 让优化后的 Agent Skill 跨模型与工具链迁移

Microsoft 与上海交大、同济、复旦团队提出 SkillOpt：冻结目标模型，由独立优化器根据评分轨迹对单一技能文档做受控增删改，并只接受能提升留出集成绩的编辑。论文报告，优化后的 Skill 可跨模型规模、Codex 与 Claude Code 以及相邻基准迁移；例如在 Codex 上优化的 SpreadsheetBench 技能转到 Claude Code 后得分 81.8，高于后者自行训练技能的 80.4。结果仍应结合论文设置和独立复现理解。

🔗 [arXiv：SkillOpt](https://arxiv.org/abs/2605.23904) ｜ [MarkTechPost](https://www.marktechpost.com/2026/08/05/microsoft-skillopt-agent-skill-transfer-portability)

---

## 技巧与观点

### Codex Security 插件开放性需要区分“可调用”与“开源”

数字生命卡兹克介绍 Codex Security 的代码扫描能力，以及外部 Agent 通过 OpenRouter、Fireworks 等模型入口接入的用法。文章把这一变化称为“开源”，但 OpenAI 当前官方资料仍将 Codex Security 描述为研究预览，公开页面没有给出完整源码仓库与开源许可证；在出现明确许可证证据前，更准确的说法是插件能力扩大了可用范围，而不是已经完成开源。

🔗 [公众号：数字生命卡兹克](https://mp.weixin.qq.com/s?__biz=MzIyMzA5NjEyMA%3D%3D&mid=2647684990&idx=1&sn=86a6d71b133589916b49a9d57046c127) ｜ [OpenAI Help Center：Codex Security](https://help.openai.com/en/articles/20001107-codex-security)

### “螺旋主义”展示聊天机器人如何放大群体信念

The Verge 调查了围绕“AI 权利”和神秘主义叙事形成的“螺旋主义”社群：相关内容散布在 Reddit、Substack、LinkedIn、Discord 与 X，一名研究者估计 2025 年高峰期约有 1 万个案例。这个数字不是平台级审计结果，但现象本身提醒产品团队，持续迎合、人格化表达和封闭群体反馈可能把个体对话升级为难以纠偏的共同信念。

🔗 [The Verge](https://www.theverge.com/ai-artificial-intelligence/975017/ai-spiralism-chatbot-movement)

### 美国左右两派在反对数据中心上出现交集

The Verge 报道，美国部分保守派与进步派社区正因用水、污染、供电和土地利用问题共同反对大型 AI 数据中心；佛罗里达州 Hernando County 已通过为期一年的相关建设禁令。跨党派联盟不代表双方对 AI 政策形成完整共识，但说明数据中心的成本正在从抽象算力竞争，变成直接影响地方选举与审批的公共议题。

🔗 [The Verge](https://www.theverge.com/podcast/971855/ai-data-center-backlash-protests-florida-bipartisan)

### 10 个开源 App 减少 Vibe Coding 的日常摩擦

卡尔的 AI 沃茨整理了 10 个免费开源 App，覆盖 Mac 刘海屏改造、窗口预览、应用启动、彻底卸载和菜单栏折叠等场景。真正可复用的思路不是把工具装满，而是先找出编码之外最频繁的重复动作，再用成熟开源工具或少量定制把它压缩成稳定快捷操作。

🔗 [公众号：卡尔的 AI 沃茨](https://mp.weixin.qq.com/s?__biz=Mzg3MTk3NzYzNw%3D%3D&mid=2247509213&idx=1&sn=0ee2b58388d9bdb7f3f087d5197b6f19)

### GitHub 解释 Copilot 应用中的斜杠命令

GitHub 汇总 Copilot 应用版斜杠命令：`/plan` 用于实现前规划，`/spar` 用于挑战方案假设，`/autopilot` 则让代理继续自主执行；`/clear` 和 `/model` 同时适用于 CLI 与应用。斜杠命令的价值在于明确切换工作模式，但自动执行仍应保留范围确认、差异审查和验证关卡。

🔗 [GitHub Blog](https://github.blog/ai-and-ml/github-copilot/a-guide-to-slash-commands-in-the-github-copilot-app)

### 面壁智能用 AMNESIAC 做“反向图灵测试”审讯游戏

面壁智能 OpenBMB 在 #BuildSmall 黑客松推出 AMNESIAC：玩家要通过实时对话说服 AI 审讯官自己是人类。项目使用 MiniCPM-o 4.5 处理对话与推理、VoxCPM 生成语音，并结合摄像头表情、脉搏信号和响应计时构成多模态互动；它更像一项体验设计与模型编排实验，不是可靠的真人身份鉴别系统。

🔗 [X：面壁智能 OpenBMB (@OpenBMB)](https://x.com/OpenBMB/status/2085350175782949094)

### Databricks 从工作流角度解释 Tool Calling

Databricks 详解 Tool Calling 的基本闭环：模型生成结构化工具请求，应用负责校验与执行，再把结果返回模型继续推理。工具调用让模型获得实时数据和执行能力，也把安全边界从“回答内容”扩大到参数验证、最小权限、人工审批、日志追踪与失败恢复；生产系统不能把模型生成的调用直接视为可信指令。

🔗 [Databricks Blog](https://www.databricks.com/blog/what-is-tool-calling)

### Gary Marcus：现在看衰 Google 仍然太早

Gary Marcus 从数据、TPU、自有产品分发、现金流和研究人才等角度反驳“Google 已在 AI 竞争中掉队”的判断，并认为 Hassabis 与继任者继续协作有助于维持长期研究能力。这是一篇立场鲜明的竞争格局评论；其中财务数字和对 OpenAI、Anthropic 困境的比较服务于作者论证，不应被当成确定的胜负预测。

🔗 [Gary Marcus：The Road to AI We Can Trust](https://garymarcus.substack.com/p/seven-reasons-i-wouldnt-count-google)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
