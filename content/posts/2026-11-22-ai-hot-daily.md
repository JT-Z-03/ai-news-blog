---
title: "AI 热点日报 | 2026年11月22日"
date: 2026-11-22T00:00:00+08:00
publishDate: 2026-11-22T08:05:36+08:00
lastmod: 2026-11-22T22:07:11+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-22
description: 2026年11月22日 AI HOT 滚动精选，关注 Lean 与 Mathlib 社区对黎曼猜想形式化证明的核验、Together AI 接入 Qwen4-Max，以及推理服务商的提示词泄露通报与 OpenRouter 处置。
aihot_ids: ["rlj39tzyujneo0u35iyrfb4uc", "xqe6lbb5zsjp9xbsc1o912cs0", "ikpixx0j7414se1f6lww2csek"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 3 条。本次取材截止北京时间 11 月 22 日 22:01。

---

## 模型与产品

### 补充：Together AI 接入 Qwen4-Max，公布 Tornado 整仓测试

**公告标注 11 月 21 日。** 继[阿里介绍 Qwen4-Max](/posts/ai-hot-2026-11-16/)后，Together AI 宣布其无服务器推理服务已支持该模型。该公司用一个已有修复的 Tornado 缺陷做了单次复测，把问题描述和 344 个文件一次送入模型，输入约 65.3 万 token。Together AI 称，模型给出的补丁通过了维护者的两项回归用例和 Tornado 的 1,673 项全套测试。

🔗 [Together AI 上线公告与测试说明](https://www.together.ai/blog/qwen4-max) · [Together AI 模型页](https://www.together.ai/models/qwen4-max)

## 开发与研究

### 进展：黎曼猜想证明的独立重建与逐模块复核通过

**11月22日 14:05 补充。** 继[本站报道两套独立内核接受完整的证明导出文件](/posts/ai-hot-2026-11-21/#进展数学家-levent-alpöge-发布黎曼猜想证明主张和-lean-文件)后，MIT 数学家 Andrew Sutherland 于北京时间 11 月 22 日 12:35 更新核验记录。核验团队在另一台机器的隔离环境里从公开源码重新构建，得到的证明导出文件与公布版本逐字节相同。另一个独立检查器 lean4lean 也核验了全部 175,187 个编译模块。

Sutherland 的午间记录显示，他的完整 Comparator 检查和使用 Lean 内核复核导出证明的工作当时仍在进行。

**11月22日 22:07 补充。** Lean 和 Mathlib 社区在标注 11 月 21 日的联合声明中确认了 Alpöge 的形式化证明。核验者用 Comparator 和 con-leche 分别比对，确认 Alpöge 证明的命题与 Mathlib 对黎曼猜想的标准表述一致。声明称，导出证明通过了 Lean 官方内核和多个独立检查器的核验。克雷数学研究所仍将黎曼猜想列为「未解决」。

🔗 [Lean 与 Mathlib 社区联合声明](https://leanprover-community.github.io/blog/posts/riemann-hypothesis/) · [Sutherland 的核验记录](https://math.mit.edu/~drew/grh/) · [克雷数学研究所问题页面](https://www.claymath.org/millennium/Riemann-Hypothesis/)

## 行业动态

### 进展：Together AI 确认部分推理提示词样本泄露

**官方通报标注 11 月 21 日。** 继[Dragos 公布推理服务链调查](/posts/ai-hot-2026-11-21/)后，Together AI 证实，该公司的部分测试用提示词样本因内部凭据外泄被未经授权的一方下载。样本来自今年 6 至 7 月提交给其无服务器推理服务的部分请求，其中部分测试凭据来自 Dragos 的调查。Together AI 表示，仍在核查受影响样本所含的客户数据，并已将零数据留存设为新账号的默认设置。

**11月22日 22:07 补充。** OpenRouter 在标注 11 月 22 日的公告中表示，平台已下架三家推理服务商，取消了 125 个端点的零数据留存（ZDR）资格，并通知了可能受影响的客户。取消资格的端点中包括出于预防而移除的端点。OpenRouter 正在核查请求和响应是否被转发给第三方，相关端点须经验证才能恢复 ZDR 资格。

🔗 [Together AI 官方事件通报](https://www.together.ai/blog/security-event-prompt-leakage-for-requests-in-june-and-july-of-2026) · [OpenRouter 官方处置公告](https://openrouter.ai/blog/announcements/data-processing-incidents-on-inference-providers/)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
