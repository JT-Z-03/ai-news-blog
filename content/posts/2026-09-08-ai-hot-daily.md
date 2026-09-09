---
title: "AI 热点日报 | 2026年9月8日"
date: 2026-09-08T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-09-08
description: 2026年9月8日 AI 圈要闻。ChatGPT Images 2.5 发布；Anthropic 巨额算力合同受到关注；OpenAI 公布 Navier–Stokes 证明，数学家同时讨论研究贡献与发布过程。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)，按北京时间 9 月 8 日整理，并核对链接原文。部分消息的收录时间晚于发布时间，本期按来源标注的发布时间归日。

---

## 模型发布/更新

### ChatGPT Images 2.5 发布，重点改善速度与连续编辑

OpenAI 发布 ChatGPT Images 2.5，称相较 Images 2.0，图像生成延迟最多降低 50%，并改善参考照片中的主体保真、局部修改和多轮编辑一致性。这是官方公布的改进幅度，具体体验仍取决于图像与任务。

配套功能包括用草图表达构图的 Sketch、图片模板、在图上直接添加编辑评论，以及分享提示词。官方表示，Images 2.5 开始向 ChatGPT、ChatGPT Work 和 Codex 的各档用户推送；API 同时提供 Flare 与 Sunburst，前者侧重速度，后者以更长生成时间换取细节控制。

🔗 [OpenAI 发布公告](https://openai.com/index/introducing-chatgpt-images-2-5/)

---

## 行业动态

### Anthropic 被报道在 11 个月内签下巨额算力合同

The Information 报道 Anthropic 在 11 个月内签署了规模达 5170 亿美元的算力协议。其公开页面可核对标题，全文需要订阅；The Decoder 的转述称，自 2025 年 10 月以来，公司新增锁定至少 14.8 GW 算力，并计划建设自有数据中心。

这里的金额是报道中的长期合同规模，不能理解为已经支付的现金；锁定容量也不等于已经投入运行的算力。转述还指出，不少合同延续到 2030 年之后，因此与其他公司某一年的容量目标直接比较并不准确。

🔗 [The Information 原始报道](https://www.theinformation.com/articles/anthropic-clinched-517-billion-compute-deals-11-months) ｜ [The Decoder 公开转述](https://the-decoder.com/anthropic-reportedly-signs-517-billion-in-compute-deals-after-dario-amodei-warned-rivals-about-reckless-risk/)

---

## 论文研究

### OpenAI 公布 Navier–Stokes 证明，关键条件是带光滑外力

OpenAI 宣布，内部 AI 系统给出了 Navier–Stokes 存在性与光滑性问题的解答，并公开证明文稿与 Lean 形式化仓库。官方描述的结果是：在光滑外力作用下，初始光滑的流体运动可以在有限时间形成奇点，对应千禧年问题表述中的 C、D 两种情形。这个条件需要保留，不能改写成无外力版本已被解决。

公司称，找到结果的小组约有一万个并发智能体，从首批启动到得到结果约用了 88 小时；随后通过 GPT-6 Astra 进行 Lean 形式化与验证，另耗时 17 小时。主要求解使用的是尚未公开、能力强于 Astra 的内部模型。

仓库说明与公告对研究范围的描述一致。本期核对了公告和仓库，未独立复现证明；这里记录的是 OpenAI 发布的研究结果及验证声明。公司同时表示，不打算申领该结果对应的千禧年奖金。

🔗 [OpenAI 研究公告与论文入口](https://openai.com/index/navier-stokes-solution/) ｜ [Lean 形式化证明仓库](https://github.com/openai/NavierStokesAndEuler)

---

## 技巧与观点

### 数学家公开合作与发布经过，强调成果范围和贡献归属

Tristan Buckmaster 在个人声明中介绍，他与 Levent Alpöge 公布了不可压缩多孔介质、Boussinesq 和三维不可压缩 Euler 方程在光滑外力下的有限时间奇点结果。他强调，这是两人的个人合作，使用过 Claude 和 Codex 等工具，并建立在 Diego Córdoba 与 Luis Martínez-Zoroa 的既有研究路线之上。

声明也讨论了与 OpenAI 的发布沟通。Buckmaster 明确表示，自己尚未看过 OpenAI 的证明，也不知道他们的数据是否被使用。OpenAI 在官方公告中则表示，公开发布前没有通过任何途径看到两人的工作，未为求解访问特定用户数据，并承认两人在带外力 Euler 研究上的优先贡献。双方对沟通过程的描述存在分歧，不能据此认定发生了抄袭或数据滥用。

这场讨论留下一个具体问题：形式化验证完成后，仍需要把论证整理成数学同行能理解和审阅的文章，并说明人类研究者、已有工作和模型各自的贡献。

🔗 [Tristan Buckmaster 原始声明（PDF）](https://cims.nyu.edu/~tristanb/statement.pdf) ｜ [OpenAI 对同期研究的说明](https://openai.com/index/navier-stokes-solution/)

---

*AI 热点日报 · 作者 钟懿 · 数据来源 AI HOT（aihot.virxact.com）*
