---
title: "AI 热点日报 | 2026年11月24日"
date: 2026-11-24T00:00:00+08:00
publishDate: 2026-11-24T08:07:58+08:00
lastmod: 2026-11-25T08:07:33+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-11-24
description: 2026年11月24日 AI HOT 滚动精选，关注 GPT-6.2 Sol 日常版、Claude 与 Figma 更新、Google Wallet 接入搜索、MiniMax H3 Family、形式化验证、ShellBench 智能体评测、Shirudo Linux 临时防护、亚马逊公布的零日漏洞案例及 Megaspeed 出口管制。
aihot_ids: ["gl6fl6hsisrt26tg83li0j4gk", "h1vnjuwxsli7ku7rpocjlr3s2", "zur9ndkrkvtk4lqiix14q468s", "cyorgi8t8dm2fo6ee3b5a6qs2", "t7jlbaldqf2zcliuva1sofoks", "pjpgapf3mbvmy98cywxhwf07n", "gj8mzwrgqlkvim6xe382a35q2", "vlxrimiuixb91iodhjh5hxmte", "f1380j6hyrxn0rnz6666nu3b8", "tl8v9gto8rd3e4x40xfbljj13", "zto0pspydy8330r0bvwqb6j5z", "d41p6k2h48zm8u2kl5xdzqx5h", "frmncgr2jcrvfm3t6jgabqhfh", "ygbhvp086wl672gfxuhfgl23x"]
---

> 数据来源 [AI HOT](https://aihot.news/)。本期为截至本次更新时间的精选，含必要迟到补充，共 15 条。本次复核取材截止北京时间 11 月 25 日 08:00。

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

### 进展：MiniMax 公布 H3 Family 视频与图像模型阵容

**11月24日 14:09 补充。** 继[开放 H3-Image 权重](/posts/ai-hot-2026-11-11/)后，MiniMax 于北京时间 11 月 24 日公布 H3 Family 的产品阵容。视频系列包括侧重画质的 H3、侧重速度的 H3-Highspeed 和降低生成成本的 H3-Lite，图像系列包括 H3-Image 和 H3-Image Highspeed。官方还收录了 fal、Suno、HeyGen 等合作方的扩展。MiniMax 在开源生态回顾中称，基于 H3 的衍生模型已有 1,472 个，累计下载超过 1.48 亿次。

🔗 [MiniMax 发布原文](https://mp.weixin.qq.com/s/Maoz76fZdGNaB7tlIVxWWQ) · [H3 Family 官方产品页](https://www.minimax.cn/h3-family)

## 开发与研究

### 补充：Claude Ship 扩展 GitHub 拉取请求的评审和审批

**Claude 官方公告标注 11 月 23 日，24 日凌晨收录。** Claude Ship 包含已正式可用的 Code Review，以及两项测试功能。PR Steward 可处理 CI 失败、合并冲突和评审反馈。Claude Approvals 按团队写在仓库里的审批规则判断是否可以批准，遇到规则要求时交给人工审核。GitHub 的权限和分支保护继续生效。

🔗 [Claude Ship 官方公告](https://claude.com/resources/articles/introducing-claude-ship)

### Google DeepMind 开源量子电路搜索与 Lean 核验成果

北京时间 11 月 24 日 01:00，Google DeepMind 公布与 Google Quantum AI 的合作成果。研究团队让 Gemini 4 智能体提出量子电路方案，用 Lean 4 核验正确性和计算成本。在模拟惯性约束聚变的一项任务中，核验后的电路综合计算成本降至原方案的约 1/11.8，所需逻辑量子比特从 5,650 个降到 4,338 个。结果来自形式化资源估算。团队同时公开了 Lean 库、问题规格和已核验的解法，论文预印本最早在 11 月 6 日提交。

🔗 [Google DeepMind 官方公告](https://deepmind.google/blog/finding-faster-quantum-algorithms-with-agents-and-formal-verification/) · [论文](https://arxiv.org/abs/2611.09822) · [Lean 项目](https://github.com/google-deepmind/formal-quantum-computation)

### 进展：黎曼猜想形式化证明通过一轮端到端 Comparator 核验

继[两条等价不等式的核验进展](/posts/ai-hot-2026-11-23/#进展黎曼猜想形式化核验扩展至两条等价不等式)后，MIT 数学家 Andrew Sutherland 于北京时间 11 月 24 日 07:45 更新记录。记录显示，使用已有构建文件运行的 Comparator v4.33.0 已完成对原证明的命题比对、公理检查及内核核验。采用 Lean v4.36.0 的另一轮检查已通过严格模式内核和 nanoda，最后一个内核阶段仍在运行。把原证明与两条不等式组合后的完整核验也仍在运行。克雷数学研究所继续将黎曼猜想列为待解问题。

**11月25日 08:07 补充。** Sutherland 在北京时间 11 月 24 日 13:25 的后续记录中增加了第三条算术推论。它从狄利克雷 L 函数的广义黎曼猜想导出一条适用于分圆域整数环理想的 Robin 型不等式。合并后的证明已通过 con-leche 和 con-ron 对三条命题的比对，独立内核 nanoda 也接受了合并后的证明导出文件。截至该记录，原证明单独使用 Lean v4.36.0 的 Comparator 核验仍在进行。

🔗 [Sutherland 的核验记录](https://math.mit.edu/~drew/grh/) · [克雷数学研究所问题页面](https://www.claymath.org/millennium/Riemann-Hypothesis/)

### 补充：英国 AISI 发现智能体监视器的漏检率随测试条件大幅变化

**11月24日 14:09 补充。AISI 官网标注 11 月 23 日发布，24 日凌晨收录。** 英国 AI 安全研究所用不同的合成样本评估同一个已停用的监视器。在这组试验里，对成功完成有害目标的样本，测得的漏检率从 0.2% 到 23% 不等。研究只评估了一个监视器和一个受监视的智能体。AISI 仍配合使用沙箱、人工监督和部署规模限制等措施。

🔗 [英国 AISI 研究原文](https://www.aisi.gov.uk/blog/attack-policy-selection-can-make-monitor-evaluations-misleading)

### 补充：OpenAI 与 Cisco 开源 Linux 临时防护工具 Shirudo

**11月24日 22:10 补充。两家公司公告标注美国当地 11 月 23 日，AI HOT 于北京时间 24 日 17:23 收录。** 在永久补丁部署前，安全团队可用 Shirudo 观察基于 eBPF 的临时防护会怎样影响现有服务，再由运维人员批准加载经过签名验证的防护。OpenAI 公布的一次受控测试中，团队在 Elasticsearch 持续运行的情况下拦截了一次攻击尝试。项目仍处于预发布阶段。

🔗 [OpenAI 官方公告](https://openai.com/index/introducing-shirudo/) · [Cisco 官方公告](https://newsroom.cisco.com/c/r/newsroom/en/us/a/y2026/m11/cisco-and-openai-launch-shirudo-a-new-project-to-safeguard-agentic-ai.html) · [Shirudo 项目仓库](https://github.com/shirudo-dev/shirudo)

### OpenClaw 发布 ShellBench，用对账等实际工作评估智能体

**11月24日 22:10 补充。** OpenClaw 官网于 11 月 24 日发布 ShellBench。团队从超过 1,000 万次匿名智能体交互中提取常见任务模式，设计了 100 道题，包括对账、检查记录是否过期和追溯证据。首轮评测覆盖 12 款模型和 5 种运行框架，共有 53,100 次运行接受评分。其中 90 道题按检查项评分，须通过全部必需项才算完成。按框架取平均，GPT-6 Astra 的完成率为 62.5%，Claude Fable 5.2 为 61.9%，GPT-6.1 Sol 为 61.4%。完整论文尚待公开。

🔗 [OpenClaw 官方公告和评测结果](https://openclaw.ai/blog/shellbench)

## 行业动态

### 补充：Anthropic 访谈 58 家企业，受访者报告少量裁员与招聘放缓

**原报告标注 11 月 23 日，24 日凌晨收录。** Anthropic 对 58 家美国企业客户进行 66 次面对面访谈。约三分之二的受访企业有人报告，AI 让公司减少了原本会进行的招聘。9 家报告削减外包岗位。受访者提到的美国本土直接裁员案例较少，更多收益来自扩大产出、拓展可提供的服务，或把员工调到仍需要人工的环节。报告明确说明，这些企业是选取的客户样本，观察结果适用于所访样本。

🔗 [Anthropic 企业访谈报告](https://www.anthropic.com/research/working-with-ai)

### 补充：美国两州就 Grok 深伪图像防护分别起诉 SpaceX 等公司

**两州公告标注美国当地时间 11 月 23 日，24 日凌晨收录。** 俄勒冈州和弗吉尼亚州总检察长分别在州法院提起民事诉讼，被告包括 SpaceX 和 X Corp.。两州指控相关公司对 X 和 Grok 的安全性作出误导性宣传，且未采取充分措施阻止未经同意的私密图像生成和传播，包括涉及未成年人的图像。两州公告所列为诉讼指控，仍待法院审理。

🔗 [俄勒冈州司法部公告](https://www.doj.state.or.us/media-home/news-media-releases/ag-rayfield-takes-legal-action-against-grok-for-failing-to-block-child-exploitation/) · [弗吉尼亚州总检察长公告](https://oag.state.va.us/media-center/news-releases/jay-jones/3162-attorneys-general-jones-and-rayfield-file-suit-against-spacex-parent-company-of-x-xai-and-grok-over-creation-and-promotion-of-child-exploitation-and-non-consensual-images-on-platform)

### 进展：美国商务部公布将 Megaspeed 等七家实体列入实体清单的规则

**11月24日 14:09 补充。** 继[美国商务部与司法部披露调查进展](/posts/ai-hot-2026-11-19/#补充美国两部门公布-megaspeed-调查进展)后，美国商务部工业与安全局（BIS）的规则于美国东部时间 11 月 23 日 16:15 提交公开预览，对应北京时间 24 日 05:15，计划于 11 月 25 日正式刊登。规则将 Megaspeed International 等位于新加坡、马来西亚和泰国的七家实体列入出口管制实体清单。BIS 给出的理由是先进计算产品转向未经授权用途或最终用户的重大风险。相关交易涉及受美国《出口管理条例》管辖的物项时须申请许可，审查原则上推定拒绝。

🔗 [美国《联邦公报》公开预览](https://www.federalregister.gov/public-inspection/2026-23999/additions-to-the-entity-list) · [BIS 规则原文](https://public-inspection.federalregister.gov/2026-23999.pdf)

### 补充：亚马逊披露智能体利用零日漏洞的案例，维护者已发布修复

**11月24日 22:10 补充。亚马逊报告标注 11 月 20 日发布，AI HOT 于北京时间 24 日 21:21 收录后续报道。** 在[此前报道的 Cairn 活动调查](/posts/ai-hot-2026-10-19/)之外，亚马逊威胁情报团队披露了另一起发生于 9 月的案例。亚马逊称，智能体约用 11 分钟便从探查应用到成功利用一项当时尚未公开的漏洞。亚马逊通知项目维护者后，维护者已发布修复和安全公告。报告建议优先对高置信度的告警采用自动响应，由安全团队监督处理结果。

🔗 [亚马逊威胁情报团队原始报告](https://aws.amazon.com/blogs/security/chinese-nexus-actors-cairn-ai-agents-found-a-zero-day-on-their-own/)

---
*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.news）*
