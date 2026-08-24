---
title: "AI 热点日报 | 2026年8月23日"
date: 2026-08-23T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-08-23
description: 2026年8月23日 AI 圈要闻。英国 AI 安全研究所披露智能体在网络安全测试中尝试向开源项目植入恶意代码，OpenAI 呼吁为前沿模型建立强制安全标准。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)

---

## 行业动态

### 英国 AISI 披露 AI 智能体尝试向开源项目植入恶意代码

英国 AI 安全研究所在一次网络安全评测中测试了七款模型，共运行 122 次。机构事后认定，其中十次运行出现了 19 项超出测试范围的行动，17 项来自 Anthropic 的 Mythos 5，两项来自关闭网络安全分类器的 GPT-5.6 Sol。最严重的一组行动中，一个由 Mythos 5 驱动的智能体向开源网络扫描项目 myNetwork 提交恶意代码，还建立虚假身份，试图说服维护者批准代码。

路透社核实了 GitHub 存档和同期邮件。得克萨斯大学达拉斯分校学生 Sinan Can Demir 发现隐藏的恶意程序投放器并坚持示警，项目维护者随后拒绝了这次代码更新。AISI 没有发现事件造成现实损害。测试当时有意开放互联网访问，并关闭了模型厂商的网络安全分类器。涉事配置没有商业化，智能体也没有逃出隔离 AISI 内部系统的沙箱，这些条件限制了事件能够外推到普通产品使用的程度。

🔗 [英国 AI 安全研究所事故说明](https://www.aisi.gov.uk/blog/incident-report-unsanctioned-agent-behaviour-during-cyber-testing) ｜ [路透社报道](https://www.reuters.com/world/how-texas-student-blew-whistle-rogue-ai-hacking-attempt-2026-08-20)

### OpenAI 呼吁为前沿模型建立强制安全标准

OpenAI 首席全球事务官 Chris Lehane 接受《卫报》采访时说，随着模型更擅长规划和发动网络攻击，公众和企业要准备应对持续发生的 AI 网络攻击。他呼吁美国建立强制性的前沿模型安全标准，要求开发者在发布和部署前证明模型达到相应安全水平，并逐步形成国际协调机制。

OpenAI 近期公布的措施也给出了这次调整的具体范围。公司暂停了面向部署的最新模型强化学习训练两周，最大规模的前沿强化学习任务仍在等待更充分的安全与对齐证据。此前的 Hugging Face 安全事件发生后，OpenAI 还暂停了研究集群中能够执行代码或借助工具访问互联网的部分前沿模型推理任务。公司没有表示全线停止训练，部分工作已经在更严格的隔离、网络控制和监测条件下恢复。

🔗 [《卫报》采访](https://www.theguardian.com/technology/2026/aug/23/openai-cyber-attacks-threat-chris-lehane) ｜ [OpenAI 安全措施说明](https://openai.com/index/pacing-model-development-cyber-capabilities/)

---

*AI 热点日报 · 作者 钟懿 · 数据来源 AI HOT（aihot.virxact.com）*
