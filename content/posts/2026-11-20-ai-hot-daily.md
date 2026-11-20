---
title: "AI 热点日报 | 2026年11月20日"
date: 2026-11-20T00:00:00+08:00
publishDate: 2026-11-20T08:10:11+08:00
lastmod: 2026-11-20T22:10:39+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-20
description: 2026年11月20日 AI HOT 滚动精选，关注腾讯混元 Hy4 开放权重、Genie 4 向开发者开放、可灵图像模型 API、Codex 排查 ChatGPT 性能回退与 Anthropic IPO 交割。
aihot_ids: ["n1nzpfmd3f6zc4abq3s8yxrde", "h5xjk79bhcu8vgnbrynj208uj", "n3npoqbr48wu58cke5p3ox18l", "cty34utgc5ppbdnayf7cnjqlv", "alwgjr29158n454prl9tjmmw1", "nl1zxwjilx9vxvz7af13c1s9w", "wi5cfyezztfdcojsokxto4q0d", "gklqioeodqeuqgz3lttg83ztv", "h4bvsjw4ri6to1inm87srlf42", "w1q2gyqsel49b4vbqeodf0qmc", "jl6m0eymz9z0kleh54c3guowx", "stnka187ae3za2qnx70vqheg7", "e871ammlz8gpx1oozsswidzt0", "z0unnn7ryj39a3tuns8b1l4a6"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 14 条。本次取材截止北京时间 11 月 20 日 22:01。

---

## 模型与产品

### 进展：Genie 4 向 Gemini API 和 Google AI Studio 开发者开放

继[向符合条件的 Ultra 用户开放 Project Genie](/posts/ai-hot-2026-11-19/)后，Google 将实时交互世界模型 Genie 4 正式开放给 Gemini Interactions API 付费层，并提供 Google AI Studio 入口。开发者可以用文字、参考图或两者共同生成场景，在实时视频和同步音频中控制移动，也可以用文字指令调整场景。Google 公告发表于北京时间 11 月 20 日凌晨。

🔗 [Google 官方公告](https://blog.google/innovation-and-ai/technology/developers-tools/genie-4-in-gemini-api/) · [Gemini API 更新日志](https://aistudio.google.com/docs/changelog#11-19-2026)

### Gemini Mac 版开始提供计算机操作功能

Google 在 Mac 版 Gemini 中加入计算机操作功能，让助手在后台操作本地文件、桌面应用和网页，用户可以实时查看、暂停或批准关键操作。首批面向美国使用英语的成年个人 Google AI Plus、Pro 和 Ultra 用户，要求 Apple Silicon 和 macOS 15 或更高版本。Google 公告发表于北京时间 11 月 20 日凌晨。

🔗 [Google 产品公告](https://blog.google/innovation-and-ai/products/gemini-app/computer-use-mac/) · [Gemini 帮助文档](https://support.google.com/gemini/answer/18956635?hl=en-GB)

### Gemini API 预览按需检索工具定义

Google 在 Gemini Interactions API 预览 Tool Retrieval。开发者可以让模型先看到工具名称和描述，到实际调用时才加载对应的参数结构，减少工具较多时的输入开销。功能支持 Gemini 3.6 及后续模型，包括 Gemini 4 系列。Google 公告发表于北京时间 11 月 20 日凌晨。

🔗 [Google 开发者公告](https://blog.google/innovation-and-ai/technology/developers-tools/gemini-api-tool-retrieval/)

### 补充：Perplexity Computer 的 Brain 可更新个人技能

**11月20日 08:10 补充，官方研究报告标注 11 月 18 日。** Perplexity 介绍，Brain 可从用户的历史会话和记忆中提取重复工作流程，生成或更新 Computer 的个人技能。通过检查的修改会在后续会话中生效。公司称，该功能在美国 Max 用户中默认开启，用户可以关闭。相关动态由 AI HOT 于 11 月 20 日收录。

🔗 [Perplexity 官方研究报告](https://www.perplexity.ai/en-GB/hub/blog/self-improving-skills)

### 进展：腾讯混元开放 Hy4 正式版权重

**11月20日 14:07 补充。** 腾讯混元在[11 月 4 日发布旗舰 Hy4](/posts/ai-hot-2026-11-04/)后，于 11 月 20 日开放指令版、FP8 量化指令版和预训练基础版的权重，均采用 Tencent Hy License。官方资料显示，Hy4 支持图像和文本输入与 100 万 token 上下文，语言主干约有 7700 亿参数，处理文本时每个 token 激活约 490 亿参数。腾讯同步发布了系统卡，披露安全评估结果。

🔗 [腾讯混元发布公告](https://x.com/TencentHunyuan/status/2123625549147070538) · [官方仓库与模型权重入口](https://github.com/Tencent-Hunyuan/Hy4#model-links)

### 补录：fal 与 Runware 开放 Kling Image 4.0 API

**11月20日 22:10 补充，模型于 11 月 17 日发布。** fal 与 Runware 均已接入可灵的图像生成模型 Kling Image 4.0，提供文字和参考图生成入口，支持 2K、4K 和 8K 输出，并可一次生成最多十张主题和风格一致的图像。该消息由 AI HOT 于 11 月 17 日收录，本次依据两家平台的 API 文档补录。

🔗 [fal 模型与 API 说明](https://fal.ai/kling-image-4) · [Runware 模型文档](https://runware.ai/docs/models/klingai-image-4-0)

## 开发与研究

### 进展：Arena 公布 Gemini 4 Neon 的首发实测

**11月20日 22:10 补充，原帖发表于美国当地时间 11 月 19 日。** 在[Google 发布 Gemini 4 Neon](/posts/ai-hot-2026-11-19/)后，Arena 分享了对该模型的首发体验，覆盖 3D 场景、游戏、界面和数据可视化任务。Arena 另有一份标注 11 月 18 日更新的智能体榜单。Neon 在高推理设置下基于 4,238 次会话获得 1,333±32 分，暂列第 3，名次估计范围为第 2 至第 7。视频相关消息由 AI HOT 于北京时间 11 月 20 日收录。

🔗 [Arena 实测原帖](https://x.com/arena/status/2123528811572846972) · [Arena 实测视频](https://www.youtube.com/watch?v=79sSH0Y8FA4) · [Arena 模型榜单](https://arena.ai/leaderboard/agent/models/gemini-4-neon-high-m0ck)

### 补充：OpenAI 用 Codex 排查 ChatGPT 性能回退

**11月20日 08:10 补充，原文发表于 11 月 19 日。** OpenAI 介绍内部系统 Performance Factory。性能告警触发后，Codex 调查原因并提出修复，由工程师审阅和决定部署，随后再由智能体验证性能是否恢复。OpenAI 称，这套流程在三个多月里跟踪了超过 1700 次调查，定位了超过 600 个案例的根因。该报告由 AI HOT 于 11 月 20 日收录。

🔗 [OpenAI 工程报告](https://openai.com/index/how-openai-performance-factory-keeps-chatgpt-fast/)

### 补充：Ai2 将科研假设工具 Theorizer 接入 Asta

**11月20日 08:10 补充，原文发表于 11 月 19 日。** Ai2 把 Theorizer 接入科研助手平台 Asta，并公开源代码。工具从已发表研究中提取相关发现，提出可供检验的解释，并附上支持各项主张的论文。研究人员仍需核查证据、判断假设的新颖性并开展验证。该消息由 AI HOT 于 11 月 20 日收录。

🔗 [Ai2 发布公告](https://allenai.org/blog/theorizer-in-asta) · [Theorizer 源码](https://github.com/allenai/asta-theorizer)

### 补充：斯坦福发布法院文书 AI 检测基准 PhantomDocket

**11月20日 08:10 补充，原文发表于 11 月 19 日。** 斯坦福研究者发布 PhantomDocket，利用已确认使用生成式 AI 的法律文书及对照样本评估检测工具。研究分析了美国四地州法院约 12.75 万份民事起诉状，估计 2026 年加州圣克拉拉县和旧金山县的可比案件样本分别有约 38% 和 36% 的起诉状呈现 AI 辅助写作迹象。研究者强调，这一方法适合估计群体比例，判断单份文书仍有明显误差。该研究由 AI HOT 于 11 月 20 日收录。

🔗 [斯坦福 HAI 研究说明](https://hai.stanford.edu/news/ai-might-be-flooding-state-court-houses-but-proving-it-is-another-matter) · [研究论文](https://dho.stanford.edu/wp-content/uploads/GenAI_Courts.pdf)

### 补充：Conductor 在聊天中展示智能体生成的 HTML 页面

**11月20日 14:07 补充，原文发表于 11 月 19 日。** Conductor 0.97.0 让本地工作区里的智能体把 HTML 页面直接嵌入聊天，例如在对话中展示流程图。用户可以通过 @ 指定产物，也可以在设置中管理模板。新版还支持选中聊天原文并引用回复。该更新由 AI HOT 于 11 月 20 日收录。

🔗 [Conductor 更新日志](https://www.conductor.build/changelog/0.97.0-first-class-artifacts)

## 行业动态

### 进展：Anthropic 股票在纳斯达克开始交易

继[公布每股 83 美元的 IPO 定价](/posts/ai-hot-2026-11-19/)后，Anthropic 股票于美国东部时间 11 月 19 日在纳斯达克以 ANT 为代码开始交易。纳斯达克确认首笔成交价为每股 111.50 美元，较发行价高约 34%，首日收于 97.17 美元。该进展由 AI HOT 于北京时间 11 月 20 日收录。

🔗 [纳斯达克上市记录](https://www.nasdaq.com/newsroom/anthropic-marks-ipo-at-nasdaq) · [Anthropic 定价公告](https://www.anthropic.com/news/anthropic-prices-initial-public-offering) · [美联社首日行情报道](https://apnews.com/article/anthropic-ipo-by-numbers-fdca56f1cda70c9908899057e7e591e6)

**11月20日 22:10 补充。** Anthropic 公告称，IPO 与同期私募均已交割。承销商全额行使了额外认购 1.47 亿股的选择权，IPO 的总募资额约为 935 亿美元，其中约 916 亿美元由 Anthropic 获得，均为扣除承销费用和其他发行费用前的金额。另有约 260 亿美元来自同期私募。

🔗 [Anthropic 交割公告](https://www.anthropic.com/news/ipo-close) · [路透社交割报道（Investing.com 刊载）](https://www.investing.com/news/economy-news/anthropic-ipo-haul-rises-to-935-billion-after-underwriters-exercise-greenshoe-5041607)

### 进展：美国远程算力出口管制规则生效

美国商务部工业与安全局[此前宣布的远程算力规则](/posts/ai-hot-2026-11-16/)已于美国当地时间 11 月 19 日在《联邦公报》发布并生效。规则针对特定先进计算芯片的出口、再出口和境内转移。如果已知芯片将用于向总部或最终母公司设在中国等适用地区的企业提供超过规定规模的远程算力，相关交易须申请许可。

🔗 [《联邦公报》规则全文](https://www.federalregister.gov/d/2026-23529) · [The Decoder 报道](https://the-decoder.com/chinese-tech-firms-face-a-double-hit-as-chip-shipments-stop-and-overseas-cloud-access-disappears/)

### 进展：英伟达股价创 52 周收盘新低，加州发出调查传票

在[公布第三财季业绩](/posts/ai-hot-2026-11-18/)后，英伟达股价于美国当地时间 11 月 19 日收于 145.98 美元，创 52 周收盘新低。同日，加州总检察长办公室宣布向英伟达发出调查传票，要求说明先进芯片或机密信息是否流向中国，以及公司是否曾误导投资者和公众。加州方面尚未公布调查结论。

🔗 [The Verge 市场报道](https://www.theverge.com/ai-artificial-intelligence/1038063/nvidia-stock-market-price-earnings) · [加州总检察长办公室公告](https://oag.ca.gov/news/press-releases/attorney-general-bonta-serves-investigative-subpoena-nvidia)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
