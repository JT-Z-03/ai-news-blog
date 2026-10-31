---
title: "AI 热点日报 | 2026年10月30日"
date: 2026-10-30T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-10-30
description: 2026年10月30日 AI HOT 要闻。Pika 发布 H3 Flex 开放权重，Figma 介绍设计编辑模型训练，Gemini 增加文件生成与编辑；Cursor 披露扩展安全事件，OpenAI 更新 Model Spec。
---

> 数据来源 [AI HOT](https://aihot.news/)，按北京时间 10 月 30 日整理并核对原始来源。本期收录 8 条，涵盖视频与设计模型、文件编辑、安全事件、模型行为规范及选型教程；开放权重许可、平台自报数据和小样本评测分别说明。

---

## 模型发布/更新

### Pika 发布 H3 Flex，以六步采样加快视频生成

Pika 发布基于 MiniMax H3 后训练的视频模型 H3 Flex，并提供开放权重。模型将生成过程压缩到六步采样，支持文本生成视频与图像生成视频；模型卡列出的原生输出分辨率为 480p 和 768p。

权重采用 MiniMax H3 Community License，使用与部署须遵守其具体条款。Pika 平台提供的更高分辨率和音频分轨等功能有单独的托管实现，不能当成下载权重后就具备的全部能力；官方速度数字也应按对应硬件和计时范围理解。

🔗 [Pika 官方发布公告](https://x.com/pika_labs/status/2115860471215788262)

🔗 [Pika 模型卡、原生能力与许可](https://huggingface.co/Pika-Labs/Pika-H3-Flex)

### Figma 介绍专用编辑模型，按结构与视觉分别评估设计修改

Figma 分享设计编辑模型的训练方法，让模型根据现有画布完成间距、颜色、布局与组件等局部调整。训练使用 Figma 原生文件格式表示设计，以合成编辑请求和成功示例进行监督微调，并结合确定性校验、视觉评判及专家设计师复核。

团队正进一步引入强化学习，分别检查输出结构、请求完成情况与视觉质量。文中对比图包含尚未发布的新编辑模型，其内部测试表现不能写成所有用户已经获得的效果；Figma agent 还会按任务调用第三方模型，整套产品的改进也不能全部归因于单个编辑模型。

🔗 [Figma 官方训练方法与评估说明](https://www.figma.com/blog/training-a-figma-fluent-editing-model/)

---

## 产品发布/更新

### Gemini 宣布可直接生成、预览和编辑多种文件

Google Gemini 官方宣布，用户可以在 Gemini 中生成、预览和编辑文档、PDF、演示文稿及电子表格。公告演示了将手写笔记整理为 PDF 学习资料，也可以手动调整内容，或选中局部文字、图像后要求 Gemini 修改。

文件生成后还能继续追问与编辑，减少导出后再返回对话补改的步骤。该公告没有逐项说明套餐、地区及所有格式的开放细则，具体可用范围仍应以账户界面与产品说明为准。

🔗 [Google Gemini 官方功能公告与演示](https://x.com/GeminiApp/status/2115845164824711247)

---

## 行业动态

### Cursor 披露被篡改扩展事件，要求升级并排查受影响安装

Cursor 在官方公告中披露，经其 IDE 扩展市场分发的 Claude Code VS Code 扩展曾被恶意修改，最多可能影响 5,000 名用户。公司说明，该恶意版本并非 Anthropic 开发，扩展市场曾下线排查，并在与相关服务商处置后恢复。

公告要求用户升级到 Claude Code for VS Code 2.1.314，可能受影响的人还应按安全通知核对安装情况与处置方法。这是特定扩展分发渠道的事件，不能扩大解释为 Claude Code 所有官方发行版均被入侵；本条按目标日官方公告整理，后续排查进展见持续更新的安全通知。

🔗 [Cursor 官方事件公告与升级建议](https://x.com/cursor_ai/status/2116074289053175808)

🔗 [Cursor 官方安全通知与后续处置说明](https://cursor.com/blog/claude-code-extension-security-notice)

### OpenAI 更新 Model Spec，围绕五项核心价值组织行为规范

OpenAI 更新公开的 Model Spec，将行为指导组织为忠于人的意图、减少伤害、诚实透明、支持人的自主性和关怀五项核心价值。修订涉及指令优先级、上下文理解、监督与副作用沟通，并移除了大部分细节化的文风指导。

公告强调，模型需要结合上下文理解人的目标，同时让相关假设清楚可见、便于纠正。Model Spec 描述的是公司希望模型达到的行为，现有模型尚未完全符合，规范更新本身也不能作为这些行为已全部实现的证明。

🔗 [OpenAI 官方 Model Spec 更新说明](https://openai.com/index/updated-model-spec/)

### OpenAI 汇集合理使用意见书，呈现 AI 训练诉讼中的支持立场

OpenAI 汇集了《纽约时报》相关诉讼中支持合理使用的法庭之友意见摘录，提交者包括图书馆与无障碍组织、作者团体、学者和美国政府等。各方从科研、创作、公共服务与竞争等角度，说明支持将合理使用原则适用于 AI 训练的理由。

这些材料是诉讼参与方及支持者提交的法律主张，OpenAI 页面也属于公司的立场说明，不能理解为法院已就全部争议作出有利裁决。完整文件仍需回到公开卷宗查阅，摘录不能代替具体案件的法律结论。

🔗 [OpenAI 汇集的意见书摘录与来源说明](https://openai.com/index/fair-use-benefits-everyone/)

### Sierra 自报 ARR 超过四亿美元，五个月完成一次翻倍

Sierra 宣布，本周年度经常性收入指标 ARR 超过 4 亿美元，第三季度新增 ARR 超过 1.5 亿美元。公司称，从 2 亿美元增长到 4 亿美元用了五个月，此前从 1 亿美元到 2 亿美元用了六个月。

Sierra 将增长归因于客户扩大智能体应用范围，以及从一次性客服对话转向跨系统、持续更久的业务任务。这些是企业自行披露的经营数据与解释；ARR 是年化指标，不能直接当作已经实现的全年营业收入或利润。

🔗 [Sierra 官方经营数据与业务说明](https://sierra.ai/blog/our-customers-ambition-is-accelerating-our-growth)

---

## 技巧与观点

### OpenRouter 用小型编程测试讨论 Claude 三档模型的任务分工

OpenRouter 发布 Claude Opus 5.5、Sonnet 5.5 与 Haiku 5.5 的选型教程，以 11 道 Python 函数题和一个小型代码库修复任务比较模型。三档模型都通过了其测试，作者建议日常从 Sonnet 开始，为高频、边界清楚的子任务尝试 Haiku。

这些样本不能代表复杂工程任务的整体表现。对于耗时较长、需求含糊或错误代价较高的工作，作者仍建议保留 Opus，并用自己的任务验证效果；比较成本时也应核对平台实际账单，避免工具对模型名称或费用的识别误差。

🔗 [OpenRouter 原始测试范围与模型选型教程](https://openrouter.ai/blog/insights/claude-opus-vs-sonnet-vs-haiku/)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
