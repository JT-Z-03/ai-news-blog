---
title: "AI 热点日报 | 2026年11月28日"
date: 2026-11-28T00:00:00+08:00
publishDate: 2026-11-28T08:10:12+08:00
lastmod: 2026-11-28T14:04:24+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-28
description: 2026年11月28日 AI HOT 滚动精选，跟进黎曼猜想 Lean 证明的机器核验结果，并说明原版与精简版的命题比对范围。
---

> 取材参考 [AI HOT](https://aihot.news/) 及原始核验记录。本期为截至本次更新时间的精选，含必要迟到补充，共 1 条。本次取材截止北京时间 11 月 28 日 13:59。

---

## 开发与研究

### 补录：黎曼猜想的 Lean 证明完成复核，短版也通过机器检查

继[本站报道原版证明通过第一轮端到端核验](/posts/ai-hot-2026-11-24/)后，MIT 数学家 Andrew Sutherland 于北京时间 11 月 28 日 01:27 更新核验记录。此前尚在运行的 Lean 4.36.0 版 Comparator 于北京时间 11 月 26 日 05:49 通过，完成了对原版证明的命题比对、公理检查与内核核验。

北京时间 11 月 26 日凌晨公开的短版有可读版和紧凑版。按 Sutherland 的记录，两版都通过了严格模式的完整核验。可读版在内存较大的机器上通过。另一台机器因内存限制，核验人员主动停止了其中的 lean4lean 检查，该次运行未得出判定。核验还涵盖由紧凑版推出的 Schoenfeld 误差界，以及该界与黎曼猜想的等价性。克雷数学研究所仍在千禧年难题页面将黎曼猜想标为「Active」。

**11月28日 14:04 更正。** 短版的五条命题与原版的文字一致，顶层定义也相同。短版使用了较新的 Mathlib，部分底层依赖有差异。Sutherland 的团队尚未形式化核验两个 Mathlib 版本下这些命题的等价性。

🔗 [MIT 原版核验记录](https://math.mit.edu/~drew/grh/) · [MIT 短版核验记录](https://math.mit.edu/~drew/shortgrh/) · [短版 Lean 源码](https://github.com/lsernau/grh-lean) · [克雷数学研究所问题页面](https://www.claymath.org/millennium/Riemann-Hypothesis/)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
