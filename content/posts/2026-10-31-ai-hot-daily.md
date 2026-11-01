---
title: "AI 热点日报 | 2026年10月31日"
date: 2026-10-31T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-10-31
description: 2026年10月31日 AI HOT 要闻。Apple 公布中国 Apple 智能测试与千问合作安排，Claude 调整 Ultra 认证账号限额；Figma 介绍 Weave 工作流，Google 披露太空 TPU 推理，Wiz 汇总平台安全事件。
---

> 数据来源 [AI HOT](https://aihot.news/)，按北京时间 10 月 31 日整理并核对原始来源。本期收录 6 条，涵盖系统级 AI、订阅额度、创作工作流、太空计算、安全事件与常驻智能体；区分计划推出的功能、已有产品指南和原型试验。

---

## 产品发布/更新

### Apple 公布中国 Apple 智能测试安排，部分体验接入千问

Apple 宣布首批 Apple 智能核心功能将在中国推出，包括实时翻译、写作工具和照片消除等。公司还确认与阿里巴巴合作，在 Siri、写作工具和视觉智能的部分体验中支持千问，提供文本与图像理解等能力。

按公告时间表，这些功能将从 11 月 4 日起随最新 iOS 开发者 Beta 版开放测试，计划于 12 月随 iOS 27.3 正式推出。本轮不包含 Siri AI 及 WWDC 2026 宣布的其他下一代 Apple 智能功能，其他平台还需等待必要审批；具体设备与语言条件见官方说明。

🔗 [Apple 中国官方公告与功能开放范围](https://www.apple.com.cn/newsroom/2026/10/apple-intelligence-features-are-coming-to-users-in-china/)

### Claude 将 Max 20x 更名为 Ultra，调整认证账号的五小时限制

Anthropic 宣布调整 Claude 高阶订阅的命名：Max 5x 改为 Max，Max 20x 改为 Ultra，月费分别保持 100 美元与 200 美元，现有订阅者无需额外操作。公告同时宣布，向经过认证的 Ultra 账号取消五小时使用限制，从大多数现有订阅者开始实施。

新账号在完成认证前仍保留临时限制，取消后会收到邮件通知；每周使用额度保持不变。这次调整降低了特定账号在短时间内集中工作的限制，不等于所有账号立即生效，也不代表可以无限使用。

🔗 [Claude 官方套餐与额度调整公告](https://x.com/claudeai/status/2116220869479428500)

🔗 [Claude 官方套餐说明](https://claude.com/pricing)

### Figma 介绍 Weave 工作流，让创作过程可以重复运行

Figma 发布 Weave 使用指南，介绍如何用相互连接的节点组织图像与视频生成、编辑和比较。创作者可以从同一素材分出多条路径，尝试不同模型，再接入色彩校正、合成、裁剪和 Painter 等编辑节点，保留各次探索之间的关系。

这些流程还可以封装为 Weave tool，供团队成员重复调用，并与 Figma 画框连接。当天文章重点是已有平台的工作方法，相关产品联动和社区工具发布早已有介绍，不能将本篇指南当作 Weave 平台首次上线公告。

🔗 [Figma 官方 Weave 工作流指南](https://www.figma.com/blog/the-tldr-on-figma-weave/)

---

## 行业动态

### Google 披露 Suncatcher 原型卫星完成 TPU 推理

Google 首席执行官 Sundar Pichai 披露，Project Suncatcher 团队在原型卫星发射数周后，从地面发送指令，启动在轨 TPU 并运行提示词，随后收到了完整回应。公告展示的结果是一首俳句，说明这次试验完成了从指令发送、在轨执行到结果回传的流程。

这是原型计算试验的阶段进展，不能据此推断轨道数据中心已投入规模化服务。官方这则公告没有说明所运行的模型型号，也未宣称它是首个在太空运行的大语言模型；转发者对此的延伸说法不作为本条事实。

🔗 [Sundar Pichai 官方原始公告](https://x.com/sundarpichai/status/2116214866444943853)

### Wiz 梳理 AI 开发平台安全事件，提醒区分不同入口与影响

Wiz 研究团队发表十月安全事件汇总，梳理至少九个 AI 开发者平台在当月披露的事件，涉及凭据窃取与 AI 服务未授权调用等风险。文章将这些披露放在一起，讨论 AI 服务密钥和开发基础设施成为攻击目标的趋势。

这些事件的调查进展与影响范围各不相同，部分仍在分析中。汇总没有证明所有平台存在同一个漏洞、共享同一受影响依赖或遭遇同一攻击者；平台自述、Wiz 的直接观察与尚未证实的攻击归因，应分别看待。

🔗 [Wiz 原始安全事件汇总](https://www.wiz.io/blog/black-october-for-ai-developer-platforms)

---

## 技巧与观点

### OpenRouter 演示常驻智能体，兼顾定时检查、记忆与审批

OpenRouter 发布 TypeScript 教程，用 Agent SDK 搭建定时查看 Hacker News、筛选主题并生成摘要的智能体。示例将已处理的新闻 ID 与运行会话分别保存，使程序重启后可以继续未完成的任务，并通过步数、费用和 API 密钥额度限制控制运行开销。

需要向团队频道发消息的工具被设为先审批，暂停状态也会保留，批准或拒绝后再恢复。教程同时说明，写出摘要后若进程崩溃，仍可能出现重复记录；这是一套带有明确取舍的实现示例，不能当作已经保证任何场景都不重复、不丢失的托管服务。

🔗 [OpenRouter 常驻智能体原始教程](https://openrouter.ai/blog/tutorials/build-always-on-ai-agent/)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
