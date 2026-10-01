---
title: "AI 热点日报 | 2026年9月30日"
date: 2026-09-30T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-09-30
description: 2026年9月30日 AI HOT 要闻。OpenAI 发布 GPT-6.1 Sol 与 dots；Google DeepMind 介绍蛋白质水印；Anthropic 研究机器人任务的能力与成本边界。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)，按北京时间 9 月 30 日收录的条目整理，并核对发布方与研究机构原文。部分原文标注为当地时间 9 月 29 日；产品开放范围、机构自述和实验结果均按原文限定。

---

## 模型发布/更新

### OpenAI 发布 GPT-6.1 Sol，强调智能体任务的成本表现

OpenAI 发布 GPT-6.1 Sol，称其在编程、计算机操作及专业工作评测中接近 GPT-6 Astra，标准 API 价格为每百万输入 token 2 美元、输出 token 10 美元、缓存输入 token 0.10 美元。官方称，标准输入与输出价格约为 Astra 的五分之一；具体任务的成本比还取决于推理设置与 token 用量。

该模型已在 ChatGPT Work 和 Codex 向 Plus、Pro、Business、Enterprise、Edu 用户开放，也可通过 API 调用；OpenAI 明确说它目前尚未进入 Chat。文中的能力对比主要来自 OpenAI 公布的指定评测，实际选型仍应按自身任务验证。

🔗 [OpenAI：GPT-6.1 Sol 发布说明](https://openai.com/index/introducing-gpt-6-1-sol/)

---

## 产品发布/更新

### OpenAI 推出可持续执行任务的 dots

OpenAI 介绍 dots：由 GPT-6 Astra 驱动的智能体拥有独立云端计算机，可连接用户授权的应用，在 ChatGPT、Slack 或 Teams 中接收任务并回报进展。用户可查看其计算机上的工作，并为应用访问与行动设置权限及审批规则。

dots 正逐步面向符合条件的 Pro、Business Premium 和 Enterprise 用户开放，企业版还涉及管理员启用。发布页展示的是产品设计、开放计划及早期案例，不能据此推断所有用户已经可用，或它能在任意任务中自主完成工作。

🔗 [OpenAI：Introducing dots](https://openai.com/index/introducing-dots/)

---

### Google DeepMind 介绍蛋白质水印 SynthID Bio

Google DeepMind 发布 SynthID Bio 概念验证，尝试在 AI 生成的蛋白质序列或预测的三维结构中嵌入可检测的标记。对于序列，方法会调整氨基酸选择；对于预测结构，则调整相关坐标，使标记在合成后的实体蛋白质上也可验证。

团队报告，在针对三个目标蛋白的湿实验中，带水印设计与未带水印设计的命中率、结合能力及序列多样性相近。这是特定实验条件下的结果，尚不能说明该方法已覆盖所有蛋白质设计，或已成为通用生物安全筛查手段。

🔗 [Google DeepMind：Introducing SynthID Bio](https://deepmind.google/blog/introducing-synthid-bio/)

---

## 行业动态

### OpenAI 披露并处置一次针对模型推理内容的提取行动

OpenAI 披露，一组操作者曾尝试通过跨对话转录等方式提取模型受保护的推理内容。公司称，相关活动始于 7 月 1 日，7 月下旬出现高流量请求；调查后对关联账户采取限制措施，并加强注册、基础设施及监测控制。

OpenAI 同时表示，观察到的操作者未必属于同一主体，其归因判断仍是公司自身的调查结论。披露说明了其所见攻击方式及处置，不等于所有参与者身份或外部影响已经得到独立确认。

🔗 [OpenAI：Disrupting a coordinated model-distillation campaign](https://openai.com/index/disrupting-a-coordinated-model-distillation-campaign/)

---

## 论文研究

### Anthropic 研究机器人任务能力与成本之间的差距

Anthropic 发布机器人任务暴露度研究。研究者用 Claude 评估美国职业任务，估计现有机器人在某些环境下可完成约 74% 的体力任务；这些任务约占全部工作时间的 34%。但按其成本模型，机器人目前仅在 0.3% 的工作任务上比人工更有价格竞争力。

这里的“能够完成”包含受控环境中的能力，不等于岗位已被自动化。论文提出的未来成本变化是基于历史降价趋势的情景推算，仍受机器人能力、法规与人的偏好等因素限制。

🔗 [Anthropic：What work can robots do?](https://www.anthropic.com/research/what-work-can-robots-do)

---

### MIT 等机构用 Ataraxos 改进隐藏信息博弈决策

MIT、CMU、NYU 和 Stanford 的研究人员开发 Ataraxos，用自我对弈学习基础策略，再在行动前结合对对手隐藏棋子的概率估计调整决策。MIT 报道，该系统在 Stratego 中以 15 胜、1 负、4 平的成绩对阵最强选手，并以更少的训练样本超过此前的相关系统；论文发表于《Nature》。

研究还在其他隐藏信息游戏中测试了方法。棋类成绩说明算法在这些测试设置下有效，不能直接推断它已能可靠处理商业谈判或现实安全决策。

🔗 [MIT News：Ataraxos 与 Stratego 研究](https://news.mit.edu/2026/game-playing-ai-stratego-new-champ-0930)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.virxact.com）*
