---
title: "AI 热点日报 | 2026年10月7日"
date: 2026-10-07T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-10-07
description: 2026年10月7日 AI HOT 要闻。Anthropic 发布 Claude Haiku 5.5，Liquid AI 开放两款 d1 决策模型；Google 推出开发者文档检索接口，并公布 AI 辅助工作与专业判断的实验结果。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)，按北京时间 10 月 7 日收录的精选条目整理，并核对发布方与研究机构原文。部分原文日期为 10 月 6 日、在北京时间 7 日进入收录窗口；性能、费用与实验结论均限于原文所述条件。

---

## 模型发布/更新

### Anthropic 发布 Claude Haiku 5.5，面向高频与成本敏感任务

Anthropic 发布 Claude Haiku 5.5，模型标识为 `claude-haiku-5-5`，已通过 Claude Platform 及主要云平台提供。公司将其定位于摘要、分类、数据库查询和编码子智能体等高频任务；这是首款提供可调推理投入设置的 Haiku 模型。

每百万输入与输出 token 的起价分别为 0.10 美元和 0.50 美元；超过 10 万 token 的提示词使用更高一档价格。Anthropic 称平均运行费用较 Haiku 4.5 降低约 75%，这一数字结合了其请求分布和任务 token 用量，不能直接视为每个调用都节省 75%。同日，Claude Sonnet 5.5 的缓存读取价降至每百万 token 0.10 美元。

🔗 [Anthropic：Introducing Claude Haiku 5.5](https://www.anthropic.com/claude-haiku-5-5)

---

### Liquid AI 开放两款可在本地运行的 d1 决策模型

Liquid AI 发布开放权重的 `d1-3B` 与实验性 `d1-omni-600M`，模型文件已上架 Hugging Face。两者以单次前向计算给出选项判断，而非逐字生成回答；前者接受文本与图像，后者可处理文本加图像或文本加音频。

Liquid AI 公布了指定硬件上的推理延迟和 Decision Index 结果，称 `d1-3B` 在 RTX 4090 上处理单个问题需 8 毫秒。该速度取决于输入长度、硬件和测试设置；发布方也指出，多模态决策评测仍不完整，`d1-omni-600M` 还处于早期研究阶段。

🔗 [Liquid AI：Open d1](https://www.liquid.ai/blog/d1-open)

---

## 产品发布/更新

### Google 扩展 Developer Knowledge API 的官方文档检索入口

Google 介绍 Developer Knowledge API 生态，为 Google Cloud、Firebase、Android 等开发文档提供程序化检索。接口可返回 Markdown 文档、搜索片段和基于文档的回答，并配套 `gcloud` 命令、Agent Skill、API Explorer 与多语言客户端库。

开发者可以在智能体或开发工具中接入这些官方文档入口，减少依赖过期的模型记忆或网页抓取。能否拿到准确答案仍取决于检索范围、文档更新和实际接入方式；公告描述的是可用工具与接口，并非所有智能体已经自动接入。

🔗 [Google Developers Blog：Developer Knowledge API ecosystem](https://developers.googleblog.com/supercharge-your-development-with-the-google-developer-knowledge-api-ecosystem/)

---

## 行业动态

### GitHub 重建 Git 基础设施以应对更高并发

GitHub 说明，正逐步重建其 Git 基础设施，以承受开发者与智能体共同产生的高频读取、提交和推送。按 GitHub 公布的数据，平台月度 Git 事件从 2025 年 9 月的 2182 亿次增至 2026 年 8 月的 4733 亿次；2026 年 9 月开发者与智能体合计创建 73.8 亿次提交。

文章重点解释，现有副本架构在最繁忙的仓库里会让读取扩容与写入延迟相互牵制。重建工作仍在进行，文中统计属于 GitHub 平台整体活动，不能用来推断每个仓库或单个智能体的增长幅度。原文 10 月 6 日发布、7 日更新，并在北京时间 7 日被 AI HOT 收录。

🔗 [GitHub Blog：Building Git infrastructure for agent-scale development](https://github.blog/engineering/architecture-optimization/building-git-infrastructure-for-agent-scale-development/)

---

## 论文研究

### OpenAI 公开内部模型产出的数学结果与部分形式化证明

OpenAI 将一批内部前沿模型产出的数学结果放入 GitHub 仓库，并公布论文修订与引用规则。公告称，仓库包含多项 Lean 形式化证明，以及 10 份模型推理摘要、尝试问题数量等过程信息，供研究者检查与讨论。

产生这些结果的模型仍是内部模型，公告只表示将继续评估并研究如何发布；公开数学结果不等于模型已向公众开放，也不表示所有证明都已形式化。原文日期为 10 月 6 日，AI HOT 在北京时间 7 日收录。

🔗 [OpenAI：Sharing AI progress in mathematics](https://openai.com/index/sharing-ai-progress-in-mathematics/)

---

### Google 实验发现 AI 提升专利起草质量，但初级律师的独立判断未见平均提升

Google Research 报告一项为期三个月的随机田野实验：11 家知识产权律所的 133 名律师中，部分人获准使用 AI 专利写作助手。研究发现，获得工具的律师在有 AI 辅助的起草任务中整体得分提高；90 天后移除 AI 完成专利审阅任务时，资深律师的判断得分有所提升，初级律师组平均未见明显改善。

初级律师的得分分布同时向高分和低分两端扩散，因此不能概括成“AI 一定削弱初级员工”。研究对象限于专利律师，观察期只有三个月；对其他职业与长期能力发展的影响仍需另行验证。

🔗 [Google Research：Does better work always mean better workers?](https://research.google/blog/does-better-work-always-mean-better-workers/)

---

## 技巧与观点

### vLLM 团队详解 DeepSeek-V4.1-Flash 的推理优化

Inferact 与 vLLM 团队介绍 DeepSeek-V4.1-Flash 发布后三周的服务优化，包括滑动窗口注意力缓存重放、CUDA graphs 和多个内核改进。团队报告，在低并发场景速度提升 1.9 倍；在每请求 150 token/秒约束下，指定智能体负载的吞吐提升 5.3 倍。

这些是其测试负载与硬件配置下的服务端测量，并非模型本身在所有部署上的固定提速。文章还说明，部分缓存重放采用近似计算，团队在列出的评测中未观察到有意义的准确率差异。

🔗 [vLLM Blog：DeepSeek-V4.1-Flash on vLLM](https://vllm.ai/blog/2026-10-07-deepseek-v41-flash)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.virxact.com）*
