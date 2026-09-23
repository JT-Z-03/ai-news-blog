---
title: "AI 热点日报 | 2026年9月22日"
date: 2026-09-22T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-09-22
description: 2026年9月22日 AI 圈要闻。小米 MiMo-V2.6 开放权重，Grok 4.7 聚焦编码与知识工作；Kimi 更新浏览器扩展，Transformers 优化本地量化推理，LiteParse 改进文档解析；Epoch AI 研究同等能力的推理成本下降。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)，按北京时间 9 月 22 日整理，并核对官方页面、模型卡与研究原文。本期关注模型能力、浏览器操作和推理成本，区分厂商披露、研究估算与实际使用效果。

---

## 模型发布/更新

### 小米 MiMo-V2.6 开放权重，强化学习覆盖多类智能体任务

小米发布 MiMo-V2.6 系列，官方模型集合已提供 Pro-RL、Flash-RL 等权重。Pro-RL 模型卡标注 MIT 许可，说明模型支持文本、图像、视频与音频，并提供 100 万 token 上下文窗口。

官方介绍，这一代将编码、通用智能体、视觉和网络安全等任务放进同一轮混合强化学习训练，同时扩大训练环境与评判计算的规模。其评判机制不仅区分任务是否通过，也比较已通过方案的质量，以引导模型使用更短的执行路径。

模型卡提供了多项基准结果和部署示例，但这些成绩属于厂商披露，本期未独立复测。开放权重为自行部署与评估提供了条件，实际所需硬件、任务质量和运行成本仍需结合具体版本验证。

🔗 [小米 MiMo：官方模型集合](https://huggingface.co/collections/XiaomiMiMo/mimo-v26) · [MiMo-V2.6-Pro-RL：模型卡](https://huggingface.co/XiaomiMiMo/MiMo-V2.6-Pro-RL)

### Grok 4.7 聚焦长时间编码和知识工作

AI HOT 在北京时间 9 月 22 日凌晨收录了 Grok 4.7 的评测动态。官方发布页标注 9 月 21 日，介绍该模型采用更大的基础模型，以及面向长时间复杂任务的强化学习训练，重点改进代码执行、自我检查和长上下文处理。

官方称，Grok 4.7 已可通过 Cursor、Grok Build 和 API 等入口使用，标准版本起价为每百万输入 token 2 美元、输出 token 6 美元；另提供输出速度与价格均为两倍的快速版本。

发布页展示了软件工程、办公与其他专业任务的评测结果。这些数据可作为选型线索，但不同任务、推理设置和执行环境会影响结果，不宜将单项成绩理解为所有工作上的能力排名。本期未进行模型实测。

🔗 [Grok 4.7：官方发布说明](https://x.ai/news/grok-4-7)

---

## 产品发布/更新

### Kimi 浏览器扩展增加侧边栏和操作录制入口

Kimi 将原 Kimi WebBridge 更名为 Kimi 浏览器扩展。官方产品页说明，新版增加浏览器侧边栏、录制网页操作、拆解网页生成指令等功能；已有本地 Agent 的调用方式继续保留，侧边栏入口需要登录 Kimi 账号。

扩展可让 Agent 打开网页、点击按钮、填写表单和提取信息，覆盖调研与重复性网页操作。对于已经在使用浏览器工作流的用户，变化主要在于入口更直接，并能记录已有操作步骤。本期核实的是官方功能说明，未安装扩展或验证任务成功率。

🔗 [Kimi：浏览器扩展官方页面](https://www.kimi.com/products/kimi-browser-extension)

### Transformers 优化 GGUF 推理，首批面向 Apple Silicon

Hugging Face 宣布在 Transformers 中更高效地运行 GGUF 量化模型。开发者可通过熟悉的模型加载接口指定 GGUF 文件，并复用 ggml 的 Metal 计算内核，在 Python 与 PyTorch 工作流里进行本地生成、评估和实验。

本次优化有明确的适用范围：保留压缩权重的推理路径目前仅支持 MPS，最初覆盖 Qwen3.5 的稠密与混合专家架构，以及兼容的 Qwen3.8 检查点；带填充的批处理仍需继续优化。原文还要求使用当时的 Transformers 主分支及兼容依赖，不能将其概括为所有设备、所有 GGUF 模型都已获得同等加速。

团队在 M2 Max 上的测试显示部分检查点速度接近 llama.cpp，但两侧计时口径并不完全一致。官方仍将 llama.cpp 推荐给优先追求高效本地推理的用户；这次集成的直接价值，是让量化模型更方便地进入现有 Transformers 研究和开发流程。

🔗 [Hugging Face：Transformers now runs llama.cpp quants](https://huggingface.co/blog/transformers-llama-cpp-quants)

### LiteParse 更新：解析提速，并为复杂文档提供分流依据

LlamaIndex 发布 LiteParse 9 月更新，改进 PDF 文本提取和表格解析，并增加视觉定位与文档复杂度检测。团队称，对自维护 PDFium 分支的优化使文本提取耗时减少约 20%—25%；在关闭 OCR 的测试条件下，文本提取平均约 2.8 毫秒每页，完整 Markdown 渲染约 3.9 毫秒每页。

新增的视觉定位功能可为 Markdown 元素提供页面边界框，方便把提取内容对应回原文。`is-complex` 接口则检测扫描页、乱码、文本覆盖率和多栏布局等信息，帮助开发者决定哪些页面可以直接解析，哪些需要交给 OCR 或更复杂的处理流程。

上述速度来自团队测试，且关闭了 OCR，不代表扫描文档的完整处理耗时。更新的实用意义在于减少简单文档的处理开销，并提前识别需要更强解析能力的页面。

🔗 [LlamaIndex：LiteParse Updates — September 2026](https://www.llamaindex.ai/blog/liteparse-updates-september-2026)

---

## 论文研究

### Epoch AI：达到同等基准表现的成本，过去三年平均每季度下降约 47%

Epoch AI 发布研究报告，分析数学、硬科学与技能游戏等五项基准中，达到给定表现水平所需的最低成本。研究估算，过去三年这一成本平均每季度下降约 47%，相当于一年降至原来的约十三分之一。

报告也观察到，不同任务与能力水平的降价速度并不相同：刚达到前沿的能力往往降价更快，随后逐渐放缓。研究公开了代码和数据，便于进一步检查估算方法。

这一结果不能直接换算为企业 AI 账单的降幅。作者明确指出，针对基准的训练可能夸大实际任务进步，数据并不完整，而计算最低成本隐含了用户持续寻找并切换最划算模型的假设。更复杂的任务需求和更大的调用量，也可能让总支出继续增长。

🔗 [Epoch AI：The plunging price of thought](https://epoch.ai/publications/the-plunging-price-of-thought)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.virxact.com）*
