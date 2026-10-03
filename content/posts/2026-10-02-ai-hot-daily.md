---
title: "AI 热点日报 | 2026年10月2日"
date: 2026-10-02T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-10-02
description: 2026年10月2日 AI HOT 要闻。Ai2 开放 AstaBrief-8B；NVIDIA 推出 64GB DGX Spark；Google 披露 Gboard 隐私训练系统；Meta 与 Epoch AI 发布研究。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)，按北京时间 10 月 2 日收录的条目整理，并核对发布方或研究者原文。文中的产品性能、模型评测和研究推算保留原发布方的适用范围。

---

## 模型发布/更新

### Ai2 开放科学文献报告模型 AstaBrief-8B

艾伦人工智能研究所（Ai2）开放 AstaBrief-8B 模型权重。模型以研究问题和已检索的科学文献片段为输入，生成带引用的报告；模型卡说明，它基于 Qwen3-8B，并经过监督微调和离线偏好优化。

Ai2 在模型卡中公布了 ScholarQA-CS2 等评测结果，并将模型定位于研究与教育用途。带引用的输出仍需读者核对原文，评测分数也不能保证每篇生成报告准确。

🔗 [Ai2：AstaBrief-8B 模型卡](https://huggingface.co/allenai/AstaBrief_8B)

---

## 产品发布/更新

### NVIDIA 推出 64GB 版 DGX Spark，计划 10 月 23 日开售

NVIDIA 宣布为 DGX Spark 增加 64GB 统一内存配置，由 Acer、ASUS、Dell、Gigabyte、HP 和 MSI 销售，起售价 4,999 美元，计划于 10 月 23 日开售。官方称单台设备可在本地运行最高 1000 亿参数的模型；实际可运行规模仍取决于模型精度、上下文长度和任务负载。

两台 64GB 设备可通过 NVIDIA Sync Cluster Assistant 连接，合计提供 128GB 内存。NVIDIA 给出的最高 1.7 倍性能提升来自其指定的 Qwen 3.8 27B 测试，不代表所有模型和场景。

🔗 [NVIDIA：DGX Spark 64GB 发布说明](https://blogs.nvidia.com/blog/local-ai-dgx-spark-64gb-sync/)

---

### Prime Intellect 发布 Prime Inference 推理服务

Prime Intellect 发布 Prime Inference，提供按需调用的 serverless 端点和预留容量，用于部署前沿开放模型。服务支持兼容 OpenAI 的接口，官方示例可通过 CLI 或 API 调用 GLM-5.3。

Prime Intellect 称平台在内部每天处理近一万亿 token，并提供跨数据中心的故障切换。这些是公司公布的运行规模与服务设计；其 OpenRouter 上的 GLM-5.3 端点已于 9 月 22 日先行上线，本次发布是推理平台的公开介绍。

🔗 [Prime Intellect：Prime Inference 发布说明](https://www.primeintellect.ai/blog/prime-inference)

---

### Google 披露用于 Gboard 的可信执行环境联邦学习系统

Google Research 介绍一套基于可信执行环境（TEE）的联邦学习系统：设备上传加密训练样本，预先授权的数据访问策略写入公开透明日志，服务器侧只允许符合策略的 TEE 工作负载处理数据。Google 称外部人员可以检查运行代码与策略，但也指出侧信道防护和软件实现的完整正确性证明仍是后续工作。

Google 表示，Gboard 已用该系统训练英语和日语的下一词预测模型。官方报告了训练速度及隐私保证方面的改进，但没有把这套部署扩展为所有 Gboard 语言模型均已迁移的结论。

🔗 [Google Research：Toward provably private learning from federated data](https://research.google/blog/toward-provably-private-learning-from-federated-data/)

---

## 论文研究

### Meta 分享数学家与 Muse Spark 协作的六篇论文

Meta AI Research 公布六篇由数学家与 Muse Spark 1.1、1.2 协作完成的数学论文，涉及概率、微分方程、群论和优化等领域。研究团队通过普通 meta.ai 聊天界面使用模型，没有另建专用研究脚手架；Meta 称其中五篇回应了此前公开的研究问题。

Meta 说明，每篇论文标注主要由人类或 AI 起草的段落，并由另一组数学家审阅。部分问题也有其他团队独立提出解法；这些成果应按各篇论文与后续同行检验理解，不能概括为模型独立解决了六个开放难题。

🔗 [Meta AI Research：Solving Open Research Problems Together](https://research.meta.ai/blog/solving-open-research-problems-together)

---

### Epoch AI 估算未来高带宽内存可支持的智能体并发量

Epoch AI 建模估算：如果 2025 至 2027 年出货的高带宽内存（HBM）完成部署，并全部分配给相关负载，硬件可支持约 3000 万至 1.7 亿个并发运行的前沿模型智能体。研究结合 HBM 出货预测、推理基准和单位智能体服务成本推算，给出的是条件情景，不是目前在线的智能体数量。

Epoch AI 指出，实际可用容量还取决于计算、互连、数据中心部署和需求；模型效率与服务价格也会改变估算。文中把持续运行时长换算为人类全职工作时长，只是时间量级比较，不等于相同的工作质量或经济产出。

🔗 [Epoch AI：How many AI agents could we run?](https://epoch.ai/publications/estimating-the-agent-population)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.virxact.com）*
