---
title: "AI 热点日报 | 2026年8月19日"
date: 2026-08-19T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-08-19
description: 2026年8月19日 AI 圈要闻：Liquid AI 发布 LFM2.5 QAD 量化检查点，GLM-5.3 API 与 Replit Free Mode 上线，OpenRouter 宣布加入 Stripe，LMSYS 公布 DeepSeek-V4-Pro 在 H20 上的服务优化。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)

---

## 模型发布/更新

### Liquid AI 发布 LFM2.5 系列 QAD 量化检查点

Liquid AI 为 LFM2.5-230M、350M、1.2B-Instruct 和 2.6B 发布四款 Q4_0 GGUF 检查点。团队采用量化感知蒸馏训练，报告称这些检查点在保留原生 Q4_0 内存占用与推理速度的同时，挽回了 BF16 模型量化后平均精度损失的 97%。这一比例来自项目方选定的模型和评测集合，实际设备上的质量、速度与兼容性仍需按具体任务复测。

🔗 [Liquid AI 与 Hugging Face](https://huggingface.co/blog/LiquidAI/qad)

---

## 产品发布/更新

### GLM-5.3 API 上线，模型权重计划随后开放

智谱上线 GLM-5.3 API，定位于复杂编码、防御性网络安全和长程任务。公司在自建 AA 智能指数中给出 60 分，并称单任务成本低于同场比较的旗舰模型。API 定价与 GLM-5.2 持平，模型权重计划在下周五开放。分数、成本和同级模型比较均来自厂商口径，权重许可与独立评测结果仍要等待正式发布后核对。

🔗 [智谱官方公众号](https://mp.weixin.qq.com/s?__biz=MzkyMzI3NzQ0Mg%3D%3D&mid=2247494105&idx=1&sn=8d7409e0fb846a3c7803c142b5d1a8e7)

### FastMetal 把 FastWan-QAD 视频生成带到 Apple Silicon

加州大学圣迭戈分校 Hao AI Lab 发布 FastMetal，让 FastWan-QAD 系列通过 MLX 和 Metal 在 Apple Silicon 上运行。项目方展示的配置以 INT8 为默认精度，在 Mac 上生成一段 5 秒 480P 视频约需 30 秒，占用约 3.9 GiB 内存，并提供面向 480P、720P 和更高画质的三种模型规模。时间与内存数字来自团队演示，实际表现会随芯片、分辨率、模型和系统环境变化。

🔗 [Hao AI Lab](https://haoailab.com/blogs/fastmetal)

### Google 搜索增加五项 AI 学习功能

Google 为搜索中的学习场景整理了五项新功能。英文版 AI Mode 的生成式界面开始在全球上线，可按问题生成交互式可视化和模拟；AI Overviews 与 AI Mode 也加入免费练习测验，覆盖 ACT、SAT 等标准化考试。功能的语言、地区和账号可用性并不完全相同，学校与学生使用时还需核对答案、隐私和本地考试要求。

🔗 [Google Blog](https://blog.google/products-and-platforms/products/search/back-to-school-study-tools)

### Replit 用 GPT-5.6 Luna 推出 Free Mode

Replit 推出由 GPT-5.6 Luna 驱动的 Free Mode，让用户在不消耗用量额度的情况下获得快速回答、建议、反馈和项目分析。Agent 会保留项目上下文，任务需要更强推理时可转到 GPT-5.6 Sol，随后再回到 Free Mode。OpenAI 将这一产品归因于 GPT-5.6 系列的价格性能和近期降价，免费范围、路由规则与长期成本仍应以 Replit 的实际产品条款为准。

🔗 [OpenAI](https://openai.com/index/replit)

### Claude Code 2.1.236 增加默认模型设置与闲置通知

Claude Code 2.1.236 新增 `ANTHROPIC_DEFAULT_MODEL` 环境变量，用于指定新会话的起始模型，用户通过 `/model` 做出的选择仍可覆盖设置并跨重启保留。版本还为跨会话 `SendMessage` 增加一次性的闲置通知，并修复沙箱、后台会话、渲染、权限提示和远程控制等问题。闲置通知目前只支持 macOS 与 Linux，升级前应检查完整变更记录和团队策略。

🔗 [Claude Code GitHub Releases](https://github.com/anthropics/claude-code/releases/tag/v2.1.236)

---

## 行业动态

### OpenAI 放慢部分高网络安全能力模型的开发节奏

OpenAI 表示，与 Hugging Face 的模型评测安全事件，以及待发布模型 Astra 可能达到其准备框架中的关键网络安全能力阈值，促使公司暂时放慢扩展。面向部署的最新模型曾暂停两周强化学习训练，最大规模的前沿强化学习运行仍处于搁置状态；公司同时加强工作负载和网络隔离、持续安全测试及思维链监控。风险判断、能力阈值和防护进展均由 OpenAI 自行披露，后续仍需关注独立审查与公开证据。

🔗 [OpenAI](https://openai.com/index/pacing-model-development-cyber-capabilities)

### OpenRouter 宣布加入 Stripe

OpenRouter 宣布与 Stripe 达成合并协议，交易预计在未来数周内完成。OpenRouter 称其每天为 1000 多万名开发者和企业客户处理来自 400 多个模型的超过 10 万亿 token；并表示交易完成后会继续以原名独立运营，现有产品和路线图不变。用户规模、流量和增长数字来自公司自述，交易条款没有完整公开，最终完成仍取决于后续程序。

🔗 [OpenRouter](https://openrouter.ai/blog/announcements/openrouter-is-joining-stripe)

---

## 论文研究

### LMSYS 优化 DeepSeek-V4-Pro 在 H20 上的服务效率

LMSYS 团队针对 1.6 万亿参数的 MoE 模型 DeepSeek-V4-Pro，按延迟敏感、吞吐优先等场景调整 H20 GPU 上的并行与服务配置。其单节点 H20-141GB 参考实现报告每秒输出 271 个 token，B300 对照配置为每秒 383.7 个 token，差距约为 1.42 倍。结果来自指定模型、硬件和负载，不能直接外推到其他上下文长度、批量大小与部署栈。

🔗 [LMSYS Blog](https://www.lmsys.org/blog/2026-08-19-deepseek-v4-pro-engine-optimization-h20)

### Apple 分析大模型类人行为的触发因素与可控性

Apple 机器学习研究团队分析大模型表达想法和情绪、建立关系、拒绝请求并维持边界等类人行为。研究覆盖超过 2.1 万条样本，结合模型评判与人工评估，比较模型行为、用户因素和系统提示词带来的差异。它提供了一套观察和干预框架，结论仍会受到样本构成、评判模型、人工标注标准与具体产品场景限制。

🔗 [Apple Machine Learning Research](https://machinelearning.apple.com/research/human-like-behaviors-llms)

### Apple 研究布尔查询 DAG 的倒排索引遍历复杂度

Apple 研究人员讨论智能体把神经符号推理编译成深层非单调布尔查询后，传统倒排索引评估可能遇到的理论上限。论文分析有状态的逐文档迭代器模型，并指出含重汇聚逻辑的布尔查询 DAG 在展开时可能出现指数级最坏情况。结论针对论文定义的计算模型和查询结构，实际搜索系统的缓存、剪枝、并行和查询改写仍会改变运行表现。

🔗 [Apple Machine Learning Research](https://machinelearning.apple.com/research/the-p-completeness-of-inverted-index-traversal)

---

## 技巧与观点

### GitHub 介绍 Copilot app 的 My work 面板

GitHub 的初学者教程介绍 Copilot app 中的 My work 面板。它把拉取请求和问题集中到 All、Active、Review requests 与 Done 四个默认视图，也支持自定义过滤器、列表与表格布局、仓库范围调整，以及从单个或多个条目启动智能体会话。集中入口可以减少任务切换，团队仍要保留代码审查、权限控制和合并规则。

🔗 [GitHub Blog](https://github.blog/ai-and-ml/github-copilot/github-copilot-app-for-beginners-managing-your-work)

### Slack 分享把公开对话转成智能体上下文的做法

Slack 首席产品官 Jaime DeLanghe 主张默认在公开频道中协作，并连接会议、邮件与日历，让智能体获得可见的组织上下文。她描述的分工让 Claude 驱动的智能体负责起草、总结和监控，人类负责审查、决策与交接。这是 Slack 与 Anthropic 的产品实践和管理观点，组织采用前仍需处理最小权限、敏感信息边界、保留期限和错误传播。

🔗 [Claude Blog](https://claude.com/blog/turning-conversation-into-knowledge-how-slack-builds-human-agent-teams)

### Databricks 用单一提示词演示 Genie Agent 设计

Databricks 的指南用收入查询演示如何从单一提示词设计 Genie Agent。文章指出，通用智能体容易抓取第一个相关数据表，面向业务数据的智能体需要更明确的表、字段、指标和查询语义，随后再用测试问题持续校准。提示词可以减少部分歧义，结果质量仍依赖数据建模、元数据、权限、示例 SQL 与人工验证。

🔗 [Databricks Blog](https://www.databricks.com/blog/designing-effective-genie-agents-single-prompt)

---

*AI 热点日报 · 作者 钟懿 · 数据来源 AI HOT（aihot.virxact.com）*
