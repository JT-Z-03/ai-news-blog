---
title: "AI 热点日报 | 2026年9月25日"
date: 2026-09-25T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-09-25
description: 2026年9月25日 AI 圈要闻。Claude 开放插件目录提交门户，GitHub 介绍 Copilot app 的可定制 canvas；Cognition 宣布年化收入运行率突破 10 亿美元，Anthropic 发布 Claude 参与九圈振幅计算的研究复盘。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)，按北京时间 9 月 25 日整理，并核对厂商公告、产品教程与研究原文。本期关注 AI 工具的扩展与交互方式，以及公司披露和科研结果各自的证据边界。

---

## 产品发布/更新

### Claude 开放插件目录提交门户，开发者可追踪审核与使用情况

Anthropic 宣布，付费 Claude 计划的开发者可通过新门户向 Claude 目录提交插件。提交形式包括指向远程服务器的单个 MCP 连接器，或托管在 GitHub 上、组合 MCP 服务与 Agent Skills 的插件包；Claude Code 插件还可包含命令、钩子、语言服务和智能体。

门户提供提交时的自动校验与安全扫描、审核状态和反馈；插件通过审核后，由开发者决定何时发布。上线后，开发者可查看安装量、目录浏览和搜索数据。Anthropic 表示，未来数周将逐步统一 Claude 与 Claude Code 的发现入口；这是后续计划，不能写成已经全量上线。

🔗 [Claude：Build plugins for Claude](https://claude.com/blog/build-plugins-for-claude)

### GitHub 演示用 canvas 为 Copilot app 创建可共同操作的界面

GitHub 的新手教程介绍了 Copilot app 的 canvas：它可以是看板、问题分诊板或发布清单，用户和智能体都能通过同一界面更新状态。教程示范在智能体会话中调用 `/create-canvas`，描述界面要支持的工作流程及双方各自可执行的操作，再继续调整生成的界面。

教程称，创建后的 canvas 可保存为个人或项目扩展，以便再次使用。这是一篇产品使用指南，不是关于所有工作流程都能自动构建成功的测试结论；实际效果仍取决于具体需求和配置。

🔗 [GitHub Blog：How to build custom workflows with canvases](https://github.blog/ai-and-ml/github-copilot/github-copilot-app-for-beginners-how-to-build-custom-workflows-with-canvases)

---

## 行业动态

### Cognition 称年化收入运行率突破 10 亿美元

开发 Devin 的 Cognition 在 9 月 25 日宣布，公司的年化收入运行率已超过 10 亿美元。公告称，Devin 已服务 GE Aerospace、Rivian、Rohlik 和 Exa 等企业的工程团队。

“年化收入运行率”是按当前收入速度推算一年的指标，并非已经确认的过去 12 个月收入。原公告没有提供完整财务报表或独立审计材料，因此这一数字应视为公司自述，不能据此推断利润、留存或客户的实际投入产出。

🔗 [Cognition：Cognition Crosses $1B in Annualized Revenue Run Rate](https://cognition.com/blog/1b-run-rate)

---

## 论文研究

### Claude 参与完成理论物理九圈振幅计算，原挑战者复盘验证过程

Anthropic 发布物理学家 Matt von Hippel 的客座文章，回顾团队借助 Claude Science 和 Fable 5.1 计算平面 N=4 超对称 Yang–Mills 理论中六粒子九圈散射振幅的过程。文章称，Claude 分别采用原有 bootstrap 方法和间接的 form-factor 方法求解；按终端用户计费估算，每种方法约需一两千美元。

物理学家 Lance Dixon 对结果做了独立核验。文章同时披露，宋贺团队也已计算出该九圈振幅的一部分，并使用 AI 辅助处理若干约束。这项成果针对特定理论模型和计算问题，不能直接外推为 Claude 已解决一般物理学问题；文章的客座作者由 Anthropic 邀稿并获得报酬。

🔗 [Anthropic Research：Yes, Claude can do Nine Loops](https://www.anthropic.com/research/yes-claude-can-do-nine-loops)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.virxact.com）*
