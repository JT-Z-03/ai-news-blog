---
title: "AI 写出数学证明以后，谁来解释它、确认它、获得署名？"
date: 2026-09-14T01:05:00+08:00
draft: false
tags: ["AI科研", "数学", "OpenAI", "Lean", "学术贡献"]
categories: ["深度分析"]
slug: "ai-math-proof-credit"
description: "OpenAI 公布 Navier-Stokes 结果及 Lean 形式化工程，数学家同时公开研究与发布经过。证明的逻辑检查、可读性和贡献归属，需要各自的证据。"
---

数学家 Tristan Buckmaster 在一份公开声明里写到，他与 Levent Alpöge 的证明通过 Lean 验证以后，两人还在持续工作，试着理解它，把它改成人能读懂的论文。

我把这份声明、OpenAI 的发布说明和公开证明工程对照了一遍。最让我在意的是这个先后顺序。机器已经能够检查一份证明，人还要花时间弄清它为什么有效、怎样向同行解释。AI 加速研究以后，这段工作仍然需要有人完成。

9 月 8 日，OpenAI 公布了 Navier-Stokes 方程的研究结果，同时提供证明文稿与 Lean 形式化工程。相关讨论很快涉及学术贡献和发布过程。读这些材料，首先要把数学结果说准确，随后才能判断人和模型分别做了什么。[OpenAI 发布说明](https://openai.com/index/navier-stokes-solution/)

## 带外力这几个字不能省

OpenAI 公布的结果涉及带光滑外力的三维不可压缩 Navier-Stokes 方程。项目说明列出全空间与周期空间两种情形，分别对应克雷数学研究所问题表述中的 C、D 两项。

这些字母很容易在新闻里被跳过，却直接决定成果的范围。Fefferman 撰写的[官方问题说明](https://www.claymath.org/wp-content/uploads/2022/06/navierstokes.pdf)允许研究者证明四项陈述中的一项。A、B 讨论无外力情况下的全局光滑解，C、D 则允许构造满足规定条件的光滑外力，证明相应的全局解不存在。

因此，带外力并不自动意味着偏离了原题；它确实在正式题目允许的路径中。但一个带外力的结果，也不能直接回答无外力时会发生什么。把条件删掉，标题会更短，读者理解的命题却变了。

还要分清 Navier-Stokes 与 Euler。官方说明中，两者的一个基本区别是黏性项是否为零。Buckmaster 与 Alpöge 公布的 Euler 工作、OpenAI 公布的 Euler 工作，以及 Navier-Stokes 结果，各有具体条件。只用“同一道千禧年难题”概括所有人的工作，会抹掉这些差别。

## 能编译的证明还需要检查什么

OpenAI 的[公开工程](https://github.com/openai/NavierStokesAndEuler)给出了 Lean、Mathlib 和 Lake 的构建入口，也提供单独的 Comparator 检查说明。这让外部研究者有机会检查发布材料，而不必只相信一份公司公告。

Lean 的作用可以从它怎样接受一个定理讲起。证明要满足系统中的形式规则，使用的定义、前提与推导都进入检查范围。但检查器面对的是已经写进代码的命题。代码里的命题是否准确表达了论文和新闻声称的结果，仍需要人对照。

[Lean 官方文档](https://lean-lang.org/doc/reference/latest/Axioms/)还解释了一个容易漏掉的细节。系统允许声明公理，未完成的证明也可以暂时使用 `sorry`。所以，看见工程完成构建，还应追问最终定理依赖了哪些公理，有没有未完成的证明进入依赖。

这是一项通用检查要求，不能据此暗示本次工程存在漏洞。本文核对了公开说明，没有重新运行整套形式化验证，也不为数学证明作独立认证。

本次 [Comparator 说明](https://github.com/openai/NavierStokesAndEuler/blob/main/ComparatorChallenges/README.md)有一条很具体的致谢。团队采用并调整了 Google DeepMind Formal Conjectures 项目对 Navier-Stokes 问题的形式化表述。连“究竟要证明什么”都已经有人先做了一部分工作。检查成果时，这种前置贡献也应当被看见。

## 验证以后，解释才有机会继续

Buckmaster 在[原始声明](https://cims.nyu.edu/~tristanb/statement.pdf)中把自己的研究放回了一段较长的历史。他说，基本思路来自 Diego Córdoba 和 Luis Martínez-Zoroa 已有的研究路线，他与 Alpöge 借助多个大模型，把工作推进到新的条件和方程上。这是两人的个人合作，并非两家雇主之间的正式项目。

他同时承认，部分文稿离适合人阅读的论文还有距离。这个细节比一句“AI 会证明了”具体得多。形式推导可以很长，审稿人需要知道关键构造在哪里，哪些假设起了作用，结论能否用于后续研究。学生也需要一条能够学习的论证路径。

我的判断是，AI 生成的证明越多，解释工作的价值越容易被低估。一个人花时间把冗长推导整理成可理解的论证，可能没有新增定理，却让其他人能够检查、教学和继续使用这项成果。这些工作需要在评价研究时被明确记录。

否则，赶着公布结果的人获得关注，慢慢整理定义、补背景和回答同行疑问的人承担后续负担。研究团队需要提前约定谁负责这些工作，以及怎样承认他们的贡献。

## 一份声明无法裁定全部署名争议

这次发布还有另一组材料。Buckmaster 对与 OpenAI 沟通的过程提出异议，也谈到自己的草稿曾进入 Codex。他明确表示，自己不知道那些数据是否被使用。OpenAI 在 9 月 10 日更新中则称，调查确认相关用户提示不可能影响此次系统，包括通过训练影响系统。

两边的材料能证明双方作了怎样的陈述，不能直接代替外部调查。把疑问写成已经发生的数据盗用，会越过现有证据。讨论研究关系时，可以继续要求更完整的过程记录，不必先替任何一方下判决。

公开材料已经足够支持一个更具体的要求。以后发布 AI 数学成果，团队应说明问题由谁选择，研究路径借鉴了什么，模型参与哪些步骤，谁修改了证明，谁核对最终命题。这些角色可能由同一人承担，也可能分散在多个项目里。写清实际工作，比笼统说“由 AI 完成”更有用。

OpenAI 的公告本身也描述了人的参与。团队调整研究方向，汇总不同智能体的中间结果，并继续给出提示。模型完成了大量工作，研究组织方式也影响了它最终得到什么。署名和致谢应该能够容纳这段过程。

对于普通读者，下一次看到类似成果，可以先顺着发布页找到正式命题，再看证明工程和检查说明。对于研究团队，我更希望看到一份随论文一起公开、能对应到具体工作和版本记录的贡献说明。那些花时间把证明变得可理解的人，应当在发表之前就知道自己的工作会如何被承认。

## 参考资料

- OpenAI，[Navier-Stokes 结果与并行研究说明](https://openai.com/index/navier-stokes-solution/)，含 9 月 10 日更新。
- Charles L. Fefferman，[克雷数学研究所官方问题表述](https://www.claymath.org/wp-content/uploads/2022/06/navierstokes.pdf)。
- OpenAI，[NavierStokesAndEuler 形式化工程](https://github.com/openai/NavierStokesAndEuler)。
- OpenAI，[Comparator 独立检查说明](https://github.com/openai/NavierStokesAndEuler/blob/main/ComparatorChallenges/README.md)。
- Lean，[公理与证明依赖文档](https://lean-lang.org/doc/reference/latest/Axioms/)。
- Tristan Buckmaster，[研究过程与发布争议声明](https://cims.nyu.edu/~tristanb/statement.pdf)。

> / 作者，ZestJT
