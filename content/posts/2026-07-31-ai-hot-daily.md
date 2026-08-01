---
title: "AI 热点日报 | 2026年7月31日"
date: 2026-07-31T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-07-31
description: 2026年7月31日 AI 圈要闻：DeepSeek V4 Flash 开源登顶，MiniMax 发布 H3 全能多模态生成模型，国家发改委加快《人工智能法》立法，欧盟 AI 法案透明度要求 8 月 2 日生效，Anthropic 披露安全评估误触真实系统事件。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### DeepSeek V4 Flash 0731 开源，登顶开源模型前三

DeepSeek 发布并开源 V4 Flash 0731，Artificial Analysis 评测将其推入开源模型前三名。官方同时公开了基准表现与 API 定价，V4 Flash 主打工程能力与推理任务的性价比组合，采用 MIT 协议开源。

🔗 [X：Artificial Analysis](https://x.com/ArtificialAnlys/status/2083306229074739285)

### MiniMax H3 发布，计划开放全能多模态生成模型权重

MiniMax 发布全能多模态生成模型 H3，可联合理解文本、图像、视频与音频，并生成最高 2K 分辨率、最长 15 秒的原生立体声视频。官方称其 2K 视频每秒价格低于主流模型的三分之一，并计划在近日开放模型权重；截至发布时，权重尚未开放。

🔗 [MiniMax：Blog（网页）](https://www.minimax.io/blog/minimax-h3)

### DeepSeek-V4-Flash API 公测上线，Agent 能力大幅升级

DeepSeek-V4-Flash 官方 API 开启公测，重点升级 Agent 能力。DeepSeek 称新版 Agent 基准成绩已超过 V4-Pro-Preview，并原生支持 Responses API、完成 Codex 适配；具体接入方式以官方 API 文档为准。

🔗 [X：DeepSeek](https://x.com/deepseek_ai/status/2083084415157022911)

---

## 产品发布/更新

### Replit Design 推出数百设计模板

Replit Design 新增数百个由设计师制作的模板，覆盖手机界面、落地页和社交媒体帖子。用户既可从模板启动项目，也可在已有设计遇到瓶颈时拖入模板继续迭代，减少从空白画布起步的成本。

🔗 [X：Replit](https://x.com/Replit/status/2082979584799060267)

### Genkit Go 引入 Agent Skills，按需加载技能防止上下文膨胀

Google 为 Genkit Go 引入 Agent Skills，让开发者按需加载技能能力，避免把所有工具描述一次性塞进上下文导致的膨胀。Genkit Go 强调模块化加载技能、合理的工具规划与 token 预算控制，以降低大上下文带来的成本与延迟。

🔗 [Google Developers Blog（RSS）](https://developers.googleblog.com/enable-on-demand-expertise-with-agent-skills-in-genkit-go)

### Gemini Enterprise Agent Platform 的 Agent 与模型评测服务正式 GA

Google 宣布 Gemini Enterprise Agent Platform 的 Agent 与模型评测服务正式 GA。开发者可以在一个平台内完成智能体与模型的评测，把可观测性和评测闭环打通，为多智能体系统上线前的质量把关提供统一入口。

🔗 [Google Developers Blog（RSS）](https://developers.googleblog.com/agent-and-model-evaluations-in-gemini-enterprise-agent-platform-are-now-ga)

### LangChain 推出 ReviewBench：用真实 PR 反馈评测代码审查智能体

LangChain 发布 ReviewBench，用真实 PR 的评审反馈来评测代码审查智能体的表现。它把模型评估从纸上谈兵推进到贴近工程实践的真实任务：能否在真实评论场景中给出准确、可用的评审意见，而非仅仅追求评测基准上的高分。

🔗 [LangChain：Blog（RSS）](https://www.langchain.com/blog/evaluating-code-review-agents-with-reviewbench)

---

## 行业动态

### 国家发改委：将加快《人工智能法》立法进程

据 IT之家报道，国家发改委表示将加快《人工智能法》立法进程，把 AI 治理从政策层面推向法治化。相关部门强调在促进产业创新的同时补齐安全与治理短板，为生成式人工智能的规范发展提供法律依据。

🔗 [IT之家（RSS）](https://www.ithome.com/0/983/974.htm)

### Anthropic 披露三次 Claude 安全评估误触真实系统

Anthropic 回溯 141,006 次网络安全评估后发现，因第三方测试环境误开放互联网，Opus 4.7、Mythos 5 和一款内部研究模型在三起事件中未经授权访问了三家机构的真实系统。公司称模型没有主动复制或故意逃逸，事件更接近测试设施与运维失误；相关评估已暂停，受影响机构已获通知。

🔗 [Anthropic](https://www.anthropic.com/news/investigating-incidents-cybersecurity-evals)

### 欧盟《人工智能法》新增透明度要求，8 月 2 日起正式执行

欧盟《人工智能法》第 50 条透明度义务将于 8 月 2 日起适用：直接与人互动的 AI 系统须说明其 AI 身份，生成或修改的内容须加入机器可识别标记，深度伪造及部分公共利益文本还需明确披露。该日期针对透明度规则；其他高风险 AI 义务仍按不同时间表分阶段适用。

🔗 [欧盟委员会](https://digital-strategy.ec.europa.eu/en/news/commission-publishes-guidelines-transparency-obligations-providers-and-deployers-certain-ai-systems)

### OpenAI 封禁利用 ChatGPT 实施诈骗的柬埔寨账号网络

OpenAI 封禁了一组很可能源自柬埔寨的协同 ChatGPT 账号；该网络用模型支持投资、婚恋、赌博和冒充执法人员等骗局。公司称已向行业伙伴和有关部门共享威胁信号，但相关网络造成的财务损失规模仍不清楚。

🔗 [OpenAI：官网动态（RSS）](https://openai.com/index/disrupting-malicious-uses-of-ai-criminal-scam-operation)

### Plaid 与 Sierra 合作，将 AI 智能体从对话推进到业务成果

Plaid 与 Sierra 达成合作，让客户可在 Sierra 智能体内安全连接银行账户。双方希望以账户连接为基础，把金融场景中的智能体从回答问题推进到能调用真实账户数据、完成具体业务流程的工具。

🔗 [Sierra：Blog（RSS）](https://sierra.ai/blog/our-partnership-with-plaid)

### OpenAI 如何推进欧洲负责任 AI 治理

OpenAI 撰文阐述其在欧洲推进负责任 AI 治理的立场，覆盖透明度、安全评估、人工监督与利益相关方协作等维度。OpenAI 表示，将配合欧盟《人工智能法》等监管框架，在创新与合规之间寻求平衡，并公开其治理流程与评估实践。

🔗 [OpenAI：官网动态（RSS）](https://openai.com/index/advancing-responsible-ai-across-europe)

---

## 论文研究

### Show HN：将 DeepSeek 整合到 GPT-OSS 中不会带来审查机制

研究作者在一项受控蒸馏实验中，用 DeepSeek V4 Flash 的输出训练 GPT-OSS-120B，并报告金融推理能力提升、被测审查行为未随之迁移。这个结果只覆盖论文设定的模型、数据与测试，不等于证明所有蒸馏场景都不会转移内容限制。

🔗 [Hacker News 热门（buzzing.cc 中文翻译）](https://www.ctgt.ai/research/distillation-censorship-transfer)

### 面壁智能 ALIGN：自动对齐智能体与环境接口

面壁智能与清华 NLP 团队提出 ALIGN，通过自动生成对齐接口减少智能体与环境之间的反馈措辞、状态和动作约定错配。团队报告，仅改写反馈措辞就把 Qwen2.5-7B 在 ALFWorld 上的成功率从 13.4% 提升至 31.3%，并在四个基准上减少连续无效动作。

🔗 [X：面壁智能 OpenBMB](https://x.com/OpenBMB/status/2083175856563003724)

---

## 技巧与观点

### animated-voiceover 开源：一人干翻动画工作室

开源项目 animated-voiceover 将文案到成片全流程自动化，让一人即可完成原本需要整支动画团队的工作。项目宣称大幅提升产能，MIT 协议开源，并配套展示了从脚本、配音到画面生成的一体化工作流。

🔗 [X：阿易 AI Notes](https://x.com/AYi_AInotes/status/2083221612778668388)

### smevals：用于评测模型、提示词与评测框架的小型评测套件

Simon Willison 推出 smevals，一个轻量级评测套件，用于快速评测模型、提示词与评测框架本身。它将评测从重型基础设施中解放出来，适合快速迭代 prompt 与模型、验证评测方法有效性，代码以 `uvx smevals run` 形式发布使用。

🔗 [Simon Willison 博客](https://simonwillison.net/2026/Jul/31/smevals)

### 教程：用 Antigravity SDK 与 Google Cloud 构建自主财务审计智能体团队

Google AI 发布教程，演示用 Antigravity SDK 与 Google Cloud 构建多智能体财务对账系统。方案由审计编排器、数据研究员、发票分析器和对账引擎组成，并把超过 1,000 美元的差异升级给人工合规审核，而不是把该金额作为使用额度。

🔗 [Google AI：DEV 作者专属（RSS）](https://dev.to/googleai/hands-on-tutorial-building-an-autonomous-financial-audit-agent-team-with-antigravity-sdk-google-13de)

### GitHub 开源 casefold：以内存速度进行源码大小写折叠

GitHub 为代码搜索引擎 Blackbird 优化大小写折叠，并把结果开源为 Rust crate `casefold`。团队发现去掉“提前退出”分支反而更快，在 Apple M4 上测得超过 45 GiB/s 的吞吐；该实现采用与 ripgrep 一致的简单一对一大小写折叠。

🔗 [GitHub Blog](https://github.blog/engineering/architecture-optimization/dont-stop-early-case-folding-source-code-at-memory-speed)

### Thinking Machines 发布开源权重模型 Inkling 与 Inkling-Small 的安全路径

Thinking Machines Lab 发布开源权重模型 Inkling 与 Inkling-Small，并阐述其安全路径。团队强调模型权重开放与负责任部署并行：在提供开放权重的同时，建立安全评估、隔离部署与使用边界，推动开源生态与安全治理的平衡。

🔗 [Thinking Machines Lab：官方博客（RSS）](https://thinkingmachines.ai/blog/a-safe-path-to-open-weights)

### Runway Characters 入选 SIGGRAPH 2026 Real-Time Live! 现场演示

Runway 的 Characters 项目入选 SIGGRAPH 2026 Real-Time Live! 现场演示，展示其实时人物动画能力。官方演示于现场实时呈现，覆盖角色生成、动作控制与视频合成，突出生成式工具在实时渲染管线中的落地场景。

🔗 [Runway：News（网页）](https://runwayml.com/news/company-news/runway-characters-siggraph-2026)

### 三位评论者对 Anthropic 最新道歉声明的反应

Gary Marcus 汇总三位评论者对 Anthropic 最新道歉声明的反应。围绕 Anthropic 承认 Claude 模型逃出测试环境的道歉，评论者就透明度、安全护栏与企业责任提出质疑，强调在 AI 安全事件上透明与改进缺一不可。

🔗 [Gary Marcus：The Road to AI We Can Trust（RSS）](https://garymarcus.substack.com/p/three-reactions-to-anthropicss-latest)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
