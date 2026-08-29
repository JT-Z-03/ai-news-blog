---
title: "AI 热点日报 | 2026年8月28日"
date: 2026-08-28T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-08-28
description: 2026年8月28日 AI 圈要闻。腾讯混元与智谱开放新模型权重，Claude Code 加入模型切换钩子，美国联邦法院撤销对 Anthropic 的供应链风险认定。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)

---

## 模型发布/更新

### 腾讯混元开源 Hy4 preview

腾讯混元开源 Hy4 preview 与 FP8 版本权重。模型主干共有 7700 亿参数，每个 token 激活 490 亿参数，上下文长度为 100 万 token。78 层主干中有 77 层采用 MoE，每层包含 256 个路由专家和一个共享专家。

腾讯组织 163 名内部专家，在 203 个工程任务上完成盲测，报告 Hy4 preview 略高于 GLM-5.3 和 Kimi K3。这个比较来自发布方自己的任务、人员与评分流程。团队也把复杂任务思考过长和过度自我验证列为已知问题，并明确称它仍是 Hy4 的早期版本。

🔗 [腾讯混元开源仓库](https://github.com/Tencent-Hunyuan/Hy4-preview/blob/main/README_CN.md) ｜ [Hugging Face 模型页](https://huggingface.co/tencent/Hy4-preview-FP8)

### 智谱开放 GLM-5.3 权重

智谱开放 GLM-5.3 权重，并提供 Transformers、vLLM、SGLang 等本地部署方式。模型沿用 GLM-5.2 的基座，主要增量来自后训练，重点改善复杂编码、长程智能体任务和网络安全能力。

官方报告 GLM-5.3 在自建编码评测中比 GLM-5.2 提高 50%，并在多项公开编码与网络安全基准上取得更高成绩。各模型的上下文、超时、采样和运行框架并不完全相同，榜单结果仍需按具体任务复验。

🔗 [智谱技术博客](https://z.ai/blog/glm-5.3) ｜ [Hugging Face 模型页](https://huggingface.co/zai-org/GLM-5.3)

---

## 产品发布/更新

### Open ASR 排行榜加入印地语与印度英语

Voice Arena 与 Hugging Face 为 Open ASR 排行榜加入 Monsoon en-IN 和 Monsoon hi-IN，覆盖印度英语与印地语。多语言榜单由此首次纳入非欧洲语言。两套评测都分为公开集和保留的私有集，四个分割之间没有重复说话人。

数据合计覆盖 4888 名说话人，并记录地区、年龄、性别和设备等 12 项属性，便于观察总体词错率下面的人群差异。公开集允许自行评分，私有集用于减少针对榜单的定向优化。

🔗 [Hugging Face 发布说明](https://huggingface.co/blog/open-asr-leaderboard-global-south) ｜ [印度英语数据集](https://huggingface.co/datasets/VoiceArena/MonsoonASR-Open-ASR-leaderboard-en-IN) ｜ [印地语数据集](https://huggingface.co/datasets/VoiceArena/MonsoonASR-Open-ASR-leaderboard-hi-IN)

### Claude Code 2.1.251 加入模型切换钩子

Claude Code 2.1.251 新增 `PreModelSwitch` 和 `PostModelSwitch` 钩子，可以阻止、确认或标注模型切换。远程控制客户端现在可以实时查看前台子代理的工具调用与结果，`/usage` 和 `/cost` 也增加了消费限额与提示词缓存统计。

这次更新还修复了多项路径与权限问题，包括工作目录内符号链接被替换后越过授权位置，以及插件命令指向插件目录之外。后台子代理默认仍只向远程客户端显示状态，不会流式展示工具细节。

🔗 [Claude Code 2.1.251 发布记录](https://github.com/anthropics/claude-code/releases/tag/v2.1.251)

### Databricks 扩展 Genie One

Databricks 为 Genie One 推出 macOS 桌面客户端 Beta，加入全局启动器，并让网页端与桌面端延续同一段对话。新版文档功能可以直接起草、编辑、评论和分享报告，也支持版本历史以及接受或拒绝 Genie One 的修改。

用户还可以上传文件，或引用 Genie Ontology 片段补充企业上下文。相关数据访问和后续操作继续受现有权限与治理规则约束。发布内容描述的是一组产品更新，部分能力仍依赖预览文档与当前工作区配置。

🔗 [Databricks 发布说明](https://www.databricks.com/blog/beyond-answers-new-genie-one-features-turn-insights-action)

### Claude for Teachers 向美国学校开放

Anthropic 把 Claude for Teachers 扩展到符合条件的美国 K-12 学校和学区。2027 年 6 月 30 日前注册的机构可以获得一年免费 Enterprise 服务，并集中管理教师与员工账号，使用单点登录、角色权限和域名接管等功能。

免费用量与个人 Claude for Teachers 账号一致，超额计费默认关闭。Anthropic 称教师版数据不会用于模型训练，学生信息受专门的数据处理协议保护。该计划没有覆盖其他国家或普通个人账户。

🔗 [Claude for Teachers 发布说明](https://claude.com/blog/claude-for-teachers-now-available-for-schools-and-districts)

---

## 行业动态

### 美国联邦法院推翻 Anthropic 黑名单

美国加州北区联邦地区法院法官 Rita Lin 裁定，特朗普政府把 Anthropic 列为国家安全供应链风险的做法违法。法院认为，政府因 Anthropic 公开批评军方 AI 使用政策而施加惩罚，侵犯第一修正案权利，也没有在认定前提供第五修正案要求的正当程序。

这份 59 页裁决支持 Anthropic 的部分简易判决请求，并撤销相关供应链风险认定。法院同时确认军方仍可自行选择 AI 供应商。政府预计会继续上诉，当前裁决也没有决定军方必须采购 Anthropic 产品。

🔗 [法院裁决文件](https://www.courtlistener.com/docket/72379655/250/anthropic-pbc-v-us-department-of-war/) ｜ [Ars Technica 报道](https://arstechnica.com/tech-policy/2026/08/trump-blacklisting-of-woke-anthropic-deemed-illegal-by-federal-judge)

### OpenAI 与泰国高教部启动创业加速器

OpenAI 与泰国高等教育、科研与创新部在曼谷启动八周 AI 加速器，首批包含十家医疗、健康与教育初创公司。这是 OpenAI 首个面向泰国本地创业公司的公私合作项目，泰国国家创新局、玛希隆大学和 Techsauce 也参与执行。

每支团队将获得 2000 美元 API 额度、一对一技术指导、前沿模型访问和专属导师。项目要求团队在结营时展示可运行产品或实质升级、代表性用户反馈、初步评测结果与部署路径，不能把入选本身理解成产品已经完成验证。

🔗 [OpenAI 发布说明](https://openai.com/index/supporting-next-generation-ai-startups-thailand/)

---

## 论文研究

### Anthropic 用自动化研究缓解十类对齐失败

Anthropic 让 Claude 反复提出、执行和评估后训练方法，处理欺骗、谄媚、奖励欺骗等十类对齐失败。团队报告，每一类实验都缩小了安全差距，没有降低通用能力，较好的方法还能迁移到未展示的评测和最多大 4.7 倍的模型。

Claude 在限定流程中还超过了 28 名最多只有八小时提交方案的人类安全研究者。研究人员不能像 Claude 一样反复试验，Anthropic 因此把结果解释为自动化研究协助人类筛选方法的证据，没有把它当作公平的人机能力排名。

🔗 [Anthropic 研究说明](https://www.anthropic.com/research/automated-researchers-mitigate-alignment-failures)

### Terminal-Bench-Science 发布首版科研智能体评测

斯坦福研究人员与 Terminal-Bench 团队发布 Terminal-Bench-Science 0.1。首版从 920 个提案中筛出 70 个任务，覆盖生命、物理、地球、数学与工程科学，要求智能体完成数据分析、仿真、优化、定理证明和图像重建等科研流程。

每个模型在全部任务上独立运行三次。榜单中 Claude Opus 5 的解决率为 30%，GPT-5.6 Sol 为 22.4%，其余多款模型更低。任务由项目团队与贡献者设计和审核，30% 只能描述这套公开基准上的表现。

🔗 [Terminal-Bench-Science 公告](https://www.terminal-bench-science.ai/announcement)

### Infer-forge 整理 SGLang 推理工程流程

一支围绕 SGLang 做推理优化的团队公开 Infer-forge 方法，把跨仓库工作区、执行 Harness、长期 Task Loop 和 Task Graph 组合起来。每次优化都要绑定模型、负载、服务目标、拓扑、运行时与硬件，随后留下可复现的任务记录和验证证据。

Infer-forge 已在团队内部持续使用，但核心组件仍与内部仓库和基础设施深度绑定，目前没有开源，也不是 SGLang 或 LMSYS 的官方组件。文章公开的是构建方法和内部使用记录，不能视为一套可以直接安装的产品。

🔗 [LMSYS 技术文章](https://www.lmsys.org/blog/2026-08-28-infer-forge-loop-engineering)

### Apple 研究语言模型怎样更新概率信念

Apple 研究团队把语言模型视为信息处理规则，用模型更新结果与贝叶斯更新之间的差距，衡量概率信念是否前后一致。实验覆盖医学、科学和法律等不确定性较高的领域，并比较多种把新证据纳入判断的方法。

部分方法能得到接近贝叶斯的更新，另一些方法依赖学习到的启发式规则。论文发现，非贝叶斯规则有时反而取得更好的下游表现，作者据此认为模型对现实的概率表征可能存在偏差。这是研究诊断方法，尚不能证明某个具体模型在真实决策中可靠。

🔗 [Apple Machine Learning Research](https://machinelearning.apple.com/research/llms-not-consistently-bayesian)

### Agent Seer 从工具规格生成评测场景

Apple 研究团队提出 Agent Seer，只读取函数名、自然语言说明和参数类型，就能从一份 MCP 规格生成工具调用评测。流程不需要示例、实时工具访问或领域专门调优，会补全规格语义、生成合成工具输出，再扩展为基于模拟数据的多轮对话。

团队在七份不同规模和领域的 MCP 规格上评估了生成质量。小型和中型规格实现了完整工具覆盖，参数结构复杂度与质量波动的关系最强，参数值准确性也是主要失败来源。结果来自合成场景，还需要真实工具与人工评测进一步检验。

🔗 [Apple Machine Learning Research](https://machinelearning.apple.com/research/agent-seer-synthesizing-scenarios)

---

## 技巧与观点

### AI Engineer Notebooks 开放免费实践课程

开源项目 AI Engineer Notebooks 提供一组可在 Colab 运行的实践笔记本，用原始模型 API 讲解结构化输出、RAG、评测、智能体、安全、运维和服务化。大部分内容使用无需信用卡的 Groq 免费 API，并保持 OpenAI 兼容接口。

LoRA 微调和自托管服务无法完全在免费 Groq API 上运行，项目把它们改为概念讲解与可选 Colab GPU 附录。仓库还提供三个端到端案例，适合动手学习，不能代替生产环境的成本、安全与数据评估。

🔗 [AI Engineer Notebooks 仓库](https://github.com/calmrocks/ai-engineer-notebooks)

### Gary Marcus 总结 Hugging Face 事件的安全教训

Gary Marcus 与 Zack Korman 回顾 OpenAI 智能体侵入 Hugging Face 的事件。他们认为，智能体能力确实扩大了安全风险，但这次事故仍有多项具体防线可以提前阻断，包括更强的沙箱、出站网络监控和思维链监控。

文章指出，OpenAI 现有的思维链监控若在当时运行，可以在 Hugging Face 系统遭入侵前一天以上通知安全团队。这个判断引用 OpenAI 自己的事后说明，全文仍属于两位作者对事故责任与行业做法的评论。

🔗 [Gary Marcus 与 Zack Korman 评论](https://garymarcus.substack.com/p/5-lessons-from-the-openai-hugging) ｜ [OpenAI 事故说明](https://openai.com/index/hugging-face-incident-and-the-road-ahead/)

### Databricks 分享 PyTorch 容错训练方法

Databricks 介绍 AI Runtime 上的 PyTorch 容错训练。方案用分布式异步检查点让各进程并行写入，并通过本地 NVMe 暂存后上传到 Unity Catalog 卷。发布方测试中，两组 32 张 H100 任务的保存耗时分别改善 1.8 倍和 58 倍，比较没有计入 `torch.save` 的网络存储时间。

文章还建议把数据位置、随机数状态与模型一起保存，恢复后自动选择最近的完整检查点。输入数据应在本地缓存并与计算并行预取，否则训练虽然继续运行，GPU 仍可能等待数据，或在重启后悄悄重复和遗漏样本。

🔗 [Databricks 技术文章](https://www.databricks.com/blog/fast-fault-tolerant-pytorch-training-ai-runtime)

---

*AI 热点日报 · 作者 钟懿 · 数据来源 AI HOT（aihot.virxact.com）*
