---
title: "AI 热点日报 | 2026年8月12日"
date: 2026-08-12T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-08-12
description: 2026年8月12日 AI 圈要闻：xAI 发布 Grok 4.6，阿里开放 Qwen3.8-2.4T-A95B 权重，LTX-2.5 提升视频生成速度，WhatsApp 测试端侧诈骗提醒，研究关注大模型事实回忆瓶颈。
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### xAI 发布 Grok 4.6，强化长时运行智能体能力

xAI 发布 Grok 4.6，重点改进长时运行智能体、复杂交互任务和视觉工作。官方称，该模型在多项智能体编码与知识工作评测中达到前沿水平，并在 Artificial Analysis Intelligence Index 上追平 GPT-5.6 Sol。基准数字来自发布方和第三方评测汇总，真实任务中的质量、速度与成本仍需结合具体工作流测试。

🔗 [xAI](https://x.ai/news/grok-4-6)

### 阿里开放 Qwen3.8-2.4T-A95B 模型权重

阿里 Qwen 团队开放 Qwen3.8-2.4T-A95B 权重。这是一款总参数 2.4 万亿、每个 token 激活约 950 亿参数的混合专家模型，原生上下文长度为 262,144 token，并可进一步扩展。模型体量很大，团队在下载或部署前需要先核对许可证、存储空间、推理框架和集群资源。

🔗 [Hugging Face：Qwen3.8-2.4T-A95B](https://huggingface.co/Qwen/Qwen3.8-2.4T-A95B)

### LTX-2.5 提升音视频生成速度并接入 ComfyUI

LTX 推出 LTX-2.5，继续提供同步音视频生成，并原生接入 ComfyUI。官方公布的双 GB200 测试中，系统生成一段 10 秒 720p 视频耗时约 6.8 秒；托管版 Fast 档的 10 秒片段标价约 0.90 美元。速度和成本数字都对应特定硬件、分辨率与服务配置，本地设备上的耗时和显存需求会明显不同。

🔗 [LTX](https://ltx.io/model/ltx-2-5)

### Microsoft AI 再次介绍首款自研推理模型 MAI-Thinking-1

Microsoft AI CEO Mustafa Suleyman 发帖介绍 MAI-Thinking-1。这是微软从零训练的首款文本推理模型，已在 Microsoft Foundry 提供预览，面向多步指令、长上下文推理和代码生成。微软公开材料称其拥有 350 亿激活参数和 256K 上下文窗口；模型可用范围与价格仍以 Foundry 实际页面为准。

🔗 [Microsoft 官方博客](https://blogs.microsoft.com/blog/2026/06/02/microsoft-build-2026-be-yourself-at-work/) ｜ [X：Mustafa Suleyman](https://x.com/mustafasuleyman/status/2087570047967408396)

---

## 产品发布/更新

### OpenRouter 上线实时网页搜索配置排行榜

OpenRouter 发布网页搜索基准，用同一套任务比较模型、搜索引擎、搜索方法与调用预算。其测试显示，增加搜索轮数往往能提高 BrowseComp 得分，同时也会推高成本；不同模型造成的平均分差还高于搜索引擎之间的差距。排行榜适合筛选候选配置，正式应用仍要加入自己的问题分布、失败率和延迟目标。

🔗 [OpenRouter Blog](https://openrouter.ai/blog/announcements/web-search-benchmark)

### Claude in Chrome 侧边栏升级为 Claude Cowork 会话

Anthropic 将 Claude in Chrome 扩展的侧边栏升级为 Claude Cowork 会话。浏览器里的对话会写入历史记录，技能与连接器也能继续使用，任务可以在桌面端、网页端和移动端之间接续。让智能体读取网页和已连接服务时，用户仍需关注登录态、页面权限与敏感数据范围。

🔗 [Claude Help Center](https://support.claude.com/en/articles/12012173-get-started-with-claude-in-chrome)

### SGLang 与 Miles 首日支持 Qwen3.8-2.4T-A95B

SGLang 与 Miles 在模型发布当天完成 Qwen3.8-2.4T-A95B 的推理适配，覆盖这款 2.4 万亿总参数、每 token 激活约 950 亿参数的混合注意力模型。首日支持能缩短部署准备时间，但这样的大模型仍对并行策略、互联带宽、显存和缓存管理提出很高要求，官方示例不等同于任何集群都能直接复现。

🔗 [LMSYS Blog](https://www.lmsys.org/blog/2026-08-12-qwen3-8-day0-support)

### WhatsApp 测试端侧 Scam Alert 诈骗提醒

WhatsApp 介绍可选的 Scam Alert 功能。它在设备端运行机器学习模型，尝试识别可疑消息，消息内容不会因检测自动上传，用户仍掌握是否启用和是否报告的决定。Meta 还计划公开模型权重，并用差分隐私汇总遥测数据。该功能目前处于有限 Beta 阶段，检测准确率、设备覆盖和误报情况还要等待更广泛测试。

🔗 [Meta Engineering](https://engineering.fb.com/2026/08/12/security/how-were-building-scam-alert-whatsapp/)

### Claude Code v2.1.229 增加远程会话恢复并修复 Windows 问题

Claude Code v2.1.229 新增远程控制会话恢复、自托管 runner 的服务端 hook 支持和插件市场命令源。该版本还修复长响应流式输出丢失、窄终端渲染崩溃与 Windows 扩展路径崩溃等问题，并调整提交与推送流程对高风险 Git 和 GitHub CLI 命令的自动批准策略。

🔗 [GitHub Releases：Claude Code v2.1.229](https://github.com/anthropics/claude-code/releases/tag/v2.1.229)

---

## 行业动态

### 调查称 Research Gold 的人工同行评审宣传由 AI 伪装支撑

404 Media 调查了面向医学研究者的 Research Gold。该网站宣称内容完全由人类撰写，并列出多名博士审稿人；报道发现部分审稿人身份和照片疑似由 AI 生成，另有真实研究者资料被未经许可使用，客服对话也由 AI 驱动。这些结论来自媒体调查及受影响研究者陈述，相关公司的回应与后续处理仍值得跟踪。

🔗 [404 Media](https://www.404media.co/company-offering-100-human-written-never-ai-peer-review-is-entirely-ai)

### RingCentral 分享 ChatGPT Work 与 Codex 的企业落地案例

RingCentral 向员工提供 ChatGPT Work 和 Codex，并通过内部 AI-Native Challenge 鼓励工程、运营及非技术岗位提交可运行项目。OpenAI 的客户案例称，活动覆盖数千名员工，帮助公司把智能体用于更多日常流程。这些成果属于供应商发布的单一企业案例，投入成本、实际使用率和长期收益需要结合 RingCentral 的组织环境理解。

🔗 [OpenAI](https://openai.com/index/ringcentral)

---

## 论文研究

### Google 研究认为事实回忆仍是大模型的主要瓶颈

Google Research 提出知识画像框架，将模型的事实错误拆分为编码失败、回忆失败等五类。团队在包括 Gemini 3 和 GPT-5 在内的前沿模型上观察到，许多事实已经进入参数，却没有在需要时被正确取回。配套的 WikiProfile 基准收录 2,150 条维基百科事实，每条设置 10 个问题，分别探测编码、回忆和识别能力。该结果来自特定基准，不能直接代表所有领域或最新知识的事实可靠性。

🔗 [Google Research](https://research.google/blog/empty-shelves-or-lost-keys-recall-is-the-bottleneck-for-parametric-factuality)

### Anthropic 综述工人再培训项目的实验依据

Anthropic 经济研究团队与独立研究者 David Roodman 汇总工人再培训项目的证据，材料包括 56 项美国随机研究和欧洲相关实验。报告关注这些项目能否缓解 AI 可能带来的劳动力市场冲击，并讨论不同设计下的就业与收入结果。历史项目面对的技术、行业和参与人群并不完全相同，研究结论更适合帮助设计政策，不能直接预测 AI 时代某一项培训的效果。

🔗 [Anthropic Research](https://www.anthropic.com/research/reviewing-the-evidence-on-worker-retraining-programs)

---

## 技巧与观点

### 一套面向零基础用户的半天 AI 上手流程

数字生命卡兹克给出 12 步入门流程，从准备电脑、订阅工具和语音输入开始，让用户按背景、痛点与需求交代任务，再通过提问澄清目标、提供文件并把有效做法保存为 Skill。文中的硬件门槛、模型选择和订阅建议带有作者经验与时间性，读者可以借用流程，具体工具仍应按预算、数据敏感度与任务类型选择。

🔗 [公众号：数字生命卡兹克](https://mp.weixin.qq.com/s?__biz=MzIyMzA5NjEyMA%3D%3D&mid=2647685084&idx=1&sn=0899296dbc140eeb745f7a99f9d5ed9c)

### 一篇上手体验比较 DeepSeek V4 Pro 与 Grok 4.6

数字生命卡兹克比较 DeepSeek V4 Pro 正式版与 Grok 4.6 的实际体验，认为两者在部分任务上接近 Claude Fable 5。文章还讨论了参数规模、模型风格和使用感受。体验比较会受到提示词、产品版本和作者任务分布影响，相关参数与发布时间也应以厂商模型卡和更新日志为准。

🔗 [公众号：数字生命卡兹克](https://mp.weixin.qq.com/s?__biz=MzIyMzA5NjEyMA%3D%3D&mid=2647685175&idx=1&sn=64c383b5b757945397894270c5f38301)

### AutoGPT 用 AGENTS.md 和门控规则管理 AI 提交

AutoGPT 维护者发现，智能体经常忽略远离代码的文档，于是把 AGENTS.md 和技能说明放到相关目录旁，并用强制 PR 模板、测试计划、CI 覆盖率门槛和 CLA 签名约束提交。文章认为，这些措施把问题从代码不可用收敛到路线图是否匹配。做法能提供参考，但不同项目仍要根据贡献规模、安全风险和维护成本调整门槛。

🔗 [GitHub Blog](https://github.blog/open-source/maintainers/your-contributors-are-ai-first-now-is-your-project)

### Nathan Lambert 反思 AI 长篇非虚构写作的停滞

研究者 Nathan Lambert 在完成一本 RLHF 教科书后回顾 LLM 的长篇写作能力。他认为模型已经能处理校对和局部编辑，写完整章节时仍容易出现结构混乱与事实错误，与编码和数学任务的快速进展形成反差。这是作者基于写书过程形成的判断，不能代表所有模型和文体，却点出了长上下文一致性与事实控制仍未解决的问题。

🔗 [Interconnects](https://www.interconnects.ai/p/i-wrote-an-ai-textbook-how-long-until)

### OpenRouter 用一套工具循环连接不同模型

OpenRouter 发布工具调用指南，演示如何用 OpenAI 兼容的 JSON Schema 定义工具、读取 `tool_calls`、执行函数并把结果交回模型。示例覆盖 cURL、Python 与 JavaScript，切换模型时主要修改模型字符串。统一接口能减少接入代码，模型之间的参数支持、工具调用稳定性和安全行为仍可能不同，生产环境需要逐个验证。

🔗 [OpenRouter Blog](https://openrouter.ai/blog/tutorials/tool-calling)

### LangChain 解释智能体与工作流的分工

LangChain 把智能体描述为由大语言模型驱动的循环系统，模型会根据观察结果决定下一步行动；工作流则预先编排固定步骤。文章主张用工作流保留确定性，用智能体处理难以提前写死的分支。实际系统通常需要同时限制工具权限、执行次数和失败后的人工接管，不能只靠概念区分获得可靠性。

🔗 [LangChain Blog](https://www.langchain.com/blog/what-is-an-agent)

### OpenAI 总结企业部署 ChatGPT 与 Codex 的路径

OpenAI 发布企业智能体应用研究，讨论领先企业如何把 ChatGPT 和 Codex 从个人辅助工具接入业务执行。报告关注组织采用差距、工作流重构和员工使用方式。由于材料来自产品提供方，读者在评估成效时还应查看样本选择、衡量口径、授权治理与无法自动化的环节。

🔗 [OpenAI](https://openai.com/index/how-enterprises-put-ai-to-work)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
