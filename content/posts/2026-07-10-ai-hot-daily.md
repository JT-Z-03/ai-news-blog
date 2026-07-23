---
title: "AI 热点日报 | 2026年7月10日"
date: 2026-07-10T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-07-10
description: 2026年7月10日 AI 圈要闻：OpenAI 推出 ChatGPT Work：可跨应用自主工作的 AI 智能体，蚂蚁灵波开源实时交互世界模型 LingBot-World 2.0，OpenAI 发布最强模型与最佳博文，蚂蚁灵波开源全球首个面向具身智能的MoE视频基模LingBot-Video等。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### OpenAI 推出 ChatGPT Work：可跨应用自主工作的 AI 智能体

OpenAI 发布 ChatGPT Work，一个能跨应用和文件收集信息、将复杂项目分解为小步骤独立完成并持续工作数小时的 AI 智能体。它内置 Codex 技术，目前每周超 500 万用户使用 Codex，其中超 100 万用于非软件开发场景。ChatGPT Work 由最新前沿模型 GPT‑5.6 驱动，具备多步骤推理和按模板生成材料的能力。该功能面向 Pro、Enterprise 和 Edu 计划推出，未来几天扩展至 Plus 和 Business 计划。桌面版 ChatGPT 在所有计划中提供 Chat、Work 和 Codex 模式，且 Codex 应用已合并至新的桌面应用。

📎 [OpenAI：官网动态（RSS · 排除企业/客户案例）](https://openai.com/index/chatgpt-for-your-most-ambitious-work)

### 蚂蚁灵波开源实时交互世界模型 LingBot-World 2.0

蚂蚁灵波开源新一代实时交互世界模型 LingBot-World 2.0（14B 参数），支持施法、攻击、跳跃等丰富角色动作及文本驱动事件，内置 Pilot Agent 与 Director Agent 实现世界持续演化，并支持多人同时交互。模型采用因果预训练范式和混合双向自回归注意力掩码（MoBA），可稳定输出 720p/60fps 实时画面，长达一小时测试画质不衰减。模型权重及推理代码以非商用协议开源，SGLang 已适配，并提供 Reactor PC 端和灵光 APP 体验入口。

📎 [IT之家（RSS）](https://www.ithome.com/0/974/508.htm)

### OpenAI 发布最强模型与最佳博文

Sam Altman 在 X 上称 OpenAI 发布的是“有史以来最好的模型”，也是团队写得最好的博文之一，并指向 GPT-5.6 官方介绍。

📎 [X：Sam Altman (@sama)](https://x.com/sama/status/2075266471316615436)

### 蚂蚁灵波开源全球首个面向具身智能的MoE视频基模LingBot-Video

蚂蚁灵波科技正式开源 LingBot-Video，这是全球首个基于 MoE 架构、面向具身智能的视频生成基础模型。模型总参数 30B，推理时仅激活约 3B，效率较同规模 Dense 架构提升约 3 倍。它引入 7 万小时 VLA、VLN、Ego 等机器人数据，并通过多维强化学习奖励系统对齐物理合理性与任务完成度，可用于机器人动作预测、仿真数据生成等方向。

📎 [IT之家（RSS）](https://www.ithome.com/0/974/517.htm)

### NVIDIA 发布 Nemotron-Labs-3-Puzzle-75B-A9B：压缩混合 MoE 模型，服务器吞吐量提升 2.03 倍

NVIDIA 发布 Nemotron-3-Super 的压缩变体 Nemotron-Labs-3-Puzzle-75B-A9B，总参数从 120.7B 降至 75.3B，活跃参数从 12.8B 降至 9.3B，保持 88 块混合布局。在 8×B200 节点上，8K/64K 场景匹配用户吞吐量≥100 tok/s 时，服务器吞吐量提升 2.03 倍。单 H100 上 1M-token 并发从 1 增至 8，权重占用从 70 GB 降至 44.5 GB。

📎 [MarkTechPost（RSS）](https://www.marktechpost.com/2026/07/09/nvidia-releases-nemotron-labs-3-puzzle-75b-a9b-a-compressed-hybrid-moe-llm-delivering-2-03x-server-throughput-at-matched-user-throughput)

### Robbyant 发布 LingBot-VLA 2.0：开源 6B 跨实体机器人视觉-语言-动作模型

Robbyant 推出 LingBot-VLA 2.0，一个 6B 参数的开源视觉-语言-动作（VLA）基础模型。它以 Qwen3-VL-4B-Instruct 为骨干，采用 MoE 动作专家架构，通过 55 维规范向量统一表示不同机器人的状态和动作。训练数据涵盖约 60,000 小时高质量数据，覆盖 20 种机器人配置。模型权重、代码和技术报告已以 Apache-2.0 许可开源。

📎 [MarkTechPost（RSS）](https://www.marktechpost.com/2026/07/08/lingbot-vla-2-0)

### Meta 发布 Muse Spark 1.1 模型

Meta AI 表示 Muse Spark 1.1 已上线，相关消息来自 Mark Zuckerberg。

📎 [X：AI at Meta (@AIatMeta)](https://x.com/AIatMeta/status/2075218647359111460)

---

## 产品发布/更新

### 微软发布Flint：面向AI智能体的可视化语言

微软研究院推出 Flint，一种可视化中间语言，让 AI 智能体通过简洁的人类可编辑 spec 自动生成图表。用户只需提供数据、语义类型和图表类型，Flint 编译器即可推导坐标轴、配色、布局等底层参数。它支持 46 种图表类型，可渲染到 Vega-Lite、ECharts 和 Chart.js 三个后端，并提供 MCP 服务器用于智能体工作流集成。

📎 [Hacker News 热门（buzzing.cc 中文翻译）](https://microsoft.github.io/flint-chart)

### Claude 推出反思功能（Beta）

Anthropic 为 Claude 推出反思功能（Beta），帮助用户追踪使用模式。用户可回顾过去 1、3、6 或 12 个月的活动总结，涵盖关键主题、使用频率和任务类型。功能结合 4D AI Fluency Framework 提供协作分析，支持设定静音时段或定时休息提醒。该功能面向 Free、Pro 和 Max 用户，需开启记忆功能，可通过 Claude 网页或桌面应用设置。

📎 [Anthropic：Newsroom（网页）](https://www.anthropic.com/news/reflect-with-claude)

### ChatGPT Sites将创意变可发布网站

OpenAI Developers 展示 ChatGPT Sites，可将想法变成可发布和分享的实时网站，并列举团队成员用 Sites 构建的示例。

📎 [X：OpenAI Developers (@OpenAIDevs)](https://x.com/OpenAIDevs/status/2075331020090687666)

### Google 推出 LiteRT.js：高性能 Web AI 推理运行时

Google 发布 LiteRT.js，这是 LiteRT 跨平台边缘 AI 运行时的最新成员，专为 JavaScript 开发者设计，可直接在浏览器中运行机器学习模型。LiteRT.js 基于 WebGPU 和即将推出的 WebNN 实现高性能推理，同时支持回退到 WebAssembly CPU 方案。

📎 [Google Developers Blog（RSS）](https://developers.googleblog.com/litertjs-googles-high-performance-web-ai-inference)

### Mistral 推出 Studio，为 AI 提示词和技能提供系统记录

Mistral 推出 Studio，为 AI 提示词和技能提供集中式系统记录。平台将 prompts 和 skills 视为生产资产，支持不可变版本、回滚、明确所有权、分类标签和审计日志，保证变更可追溯。非开发者可直接编辑测试，通过标签将变更推送至生产，并保留原有 CI/CD 流程。

📎 [Mistral AI：News（网页）](https://mistral.ai/news/manage-prompts-and-skills-in-studio)

---

## 行业动态

### Elon Musk称赞Anthropic并承诺不切断其算力

Elon Musk 近日在 X 上承认此前对 Anthropic 的判断有误，称其“显然是当前 AI 领域的领导者”，盛赞 Mythos/Fable 模型，并承诺不会恶意切断其计算资源。报道称，Anthropic 自 2026 年 7 月起成为 SpaceX 最大客户之一，双方 5 月签署协议，Anthropic 购买 xAI 旗下 Colossus 1 数据中心 300 兆瓦全部算力。

📎 [TechCrunch：AI（RSS）](https://techcrunch.com/2026/07/09/elon-musk-praises-mythos-fable-promises-not-to-cut-off-anthropic)

### 消息称特斯拉三代擎天柱人形机器人初步定型，马斯克放话达不成产能目标就开掉整个采购团队

据晚点 LatePost 报道，特斯拉 Optimus Gen 3 经马斯克评审通过，即将量产。供应链要求供应商 9 月产能达 1000 台/周，年底升至 2000-2500 台/周，届时年产能可达 10 万台。马斯克六月底高管会上要求年底前实现产能目标，否则开除整个 Optimus 采购团队。

📎 [IT之家（RSS）](https://www.ithome.com/0/974/782.htm)

### Ollama 开发者数达890万，B轮融资由Theory领投

Ollama 让开源模型在本地或云端轻松运行，保持体验一致。目前拥有 890 万开发者、6.7 万集成，并与各大模型实验室及硬件供应商建立合作。B 轮融资由 Theory 领投。

📎 [Tomer Tunguz 博客（VC 分析）](https://www.tomtunguz.com/ollama-series-b)

### Anthropic发起“硬问题”倡议，邀请公众提出AI相关尖锐问题

Anthropic 作为公益公司，发起“硬问题”倡议，邀请公众就 AI 对就业、社会、家庭、科学医学等领域的影响提出尖锐问题。此前公司已通过调查、Anthropic Interviewer、线下焦点小组和匿名真实数据研究收集看法，并设立 Anthropic Institute 和 Long-Term Benefit Trust 监督公益使命进展。

📎 [Anthropic：Newsroom（网页）](https://www.anthropic.com/news/hard-questions)

### Anthropic长期利益信托任命本·伯南克为受托人

Anthropic 的长期利益信托（LTBT）任命前美联储主席、2022 年诺贝尔经济学奖得主本·伯南克为最新受托人。他将与另外三位受托人共同监督公司以对社会长期有益的方式负责任开发先进 AI 的使命，并参与公司的经济研究，帮助理解 AI 对全球劳动力与经济的影响。

📎 [Anthropic：Newsroom（网页）](https://www.anthropic.com/news/ben-bernanke)

### GPT-5.5 生物漏洞赏金计划

OpenAI 将 GPT-5.5 Bio Bug Bounty 升级为持续私密项目 OpenAI Bio Bounty Program，以 GPT-5.6 为起点并覆盖后续前沿模型，旨在发现能突破预设生物安全挑战的通用越狱攻击。公开信息显示，奖励从 $25,000 提高至 $50,000。

📎 [OpenAI：官网动态（RSS · 排除企业/客户案例）](https://openai.com/index/bio-bug-bounty)

---

## 论文研究

### 揭密在线策略蒸馏：何时有益、何时有害及原因

Apple 机器学习研究团队提出训练无关诊断框架，以每个 token、每个问题、每个教师的分辨率分析 on-policy 蒸馏。通过可扩展 targeted-rollout 算法估计理想梯度，并计算蒸馏梯度与理想梯度的余弦相似度。实验发现，蒸馏指导在错误 rollouts 上的对齐程度显著高于正确 rollouts；最优蒸馏上下文取决于学生模型容量和目标任务，无通用配置。

📎 [Apple Machine Learning Research（RSS）](https://machinelearning.apple.com/research/unmasking-on-policy-distillation)

### TGPO：通过可验证奖励强化学习激励第一人称视频时序感知

多模态大语言模型（MLLM）在第一人称视频理解中缺乏时序感知，常依赖空间捷径。研究者提出 Temporal Global Policy Optimization（TGPO），一种基于可验证奖励的强化学习算法。TGPO 通过对比模型在时序有序与打乱帧上的输出，生成全局归一化奖励信号，明确奖励时序连贯推理。在五个第一人称视频基准上，TGPO 一致提升时序定位与因果连贯性。

📎 [Apple Machine Learning Research（RSS）](https://machinelearning.apple.com/research/incentivizing-temporal-awareness-egocentric)

### Apple 提出 SRLM：自反思程序搜索提升长上下文处理能力

Apple 机器学习研究团队提出 SRLM 框架，利用自一致性、推理链长度和口头置信度三种内在信号，让模型在推理时评估候选长上下文交互程序。实验表明，在相同时间预算下，SRLM 较传统递归语言模型（RLM）最高提升 22%。分析发现，递归本身并非 RLM 性能关键，简单的自反思程序搜索无需显式递归即可匹配或超越 RLM。

📎 [Apple Machine Learning Research（RSS）](https://machinelearning.apple.com/research/self-reflective-program-search)

---

## 技巧与观点

### AI 能否回答 3 万亿美元的问题？

Sequoia 合伙人 David Cahn 更新 AI 基础设施支出估算：2026 年全球投入达 1.5 万亿美元，行业需产生 3 万亿美元收入才能回本。Anthropic 年化收入（ARR）达 600 亿美元，OpenAI 2025 年收入 130 亿美元，但缺口仍大。Apollo 首席经济学家指出，风险在于更多组织转向更便宜的开放权重模型，且 OpenAI 最新模型编码任务 token 效率提升 54%，导致 token 价格持续下降。

📎 [TechCrunch：AI（RSS）](https://techcrunch.com/2026/07/09/can-ai-answer-the-3-trillion-question)

### 社交媒体AI生成内容泛滥：LinkedIn超过40%长文为AI写作

安全公司 Pangram 通过 Chrome 扩展收集超 100 万条帖子，分析发现社交媒体 AI 生成内容泛滥。整体 AI 检测率 13.8%，长文中 25.72% 完全由 AI 生成。LinkedIn 最为严重，超 40% 长文帖子被标记为完全 AI 生成；X/Twitter 近一半文章为 AI 写作。Reddit 整体 AI 率较低，但顶层帖子 AI 率达 11.6%。

📎 [Hacker News 热门（buzzing.cc 中文翻译）](https://www.pangram.com/blog/ai-in-your-feed)

### Bun 被 Anthropic 收购后用 Rust 重写，月下载超 2200 万

Bun 于 2025 年 12 月被 Anthropic 收购，作者使用预发布版 Claude Fable 5 进行了大量 Rust 重写。Bun 最初用 Zig 构建，如今 CLI 月下载超 2200 万，被 Claude Code 等采用。团队通过 ASAN、Fuzzilli 模糊测试等系统性预防，并借助 Rust 的内存安全特性减少 use-after-free、内存泄漏等缺陷。

📎 [Hacker News 热门（buzzing.cc 中文翻译）](https://bun.com/blog/bun-in-rust)

### TeXada：基于MiniCPM的本地数学Agent发布

社区开发者基于 MiniCPM5-1B 和 MiniCPM-V 4.6 构建了本地优先的数学智能体 TeXada。该 Agent 支持自然语言直接转 LaTeX、手写或图像公式 OCR 转可编辑 LaTeX、LaTeX 补全与错误修复等功能。所有推理在本地完成，无需依赖云服务，适用于学生、研究人员和开发者处理数学表达式。

📎 [X：面壁智能 OpenBMB (@OpenBMB)](https://x.com/OpenBMB/status/2075218678027850154)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
