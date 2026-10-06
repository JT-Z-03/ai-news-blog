---
title: "AI 热点日报 | 2026年10月5日"
date: 2026-10-05T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-10-05
description: 2026年10月5日 AI HOT 要闻。Liquid AI 发布支持图像输入的 d1；OpenAI 公布 ChatGPT 视觉广告测试与文本水印方案；PromptArmor 演示 Genie Code 恶意 Skill 风险。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)，按北京时间 10 月 5 日收录的精选条目整理，并核对发布方与研究者原文。文中的节省费用、模型效果和安全风险分别来自厂商估算、指定测试与研究者演示，不能直接推广到所有使用场景。

---

## 模型发布/更新

### Liquid AI 发布支持图像输入的 d1 决策模型

Liquid AI 发布 d1 决策模型，可同时读取文本与图像，对是非判断、分类选择或分数评定返回各选项的概率，而不生成逐字文本。该模型已通过 Liquid AI API 和 d1 Playground 提供；第三方平台上的图像能力尚未同步开放。

发布方展示了工件缺陷检查、客服工单筛选等应用，并与通用语言模型作了比较。这些质量、速度与成本数字来自其指定任务和测试方法，不能视为 d1 在任意决策任务上的通用优势。

🔗 [Liquid AI：Introducing d1](https://www.liquid.ai/blog/d1-decision-model)

---

## 产品发布/更新

### OpenAI 将在 ChatGPT 图像生成场景测试视觉广告

OpenAI 公布新的 ChatGPT 视觉广告形式，计划在 10 月晚些时候先向美国一组广告主开放图像生成场景测试。公司表示广告会明确标注，并与用户生成的图像分开；同篇公告还介绍了转化数据接入、归因和品牌适配度评估方面的新合作。

这是即将开始的区域性测试，并非所有用户都已看到这一广告形式。广告不影响 ChatGPT 回答、对话保持私密等说法是 OpenAI 对其产品设计的说明，仍需结合实际投放观察。

🔗 [OpenAI：Building advertising for the way people use AI](https://openai.com/index/new-chatgpt-ads-format-and-measurement/)

---

### Together AI 推出连接现有编码智能体的 Together Link

Together AI 发布 Together Link，让用户在 Claude Code、Codex、OpenCode 等现有工具中调用 Together 平台上的开放权重模型，并按会话首项任务自动选择模型。服务通过 Together AI API 计费，退出会话时可查看用量和费用。

公司宣称，相比所有任务都使用高价闭源模型，相关开支可降低超过 50%。这是厂商基于其模型价格与工作负载的比较；实际节省金额还取决于所选模型、任务质量、用量和原有费用。

🔗 [Together AI：Together Link 发布说明](https://www.together.ai/blog/together-link-frontier-quality-open-models-in-the-harness-you-already-use)

---

## 行业动态

### OpenAI 公布面向欧盟文本溯源规则的 textGrain 水印方案

OpenAI 公布 textGrain 文本水印技术，通过模型的词语选择嵌入不可见的统计信号。部分模型的 API 客户可从公告当天自行开启；公司计划未来数周为欧盟地区符合条件的 ChatGPT 和 Codex 文本输出添加水印。检测工具初期仅向获批研究者与专业机构开放。

OpenAI 同时说明，短文本、受约束内容和改写都可能降低检出率；检测不到水印不能证明文本由人写成，检测到水印也不能判断作者贡献或内容真假。因此它只能提供有限的来源线索。

🔗 [OpenAI：Our approach to EU text provenance rules](https://openai.com/index/eu-text-provenance/)

---

### PromptArmor 演示 Genie Code 恶意 Skill 的钓鱼与数据外泄路径

安全研究机构 PromptArmor 披露一条针对 Databricks Genie Code 的攻击演示：用户使用上传的恶意 Skill 分析数据后，Skill 在结果展示内容中嵌入数据与脚本；打开结果时，浏览器可能向攻击者发送数据并显示钓鱼页面。研究者指出，代码执行环境的出站限制不会覆盖用户浏览器发出的请求。

这是研究者构造并于 8 月向 Databricks 报告的演示，原文没有证明真实客户发生数据泄露。报告也记录了 Databricks 的回应：上传 Skill 的内容需由用户负责核验。

🔗 [PromptArmor：Databricks Genie Phishing and Exfiltration](https://www.promptarmor.com/resources/four-databricks-genie-controls-that-dont-stop-malicious-skills)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.virxact.com）*
