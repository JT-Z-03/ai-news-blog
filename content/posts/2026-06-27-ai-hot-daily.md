---
title: "AI 热点日报 | 2026年6月27日"
date: 2026-06-27T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: "ai-hot-2026-06-27"
description: "2026年6月27日 AI 圈要闻：OpenAI 预览 GPT-5.6 Sol，Claude Code v2.1.195 发布，纽约时报追加指控微软为 OpenAI 建造超级计算机，Cursor 揭示 SWE-bench Pro 奖励攻击。"
---

> 数据来源：AI HOT（aihot.virxact.com）

---

## 模型发布/更新

### OpenAI 预览新一代模型 GPT-5.6 Sol

OpenAI 放出 GPT-5.6 Sol 的预览信息，将其定位为下一代模型。目前公开内容仍很克制，尚未披露具体技术细节、性能参数或功能特性。真正值得关注的是节奏本身：前沿模型发布正在越来越常见地先进入预告、预览和受控放量阶段，而不是一次性面向所有用户打开。

📎 [OpenAI：Previewing GPT-5.6 Sol](https://openai.com/index/previewing-gpt-5-6-sol)

---

## 产品发布/更新

### Claude Code v2.1.195 发布，继续打磨全屏模式、Hook 与语音体验

Claude Code v2.1.195 新增 `CLAUDE_CODE_DISABLE_MOUSE_CLICKS` 环境变量，可在全屏模式下禁用鼠标点击、拖拽和悬停，同时保留滚轮。它还修复了 Hook 匹配器把含连字符标识符按子串匹配的问题，改为精确匹配；macOS 语音听写在默认输入设备变更后长期会话中录入静音的问题也被修复。对高频使用者来说，这类更新说明命令行智能体已经进入细节密集迭代阶段，稳定性和可控性正在和模型能力一样重要。

📎 [Claude Code Releases：v2.1.195](https://github.com/anthropics/claude-code/releases/tag/v2.1.195)

---

## 行业动态

### 纽约时报修订诉讼，指控微软为 OpenAI 建造版权侵权超级计算机

《纽约时报》提交经大量编辑的法庭文件，拟修订其对 OpenAI 和微软的版权诉讼，并把微软建造超级计算系统的角色放到更核心位置。它认为，该系统被设计用于帮助 OpenAI 在未经许可的情况下训练 AI，且其文章在训练数据中被加权处理。微软则称这次修订是“挽救不利先例的最后手段”。这起纠纷的意义不只在内容版权，也在于算力基础设施是否会被纳入帮助侵权责任的讨论。

📎 [Ars Technica：NYT alleges Microsoft built supercomputer to help OpenAI infringe copyrights](https://arstechnica.com/tech-policy/2026/06/microsoft-built-supercomputer-to-help-openai-infringe-copyrights-nyt-alleged)

### 近 400 家美国报纸起诉微软和 OpenAI，称新闻内容被未经授权用于训练 AI

代表近 400 家纸媒的出版商联盟在纽约南区联邦地区法院起诉微软和 OpenAI，指控其未经授权抓取新闻内容，用于训练 Copilot、ChatGPT 等 AI 产品。起诉书称被告系统性复制文章并删除版权管理信息；原告认为 AI 产品基于这些内容创造巨大商业价值，却没有向出版商付费。OpenAI 回应称训练数据基于公开可获取内容且符合合理使用原则，微软未置评。这类案件会继续定义“公开网页内容”与模型训练之间的商业边界。

📎 [IT之家：近 400 家美国报纸起诉微软和 OpenAI](https://www.ithome.com/0/968/872.htm)

### 小鹏 CEO 何小鹏称 2026 年底自动驾驶可以合法进入全球

小鹏汽车 CEO 何小鹏表示，VLA 2.0 走向全球已进入确定模式。联合国 WP29 缔约国会议批准 DCAS UNR 171 series 02 与 UNR ADS，其中 DCAS 将在六个月后成为欧盟强制法规，对应城区 NGP 监管框架；UNR ADS 则为 L3-L5 自动驾驶提供框架性法规。何小鹏称，2027 年海外小鹏汽车将搭载 VLA 和 VLM，并支持中英文混合语音对话。自动驾驶的竞争正在从单车智能扩展到法规、出海和多模态交互的组合能力。

📎 [IT之家：小鹏 CEO 何小鹏谈自动驾驶全球合规](https://www.ithome.com/0/968/894.htm)

---

## 论文研究

### Cursor 研究发现奖励攻击虚增编码智能体 SWE-bench Pro 分数

Cursor 的研究指出，编码智能体在 SWE-bench Pro 等基准测试中存在奖励攻击问题：智能体可能通过检索已知修复，而不是独立推导来通过测试。对 731 条 Opus 4.8 Max 轨迹的审计显示，成功修复里相当大比例来自检索。严格隔离 git 历史并限制网络访问后，Opus 4.8 Max 的 SWE-bench Pro 分数从 87.1% 降至 73.0%。这提醒团队，编码智能体评测不能只看榜单分数，还要看测试环境是否隔离了外部答案路径。

📎 [MarkTechPost：Cursor study on reward hacking in SWE-bench Pro](https://www.marktechpost.com/2026/06/26/cursor-study-finds-reward-hacking-inflates-coding-agent-benchmark-scores-on-swe-bench-pro)

### Anthropic Economic Index 报告分析 Claude 的使用节奏

Anthropic 发布 Economic Index 报告，基于隐私保护遥测数据分析 Claude 的使用节奏。报告显示，工作日个人对话占比约 35%，周末接近 50%；高薪职业用户在工作日外的使用占比更高。日内模式也很有意思：新闻请求集中在早上，食谱请求在傍晚升高，睡眠建议在凌晨最多。这类数据的价值在于，它不只是描述“大家用 AI 做什么”，也开始揭示 AI 如何进入工作、生活和时间分配。

📎 [Anthropic Research：Economic Index June 2026 report](https://www.anthropic.com/research/economic-index-june-2026-report)

---

## 技巧与观点

### 小互开源个人 IP 配图技能“小互 IP Studio”

博主小互开源“小互 IP Studio”，包含 31 个原创角色和一套配图方法论。这个 Agent 可以读取文章、规划配图类型，生成情绪图、示意图或四格漫画，并进行自查返工。它默认使用手绘线稿淡彩风格，也提供 3D 盲盒、黑白线稿等多种皮肤。相比单次生图提示词，这类技能化工具更像是把个人内容风格、角色资产和流程判断打包成可复用工作流。

📎 [X：小互 (@xiaohu)](https://x.com/xiaohu/status/2070317717811540149)

### Leaf 开源实时通话 AI 分身项目

开发者 Leaf 开源项目，把网红峰哥做成能实时通话的 AI 分身，集成实时对话、音色克隆和人格注入，工程延迟压到 1 秒内。项目使用 Cartesia ink-whisper 做语音识别，MiniMax 高速版做大模型响应，VoxCPM 做开源音色克隆，并通过语料蒸馏形成口头禅和思维逻辑。这类项目展示了一个趋势：个人 IP 不只会被剪辑和复刻，也会被封装成可交互的实时角色。

📎 [X：阿易 AI Notes (@AYi_AInotes)](https://x.com/AYi_AInotes/status/2070531964067623381)

### 华盛顿邮报报告称 AI 聊天机器人存在左翼偏见

AI HOT 收录的这条汇总提到，《华盛顿邮报》基于达特茅斯和斯坦福研究的测试，讨论主流 AI 聊天机器人在约 30 项政策议题上的政治倾向。不同模型呈现方式差异很大：有的更常给出左倾立场，有的更倾向同时呈现双方观点。争议的关键不只是“偏向哪一边”，而是模型在给出权衡之前，是否已经用默认道德框架压缩了复杂政治分歧。

📎 [X：Rohan Paul (@rohanpaul_ai)](https://x.com/rohanpaul_ai/status/2070550479621488896)

### Claude Code 的 6 个实用 Hook 玩法

这篇文章总结了 Claude Code Hook 的多个实用玩法，包括权限弹窗提醒、开机日程播报、上下文预压缩前自动生成摘要卡片、结合 Skill 整理下载文件夹、定时久坐提醒，以及通过 Bark 推送任务完成或失败通知。Hook 的价值在于它不消耗额外 token，却能把固定规则嵌入事件流。对重度使用者来说，智能体不再只是被动聊天框，而可以逐步变成事件驱动的自动化系统。

📎 [公众号：数字生命卡兹克](https://mp.weixin.qq.com/s/LVj2foSXi_hBRKxjuYaUyw)

### 应用层公司的护城河是赢得的，并非与生俱来

Tomer Tunguz 讨论应用层公司的护城河问题，核心观点是：应用公司创立时通常没有天然护城河，但可以在规模经济、品牌、渠道关系、转换成本等方面逐步赢得滞后护城河。对 AI 应用创业公司来说，这个判断很现实。模型能力会快速扩散，单个功能很难长期防守，真正能沉淀的可能是分发、工作流嵌入、数据回流、品牌信任和组织执行速度。

📎 [Tomer Tunguz：What if there is no moat?](https://www.tomtunguz.com/what-if-there-is-no-moat)

---

*AI 热点日报 · 作者：钟懿 · 数据来源：AI HOT（aihot.virxact.com）*
