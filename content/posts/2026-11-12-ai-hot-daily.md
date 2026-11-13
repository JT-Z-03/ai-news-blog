---
title: "AI 热点日报 | 2026年11月12日"
date: 2026-11-12T00:00:00+08:00
publishDate: 2026-11-12T08:11:31+08:00
lastmod: 2026-11-13T08:04:54+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-12
description: 2026年11月12日 AI HOT 滚动精选，关注 OpenRouter 多语言本地化与智能体循环防护、Gemini Decisions API、Praxis-1、多智能体协调研究及 NVIDIA 管理层变动。
aihot_ids: ["r8hsm3m3munjwk1n3u885zszw", "bx3sq4dxfqblyztkuiktiz0wv", "z9u4n1e7zfapxjozcn97quhdp", "vq9nwgwhtm31cgoliyb7ydyde", "cve017k4le2q7l8x1bfr2xdjx", "qsbjbz754aodhcijq56puh6va"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 6 条；本次取材截止北京时间 11 月 13 日 07:59。

---

## 模型与产品

### NVIDIA 宣布首席执行官变动

**11月13日 08:04 补充。** NVIDIA 11 月 12 日宣布，黄仁勋已辞去总裁、首席执行官及董事职务，即时生效；首席财务官 Colette Kress 出任临时 CEO，同时继续担任 CFO。董事会将寻找永久继任者，Harvey C. Jones 获任董事会主席。

此前[本站报道](/posts/ai-hot-2026-11-09/)了 NVIDIA 董事会启动独立调查；此次公司公告没有给出离职原因或调查结论。

🔗 [NVIDIA 官方公告](https://nvidianews.nvidia.com/news/nvidia-announces-ceo-transition)

### OpenRouter 推出八种语言界面

**11月12日 22:06 补充。** OpenRouter 宣布网站本地化功能进入测试阶段，除英语外支持简体中文、西班牙语、巴西葡萄牙语、德语、法语、日语和韩语，可在账户菜单切换语言。

官方介绍，其翻译流程使用 GPT-6.1 Sol 翻译，再以同一模型的另一次调用对照英文检查。按文章中的规模估算，将 16,918 条英文字符串翻译为七种语言并核验一次约需 460 美元；该费用对应其特定流程和工作量。

🔗 [OpenRouter 官方介绍](https://openrouter.ai/blog/announcements/openrouter-in-8-languages/)

### OpenRouter 介绍智能体循环防护方法

**11月12日 14:09 补充。** OpenRouter 在教程中介绍如何限制 AI 智能体重复调用工具：检测相同调用的循环，并通过归一化调用参数识别仅有细微变化的重复请求。

教程还建议为单次运行设置步数和费用上限，并为 API 密钥设置信用额度；单独限制步数不能确保费用不会超出预算。这些是开发实践建议，实际阈值需要结合任务调整。

🔗 [OpenRouter 官方教程](https://openrouter.ai/blog/tutorials/ai-agent-infinite-loop/)

### Google 推出 Gemini Decisions API

**11月12日 08:11 补充。** Google 介绍由 Gemini Decision 1 驱动的 Decisions API，可对文本、图片、音频、视频和 PDF 等输入执行判断。官方称，单次请求可针对同一输入提出最多 1,000 个独立问题，支持是非判断、多选和按标准评分，并返回概率或置信度。

官方公布的端到端延迟为 150–250 毫秒，但该数字对应其文中最多 16K token 上下文的测试条件，不应直接推广到所有输入长度和使用场景。

🔗 [Google 官方介绍](https://blog.google/innovation-and-ai/technology/developers-tools/gemini-decisions-api/)

### Runway 开放 Praxis-1 权重与代码

**11月12日 08:11 补充。** Runway 于 11 月 11 日宣布开放 Praxis-1 的模型权重、推理及微调代码，采用 Apache 2.0 许可证。这是该机器人模型在此前面向合作伙伴早期测试后的新进展。官方介绍模型采用 27B 混合专家架构，联合预测视频和动作。

Runway 报告其在 RoboLab-120 的 1,200 次测试中取得 46.2% 成功率；这是厂商在特定评测条件下披露的结果。原文发布于 11 月 11 日，本站据次日收录补充。

🔗 [Runway 官方公告](https://runway.com/news/company-news/praxis-1-is-now-available)

---

## 研究进展

### Anthropic 比较多用户智能体的协调方式

**11月12日 08:11 补充。** Anthropic 于 11 月 11 日发布多智能体协调研究，比较由单个协调者处理多用户需求与各用户分别使用智能体的方式。研究称，在四类模拟环境中，测试的 Claude Opus 5 和 Sonnet 5 单一协调者表现优于各用户智能体组成的团队。

研究者开放了其中三个环境，组成 MAMUBench；结果限定于所测模型、任务和设置，不能据此推断所有多智能体团队均不如单一协调者。原文发布于 11 月 11 日，本站据次日收录补充。

🔗 [Anthropic 研究报告](https://alignment.anthropic.com/2026/worse-together/)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*