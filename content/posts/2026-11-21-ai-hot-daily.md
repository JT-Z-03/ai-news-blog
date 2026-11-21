---
title: "AI 热点日报 | 2026年11月21日"
date: 2026-11-21T00:00:00+08:00
publishDate: 2026-11-21T10:23:03+08:00
lastmod: 2026-11-21T22:11:30+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-21
description: 2026年11月21日 AI HOT 滚动精选，关注黎曼猜想的两份证明主张及核验进展、混元 Hy4 轻量模型计划、Inkling 2 Mini 权重与 ChatGPT Space。
aihot_ids: ["y7nk77dxae51qwi826gpmvbho", "ekf0so0xitc52thkrxx3mwax1", "t68rgyv46hdbp52212ozxleh3", "vu6fw8wmrs3xcln4u9gwzf1f4", "sn8qb9u8fqka3mpnmy0r1nz4b", "wibzzhd168cafn7o3gl8336di", "wnw22hxqlwsd58lzsm44psc6g", "i94tul4bae051uizh2kkpn2r4", "j8qdprqh5i5n9n7ece0f411f1", "tje8i8y21ttk7jjmqet5bpxuq"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 9 条。本次取材截止北京时间 11 月 21 日 22:07。

---

## 模型与产品

### 补充：Thinking Machines Lab 开放 Inkling 2 Mini 权重

**原文标注 11 月 20 日。** Thinking Machines Lab 推出 Inkling 2 Mini，模型总参数 264 亿，每个 token 激活 34 亿参数。模型处理每个 token 时会重复运行 Transformer 的中间层，以缩小需要常驻内存的权重体积。它接受文本和图像输入，输出文本，权重采用 Apache 2.0 许可。

🔗 [Thinking Machines Lab 发布说明](https://thinkingmachines.ai/news/inkling-2-mini/) · [官方模型卡](https://huggingface.co/thinkingmachines/Inkling-2-Mini)

### 进展：ChatGPT Space 开始向 Plus 用户开放

**官方更新日志标注 11 月 20 日。** OpenAI 开始向全球年满 18 岁的 ChatGPT Plus 用户逐步开放 Space。用户可以在同一空间整理文件、协作编辑互动页面和演示文稿，并让 ChatGPT 根据已连接的数据源定期更新内容。Space 将在符合条件的账户中取代 Library。OpenAI 此前已经宣布向 Pro、Business 和 Enterprise 用户推出 Space。

🔗 [ChatGPT 官方更新日志](https://help.openai.com/en/articles/6825453-chatgpt-release-notes) · [OpenAI DevDay 公告](https://openai.com/index/devday-2026-recap/)

### 进展：Google 公开 Gemini Tasks 商家电话功能的技术细节

**原文标注 11 月 20 日。** 在[为 Gemini Tasks 加入代打商家电话的功能](/posts/ai-hot-2026-11-18/)后，Google Research 说明了新版 Duplex 如何用 Gemini 统一语义理解、任务规划和对话生成，通过声学与对话节奏模型处理电话里的噪声和停顿。Google 表示，自动来电会说明其身份，商家可以选择不再接收这类来电。

🔗 [Google Research 工程说明](https://research.google/blog/how-google-duplex-evolved-to-also-call-businesses-for-you-in-gemini/)

### 补录：腾讯混元团队预告更轻量的 Hy4 模型

**11月21日 14:05 补充。** AI HOT 于 11 月 19 日收录腾讯混元的社区问答预告。继[开放旗舰 Hy4 权重](/posts/ai-hot-2026-11-20/)后，团队在北京时间 11 月 21 日的问答中表示，更小的 Hy4 模型已列入路线图，并预告了 Flash-Lite。团队还在推进 llama.cpp 适配，尚未公布这些计划的具体时间。

🔗 [较小模型路线图](https://www.reddit.com/r/LocalLLaMA/comments/1y15w4a/comment/19sxf15n36tnm/) · [Flash-Lite 预告](https://www.reddit.com/r/LocalLLaMA/comments/1y15w4a/comment/19sxin04bnm3m/) · [llama.cpp 适配回复](https://www.reddit.com/r/LocalLLaMA/comments/1y15w4a/comment/19sxert2z7a8x/)

## 开发与研究

### 进展：数学家 Levent Alpöge 发布黎曼猜想证明主张和 Lean 文件

**原始说明于 11 月 20 日发布。** Anthropic 数学家 Levent Alpöge 在个人网站公开说明和分卷 Lean 文件，称他与 Claude 找到了黎曼猜想的证明，方法也适用于狄利克雷 L 函数的广义版本。本站[曾报道相关的零点比例下界结果](/posts/ai-hot-2026-08-10/)。MIT 数学家 Andrew Sutherland 公布的初步核验显示，源码编译无误，独立内核接受了导出的证明；截至本期取材时，部分形式化检查仍在进行，克雷数学研究所仍将该猜想列为未解决。

🔗 [Alpöge 原始说明及文件入口](https://alpo.ge/remark.pdf) · [Sutherland 核验记录](https://math.mit.edu/~drew/grh/) · [克雷数学研究所问题页面](https://www.claymath.org/millennium/Riemann-Hypothesis/)

**11月21日 14:05 补充。** Lean 社区的证明镜像于北京时间 12:27 合入公开的编译缓存，方便第三方复核。维护者记录称，已验证全部 175,187 个模块的缓存下载和恢复。美联社随后刊载克雷数学研究所所长 Martin Bridson 的回应。他表示，要充分理解这项成果仍需时间。该研究所的问题页面仍标注「未解决」。

🔗 [Lean 社区合并记录](https://github.com/leanprover-community/riemann-hypothesis/pull/7) · [美联社刊载的研究所回应](https://apnews.com/article/anthropic-claude-math-solution-ai-4fe8b69a891f160f9e7f0c85af8c55c8)

**11月21日 22:11 补充。** 斯坦福数学家 Ravi Vakil 于北京时间 11 月 21 日凌晨公开了 Alessandro Maria Masullo 独立撰写的广义黎曼猜想证明草稿。Vakil 随后表示，有读者借助不同的 AI 模型发现了草稿中的问题，仍需逐一解决。另一边，Sutherland 在北京时间 20:55 更新核验记录，报告两个独立实现的内核均接受了 Alpöge 版本的完整证明导出，其中一个还核对了五个定理陈述。另有检查仍在进行，克雷数学研究所仍将黎曼猜想列为未解决。

🔗 [Vakil 发布草稿及补记](https://math216.wordpress.com/2026/11/20/hurried-announcement-alessandro-masullo-grh/) · [Masullo 原稿](https://math216.wordpress.com/wp-content/uploads/2026/11/the-music-of-the-primes.pdf) · [Sutherland 更新的核验记录](https://math.mit.edu/~drew/grh/)

### 补充：METR 更新 AI 任务时间视野评估

**原文标注 11 月 20 日。** METR 在合并的 TH1.1 与 TH2 任务集上估计，模型的 50% 时间视野约每 3.6 个月翻倍，95% 置信区间为 2.08 至 4.94 个月。时间视野以人工完成任务所需的时间为尺度，衡量模型在多长的任务上能达到 50% 成功率。研究者提醒，若评测环境与强化学习训练环境越来越相似，分数可能高估模型在实际任务上的能力。

🔗 [METR 能力评估更新](https://metr.org/blog/2026-11-20-q4-2026-capability-update/)

### 补充：Browser Use 复盘 1.0 如何收拢浏览器操作工具

**工程复盘标注 11 月 20 日，1.0 于 11 月 10 日发布。** Browser Use 将 0.x 的 24 种独立操作收拢到一个保留运行状态的 Python 环境，方便智能体把多个浏览器动作组织在一起。团队报告，在自家的 BU Bench v2.1 上，同三个模型的分数提高了 14 至 33 分。每款模型只运行了一次，分差反映整版更新。

🔗 [Browser Use 工程复盘](https://browser-use.com/posts/browser-use-1-0) · [1.0.0 发行记录](https://github.com/browser-use/browser-use/releases/tag/1.0.0)

### 补充：Runway 披露内部智能体软件交付数据

**原文标注 11 月 20 日。** Runway 介绍了公司把云端智能体接入代码修改和评审的过程。据其内部统计，已合并的 PR 中，由云端智能体推动的比例从 6 月的 0.1% 升至 10 月的 38%。首次审批等待时间的中位数从 9 月的两小时以上降至 11 月中旬约五分钟。

🔗 [Runway 工程博客](https://runwayml.com/news/engineering/building-a-software-factory)

### 补充：OpenHands 公布自家容器镜像的漏洞修补流程

**原文标注 11 月 19 日。** OpenHands 介绍了如何从自家部署清单识别容器镜像，交叉比对两款扫描器的结果，再由智能体提出依赖升级或镜像重建 PR。公司称，风险较低的变更可在检查通过后自动合并，其余由人员审阅，团队跟踪补丁是否随部署生效。

🔗 [OpenHands 工程博客](https://www.openhands.dev/blog/automating-cve-remediation-with-openhands)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
