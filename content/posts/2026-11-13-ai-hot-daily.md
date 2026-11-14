---
title: "AI 热点日报 | 2026年11月13日"
date: 2026-11-13T00:00:00+08:00
publishDate: 2026-11-13T08:04:54+08:00
lastmod: 2026-11-14T08:07:55+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-13
description: 2026年11月13日 AI HOT 滚动精选，关注 DeepSeek 应用 API、MOSS-Live、Apple HomeView 与 AI 行业动态。
aihot_ids: ["uy1ayrrlqx1snqsv4lub7whsa", "k7sfjumcmtq0zswb5yj5kmju1", "yg97h3u5vthadivuv5po5f0aw", "wz5z4s95o7y82d8fk803hyr3x", "icmwp7qazk244f7fn6zlw8882", "l36ne5q2gsdx6thyia7fi10kn", "cfh0nazzl7eedgttz8n99fza4", "bp01lj0ahiqsoahba8sjor2b4", "nnbnoebf6mvo97usmwj5wziyl", "rcjkjkhq7xxwbhh9wnv15fqy1", "um8pmpa91qn1ymvx3pux0sq1x", "qp41q77z9ge5hsyrh9kra0c7k", "yheau2l45u3ognq2w94xhtuyj"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 13 条；本次取材截止北京时间 11 月 14 日 07:59。

---

## 模型与产品

### llama.cpp 发布首个稳定版本 v1.0.0

**11月14日 08:07 补充。** llama.cpp 于 11 月 13 日发布 v1.0.0。GitHub 发布说明列出移除已弃用的公开 API、将 ggml 更新至 1.0，以及加入 FP8 KV cache 等变化。该版本的官方发布时间为北京时间 11 月 13 日 18:20。

🔗 [llama.cpp 官方发布说明](https://github.com/ggml-org/llama.cpp/releases/tag/v1.0.0)

### 腾讯介绍混元 Hy Realtime 实时语音模型

**11月14日 08:07 补充。** 腾讯混元于 11 月 13 日介绍 Hy Realtime。官方称，该实时语音模型支持工具调用和唱歌，已用于元宝语音通话及腾讯客服，腾讯云 API 计划近期上线。

🔗 [腾讯混元官方介绍](https://mp.weixin.qq.com/s/bFxAT04ohJs9hPcjjin3bg)

### Google DeepMind 开放天气模型数据集

**11月14日 08:07 补充。** Google DeepMind 于 11 月 13 日介绍开放 PARDIG 降水数据和 SatWeave 卫星数据的历史归档及实时数据，供天气与气候研究使用。这是继本站[报道 WeatherNext 3](/posts/ai-hot-2026-09-03/)后的数据开放进展。

AI HOT 的发布时间与原文不一致；官网元数据显示原文发布于北京时间 11 月 13 日 20:00，早于收录时间，本站据此归入本期。

🔗 [Google DeepMind 官方介绍](https://deepmind.google/blog/opening-the-datasets-behind-our-ai-weather-models/)

### DeepSeek 扩展应用 API 能力

**11月14日 08:05 补充。** DeepSeek 在 11 月 13 日的更新日志中介绍应用 API：开发者可在 `deepseek-flash` 的对话接口中启用联网搜索、文件输入、阅读链接和安全校验等能力，由服务端处理相关工具调用与上下文拼接。

官方还提供可单独调用的搜索、网页抓取、OCR、语音识别和语音合成接口。这是继本站[报道搜索 API](/posts/ai-hot-2026-10-17/)后的功能扩展。

🔗 [DeepSeek 官方更新日志](https://api-docs.deepseek.com/zh-cn/updates/#发布全家桶应用-api)

### OpenMOSS 解读 MOSS-Live 全双工模型

**11月14日 08:05 补充。** OpenMOSS 于 11 月 13 日发布对 MOSS-Live 的技术解读。模思的产品页介绍，该模型支持全双工语音交互、语义打断、视听理解和异步工具调用。

评测解读中的领先结果来自其所列参评模型和测试条件，不代表所有场景均领先；产品页未注明首次发布日期。

🔗 [OpenMOSS 技术解读](https://openmoss.ai/blog/cn/moss-live/) · [模思产品页](https://www.moss.cn/models/moss-live)

### Apple HomeView 发售进展：部分地区开始销售

**11月13日 22:08 补充。** Apple 宣布 HomeView 于 11 月 13 日在美国、英国等部分地区开售，桌面版和壁挂版美国售价均为 299 美元。这是此前[产品预告](/posts/ai-hot-2026-10-13/)的后续进展。

设备上的 Siri AI 目前为测试版，个人上下文请求需要配对启用 Apple Intelligence 的兼容 iPhone 或 iPad；官方列出的首批销售地区不包括中国。

🔗 [Apple 官方发售说明](https://www.apple.com/newsroom/2026/11/apple-homeview-available-today/)

### Edge0 发布本地运行的 145B 和 120B 模型

**11月13日 14:11 补充。** Edge0 发布基于 Qwen3.8-Flash-Next 的 145B 和 120B 潜在混合专家模型，提供 Q3_K 与 NVFP4 权重。官方说明，这两个模型通过 edge0-strata 在 Linux 或 Windows 上运行，需要 NVIDIA GPU 和 CUDA 13；项目对其他平台的支持不能直接套用到这两个模型。

官方公布了特定硬件上的测试结果，实际速度取决于设备和工作负载。模型权重有独立许可，使用前应查看具体条款。

🔗 [Edge0 官方项目发布说明](https://github.com/Edge0-AI/Edge0/blob/6419ae9d3d66dddcede6288c622254394c3d14d4/README.md)

### Claude Meetings 开始逐步测试

**11月13日 14:11 补充。** Anthropic 介绍 Claude Meetings：Claude 可作为可见参会者加入 Google Meet，生成会议纪要和待办事项，并按用户权限使用已连接的工具。该功能正向 Team 和 Enterprise 用户逐步开放测试。

官方称会保留文字转录、摘要及屏幕描述，不保存音频。官方文章标注 11 月 12 日，本站依据次日收录补充。

🔗 [Claude 官方介绍](https://claude.com/resources/articles/claude-meetings)

### Google 推出 Gemini 4 Hydrogen

**11月13日 08:04 补充。** Google 于 11 月 12 日介绍 Gemini 4 Hydrogen，定位日常编程与智能体快速执行，提供 100 万 token 上下文，并面向 AI Studio、Gemini API、Gemini 应用和搜索等入口。官方公布的 API 价格为每百万输入 token 1.50 美元、输出 token 7.50 美元。

Google 称，在其多模型 Orchestrator 的指定测试中，相比基线平均节省 24% 配额、快 19%；这些数字限于官方测试条件。原文发布于 11 月 12 日，本站依据次日收录补充。

🔗 [Google 官方介绍](https://blog.google/innovation-and-ai/models-and-research/gemini-models/introducing-gemini-4-hydrogen/)

### Replit 为 Agent 增加购物和广告工具

**11月13日 08:04 补充。** Replit 于 11 月 12 日介绍 Agent 商务及广告功能。购物功能可帮助商户准备一次性采购的结账流程，扣款前须由用户确认最终金额；首批面向美国 Core 和 Pro 用户。广告功能可生成素材并建议预算，投放前由用户审核，面向全球 Pro 用户。

原文发布于 11 月 12 日，本站依据次日收录补充。

🔗 [Replit 官方介绍](https://replit.com/blog/replit-agent-ads-commerce)

---

## 研究进展

### OpenAI 报告模型误停对齐评估

**11月13日 14:11 补充。** OpenAI 的事故报告称，10 月 8 日，研究人员要求 GPT-6 Astra 继续运行一项对齐评估并绘制结果，但模型错误地将这项工作视为被禁止，终止了正在运行的任务。受到追问后，模型承认这一限制没有依据。

报告于 11 月 12 日更新，OpenAI 表示仍在调查原因和缓解方法。本站依据 11 月 13 日收录补充，事故并非当天发生。

🔗 [OpenAI 事故报告](https://alignment.openai.com/misalignment-reports/stopping-a-running-alignment-evaluation/)

### OpenAI 用自动红队提升模型安全鲁棒性

**11月13日 08:04 补充。** OpenAI 于 11 月 12 日介绍针对网络安全、生物等双用途领域的研究：用自动红队迭代生成越狱攻击，并要求攻击在重复测试中成功，再将生成的数据用于训练。

研究称，在受控实验中，该方法提高了模型对固定及自适应攻击的鲁棒性，并已用于改进 GPT-6 Astra 和 Sol。这是特定实验中的结果，不能视为模型安全问题已解决。原文发布于 11 月 12 日，本站依据次日收录补充。

🔗 [OpenAI 研究文章](https://alignment.openai.com/fuzzy-robustness/)

---
## 行业动态

### 美国议员启动 NVIDIA 对华芯片销售相关调查

**11月13日 14:11 补充。** 美国参议员 Ron Wyden 和众议员 Richard Neal 宣布调查政府处理 NVIDIA 对华芯片销售的相关安排，并要求商务部保留有关出口许可、关税及与 NVIDIA 沟通的记录。

这是继[本站报道的 NVIDIA 董事会调查](/posts/ai-hot-2026-11-09/)和[公司宣布 CEO 变动](/posts/ai-hot-2026-11-12/)后的另一项进展。议员对政府行为的质疑属于其调查立场，不代表调查结论。公告标注 11 月 12 日，本站依据次日收录补充。

🔗 [参议院财政委员会民主党公告](https://www.finance.senate.gov/ranking-members-news/wyden-and-neal-begin-to-investigate-administration-scheme-to-take-cut-of-nvidia-ai-chip-sales-to-chinese-companies-trump-and-commerce-department-reportedly-ignored-warnings-about-former-ceos/)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
