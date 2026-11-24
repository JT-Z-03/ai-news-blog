---
title: "AI 热点日报 | 2026年11月24日"
date: 2026-11-24T00:00:00+08:00
publishDate: 2026-11-24T08:07:58+08:00
lastmod: 2026-11-24T08:07:58+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-24
description: 2026年11月24日 AI HOT 滚动精选，关注 ChatGPT 日常聊天版 GPT-6.2 Sol、Claude 插件与 Claude Ship、Figma 智能体、Google Wallet 接入搜索、量子电路和黎曼猜想的形式化核验、企业 AI 用工访谈及美国两州的 Grok 诉讼。
aihot_ids: ["gl6fl6hsisrt26tg83li0j4gk", "h1vnjuwxsli7ku7rpocjlr3s2", "zur9ndkrkvtk4lqiix14q468s", "cyorgi8t8dm2fo6ee3b5a6qs2", "t7jlbaldqf2zcliuva1sofoks", "pjpgapf3mbvmy98cywxhwf07n", "gj8mzwrgqlkvim6xe382a35q2", "vlxrimiuixb91iodhjh5hxmte"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 9 条。本次取材截止北京时间 11 月 24 日 08:01。

---

## 模型与产品

### 进展：ChatGPT 的 Chat 标签开始推出 GPT-6.2 Sol

继[本月面向 Work、Codex 和 API 的发布](/posts/ai-hot-2026-11-18/)后，OpenAI 在 11 月 23 日的发布说明中宣布，面向日常对话调校的 GPT-6.2 Sol 开始在 Chat 标签分批上线，覆盖 Plus、Pro、Business 和 Enterprise，企业账户仍受管理员设置约束。OpenAI 的内部测试记录了复杂指令执行、网页资料查找和图像理解的提升。本次消息于北京时间 11 月 24 日收录。

🔗 [OpenAI 的 ChatGPT 发布说明](https://help.openai.com/en/articles/6825453-chatgpt-release-notes)

### 补充：Claude 将插件、技能与连接器放进同一入口

**Claude 于美国时间 11 月 23 日公布更新，24 日凌晨收录。** 网页版和桌面版 Claude 的侧栏新增 Plugins 入口，用户可以在同一页面发现、添加和管理插件、技能与连接器，已安装项目继续可用。Free、Pro、Max 与 Ultra 已开放，Team 从 11 月 30 日开始逐步推出，Enterprise 将在随后几周跟进。

🔗 [Claude 官方帮助说明](https://support.claude.com/en/articles/17740565-manage-plugins-skills-and-connectors-from-one-plugins-page)

### 补充：Figma 智能体面向付费用户开放白板与演示文稿功能

Figma 博客的发布时间对应北京时间 11 月 24 日 04:54。 FigJam 和 Figma Slides 的付费用户可以把附件或来自 Slack、Asana 等连接器的资料交给 Figma 智能体，用于整理白板、生成流程图，或按现有大纲和品牌模板起草演示文稿。

🔗 [Figma 博客原文](https://www.figma.com/blog/introducing-figma-agent-in-figjam-and-slides/) · [Figma 官方发布说明](https://www.figma.com/release-notes/)

### Google Search 的 AI Mode 开始接入 Google Wallet

谷歌在北京时间 11 月 24 日 01:00 公布，Search 的 AI Mode 开始分批开放 Google Wallet 连接。用户选择开启后，AI Mode 可读取账户信息，用于整理开支或分析卡片权益，权限限于读取。Google Drive 和 Gemini 应用的连接将在未来数周跟进，用户可以在搜索个性化设置中关闭连接。

🔗 [Google Search 官方公告](https://blog.google/products-and-platforms/products/search/google-search-personal-intelligence-apps/)

## 开发与研究

### 补充：Claude Ship 扩展 GitHub 拉取请求的评审和审批

**Claude 官方公告标注 11 月 23 日，24 日凌晨收录。** Claude Ship 包含已正式可用的 Code Review，以及两项测试功能。PR Steward 可处理 CI 失败、合并冲突和评审反馈。Claude Approvals 按团队写在仓库里的审批规则判断是否可以批准，遇到规则要求时交给人工审核。GitHub 的权限和分支保护继续生效。

🔗 [Claude Ship 官方公告](https://claude.com/resources/articles/introducing-claude-ship)

### Google DeepMind 开源量子电路搜索与 Lean 核验成果

北京时间 11 月 24 日 01:00，Google DeepMind 公布与 Google Quantum AI 的合作成果。研究团队让 Gemini 4 智能体提出量子电路方案，用 Lean 4 核验正确性和计算成本。在模拟惯性约束聚变的一项任务中，核验后的电路综合计算成本降至原方案的约 1/11.8，所需逻辑量子比特从 5,650 个降到 4,338 个。结果来自形式化资源估算。团队同时公开了 Lean 库、问题规格和已核验的解法，论文预印本最早在 11 月 6 日提交。

🔗 [Google DeepMind 官方公告](https://deepmind.google/blog/finding-faster-quantum-algorithms-with-agents-and-formal-verification/) · [论文](https://arxiv.org/abs/2611.09822) · [Lean 项目](https://github.com/google-deepmind/formal-quantum-computation)

### 进展：黎曼猜想形式化证明通过一轮端到端 Comparator 核验

继[两条等价不等式的核验进展](/posts/ai-hot-2026-11-23/#进展黎曼猜想形式化核验扩展至两条等价不等式)后，MIT 数学家 Andrew Sutherland 于北京时间 11 月 24 日 07:45 更新记录。记录显示，使用已有构建文件运行的 Comparator v4.33.0 已完成对原证明的命题比对、公理检查及内核核验。采用 Lean v4.36.0 的另一轮检查已通过严格模式内核和 nanoda，最后一个内核阶段仍在运行。把原证明与两条不等式组合后的完整核验也仍在运行。克雷数学研究所继续将黎曼猜想列为待解问题。

🔗 [Sutherland 的核验记录](https://math.mit.edu/~drew/grh/) · [克雷数学研究所问题页面](https://www.claymath.org/millennium/Riemann-Hypothesis/)

## 行业动态

### 补充：Anthropic 访谈 58 家企业，受访者报告少量裁员与招聘放缓

**原报告标注 11 月 23 日，24 日凌晨收录。** Anthropic 对 58 家美国企业客户进行 66 次面对面访谈。约三分之二的受访企业有人报告，AI 让公司减少了原本会进行的招聘。9 家报告削减外包岗位。受访者提到的美国本土直接裁员案例较少，更多收益来自扩大产出、拓展可提供的服务，或把员工调到仍需要人工的环节。报告明确说明，这些企业是选取的客户样本，观察结果适用于所访样本。

🔗 [Anthropic 企业访谈报告](https://www.anthropic.com/research/working-with-ai)

### 补充：美国两州就 Grok 深伪图像防护分别起诉 SpaceX 等公司

**两州公告标注美国当地时间 11 月 23 日，24 日凌晨收录。** 俄勒冈州和弗吉尼亚州总检察长分别在州法院提起民事诉讼，被告包括 SpaceX 和 X Corp.。两州指控相关公司对 X 和 Grok 的安全性作出误导性宣传，且未采取充分措施阻止未经同意的私密图像生成和传播，包括涉及未成年人的图像。两州公告所列为诉讼指控，仍待法院审理。

🔗 [俄勒冈州司法部公告](https://www.doj.state.or.us/media-home/news-media-releases/ag-rayfield-takes-legal-action-against-grok-for-failing-to-block-child-exploitation/) · [弗吉尼亚州总检察长公告](https://oag.state.va.us/media-center/news-releases/jay-jones/3162-attorneys-general-jones-and-rayfield-file-suit-against-spacex-parent-company-of-x-xai-and-grok-over-creation-and-promotion-of-child-exploitation-and-non-consensual-images-on-platform)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
