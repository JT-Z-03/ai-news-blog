---
title: "AI 热点日报 | 2026年6月10日"
date: 2026-06-10T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: "ai-hot-2026-06-10"
description: "2026年6月10日 AI 圈要闻：Anthropic 发布 Claude Fable 5 与 Mythos 5、Gemma 4 12B 统一多模态开源、MiMo UltraSpeed 突破 1000 tokens/s、SpaceX AI1 轨道数据中心细节首次披露"
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 今日头条

### Anthropic 发布 Claude Fable 5 与 Mythos 5：全面 SOTA，售价砍半

Anthropic 推出 Claude Fable 5（通用安全版）和 Claude Mythos 5（受限安全版）。Fable 5 在软件工程、知识工作、视觉、科研等几乎所有测试基准上达到 SOTA，Stripe 称其将数月工程压缩至数天，FrontierCode 评分居前沿模型之首，可仅凭截图重建网页应用源码。Mythos 5 在药物设计中实现约 10 倍加速，其分子生物学假说盲测获科学家偏好的概率约 80%。两模型售价均为 $10/百万输入 tokens、$50/百万输出 tokens，较 Mythos Preview 降价过半。

📎 [Anthropic Newsroom](https://www.anthropic.com/news/claude-fable-5-mythos-5)

---

## 模型发布/更新

### Google DeepMind 发布 Gemma 4 12B：统一无编码器多模态模型

采用无编码器统一架构，原生支持音频输入，基准性能接近 26B MoE 模型，但内存占用不到一半，仅需 16GB 显存即可在消费级笔记本上本地运行。内置多 token 预测 drafter 降低延迟，Apache 2.0 开源，累计超 1.5 亿次下载。

📎 [Google DeepMind Blog](https://deepmind.google/blog/introducing-gemma-4-12b-a-unified-encoder-free-multimodal-model)

### 小米 MiMo UltraSpeed 模式：1T 模型输出突破 1000 tokens/s

MiMo-V2.5-Pro-UltraSpeed 采用 FP4 混合量化与 DFlash 块级并行推测解码（coding 场景平均接受长度 6.30 tokens），配合 TileRT 常驻内核引擎与异构流水线协作，速度提升约 10 倍。API 限时开放至 6 月 23 日，FP4 权重与 DFlash checkpoint 已开源。

📎 [小米 MiMo 公众号](https://mp.weixin.qq.com/s/EZvmrx8xfM9MZNCMDwImFQ)

### Cohere 发布 North Mini Code：开源编码模型

30B MoE 架构，仅 3B 活跃参数，Apache 2.0 开源。在 Artificial Analysis Coding Index 得分 33.4，SWE-Bench Verified pass@10 达 80.2%，Terminal-Bench v2 达 55.1%，专为智能体编码任务优化。

📎 [Hugging Face Blog](https://huggingface.co/blog/CohereLabs/introducing-north-mini-code)

### Gemini 3.5 Live Translate 发布

Google DeepMind 发布最新音频模型，专为快速跨语言交流构建。

📎 [Google DeepMind @ X](https://x.com/GoogleDeepMind/status/2064366504745828689)

---

## 产品发布/更新

### Luma AI Ray3.2 API：电影级渲染可集成

Ray3.2 API 可大规模运行电影级渲染，专为需要将电影感融入产品的开发者、代理机构和企业设计。

📎 [Luma AI @ X](https://x.com/LumaLabsAI/status/2064389582997897216)

### Claude Managed Agents 新增定时运行和环境变量存储

支持 cron 计划自动执行周期性任务，无需用户自建调度器。vaults 新增环境变量支持，允许代理通过 CLI 进行认证请求，真实密钥仅附加在网络边界，代理无法读取。已集成 Browserbase、KERNEL、Notion、Ramp 和 Sentry。

📎 [Claude Blog](https://claude.com/blog/whats-new-in-claude-managed-agents)

### OpenRouter 推出 Advisor 工具：低成本模型可随时调用强模型

允许快速便宜的模型在生成过程中咨询更强大的模型，实现成本与质量的动态平衡。例如用 GPT-4o Mini 处理日常任务，关键时刻调用 Claude Fable。

📎 [OpenRouter Announcements](https://openrouter.ai/blog/advisor-server-tool)

### 火山引擎 TRAE Work 企业版正式上线

品牌从 TRAE Solo 升级为 TRAE Work，面向全员提供 AI 办公平台。Work 模式面向非技术岗位（PPT/文档生成、语音讨论自动整理纪要、定时数据报告）；Code 模式面向开发者（自然语言生成页面或小应用）。多端同步，企业后台可统一配置模型和用量。

📎 [火山引擎公众号](https://mp.weixin.qq.com/s/f7QzLzwHPHHv3tWT1Wrnkw)

### Responses API 网页搜索新增图片结果

OpenAI 的 Responses API 网页搜索现支持图片结果，可用于展示商品、地点、视觉参考和来源链接。

📎 [OpenAI Developers @ X](https://x.com/OpenAIDevs/status/2064395155688616153)

### Cursor Evals 新增成本与输出 Token 图表

在 cursor.com/evals 上可查看每个模型的成本、输出 token 和步骤的图表可视化。

📎 [Eric Zakariasson @ X](https://x.com/ericzakariasson/status/2064404502053294565)

### NotebookLM 笔记本功能在欧洲 Gemini App 全面上线

欧洲用户现可直接在 Gemini App 内访问个人未共享的笔记本，并将与 Gemini 的对话作为新笔记本或已有笔记本的来源。先面向 Google AI Ultra、Pro 和 Plus 订阅者。

📎 [NotebookLM @ X](https://x.com/NotebookLM/status/2064410506287538387)

### World Labs 与 Lore 合作打造互动体验

Fei-Fei Li 的 World Labs 与 Lore 合作，将创意想法转化为用户可以享受的互动体验。

📎 [Fei-Fei Li @ X](https://x.com/drfeifei/status/2064387365930676695)

---

## 行业动态

### Elon Musk 详解 SpaceX AI1 轨道 AI 数据中心卫星

峰值功率 150 kW，持续计算约 120 kW，相当于一个 NVIDIA GB300 机架。太阳能板效率 250 W/m²，双面散热器排热 1,400 W/m²。激光链路互联约 1 Tbps，低轨 600–800 km 往返延迟 6–8 ms。计划部署多达百万颗卫星，2027 年底前量产，长期向太瓦级轨道算力推进。

📎 [Rohan Paul @ X](https://x.com/rohanpaul_ai/status/2064165951936094364)

### Apollo 与 Blackstone 联手 350 亿美元 AI 融资交易

华尔街为昂贵 AI 芯片创建新融资模型，Anthropic 和 Broadcom 参与其中。这可能标志着一个全新 AI 投资类别的开端。

📎 [Bloomberg](https://www.bloomberg.com/news/videos/2026-06-09/apollo-blackstone-fund-ai-boom-video)

### 中国准备 2950 亿美元计划资助全国 AI 基础设施建设

未来五年投入约 2 万亿元人民币建设全国数据中心，推动国内 AI 产业发展并超越美国。

📎 [Bloomberg](https://www.bloomberg.com/news/articles/2026-06-09/china-prepares-295-billion-plan-to-fund-nationwide-ai-buildout)

### 台湾考虑限制 AI 芯片对华出口以配合美国

知情人士透露台湾当局正考虑对 AI 芯片出口中国大陆实施更严格管制，以遏制半导体走私。

📎 [Bloomberg](https://www.bloomberg.com/news/articles/2026-06-09/taiwan-mulls-curbs-on-ai-chip-exports-to-china-to-align-with-us)

### 里程碑式德国裁决：Google AI Overviews 被视为谷歌自身言论，需为错误回答担责

德国地方法院裁定 Google 对其 AI 概览生成内容直接承担法律责任，不能援引搜索引擎运营商的有限责任保护。该裁决可能为全球 AI 生成内容责任认定树立先例。

📎 [The Decoder](https://the-decoder.com/landmark-german-ruling-declares-googles-ai-overviews-are-googles-own-words-and-makes-it-liable-for-false-answers)

### Cursor 欧洲总部落子伦敦，SpaceX 手握 600 亿美元收购选择权

Cursor 计划在伦敦招聘约 200 名员工，B2B 年化营收约 26 亿美元。SpaceX 拥有以 600 亿美元收购 Cursor 的选择权，或支付 100 亿美元开展全新合作。

📎 [IT之家](https://www.ithome.com/0/961/868.htm)

### OpenAI 秘密提交 IPO 申请

同时 Sam Altman 旗下的 Tools for Humanity 正裁员，该公司因虹膜扫描项目 World 及加密货币 Worldcoin 知名，投后估值 25 亿美元。韩国因违反隐私法规对其罚款 83 万美元。

📎 [IT之家](https://www.ithome.com/0/961/792.htm)

---

## 技巧与观点

### FrontierCode 基准测试：AI 编程评估新标准——维护者审核通过率最高仅 13.4%

Cognition 发布 FrontierCode，由 20 多位顶级开源维护者手工制作 150 个任务。结果：Claude Opus 4.8 在最高难度档获 13.4%，GPT-5.5 为 6.3%，其余模型 1%–5%。即使最强模型也近九成代码无法通过有经验维护者审核。

📎 [阿易 AI Notes @ X](https://x.com/AYi_AInotes/status/2064146694774595646)

### 一个 Agent 链式调用两个 HuggingFace Space 构建 3D 巴黎画廊

先用 ideogram-ai/ideogram4 生成图像，再通过 VAST-AI/TripoSplat 重建 3D 高斯散点，自动坐标系校正、压缩为 .ksplat，并构建基于 Three.js 的交互式查看器。

📎 [Hugging Face Blog](https://huggingface.co/blog/mishig/spaces-agents-md)

### Claude Code 团队分享提升效率的十条建议

核心转变：从检查 Claude 是否做对工作，转向检查它是否在做正确的工作。包括提前提供完整上下文、用小规格文档让 Claude 访谈实现细节、使用 /goal 命令、利用 Workflows 并行任务等。

📎 [Rohan Paul @ X](https://x.com/rohanpaul_ai/status/2064425086409679358)

### 开源工具 Tokei：菜单栏实时监控 AI coding agent 的 token 用量与成本

macOS 菜单栏小工具，只读本地日志、零网络调用，支持 Claude Code、Grok CLI、Aider、OpenCode 等 8 个主流 AI coding agent，30 秒自动刷新，数据全程私有。

📎 [Berry Xia @ X](https://x.com/berryxia/status/2064155452934639718)

### GitHub 122K⭐ Skills 推出新技能「Teach」：把工作目录变有状态学习空间

五个关键机制：Mission 定方向、ZPD 根据记录调整难度、Lesson 一课一事+即时反馈、Learning Record 记"会了什么"、Reference 形成长期可回看手册。

📎 [邵猛 @ X](https://x.com/shao__meng/status/2064144978792878348)

### 将 GitHub CI 迁移到 Hugging Face Jobs

使用 huggingface/jobs-actions 桥接，将 GitHub Actions job 转为临时自托管运行器，解决速度慢、缺乏 GPU 支持等问题。

📎 [Hugging Face Blog](https://huggingface.co/blog/github-ci-hf-jobs)

### OpenRouter 与 Cursor 集成指南

📎 [OpenRouter Cookbook](https://openrouter.ai/docs/cookbook/coding-agents/cursor-integration)

### 在 AgentsView 中为 Claude Fable 5 设置自定义价格

Wes McKinney 利用 Fable 逆向工程找到了为 AgentsView 设置自定义模型价格的方法，并展示了 Fable 5 在本地项目中的使用量树状图。

📎 [Simon Willison 博客](https://simonwillison.net/2026/Jun/9/agentsview-custom-model-price)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
