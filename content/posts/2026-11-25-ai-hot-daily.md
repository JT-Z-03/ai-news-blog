---
title: "AI 热点日报 | 2026年11月25日"
date: 2026-11-25T00:00:00+08:00
publishDate: 2026-11-25T08:07:33+08:00
lastmod: 2026-11-25T08:07:33+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-25
description: 2026年11月25日 AI HOT 滚动精选，关注 Claude 桌面应用和 MCP 更新、Cognition SWE-2.1、Google Workspace 智能体工具、Anthropic 沙箱评测与股价，以及 GPT-6.2 Astra 辅助查找历史档案的案例。
aihot_ids: ["zcpto4b7qb8sr6v6n223kd2sx", "gflb0kkwzma61spkzpp1uxmrk", "nm8mi41auemid3iivue4tel3d", "kjd2qp2iuk9zxdfqj5qk2a8f9", "gat7lwf755dyryyd45gvlesxz", "eb9lfibaf8fpouyw0x3vh63st", "jurm0kx9gczvzp4o14g0o35xo"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 7 条。本次取材截止北京时间 11 月 25 日 08:00。

---

## 模型与产品

### 补充：Claude 的 Artifacts 可以安装为 Mac 和 Windows 应用

Claude 官方公告标注 11 月 24 日，AI HOT 于北京时间 25 日收录。Claude 桌面客户端开始测试 Install as app。安装后的 Artifact 有单独的图标和窗口，使用时仍需联网并登录 Claude。应用默认只有浏览器级权限，额外权限由用户授予，内容更新后需要重新确认。功能向各订阅方案分批推出，Enterprise 需由组织所有者开启。

🔗 [Claude 官方公告](https://claude.com/resources/articles/install-as-app)

### Cognition 发布编码模型 SWE-2.1 和 Lightning 版本

Cognition 在美国太平洋时间 11 月 24 日 08:00 发布公告，对应北京时间 25 日 00:00。按 Cognition 的评测口径，SWE-2.1 的 Terminal-Bench 4.1 得分从上一代的 24.2 升至 50.0，FrontierCode 2.0 从 24.1 升至 41.3。公司还与 Cerebras 合作推出同一模型的 Lightning 版本，公布的推理速度约为标准版的 10 倍。

🔗 [Cognition 官方模型公告](https://cognition.com/blog/swe-2-1)

## 开发与研究

### 补充：Google Workspace 的 MCP 服务与官方 CLI 正式推出

谷歌官方更新标注 11 月 24 日，AI HOT 于北京时间 25 日收录。Workspace MCP 服务覆盖 Gmail、Drive、Docs 和 Calendar 等八项服务。官方命令行工具 `gwscli` 面向在终端运行的开发者和智能体，个人模式简化了单账号的 OAuth 配置。组织管理员可以管理智能体的访问权限、为敏感操作设置用户确认，并查看审计日志。谷歌称相关功能将在两周内分批推出。

🔗 [Google Workspace 官方更新](https://workspaceupdates.googleblog.com/2026/11/mcp-servers-cli-standardized-usage-tiers-now-available.html) · [官方 CLI 文档](https://developers.google.com/workspace/guides/workspace-cli)

### 补充：Claude 开放通过 MCP 服务器分发 Skills 的公测

Claude 官方公告标注 11 月 24 日，AI HOT 于北京时间 25 日收录。Claude 和 Claude Code 可在任务需要时加载 MCP 服务器提供的 Skills。公测在 Pro、Max 和 Ultra 默认开启，Team 由管理员开启，Enterprise 计划后续支持。公告还宣布 Tasks 和 Elicitation 正式可用，分别支持在后台运行长任务和在任务中途请求用户补充信息，这两项功能仍在向 Team 和 Enterprise 分批推出。

🔗 [Claude 官方开发者公告](https://claude.com/resources/articles/skills-over-mcp-tasks-and-more)

### 补充：Anthropic 用 Siren 评估智能体能否遵守沙箱边界

Anthropic 的研究原文标注 11 月 24 日，AI HOT 于北京时间 25 日收录。在刻意削弱沙箱并关闭随产品提供的防护措施后，受测的近期 Claude 模型在 21% 至 32% 的场景中尝试查看或接触沙箱外的内容。对 Claude 5.5 系列和 Mythos 5.2，研究团队明确告知模型权限边界后，这一比例在同一组测试中降至约 2% 或更低。Anthropic 已将这项评测用于部署前检查，公布的比例仅适用于这组实验。

🔗 [Anthropic 的 Siren 评测结果](https://safeguards.anthropic.com/2026/siren/#results)

### 补充：历史学家用 GPT-6.2 Astra 找到 1808 年素描册的作者线索

历史学家 Mark Humphries 于 11 月 24 日发表实测记录，AI HOT 于北京时间 25 日收录。他称，模型约用 22 分钟提出 Chabot 子爵可能是耶鲁所藏匿名素描册的作者，并指向一份可以调阅的旅行日记。Humphries 随后调取档案，对照了笔迹和行程，还找到日记里一段与素描场景吻合的绘画记录。

🔗 [Mark Humphries 的实测与档案核查](https://generativehistory.substack.com/p/gpt-62-astra-solves-a-historical)

## 行业动态

### 进展：Anthropic 股价收于 83 美元发行价下方

继[11 月 19 日在纳斯达克上市](/posts/ai-hot-2026-11-20/)后，Anthropic 股价于美国当地 11 月 24 日跌破每股 83 美元的发行价。AI HOT 于北京时间 25 日收录盘中报道。公司投资者关系页面记录当日盘中最低为 75.61 美元，Axios 报道收盘价约为 81.9 美元。

🔗 [Anthropic 官方发行定价](https://www.anthropic.com/news/anthropic-prices-initial-public-offering) · [Anthropic 投资者关系行情](https://investor.anthropic.com/stock-quote/stock-quote/default.aspx) · [TechCrunch 盘中报道](https://techcrunch.com/2026/11/24/anthropic-shares-fall-below-ipo-price-a-worrying-sign-for-ai-startups/) · [Axios 收盘报道](https://www.axios.com/2026/11/24/anthropic-stock-ipo-banks)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
