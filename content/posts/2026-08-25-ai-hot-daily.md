---
title: "AI 热点日报 | 2026年8月25日"
date: 2026-08-25T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-08-25
description: 2026年8月25日 AI 圈要闻。Google 开源 WeatherNext 气旋模型，Apple 发布 M6、M5 Ultra 与新款 Mac，OpenAI 公布 Jalapeño 推理芯片首批结果。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)

---

## 模型发布/更新

### Google 开源 WeatherNext 气旋模型

Google DeepMind 与 Google Research 开源了 WeatherNext 2 和 WeatherNext Cyclones 的代码与权重。团队称，这套模型可以同时预测热带气旋的路径、强度和风场结构。在 2023 至 2024 年的历史气旋评测中，它对三项指标的平均领先时间比对照模型多出 24 小时以上。

2025 年飓风季，美国国家飓风中心把 WeatherNext 与物理模型、卫星和飓风侦察机数据一同用于预报。模型提前五天预测 Melissa 将以五级强度登陆牙买加，置信度为 80%，提前三天时接近 100%。Google 今年把单场气旋的集合预测规模从 50 组扩至 1000 组。模型提供辅助预测，正式预警仍由各地气象机构发布。

🔗 [Google DeepMind 模型与开源说明](https://deepmind.google/blog/weathernext-ai-model-achieves-breakthrough-in-forecasting-cyclones/) ｜ [Melissa 预报案例](https://deepmind.google/blog/how-weathernext-helped-the-national-hurricane-center-better-predict-hurricane-melissas-historic-landfall-in-jamaica/)

---

## 产品发布/更新

### OpenWorker 加入三类网络安全智能体

Andrew Ng 宣布 OpenWorker 新版内置代码漏洞扫描、依赖项供应链注入检查和云安全配置检查。OpenWorker 的智能体运行框架以 MIT 许可证公开，安全团队可以审查代码，也可以通过 Ollama 在本地运行开放权重模型。

本地运行并不自动涵盖所有数据路径。用户若选择云端模型或外部连接器，相关数据仍会按所选服务流转。项目目前处于公开测试阶段，Windows 安装包也尚未完成代码签名。

🔗 [Andrew Ng 发布说明](https://x.com/AndrewYNg/status/2092315079576555806) ｜ [OpenWorker GitHub 仓库](https://github.com/andrewyng/openworker)

### Claude 打通聊天与 Cowork 记忆

Claude 现在让聊天与 Cowork 共用同一份记忆。用户可以按主题查看 Claude 保存的内容，并逐条编辑或删除。聊天里积累的项目背景可以带入 Cowork，Cowork 任务形成的上下文也会回到聊天。

健康和信仰等敏感主题默认不写入记忆，用户可以在设置中主动开启。社会保障号、政府证件号码、犯罪记录和移民身份等信息即使开启敏感主题也不会保存。记忆可随时关闭，云端任务仍要遵循账户与组织的数据保留政策。

🔗 [Claude Blog](https://claude.com/blog/claudes-memory-works-everywhere-and-you-decide-whats-in-it)

### Apple 发布 M5 Max 与 M5 Ultra 版 Mac Studio

新款 Mac Studio 提供 M5 Max 和 M5 Ultra 两种芯片。M5 Ultra 版本最高配备 36 核 CPU、80 核 GPU、512GB 统一内存和 1.2TB/s 内存带宽，可以在本机装载更大的开放权重模型。机器已于 8 月 25 日开放预购，9 月 22 日开始发售，512GB 内存配置要到 10 月下旬才提供。

Apple 还支持用 Thunderbolt 5 与 RDMA 连接多台 Mac Studio。公司测试称，四台机器组成的集群在分布式 AI 推理中最高达到单机的三倍速度。这些数字来自 Apple 在指定应用、模型和配置上的测试，不能直接外推到所有本地推理负载。

🔗 [Apple Newsroom](https://www.apple.com/newsroom/2026/08/apple-introduces-new-mac-studio-with-m5-max-and-m5-ultra/)

### AI HOT 收录 LangChain 与 Airbyte 的旧版数据摄取方案

AI HOT 在本期收录了 LangChain 与 Airbyte 的数据摄取文章，原文实际发布于 2023 年 8 月 8 日。方案把 LangChain 作为 Airbyte 的目标端，让 Airbyte 负责定时重建索引，再用 LangChain 完成文本切分、嵌入和向量存储接入。

这篇文章适合了解生产数据摄取为何需要调度与转换，不能视为 2026 年的新集成发布。文中的组件名称、接口和支持范围已有三年时间，实施时应以两个项目的当前文档为准。

🔗 [LangChain Blog](https://www.langchain.com/blog/making-data-ingestion-production-ready-a-langchain-powered-airbyte-destination)

### Apple 发布 M6 与 M5 Pro 版 Mac mini

新款 Mac mini 提供 M6 和 M5 Pro 两种芯片，并加入 Wi-Fi 7、蓝牙 6 与 2.5Gb 以太网。M6 配备 12 核 CPU、12 核 GPU、双 16 核神经引擎和最高 170GB/s 的统一内存带宽。Apple 称，它在指定测试中的 AI 性能最高达到 M4 版 Mac mini 的四倍，CPU 性能最高提升 40%。

两款机器已开放预购，9 月 22 日开始发售。M6 版本最高只有 32GB 统一内存，M5 Pro 版本最高为 64GB。实际运行本地模型时，模型规模、量化方式和内存容量会比峰值算力数字更直接地限制可用范围。

🔗 [Apple Newsroom](https://www.apple.com/newsroom/2026/08/apple-unveils-a-more-powerful-mac-mini-featuring-the-all-new-m6-and-m5-pro/)

### Apple 详解 M6 与 M5 Ultra 芯片

M6 是 Apple 首款采用 2 纳米工艺的芯片，包含 12 核 CPU、12 核 GPU 和双 16 核神经引擎。Apple 称，其多线程性能最高达到 M5 的 1.2 倍，GPU 的 AI 峰值算力比 M5 高近 30%。

M5 Ultra 首次在 M 系列中采用四晶粒封装，通过 UltraFusion 把两颗双晶粒 M5 Max 连接成一个处理器。它最高配备 36 核 CPU 和 80 核 GPU，统一内存带宽达到 1.2TB/s，比 M3 Ultra 高 50%。这些提升来自 Apple 的内部测试和峰值指标，应用能否获得相同比例的收益取决于软件、模型与内存访问方式。

🔗 [Apple 芯片发布说明](https://www.apple.com/newsroom/2026/08/apple-introduces-m6-and-m5-ultra-for-a-big-leap-in-performance-and-ai-compute/)

### OpenAI 推出 ChatGPT Work 与 Codex 的 Admin 插件

Admin 插件把工作区用量、成员与群组、访问权限、额度和支出请求放进 ChatGPT Work 与 Codex 对话。管理员可以查询活动，调整受支持的设置，也可以把待审批的用量请求转到 Slack 或 Microsoft Teams。

插件沿用每名用户现有的角色与权限，不会额外扩大访问范围，影响较大的操作可以在执行前复核。OpenAI 还披露，其内部已经部署的 ChatGPT Work 工作流解决了约 45% 的 IT 工单量。这个数字反映公司自己的整套 IT 自动化，不能单独证明 Admin 插件的效果。

🔗 [OpenAI](https://openai.com/index/introducing-admin-plugin/)

### OpenAI 公布 Jalapeño 推理芯片首批结果

OpenAI 公布首款自研推理芯片 Jalapeño 的首批实测。公司在 GPT-OSS 120B、DeepSeek R1 和 Kimi K2.5 1T 三个模型上测试后称，Jalapeño 在峰值吞吐量下每瓦完成的 AI 工作量达到对照系统的 1.5 至 1.9 倍，端到端延迟耗时约为对照系统的 28% 至 59%。

Jalapeño 由 OpenAI 设计，Broadcom 和 Celestica 参与芯片实现与系统集成。当前结果由 OpenAI 选择工作负载和运行点完成，具体对照硬件与配置需要结合原文附录判断。公司计划在未来数月扩大部署，尚未给出面向外部客户的独立测试或单独采购信息。

🔗 [OpenAI](https://openai.com/index/jalapeno-first-results/)

---

## 行业动态

### Anthropic 设立 500 万美元用户福祉研究资助

Anthropic 启动一项 500 万美元资助计划，支持外部团队评估 AI 对用户福祉的影响。入选者可以获得资金、模型访问权限和技术支持，研究团队保持独立，成果要以开源项目发布，供其他开发者使用。

申请截止日为 9 月 21 日。Anthropic 会在 10 月 5 日前通知获邀提交完整提案的申请者，这个日期并不等同于最终资助名单公布。资助方同时是被评估模型的开发者，成果的独立性仍要看研究设计、数据访问和公开复现条件。

🔗 [Anthropic](https://www.anthropic.com/news/wellbeing-research-grants)

### OpenAI 封禁一批疑似源自俄罗斯的影响力行动账号

OpenAI 称，公司封禁了一批极可能源自俄罗斯的 ChatGPT 账号。运营者用俄语提示生成社交媒体内容，推广自称位于以色列的 International Burke Institute，并刻意隐藏俄语背景。该网站还发布一套偏向俄罗斯、贬低西方国家的主权指数。

OpenAI 抽查网站挂在专家名下的 36 篇文章，发现 34 篇复制自其他来源，部分作者归属也被改动。ChatGPT 主要用于生成网站推广帖，没有生成这些被复制的文章。公司评估这次行动触达的受众较少，相关结论来自 OpenAI 自己的调查与平台数据。

🔗 [OpenAI 调查报告](https://openai.com/index/disrupting-malicious-uses-of-ai-influence-campaign-russia/)

---

## 论文研究

### AgentHands 为 XR 对话智能体生成同步手势

Google 在 CHI 2026 发表 AgentHands 研究原型。系统让大语言模型在回复中插入与具体词语对齐的 GestureEvents，再把事件转换成带时间戳的姿势和动作，让虚拟手势与语音同步。手势可以指向空间中的物体，也可以表达形状、动作和提醒。

研究团队先访谈十名 XR 与人机交互专家建立手势分类，再用十二名参与者进行被试内研究。论文报告，AgentHands 比纯语音基线更容易跟随，也提高了参与感。样本规模较小，系统仍是研究原型，结果还不能代表长时间使用或复杂现实环境中的表现。

🔗 [Google Research 介绍](https://research.google/blog/agenthands-generating-interactive-hand-gestures-for-spatially-grounded-agent-conversations-in-xr/) ｜ [论文页面](https://research.google/pubs/agenthands-generating-interactive-hands-gestures-for-spatially-grounded-agent-conversations-in-xr/)

### STARFlow2 用归一化流统一文本与图像生成

Apple 研究团队提出 STARFlow2，把自回归归一化流与语言模型放进同一套因果掩码和从左到右的生成结构。文本与视觉输出都能直接进入 KV cache，无需先把图像压成离散 token，也无需在生成后重新编码视觉结果。

论文在冻结的预训练视觉语言模型旁接入 TARFlow，并使用深浅结合的流模型与统一潜在空间。作者报告它在图像生成和多模态理解评测中表现良好。当前证据来自论文设定与作者实验，Apple 没有把它作为可用产品或公开模型发布。

🔗 [Apple Machine Learning Research](https://machinelearning.apple.com/research/starflow2-multimodal-generation)

---

## 技巧与观点

### OpenRouter 给出实时模型选型流程

OpenRouter 发布一套六步模型选型流程。先把任务、质量标准和延迟预算写清，再用实时用量与第三方基准缩小候选范围，比较不同提供商的价格和速度，最后拿自己的提示词测试，并按每次成功完成任务的成本作决定。

文章建议在结果接近时按请求动态路由。它同时推广 OpenRouter 的 MCP 服务、测试接口和自动路由器，数据与方法都围绕自家平台设计。团队可以借用这套流程，最终选择仍应由自己的任务样本、故障标准和账单数据决定。

🔗 [OpenRouter](https://openrouter.ai/blog/tutorials/choose-best-ai-model/)

### OpenRouter 发布统一视频生成 API 指南

OpenRouter 的异步视频接口把 Seedance、Veo、Wan 等模型放进同一套提交、轮询和下载流程。开发者提交任务后取得任务编号，等待状态完成，再下载 MP4。切换模型主要更改模型标识，但时长、分辨率、画幅和音频等参数仍要按各模型能力调整。

指南还说明，视频生成不支持零数据保留，因为异步下载需要短暂保存生成结果。团队接入前需要核对保存时间、失败状态、超时、价格和所选模型的内容政策，不能只把模型名称替换当作完整兼容。

🔗 [OpenRouter](https://openrouter.ai/blog/tutorials/video-generation-api/)

### Dylan Patel 预计两家实验室将取得大部分新增算力

SemiAnalysis 创始人 Dylan Patel 在 Dwarkesh Patel 的播客中预计，到 2028 年，Anthropic 与 OpenAI 可能取得全球新增 AI 算力的 70% 至 80%。他的计算口径会把 Amazon Bedrock 承载的 Anthropic 模型也计入 Anthropic 算力，因为相关使用会转化为 Anthropic 收入。

这是一项建立在资本开支、电力、芯片供应和实验室出价能力上的预测。云厂商是否愿意出售足够算力、算力价格会怎样变化，以及各公司自建芯片能否按期扩张，都会改变结果。它适合观察算力竞争的假设，不能当作已经确定的市场份额。

🔗 [Dwarkesh Podcast](https://www.dwarkesh.com/p/dylan-patel-3)

### AI HOT 收录 LangChain 的 2023 年 CSV 问答评测

LangChain 这篇文章原本发布于 2023 年 8 月 14 日。团队用泰坦尼克号 CSV 数据收集约 400 次真实交互，其中约 200 次带有反馈，再人工整理出约 50 条评测数据。初始方案只有约三分之一反馈为正，改进版让智能体同时使用 Python REPL 和检索器，并用语言模型辅助评判答案。

文章展示了如何用真实问题建立评测集，也记录了表格格式在不同运行环境中变化造成的错误。它不能代表当前模型或 LangChain 版本的性能。Python REPL 还能执行任意代码，生产系统必须把数据访问、执行权限和隔离边界单独收紧。

🔗 [LangChain Blog](https://www.langchain.com/blog/benchmarking-question-answering-over-csv-data)

### AI HOT 收录 LangChain 的 2023 年文本转 SQL 指南

这篇文本转 SQL 指南发布于 2023 年 3 月 13 日。文章指出，模型容易编造表名和字段，也可能生成无法执行的查询。它建议向模型提供数据库结构和少量示例行，限制返回的列数与行数，并把数据库错误反馈给模型后重试。

这些原则仍有参考价值，文中的 LangChain 接口已经较旧。真实系统还需要只读账号、表级与行级权限、查询成本限制、敏感字段屏蔽和执行前审查，避免一个语法正确的查询读取过量数据或占满数据库资源。

🔗 [LangChain Blog](https://www.langchain.com/blog/llms-and-sql)

### Google 用五项搜索功能辅助家居布置

Google 介绍了五种家居布置用法。AI Mode 可以根据房间照片生成家具摆放效果，Lens 和 Circle to Search 用于识别与查找相似商品，Search Live 可以在安装置物架等任务中提供逐步提示，商品列表还能比较价格并追踪降价。

Google 称，过去一个月里“home decor inspo”的搜索量增长了 300%。这是 Google 自己的搜索趋势口径，没有给出绝对搜索量。部分功能还受国家、语言、设备和商品类型限制，生成的摆放图也不能替代尺寸测量与施工安全判断。

🔗 [Google Blog](https://blog.google/products-and-platforms/products/search/home-decor-tips/)

---

*AI 热点日报 · 作者 钟懿 · 数据来源 AI HOT（aihot.virxact.com）*
