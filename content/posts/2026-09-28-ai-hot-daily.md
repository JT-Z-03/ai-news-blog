---
title: "AI 热点日报 | 2026年9月28日"
date: 2026-09-28T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-09-28
description: 2026年9月28日 AI HOT 要闻。H Company 发布 Holo4 计算机使用模型；xAI 推出团队共享智能体；NVIDIA 发布智能体安全平台；MIT 借助 AI 改进 RNA 疫苗配方。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)，按北京时间 9 月 28 日收录的条目整理，并核对发布方、研究机构及独立评测机构的原文。产品功能、基准成绩和研究结果均按各自证据范围表述。

---

## 模型发布/更新

### H Company 发布 Holo4 计算机使用智能体模型

H Company 发布 Holo4 系列，包括 27B 稠密模型与 35B-A3B 混合专家模型，并更新了较小的 Holotron4 Nano。公司称，Holo4 能在图形界面、代码、MCP 和 API 之间选择操作方式；两款 Holo4 模型已提供 API，权重及部分运行轨迹也已公开。

在公司公布的 OSWorld 2.0 测试中，Holo4 27B 得分为 61.7%，35B-A3B 为 30.9%。这些是发布方使用其测试设置报告的成绩，不宜直接当作不同模型在所有真实工作流中的表现。

🔗 [H Company：Holo4 发布说明](https://huggingface.co/blog/Hcompany/holo4)

---

### Artificial Analysis：Claude Sonnet 5.5 在其智能指数中升至第二

独立评测机构 Artificial Analysis 9 月 28 日公布的测试显示，Claude Sonnet 5.5 在最高 effort 设置下取得智能指数 56 分，比 Sonnet 5 高 18 分，在该机构当时的榜单中位列第二。报告同时指出，这一设置的单任务输出 token 用量约为 19.3 万，是其测得的最高水平；更高的榜单分数并不等于更低的使用成本。

评测使用的是发布前部署版本，机构说明其中存在可能影响结构化输出请求的缺陷，计划重新运行相关测试。因此，这里只引用该机构截至 9 月 28 日公布的测试结果。

🔗 [Artificial Analysis：Claude Sonnet 5.5 评测](https://artificialanalysis.ai/articles/claude-sonnet-5-5)

---

## 产品发布/更新

### xAI 推出供团队共享的 Team Bots

xAI 发布 Team Bots，允许团队围绕岗位或工作流共享 Grok Bot。官方介绍中，一个 Team Bot 可组合文件与指令、应用插件、第三方 API 凭据和记忆；它也能以独立身份加入 Slack 频道。共享的是团队技能与工作背景，每位成员与 Bot 的对话及个人记忆仍分别保留。

Team Bots 目前面向 Teams 和 Enterprise 计划提供公开测试。以上是 xAI 公布的产品机制与开放范围，尚不能据此判断它在具体团队中的实际成效。

🔗 [xAI：Team Bots 发布说明](https://x.ai/news/team-bots)

---

### NVIDIA 发布面向智能体的分层安全平台

NVIDIA 介绍 Open Agent Safety Platform：开源运行时 OpenShell 将智能体放入沙箱，并按文件、网络、工具、进程和凭据等权限执行策略；可选的 NVIDIA Sentry 则借助 BlueField 硬件提供独立的监测与执行层。官方把它定位为软件与硬件结合的参考架构。

OpenShell 已作为开源项目提供。硬件监控层依赖相应基础设施；发布说明描述的是平台设计与提供的组件，并未证明所有部署环境都已具备相同防护效果。

🔗 [NVIDIA Technical Blog：Open Agent Safety Platform](https://developer.nvidia.com/blog/nvidia-open-agent-safety-platform-a-reference-for-continuous-in-silicon-agent-monitoring/)

---

## 论文研究

### MIT 用小样本算法筛选耐热 RNA 疫苗配方

MIT 研究人员用机器学习算法，在少量实验数据基础上调整包裹 RNA 的脂质纳米颗粒辅料配比。MIT 报道称，研究团队将所得配方制成并干燥后，在室温保存一年或 37°C 保存两个月；使用这些颗粒制备的疫苗在小鼠实验中仍产生了与对照配方相近的免疫反应。

研究发表于《Nature Biotechnology》。这里的稳定性与免疫结果来自实验室和小鼠测试，不代表相关疫苗已获批、已开展人体试验或能按同样条件进入实际运输和接种流程。

🔗 [MIT News：耐热 RNA 疫苗配方研究](https://news.mit.edu/2026/new-formulation-helps-rna-vaccines-withstand-high-temperatures-0928)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.virxact.com）*
