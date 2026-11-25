---
title: "AI 热点日报 | 2026年11月25日"
date: 2026-11-25T00:00:00+08:00
publishDate: 2026-11-25T08:07:33+08:00
lastmod: 2026-11-25T14:08:27+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-25
description: 2026年11月25日 AI HOT 滚动精选，关注千问 Go 代打电话、MAGI-2 与 Claude 更新、Cognition SWE-2.1、矩阵乘法预印本、预测智能体、OpenAI 预训练损失和 Copilot 招聘研究等。
aihot_ids: ["zcpto4b7qb8sr6v6n223kd2sx", "gflb0kkwzma61spkzpp1uxmrk", "nm8mi41auemid3iivue4tel3d", "kjd2qp2iuk9zxdfqj5qk2a8f9", "gat7lwf755dyryyd45gvlesxz", "eb9lfibaf8fpouyw0x3vh63st", "jurm0kx9gczvzp4o14g0o35xo", "cebavio3uyjwli5r3imsuq1si", "u71y2i8e6zhwauu7gpuyxrp4z", "w9zx5w4dj1xhxvjylbijskshq", "pdtslys0302mclldlo6l1dlr9", "yh9lmlhqwoc77d1ii1mvr5d6x", "youah0x28ti3a58sj8ku26rdy", "hyofqy3ukzks1eyr4bu317bez"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 14 条。本次取材截止北京时间 11 月 25 日 14:01。

---

## 模型与产品

### 补充：Claude 的 Artifacts 可以安装为 Mac 和 Windows 应用

Claude 官方公告标注 11 月 24 日，AI HOT 于北京时间 25 日收录。Claude 桌面客户端开始测试 Install as app。安装后的 Artifact 有单独的图标和窗口，使用时仍需联网并登录 Claude。应用默认只有浏览器级权限，额外权限由用户授予，内容更新后需要重新确认。功能向各订阅方案分批推出，Enterprise 需由组织所有者开启。

🔗 [Claude 官方公告](https://claude.com/resources/articles/install-as-app)

### Cognition 发布编码模型 SWE-2.1 和 Lightning 版本

Cognition 在美国太平洋时间 11 月 24 日 08:00 发布公告，对应北京时间 25 日 00:00。按 Cognition 的评测口径，SWE-2.1 的 Terminal-Bench 4.1 得分从上一代的 24.2 升至 50.0，FrontierCode 2.0 从 24.1 升至 41.3。公司还与 Cerebras 合作推出同一模型的 Lightning 版本，公布的推理速度约为标准版的 10 倍。

🔗 [Cognition 官方模型公告](https://cognition.com/blog/swe-2-1)

### 千问 Go 免费开放经用户授权的代打电话服务

**11月25日 14:08 补充。** 千问 App 于北京时间 11 月 25 日 12:32 公布，千问 Go 可在用户指定联系对象和要办的事并授权后代拨电话，支持预约拨打时间。官方给出的场景包括向餐厅询问能否预订包间和联系快递。

🔗 [千问 App 官方公告](https://mp.weixin.qq.com/s/jZumD5cprhI7bgmOI7mUEw)

### 补充：Sand.ai 公布同步生成音视频的 MAGI-2

**11月25日 14:08 补充。** Sand.ai 官方公告标注 11 月 24 日，AI HOT 于北京时间 25 日收录相关报道。MAGI-2 有 4,800 亿总参数，推理时激活约 280 亿参数。按官方说明，模型可以同步生成最长 30 秒的音视频，支持 1080p、每秒 25 帧，可同时使用图像、视频和音频作为参考。开源发布与技术报告计划后续提供。

🔗 [Sand.ai 官方发布原文](https://sand.ai/blog/magi-2)

### 进展：Claude 月度回顾转正，连接器开始测试文件传输

**11月25日 14:08 补充。** Claude 发布说明标注 11 月 24 日，AI HOT 于北京时间 25 日收录。继[今年 7 月推出测试版](/posts/ai-hot-2026-07-09/)后，月度回顾现已在网页、桌面和移动端向 Free、Pro、Max 和 Ultra 用户正式开放。回顾可纳入 Claude Code 会话和云端 Claude Cowork 任务，用户可以删除已存储的回顾。同一份说明还宣布，向已连接应用发送文件、从这些应用保存文件的功能开始分批测试。

🔗 [Claude 官方发布说明](https://support.claude.com/en/articles/12138966-release-notes#h_21ad83d886)

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

### 进展：OpenAI 预印本提出与 9/4 上界匹配的矩阵乘法下界

**11月25日 14:08 补充。** 预印本标注 11 月 24 日版，PDF 于北京时间 25 日 08:04 上传至 OpenAI 的公开仓库。作者主张，任意域上的方阵乘法算术复杂度指数恰为 9/4，并给出与此前上界匹配的下界。仓库说明将 Lean 形式化的结论限定在计算形式多项式恒等式的无除法电路。较广的下界主张仍以这份预印本为依据。

🔗 [OpenAI 预印本](https://github.com/openai/math/blob/92b516ef8e2abf66c3db7aa31438d3010bc7956f/preprints/The-matrix-multiplication-exponent-is-nine-fourths-November-24-2026/paper.pdf) · [论文与形式化范围说明](https://github.com/openai/math/blob/main/preprints/The-matrix-multiplication-exponent-is-nine-fourths-November-24-2026/README.md)

### 补充：Mantic 在数值预测测试中把单次成本降至对照模型的约 1/15

**11月25日 14:08 补充。** Thinking Machines Lab 与 Mantic 的联合文章标注 11 月 24 日，AI HOT 于北京时间 25 日收录。Mantic 在 Tinker 上对[此前发布的 Inkling 2 Small](/posts/ai-hot-2026-11-06/)做后训练，让同一个智能体完成资料查找和概率预测。团队报告，在 200 道未用于训练的数值预测题上，智能体的平均对数评分接近 Claude Fable 5.2 的中档推理设置，单次预测成本约为后者的 1/15。

🔗 [Mantic 与 Thinking Machines Lab 的实验报告](https://thinkingmachines.ai/news/training-a-scalable-forecasting-agent/)

### 补充：METR 发现 OpenAI 公布的预训练损失曲线下降加快

**11月25日 14:08 补充。** METR 的分析标注 11 月 24 日，AI HOT 于北京时间 25 日收录。研究者比较 OpenAI 公布的 13 个基础模型在同一份内部代码留出数据集上的对数困惑度，估计 2026 年初以来的下降速度约为 2022 至 2025 年的 7 倍。METR 指出，样本来自单一代码语料，模型完训日期也未公开，现有数据尚不足以判断通用能力会以多快的速度提升，或将这次加速归因于 AI 辅助研发。

🔗 [METR 分析原文](https://metr.org/blog/2026-11-24-interpreting-a-recent-acceleration-in-pretraining-loss/) · [OpenAI 原始曲线与说明](https://openai.com/index/perplexity-and-intelligence/)

## 行业动态

### 进展：Anthropic 股价收于 83 美元发行价下方

继[11 月 19 日在纳斯达克上市](/posts/ai-hot-2026-11-20/)后，Anthropic 股价于美国当地 11 月 24 日跌破每股 83 美元的发行价。AI HOT 于北京时间 25 日收录盘中报道。公司投资者关系页面记录当日盘中最低为 75.61 美元，Axios 报道收盘价约为 81.9 美元。

🔗 [Anthropic 官方发行定价](https://www.anthropic.com/news/anthropic-prices-initial-public-offering) · [Anthropic 投资者关系行情](https://investor.anthropic.com/stock-quote/stock-quote/default.aspx) · [TechCrunch 盘中报道](https://techcrunch.com/2026/11/24/anthropic-shares-fall-below-ipo-price-a-worrying-sign-for-ai-startups/) · [Axios 收盘报道](https://www.axios.com/2026/11/24/anthropic-stock-ipo-banks)

### 补充：Copilot 招聘研究发现，部分企业的初级软件工程师招聘下降

**11月25日 14:08 补充。** MIT 与 Microsoft Research 的两位研究者于 UTC 11 月 23 日、北京时间 24 日向 arXiv 提交论文，AI HOT 于 25 日收录相关讨论。作者用 5,414 家跨国公司的软件采购周期构造自然实验。在因合同审查而采用 GitHub Copilot 的企业中，作者估计采用一年后，每季度技术岗位招聘量下降 29%，初级软件工程师招聘量下降约 40%。研究未发现技术人员总数或离职量出现显著变化。这些估计针对因审查时点而采用工具的企业。

🔗 [arXiv 论文与提交记录](https://arxiv.org/abs/2611.31083) · [MIT 托管的论文全文](https://economics.mit.edu/sites/default/files/2026-11/AILaborDemand_06Nov2026.pdf)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
