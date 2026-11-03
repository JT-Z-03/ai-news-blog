---
title: "AI 热点日报 | 2026年11月2日"
date: 2026-11-02T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-02
description: 2026年11月2日 AI HOT 要闻。腾讯混元公开 Hyra 研究产物与两款蛋白质模型，OpenAI 推出电网需求响应计划；Addy Osmani 分享 Claude Code 当前回合提高推理努力的技巧。
---

> 数据来源 [AI HOT](https://aihot.news/)，按北京时间 11 月 2 日整理并核对原始来源。本期收录 3 条，关注科研模型公开、电力基础设施与编程工具用法；仅有日期、无法确认落入当天时间范围的消息不计入本期。

---

## 产品发布/更新

### 腾讯混元公开 Hyra 研究产物，发布两款蛋白质模型

11 月 2 日，腾讯混元在 Hyra 官方成果仓库中公布 HyInv 和 HyPLM-Flash，提供权重、推理代码与技术报告。HyInv 是约 196 万参数的蛋白质逆折叠模型，用于从目标骨架生成序列；HyPLM-Flash 是约 6.5 亿参数的蛋白质语言模型，配套 INT8 GPU 推理引擎。

官方说明，这些模型由研究智能体 Hyra 2.0 训练。HyInv 可在 CPU 或 GPU 上运行，HyPLM-Flash 的部署需要 CUDA GPU。本条记录具体模型与复现材料的公开，性能比较仍须结合项目报告中的硬件、精度和测试条件，不据此断言整套科研过程已无需人工参与。

🔗 [腾讯混元官方 Hyra 成果仓库与模型材料](https://github.com/Tencent-Hunyuan/Hyra-results)

---

## 行业动态

### OpenAI 推出 Grid Protectors，计划让计算园区参与电网削峰

OpenAI 宣布推出 Grid Protectors Program，与公用事业公司、监管机构和政策制定者协商，让未来计算园区在电网承压时减少用电。各地安排将分别约定削减多少需求、响应速度与持续时间；具备条件的园区还可能利用现场发电或储能支持电网。

公司计划以佐治亚州 Effingham County 园区作为试点。与 Georgia Power 的既有协议包含最高 1,000 兆瓦的灵活需求响应，并约定由项目承担所需基础设施和供电成本。园区仍在开发，这次公布的是推广计划，不能把协议额度写成已经实现的削峰能力，也不能把预期收益当作已兑现的居民电费下降。

🔗 [OpenAI 官方 Grid Protectors 计划公告](https://openai.com/index/grid-protectors-program/)

🔗 [Georgia Power 对既有园区协议的说明](https://www.georgiapower.com/news-hub/press-releases/georgia-power-to-serve-openai-project-in-effingham-county.html)

---

## 技巧与观点

### Addy Osmani 分享 Claude Code 技巧，任务变难时提高当前回合推理努力

Addy Osmani 分享一项终端版 Claude Code 用法。如果任务进行中发现难度超过预期，可以在 Claude 工作时输入 `ultrathink`，提高本回合剩余部分的推理努力。原帖注明适用于最新版本，分享时间为北京时间 11 月 2 日凌晨。

这条消息讲的是已有功能的使用方法，所引用的功能回归公告发布得更早。调整范围限于当前回合的剩余部分，不能理解成永久修改所有会话的设置，也不代表任务一定能解决。

🔗 [Addy Osmani 原始技巧分享](https://x.com/addyosmani/status/2116986087390486816)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
