---
title: "AI 热点日报 | 2026年11月23日"
date: 2026-11-23T00:00:00+08:00
publishDate: 2026-11-23T08:08:53+08:00
lastmod: 2026-11-23T08:08:53+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-23
description: 2026年11月23日 AI HOT 滚动精选，关注 MiniCPM 本地文档实测、OpenAI 的困惑度提议、黎曼猜想形式化核验，以及卡兹克的多模型协作案例。
aihot_ids: ["g3vdho0vzm8rzriiz5grruy3m", "r7kb35fpdwc1m2iqsmd310tdj", "hz782dpcwhurj6584rtd13eaf"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 4 条。本次取材截止北京时间 11 月 23 日 08:02。

---

## 模型与产品

### 补充：用户实测 MiniCPM5-2B 在 Mac 本地读取体检报告

**原帖发布于 11 月 19 日，面壁智能于 11 月 22 日引用，23 日凌晨收录。** 一位开发者在搭载 M4 Pro 的 Mac 上用 Mirobody 1.6.1 处理一份 14 页体检报告，由 GLM-OCR 识别文档、MiniCPM5-2B 回答问题。首次导入漏掉了 3 页含扫描图的化验单。作者把这三页转成图片逐页导入，核对后称 58 行数值均与原件一致，其中 20 行匹配到 LOINC 标准编码。模型找全了报告标出的 5 项超范围指标，同时把一项处在参考范围内的读数误报为超范围。Mirobody 1.6.2 已修复带页眉页脚的扫描页漏送 OCR 的问题。

🔗 [开发者实测原帖](https://x.com/cxjwin/status/2123256763340444007) · [面壁智能引用](https://x.com/OpenBMB/status/2124461770043785636) · [Mirobody 1.6.2 修复记录](https://github.com/thetahealth/mirobody/pull/327)

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

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
