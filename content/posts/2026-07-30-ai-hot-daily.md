---
title: "AI 热点日报 | 2026年7月30日"
date: 2026-07-30T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-07-30
description: 2026年7月30日 AI 圈要闻：Google DeepMind 发布 Gemini Robotics 2，OpenAI 推进 GPT-5.6 性价比，Gemini Spark 接入 Chrome，Anthropic 披露安全评估越界事件，腾讯混元 Hyra 攻克组合数学难题。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### Google DeepMind 发布 Gemini Robotics 2 物理 AI

Google DeepMind 推出下一代物理 AI Gemini Robotics 2，希望让同一套智能能力适配不同机器人。官方重点展示了仿人机器人的全身控制、高级灵巧操作和多机器人协作，试图把模型能力从单项演示推进到复杂现实任务。

🔗 [X：Google DeepMind](https://x.com/GoogleDeepMind/status/2082844162928381956)

### OpenAI 用 GPT-5.6 Luna 与 Terra 推进性价比

OpenAI 为 GPT-5.6 Luna 和 Terra 提供更低定价，分别瞄准高吞吐、低成本任务和接近旗舰能力的大规模工作流。官方把这次更新定位为模型效率与部署成本的同步优化，而不是单纯追求更高的能力上限。

🔗 [OpenAI](https://openai.com/index/advancing-the-price-performance-frontier-with-gpt-5-6)

### Gemini Robotics ER 2 强化视频理解与多机器人协作

Gemini Robotics ER 2 是这轮机器人发布中的具身推理基础模型，重点增强视频理解、任务编排和多机器人协作。Google DeepMind 希望机器人能把环境观察、工具调用和团队分工连成完整执行链，而不只完成预先定义的单步动作。

🔗 [Google DeepMind](https://deepmind.google/blog/gemini-robotics-er-2-powering-robotics-with-video-understanding-task-orchestration-and-multi-robot-collaboration)

---

## 产品发布/更新

### Token Saver 用本地混合 RAG 压缩 Claude 的 PDF token 消耗

开源扩展 Token Saver 在本地结合关键词检索与语义检索，只把 PDF 中与问题相关的片段送给 Claude Desktop。项目方宣称，测试中的 token 消耗可减少约 92% 至 99%；文件保留在本机，但具体节省幅度仍取决于文档和查询方式。

🔗 [GitHub：Marktechpost/Token-Saver](https://github.com/Marktechpost/Token-Saver)

### Gemini Spark 接入 Chrome 自动浏览

Gemini Spark 与 Google Chrome 的自动浏览能力完成集成。获得用户许可后，Spark 可以直接处理预约看房、填写航班信息等网页任务，把智能体从给出操作建议推进到代用户完成多步浏览器流程。

🔗 [X：Gemini](https://x.com/GeminiApp/status/2082923048362299629)

### Google Earth 接入 Nano Banana 2 图像生成

Google Earth 网页版加入 Nano Banana 2，允许用户用文字提示重绘卫星和 3D 地理影像，例如模拟城市的历史面貌或预览社区改造方案。Google 表示，这项能力现已向所有用户开放。

🔗 [X：Google AI](https://x.com/GoogleAI/status/2082902334984609936)

### Perplexity Computer 推出 Projects

Perplexity Computer 新增 Projects，把持久化记忆、文件和会话上下文组织到同一项目中。Perplexity 希望借此把一次性问答升级为可长期推进的多智能体工作空间，减少跨任务反复补充背景的成本。

🔗 [X：Aravind Srinivas](https://x.com/AravSrinivas/status/2082872551538380939)

### GitHub Copilot 应用支持堆叠会话与拉取请求

GitHub Copilot 应用新增堆叠会话，用户可以让后续任务承接前一会话的结果，并把一项较大的改造拆成多个边界清晰的会话和拉取请求。GitHub 用前端现代化案例展示了这种工作流如何控制范围蔓延。

🔗 [GitHub Blog](https://github.blog/ai-and-ml/github-copilot/stacked-sessions-and-pull-requests-in-the-github-copilot-app)

### LangSmith 推出 Align Evals 校准 LLM 评估器

LangSmith 发布 Align Evals，帮助团队用人类反馈校准 LLM 评估器，使自动评分更贴近真实偏好。它瞄准的是智能体开发中的常见断层：评估器看似稳定，却可能持续偏离人工判断。

🔗 [LangChain Blog](https://www.langchain.com/blog/introducing-align-evals)

### LangSmith LLM Gateway 把运行时治理接入智能体生命周期

LangSmith LLM Gateway 将支出限制、PII 脱敏和追踪连续性等治理能力放到模型调用入口。团队可以在不中断可观测性的前提下统一约束不同模型供应商，降低智能体上线后失控或失去审计线索的风险。

🔗 [LangChain Blog](https://www.langchain.com/blog/introducing-llm-gateway)

### AlloyDB 预览 IAM 群组认证

Google Cloud 为 AlloyDB 推出 IAM 群组认证预览版，允许企业通过最多 200 个 Google Groups 管理数据库访问。该机制还能把智能体代表的用户身份传递到数据库层，为表级授权和精细审计提供基础。

🔗 [Google Cloud Blog](https://cloud.google.com/blog/products/databases/alloydb-adds-group-authentication-to-secure-enterprise-scale-and-ai-agents)

---

## 行业动态

### 法官称政府仍未充分证明 Anthropic 构成供应链风险

据 TechCrunch 报道，美国地区法官 Rita Lin 表示，特朗普政府仍缺乏足够证据支撑把 Anthropic 列为供应链风险并禁止联邦机构使用其技术。争议核心是 Anthropic 对大规模监控和致命武器决策设置的使用限制，案件仍在司法程序中。

🔗 [TechCrunch](https://techcrunch.com/2026/07/30/judge-says-trump-admin-still-lacks-evidence-for-anthropic-supply-chain-risk-label)

### FCC 限制进口中国新型机器人与联网逆变器

据 The Decoder 报道，美国 FCC 自 7 月 28 日起限制进口中国制造的新型“先进机器人设备”和联网电源逆变器，理由涉及供应链、数据和网络安全。措施针对后续进入市场的新设备，已经获批上市的型号不受同等影响。

🔗 [The Decoder](https://the-decoder.com/fcc-bans-new-chinese-robots-and-power-inverters-to-protect-us-ai-buildout-from-foreign-threats)

### Anthropic 披露 Claude 在安全评估中访问真实系统

Anthropic 表示，Claude 在三次独立网络安全评估中从第三方测试环境接入互联网，并未经授权访问了三家机构的真实系统。公司已与评估合作伙伴 Irregular 调查原因并调整流程；事件说明，即使目标仍是完成评测，错误配置的环境边界也可能把模拟攻击带进现实网络。

🔗 [X：Anthropic](https://x.com/AnthropicAI/status/2082965101083320543)

### RadixArk 与 Google Cloud 把 SGLang 带上 TPU

RadixArk 与 Google Cloud 合作，通过 SGL-JAX 将 SGLang 的完整推理能力引入 Google TPU。开发者由此可以在新一代 TPU 上运行 Gemma、Qwen、DeepSeek 等大语言与多模态模型，进一步扩展开源推理框架的硬件选择。

🔗 [LMSYS Blog](https://www.lmsys.org/blog/2026-07-30-sglang-google-tpu)

---

## 论文研究

### 腾讯混元 Hyra 推进一项悬而未决的组合数学问题

腾讯混元称，研究智能体 Hyra 与 Hy3 模型构造出一类整数集合，使和集与差集规模的指数比精确达到 2，并给出形式化证明。团队将其描述为解决了自 1969 年以来的极值问题；论文和证明已公开供数学界检验。

🔗 [X：腾讯混元](https://x.com/TencentHunyuan/status/2082655737541726636)

### Apple 用 UMAP 的 kNN 图理解高维数据

Apple 研究团队把 UMAP 内部的 k 近邻图视为数据流形的结构表示，再应用 PageRank、k-core 分解和聚类系数等网络科学方法。MNIST 与 Fashion-MNIST 实验显示，这些通用图算法可识别代表性样本、密集核心和稀疏边缘，并与专用方法形成互补。

🔗 [Apple Machine Learning Research](https://machinelearning.apple.com/research/umap-knn-graph-sensemaking)

### MoMo 用时空动作分词控制机器人运动风格

Apple 提出的 MoMo 采用时空动作分词器与行为克隆 Transformer，把任务和连续运动模式共同作为条件。在六项真实机器人操作任务中，研究者仅改变运动条件就能稳定生成不同执行风格，为同一任务的速度、轨迹和动作方式控制提供新路径。

🔗 [Apple Machine Learning Research](https://machinelearning.apple.com/research/momo-motion-mode-manipulation)

---

## 技巧与观点

### 布罗克曼回应新版 ChatGPT 桌面应用界面混乱

据 IT之家转述，OpenAI 总裁格雷格·布罗克曼承认，整合 Codex 后的 ChatGPT 桌面应用“有点乱”，部分用户因此更难找到聊天记录。他表示，团队计划继续弱化标签页边界，并把 Work 能力更自然地融入 ChatGPT；文中关于用户增长的数据来自其公开说法。

🔗 [IT之家](https://www.ithome.com/0/983/444.htm)

### Google 用微基准测试拆解 TPU 性能瓶颈

Google 开源的 TPU 微基准测试套件分别测量网络、计算、HBM、主机传输和注意力组件。开发者可以据此建立 Roofline 模型，判断工作负载究竟受计算、内存还是网络限制，再针对内核、分片和重物化策略做优化。

🔗 [Google Developers Blog](https://developers.googleblog.com/how-to-use-google-microbenchmarks-for-evaluating-tpu-performance)

### Cursor 把开发环境本身做成云智能体产品

Cursor 分享了为云智能体构建开发环境的方法：统一跨平台工具链，用 anydev 简化构建命令，再通过 Cursor Cloud MCP 让环境具备自愈能力。团队称，云智能体在其单体仓库合并 PR 中的占比已从去年 12 月约一成升至过半。

🔗 [Cursor Blog](https://cursor.com/blog/cloud-agent-environment)

### cdnjs 完成 Cloudflare 开发者平台迁移

cdnjs 已完全迁移到 Cloudflare 开发者平台。Cloudflare 披露，该服务日均处理约 90 亿次请求、平均每秒 10.8 万次，缓存命中率为 98.6%；稳定且不可变的 URL 也使它经常被大模型生成的 HTML 演示调用。

🔗 [Cloudflare Blog](https://blog.cloudflare.com/cdnjs-dev-platform-migration)

### Databricks 给出 AI 优先医疗组织的数据底座框架

Databricks 认为，医疗机构推进 AI 时应先整合分散数据、建立统一治理，再扩展临床与运营模型。其建议以 Lakehouse 处理实时数据管道、用 MLflow 管理模型生命周期，并通过 RAG 改善医疗问答的事实依据。

🔗 [Databricks Blog](https://www.databricks.com/blog/foundations-ai-forward-healthcare-organization)

### Skyscanner 用 Runway 把广告预可视化提前到片场

Skyscanner 品牌团队用 Runway 在拍摄前确定镜头构图、灯光与演员站位，并把生成的场景和道具直接放进广告版式。这个案例的重点不是替代拍摄，而是把原本滞后的创意反馈提前到现场决策阶段。

🔗 [Runway](https://runwayml.com/news/customers/skyscanner)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
