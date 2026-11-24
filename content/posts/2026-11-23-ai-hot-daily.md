---
title: "AI 热点日报 | 2026年11月23日"
date: 2026-11-23T00:00:00+08:00
publishDate: 2026-11-23T08:08:53+08:00
lastmod: 2026-11-24T08:07:58+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-23
description: 2026年11月23日 AI HOT 滚动精选，关注智谱 GLM-5.4、Gemini Notebook 交互网站、MiniCPM 本地文档实测、OpenAI 困惑度提议、黎曼猜想形式化核验、多模型协作、Beam 售货测试、加州对 OpenAI 提起诉讼、英伟达恢复黄仁勋职务与购物智能体测试。
aihot_ids: ["g3vdho0vzm8rzriiz5grruy3m", "r7kb35fpdwc1m2iqsmd310tdj", "hz782dpcwhurj6584rtd13eaf", "w0ka422uzqyautrrsmzlmk9iq", "d4hhqnlmrclsx7d6idtvq95wz", "dlnrpd7xq39i5gkkti3hic390", "t1ol5cc73f6teh8f32wvri1cn", "ajcxs84uezjqgsgxpdtr31o0l", "qkxvs90ewfu3k430sdefndv56"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 10 条。本次取材截止北京时间 11 月 24 日 08:01，补查 23 日晚间收录。

---

## 模型与产品

### 智谱发布首款采用 Loop Transformer 的旗舰模型 GLM-5.4

**11月23日 22:06 补充。** 智谱于 11 月 23 日发布 GLM-5.4。模型在 7500 亿参数基座上让同一组 28 层共享权重、运行两轮，在参数量不变的情况下增加计算深度。官方技术说明还展示了用代码生成视频、在 FreeCAD 中构建六轴机械臂模型等案例。

GLM Coding Plan 用户已可使用。智谱表示，通用 API 将在安全评估后上线，模型权重计划后续开放。

🔗 [智谱发布原文](https://mp.weixin.qq.com/s/D-IZr-QaT1or_chminK8IQ) · [Z.ai 技术说明](https://z.ai/blog/glm-5.4)

### 补充：用户实测 MiniCPM5-2B 在 Mac 本地读取体检报告

**原帖发布于 11 月 19 日，面壁智能于 11 月 22 日引用，23 日凌晨收录。** 一位开发者在搭载 M4 Pro 的 Mac 上用 Mirobody 1.6.1 处理一份 14 页体检报告，由 GLM-OCR 识别文档、MiniCPM5-2B 回答问题。首次导入漏掉了 3 页含扫描图的化验单。作者把这三页转成图片逐页导入，核对后称 58 行数值均与原件一致，其中 20 行匹配到 LOINC 标准编码。模型找全了报告标出的 5 项超范围指标，同时把一项处在参考范围内的读数误报为超范围。Mirobody 1.6.2 已修复带页眉页脚的扫描页漏送 OCR 的问题。

🔗 [开发者实测原帖](https://x.com/cxjwin/status/2123256763340444007) · [面壁智能引用](https://x.com/OpenBMB/status/2124461770043785636) · [Mirobody 1.6.2 修复记录](https://github.com/thetahealth/mirobody/pull/327)

### 补录：Gemini Notebook 可将笔记资料生成交互网站

**11月23日 22:06 补充。谷歌原公告标注 11 月 16 日，AI HOT 于北京时间 11 月 17 日收录。** 用户可以在笔记本的聊天窗口描述想做的数据看板或项目进度表，让 Gemini Notebook 根据已有资料生成交互页面。谷歌的 11 月 18 日更新注明，功能面向年满 18 岁的网页用户逐步推出。

谷歌帮助文档说明，通过链接分享生成页面时，接收者需要有整个笔记本的访问权限。单独分享页面文件可以使用下载功能。

🔗 [Google Labs 发布原文](https://blog.google/innovation-and-ai/products/gemini-notebook/interactive-sites/) · [Google Workspace 上线说明](https://workspaceupdates.googleblog.com/2026/11/transform-your-notes-and-research-into-dynamic-tools-with-Gemini-Notebook.html) · [谷歌帮助文档](https://support.google.com/gemininotebook/answer/18945748?hl=en)

## 开发与研究

### 补充：OpenAI 首席科学家建议用困惑度追踪预训练进展

**原文发布于 11 月 22 日，23 日凌晨收录。** OpenAI 首席科学家 Jakub Pachocki 建议，不同模型开发商可以尝试用困惑度衡量预训练进展，并据此讨论何时需要加强安全评估。困惑度越低，模型平均越能预测下一个 token。OpenAI 在文中公开了从 GPT‑3.5 起在同一份内部代码留出集上测得的一组对数困惑度。Pachocki 指出，各家训练数据和评测集不同，分数如何跨机构比较仍待解决。

🔗 [OpenAI 原文与测量图表](https://openai.com/index/perplexity-and-intelligence/)

### 进展：黎曼猜想形式化核验扩展至两条等价不等式

继[Lean 与 Mathlib 社区确认 Alpöge 的形式化证明](/posts/ai-hot-2026-11-22/#进展黎曼猜想证明的独立重建与逐模块复核通过)后，MIT 数学家 Andrew Sutherland 于北京时间 11 月 23 日 00:20 更新核验记录。记录显示，核验者将原证明与一套独立的 Lean 形式化相结合，推出与黎曼猜想等价的 Robin 不等式和 Lagarias 不等式，并用 con-leche、con-ron 等工具核验组合后的导出文件及命题。该组合的完整 Comparator 核验仍在运行。克雷数学研究所仍将黎曼猜想列为「未解决」。

🔗 [Sutherland 的核验记录](https://math.mit.edu/~drew/grh/) · [克雷数学研究所问题页面](https://www.claymath.org/millennium/Riemann-Hypothesis/)

### 卡兹克分享 Claude、Codex 与 Gemini 的协作流程

数字生命卡兹克在 11 月 23 日发布的文章中介绍，他用 Claude 拆解需求和验收，遇到较大的架构决策就让 Claude 和 Gemini 各自出方案。Gemini 只拿原始需求和必要背景，Claude 核对建议后汇总，作者自己拍板。作者也让 Gemini 复核交互和文案，再把接口已定的后端和算法工作交给 Codex，由 Claude 检查改动并跑测试。

🔗 [数字生命卡兹克公众号原文](https://mp.weixin.qq.com/s/gwj0xLNHPfToQnQJN7IkMA)

### 补充：Reflection 公布 Beam 智能体的办公室售货测试

**11月23日 14:07 补充。原文标注 11 月 20 日，23 日由 AI HOT 收录。** Reflection 与 Andon Labs 在纽约和旧金山办公室测试 Beam。智能体负责选品、定价、下单和处理客诉，实物收货和补货由员工完成。Reflection 公布的纽约试点记录显示，10 月 8 日至 30 日共有 23 条人工介入记录，其中 12 条涉及财务监督或流程纠正，包括补查已收款但尚未向供应商下单的交易。

测试中，一条未经核实的人员变动消息被写入长期记忆，影响了智能体接下来数天的操作。Reflection 据此提出，评测还应检查哪些信息被写入记忆，以及会产生实际后果的工具调用是否符合规则。

🔗 [Reflection 官方测试报告](https://reflection.ai/blog/mr-beam-partnering-with-andon-labs)

## 行业动态

### 补录进展：加州总检察长因模型测试安全措施起诉 OpenAI

**11月23日 22:06 补充。加州司法部公告标注当地时间 11 月 16 日，AI HOT 于北京时间 11 月 17 日收录。** 继今年 7 月的 [Hugging Face 事件](/posts/ai-hot-2026-10-11/)后，加州总检察长 Rob Bonta 向旧金山高等法院提起民事诉讼。加州方面指控，OpenAI 对先进模型的测试缺乏充分的隔离和监督，构成公共妨害并违反加州《不公平竞争法》。

OpenAI 发言人向 Axios 表示，公司已发布多份报告、通知受影响机构，并在事件后加强了防护措施。

🔗 [加州司法部原始公告](https://oag.ca.gov/news/press-releases/it%E2%80%99s-golden-state-not-wild-west-attorney-general-bonta-sues-openai-over) · [Axios 报道及 OpenAI 回应](https://www.axios.com/local/san-francisco/2026/11/16/california-openai-lawsuit-hugging-face-hack)

### 进展：英伟达董事会恢复黄仁勋的总裁、CEO 和董事职务

**11月24日 08:07 补充。** 英伟达 11 月 23 日在美国发布公告。提交给美国证券交易委员会的 8-K 文件显示，董事会于当地时间 11 月 22 日一致同意恢复黄仁勋的三项职务，立即生效。此前[兼任临时 CEO 的 Colette Kress](/posts/ai-hot-2026-11-12/)继续担任执行副总裁兼首席财务官，Harvey C. Jones 仍任董事长。英伟达表示，独立董事此前启动的调查将继续。

🔗 [英伟达公告](https://nvidianews.nvidia.com/news/nvidia-board-reinstates-jensen-huang-as-president-ceo-and-board-director) · [SEC 8-K 文件](https://www.sec.gov/Archives/edgar/data/1045810/000104581026000090/nvda-20261122.htm)

### a16z 实测购物智能体如何筛选商品

**11月24日 08:07 补充。** a16z 与 The Prompting Company 在 11 月 23 日公布一组购物实验，涵盖 1,270 条提示词和 11,307 次完成的智能体运行。在 Grok Bot、Muse、Instinct 和 Dots 的对照中，一个智能体选中的商品有 73% 的概率也被至少一个其他智能体选中。加入发质、使用频率等具体要求后，部分问题的首选会改变。这些数字统计的是测试中的推荐，研究另用消费数据观察实际交易。

🔗 [a16z 联合测试原文](https://www.a16z.news/p/welcome-to-the-b2a-economy-how-agents)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
