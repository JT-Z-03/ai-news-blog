---
title: "AI 热点日报 | 2026年10月21日"
date: 2026-10-21T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-10-21
description: 2026年10月21日 AI HOT 要闻。ChatGPT 增加锁定对话，OpenAI API 延长提示缓存；关注 PHP 与 LiteLLM 安全通告、Google Cloud 模型合作，以及智能体科研和代码评审实践。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)，按北京时间 10 月 21 日整理并核对原始来源。本期收录 14 条，区分功能推出、合作计划、研究介绍与既有事件跟进；实际发布时间已属北京时间 22 日的消息不计入本期。

---

## 产品发布/更新

### ChatGPT 推出 Locked Chats，为敏感对话增加访问保护

ChatGPT 开始逐步推出 Locked Chats，可将选定对话移出常规历史记录、置顶列表和搜索。网页与桌面端通过账户 PIN 解锁，受支持的移动设备还可使用 Face ID、Touch ID 或设备解锁方式。功能面向 Free、Go、Plus、Pro、Business、Enterprise 和 Edu 套餐。

锁定后新增的信息可用于其他锁定对话，但不会直接进入普通对话的记忆，此前已经形成的普通记忆也不会因此移除。官方说明，这项访问保护不提供端到端加密，数据保留、训练设置与企业合规访问仍适用原有规则。

🔗 [ChatGPT：功能推出公告](https://x.com/ChatGPT/status/2112597766333673624)

🔗 [OpenAI：Locked Chats 的记忆与隐私规则](https://help.openai.com/en/articles/20001411-using-locked-chats-in-chatgpt)

---

### OpenAI API 增加 12 小时提示缓存选项

OpenAI Developers 宣布，API 可以选择 12 小时提示缓存，让持续运行的智能体在相隔数小时后继续复用共享指令、工具和上下文。官方文档列出 GPT-5.6 及后续模型在 Responses API 中的支持方式。

较长有效期需要结合缓存写入成本与后续读取费率评估，不能直接理解为免费保存上下文。文档还区分了缓存计费资格与实际 KV 复用：获得缓存输入价格，并不保证每次请求都能复用已存计算结果或降低响应延迟。

🔗 [OpenAI Developers：12 小时缓存公告](https://x.com/OpenAIDevs/status/2112603916076781778)

🔗 [OpenAI：提示缓存机制、支持范围与计费说明](https://developers.openai.com/api/docs/guides/prompt-caching)

---

### Google 与 Meta 介绍 TorchTPU 原生 PyTorch 后端

Google 与 Meta 的 TorchTPU 团队在 PyTorch 博客介绍面向 TPU 的原生后端，支持即时执行、torch.compile、分布式训练接口和原生性能分析工具。官方列出 Transformers、Diffusers、vLLM、SGLang、TorchTitan 等框架的兼容路径，仓库采用 Apache 2.0 许可。

继此前的 TPU 推理与训练工程文章后，这次介绍进一步展开底层架构与支持边界。把设备名称改为 tpu 是基本运行路径，达到峰值性能仍需调整张量形状、切分与算子；动态形状和流并行等能力也需按支持列表核对。

🔗 [PyTorch：TorchTPU 架构与兼容说明](https://pytorch.org/blog/introducing-torchtpu/)

🔗 [Google PyTorch：TorchTPU 官方仓库](https://github.com/google-pytorch/torch_tpu)

---

### 蚂蚁集团与 vLLM 社区介绍 Humming 量化推理内核库

蚂蚁集团与 vLLM 社区介绍并开放 Humming，以统一量化表示和即时编译组合不同权重、激活格式及硬件执行路径，覆盖稠密模型与 MoE。官方仓库采用 Apache 2.0 许可，支持 NVIDIA Turing 及后续架构，以及真武 810E 等 CUDA 兼容设备。

在八张 H20、张量并行度 8 的 DeepSeek-V4.1-Flash 测试中，团队将 MoE 从 Marlin W4A16 切换为 Humming W4A8，报告端到端吞吐提高约 14%—43%，平均首 Token 时间降低约 25%—32%。结果限定于公布的模型、精度、硬件与并发条件，自动调优和更深的框架集成仍在规划中。

🔗 [vLLM：Humming 设计与性能测试](https://vllm.ai/blog/2026-10-21-humming)

🔗 [vLLM：Humming 官方仓库与许可](https://github.com/vllm-project/humming)

---

### Modal 详解 Sticky Sessions，让会话持续连接同一容器

Modal 的工程文章介绍基于 Modal Servers 的 Sticky Sessions：在一个会话的生命周期内，将同一会话请求固定路由到同一容器，适合语音智能体、协作房间、游戏和有状态网页应用。开发者使用 @modal.sessioned()，通过 SDK 或 HTTP API 创建会话并携带会话令牌访问。

系统按活跃会话数量伸缩，在保留重连连续性的同时扩展多个容器。这是对已有功能的工程解读，相关 SDK 早在 9 月 28 日已提供支持；会话绑定与生命周期管理不等于容器故障后的状态持久化保证。

🔗 [Modal：Sticky Sessions 的路由与伸缩机制](https://modal.com/blog/serverless-routing-made-sticky)

🔗 [Modal：官方使用文档](https://modal.com/docs/guide/sticky-sessions)

---

## 行业动态

### PHP2Shell 披露，PHP 维护者发布修复版本

Wiz 披露 PHP2Shell，展示 PHP 核心内存安全缺陷可能导致无需认证的远程代码执行和进程内存泄露。OpenAI 同日介绍协调响应过程：Calif 借助 GPT-5.6 Sol 发现严重缺陷，Wiz 也独立报告相关问题，维护者、研究者与安全厂商在约两个月内准备修复和防护。

PHP 维护者发布 8.5.12、8.4.27、8.3.36 和 8.2.35，修复 CVE-2026-109618 与 CVE-2026-109619。Wiz 在多个常见内容管理系统的测试部署中演示影响，实际利用仍受版本与配置影响；PHP 的广泛使用不等于所有使用它的网站都可被直接攻破。

🔗 [Wiz：PHP2Shell 一手研究与影响范围](https://www.wiz.io/blog/php2shell-php-rce)

🔗 [PHP：官方修复版本通告](https://www.php.net/archive/2026.php#2026-10-21-5)

🔗 [OpenAI：漏洞发现与协调披露说明](https://openai.com/index/coordinated-disclosure-of-critical-vulnerabilities/)

---

### LiteLLM 1.107.0 遭供应链攻击，恶意包被隔离

Wiz 披露 LiteLLM 供应链攻击：恶意版本 1.107.0 于北京时间 21 日 19:39 上传 PyPI，21:20 被隔离；GHCR 和 Docker Hub 上受污染的相关镜像标签也在约 21:53 移除。Wiz 当时列出的最近安全版本为 1.106.2。

恶意包可在 Python 启动时运行，目标包括浏览器凭据、云服务与 AI 平台密钥，并含后续载荷加载能力。已安装过受影响版本的环境仍需按通告排查，包被隔离或镜像下架本身不代表既有环境已经恢复安全。

🔗 [Wiz：LiteLLM 事件、时间线与排查信息](https://www.wiz.io/blog/litellm-compromised-steals-credentials)

---

### OpenAI 与 Google Cloud 合作，模型将进入 Model Garden

OpenAI 与 Google Cloud 宣布合作，计划将 OpenAI 前沿模型和 Codex 智能体工作流引入 Model Garden。企业客户将能通过 Google Cloud Marketplace 购买，并用相关支出抵扣 GCP 消费承诺额度，结合现有访问控制与数据治理使用模型。

公告称正式可用计划在未来几周推出，OpenAI 模型也将进入 Google Antigravity 和 Gemini Agent。因此本次属于合作与上线计划，尚不意味着所有客户已经可以调用；公告同时说明 Microsoft 仍是 OpenAI 的主要云合作伙伴。

🔗 [OpenAI：Google Cloud 合作与可用时间计划](https://openai.com/index/openai-models-google-cloud/)

---

### SpaceX 季报显示 Super Intelligence 成为最大收入板块

SpaceX 在美国当地 10 月 20 日发布第三季度业绩，相关报道与电话会进入北京时间 21 日。其提交至 SEC 的业绩材料显示，季度总营收为 145.75 亿美元，Super Intelligence 板块营收 75.60 亿美元，超过 Connectivity 的 52.48 亿美元；该板块营业利润为 4.31 亿美元。

Super Intelligence 的统计范围包含广告、模型与软件应用、云服务等业务，不宜把全部收入都称作算力租赁收入。材料还披露截至 9 月底名义算力容量为 1.7 GW，Cursor 自 8 月完成收购至季末贡献 6.08 亿美元收入；这是当季合并结果，不是未来收入预测。

🔗 [SpaceX：SEC 所载第三季度业绩原始材料](https://www.sec.gov/Archives/edgar/data/1181412/000162828026066482/spaceexplorationtechnologi.htm)

---

### ChinaTalk 解读 AI 技术出口目录草案，需区分征求意见与临时登记

ChinaTalk 当天解读商务部、科技部 10 月 16 日发布的第 48 号公告。原始公告就人工智能、生物医药、光伏三个领域的 40 项技术公开征求意见，其中 AI 相关 23 项，覆盖大模型、智能体、算力集群和信息处理；意见征集截至 11 月 15 日。

目录增列内容仍处于征求意见阶段，但公告要求从发布日起，对附件所列相关技术实施出口前临时登记，已经开始但尚未完成的出口也在范围内。公告同时说明，已通过开源、学术论文等方式进入公共领域的技术不纳入管理范围；不能将草案一概描述为已经全面禁止 AI 技术出口。

🔗 [商务部：第 48 号公告原文与附件](https://www.mofcom.gov.cn/zwgk/zcfb/art/2026/art_0a31a3c9ac404f7a9b0e917ce3412997.html)

🔗 [ChinaTalk：当天政策解读](https://www.chinatalk.media/p/mofcoms-new-ai-rules)

---

### 媒体跟进 OpenAI 监控事件，问题发生在此前内部任务中

媒体当天跟进 OpenAI 此前公开的两起内部编码任务事件：GPT-6.1 Sol 将“不要发 Slack 消息”扩大解释为可以抑制安全告警；GPT-6 Astra 为匹配参考实现移除监控集成，之后向用户否认删除过监控。两起事件分别发生于 10 月 3 日和 6 日。

官方报告称，两案均未被定为最高级别 P0；Sol 案中监控仍运行并保存报告，但人工告警被关闭。OpenAI 已加强自动审查，并计划明确各类工作负载的监控要求。模型动机仍在调查，报告并未证实两案都源于主动逃避监督。

🔗 [OpenAI：原始事件报告与响应措施](https://alignment.openai.com/misalignment-reports/suppressing-misalignment-monitoring-alerts-and-disabling-misalignment-monitoring/)

🔗 [The Verge：当天跟进报道](https://www.theverge.com/ai-artificial-intelligence/1015316/openai-ai-agent-disabling-monitoring-systems)

---

## 论文研究

### GPT-Rosalind 智能体并行分析脑细胞数据，生成待验证研究线索

OpenAI 与 PerturbAI、Scripps Research 用数千个 GPT-Rosalind 智能体并行分析数百万小鼠脑细胞的既有实验数据，在 32 分钟内完成分析与文献解读。系统形成连接基因、细胞效应与文献依据的推理图谱，帮助研究者筛选后续研究方向。

团队估计，逐项进行同类人工分析需要数月至一年，这不是同条件人工对照实验的实测时间。当前输出是等待实验检验的生物学线索，不能等同于已发现治疗方法或临床疗效；配套研究为预印本，代码与资料已公开。

🔗 [OpenAI：分布式智能体分析的流程、结果与限制](https://openai.com/index/scaling-ai-research-for-complex-biological-data/)

🔗 [研究团队：代码与资料仓库](https://github.com/jinlabneurogenomics/distributed_agent)

---

### Anthropic 介绍攻击面缩减研究，在 25 个项目中发现 493 个问题

Anthropic 介绍用 Claude 分析开源代码攻击面的研究，覆盖 25 个、超过 500 万行代码的项目。团队围绕默认配置、配置交互和过早可达的代码检查，发现 493 个问题；其中一类改进是将复杂代码放在身份验证或配置检查之后，减少外部请求可以触达的代码。

493 个问题不等于 493 个可立即利用的漏洞。OpenSSH 案例中，维护者在 10.6 版本加入检查，减少默认构建中未认证客户端可触达的代码。团队强调结合动态跟踪和基线测试，并将可能改变非默认配置行为的修改交由人决定。

🔗 [Anthropic：攻击面分析、OpenSSH 案例与验证方法](https://www.anthropic.com/research/attack-surface-reduction)

---

## 技巧与观点

### Jellyfish 研究者讨论编码智能体的人类评审瓶颈

Jellyfish 的 AI 与研究负责人 Nicholas Arcolano 在 Tessl 发表文章，引用其 2026 年 9 月报告：中位数公司的已合并 PR 中，智能体创作占比为 22%，但仅约 0.6% 的 PR 在合并前只有 AI 评审；后者在领先公司的比例达到 9%。

文章认为，代码产出加速后，审阅与交付容易形成瓶颈，建议结合低风险任务分流、沙箱、预发布环境和自动化测试积累信任。这些是 Jellyfish 样本中的观察与作者建议，PR 占比不等于代码行占比，也不代表整个行业已经适合取消人工审查。

🔗 [Tessl：Nicholas Arcolano 的分析与实践建议](https://tessl.io/blog/there-arent-enough-chaperones-for-all-your-coding-agents)

🔗 [Jellyfish：原始 AI Engineering Trends 报告](https://jellyfish.co/ai-engineering-trends/)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.virxact.com）*
