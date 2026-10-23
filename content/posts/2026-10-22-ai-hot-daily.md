---
title: "AI 热点日报 | 2026年10月22日"
date: 2026-10-22T08:00:00+08:00
draft: false
tags: ["AI", "日报"]
categories: ["日报"]
slug: ai-hot-2026-10-22
description: 2026年10月22日 AI HOT 要闻。Claude Duet 开启研究预览，Baseten 发布决策模型，MiniMax Code 推出 Mini App；关注智能体安全研究、DeepSeek 融资进展、KLS 证明与语音资料采集评测。
---

> 数据来源 [AI HOT](https://aihot.virxact.com/)，按北京时间 10 月 22 日整理并核对原始来源。本期收录 11 条，区分产品发布、研究介绍、媒体跟进与尚未完成的融资；实际发布时间已属北京时间 23 日的消息不计入本期。

---

## 模型发布/更新

### Baseten 发布 mammoth-1 与 elephant-1，面向有界决策任务

Baseten 的 Base Labs 发布 27B 的 mammoth-1 与 9B 的 elephant-1，分别由同尺寸 Qwen3.5 模型在 621 万条决策样本上后训练而成。模型面向分类、路由和评分，接收文字及图像，为预设答案返回概率，权重以 MIT 许可公开。

当前模型卡标注最大序列长度为 16,384 Token。厂商公布的部分成绩来自对 Artificial Analysis 决策基准的复现，不是该平台官方榜单结果；上线免费试用也有时限，实际选型仍需用自己的决策任务测试。

🔗 [Baseten：模型发布、任务与评测说明](https://www.baseten.co/blog/the-best-decision-models-in-the-world-mammoth-1-and-elephant-1/)

🔗 [Base Labs：mammoth-1 模型卡与许可](https://huggingface.co/baselabs/mammoth-1)

🔗 [Base Labs：elephant-1 模型卡与许可](https://huggingface.co/baselabs/elephant-1)

---

## 产品发布/更新

### Claude Duet 开启研究预览，主动整理并后台执行工作

Anthropic 开启 Claude Duet 研究预览，面向美国 Pro 和 Max 用户接受候补登记。独立移动应用和网页入口可继承账户记忆、技能及连接应用，主动发送工作简报，并在独立虚拟机中继续执行用户交办的任务。

产品与其他 Claude 功能共用套餐额度，后台检查也消耗额度。官方称，发送消息、付款、签署文件和删除内容前会展示操作并等待批准；目前仍是早期预览，可能误判信息与紧急程度，可靠性仍需在实际使用中检验。

🔗 [Anthropic：Claude Duet 功能、开放范围与权限规则](https://claude.com/blog/claude-duet)

🔗 [Claude：官方发布公告](https://x.com/claudeai/status/2112984664256241837)

---

### MiniMax Code 推出 Mini App，让智能体使用常驻工作界面

MiniMax Code 桌面端推出 Mini App，以插件形式提供包含前端、Node.js 后端和持久数据目录的长运行应用。页面可显示在对话侧栏或独立窗口，应用与智能体可以双向调用，用于持续更新的仪表盘、模型查看器等工作界面。

功能支持 macOS 和 Windows 的本地会话，并提供创建工具、插件市场和社区源码。凭据、权限声明及运行管理由宿主处理，但应用代码仍以用户身份在本机执行，安装来源与授权范围仍需由使用者判断。

🔗 [MiniMax：Mini App 架构、使用方式与执行边界](https://www.minimax.io/blog/minimax-code-mini-app-1792650729)

🔗 [MiniMax：社区应用源码](https://github.com/MiniMax-AI/MiniMax-Code-MiniApps)

---

### Kling 4.0 接入 OpenArt，提供参考图与关键帧控制

OpenArt 宣布 Kling 4.0 上线，支持用起始、中间和结束帧引导视频，以及最多 10 张参考图。官方介绍还列出文字或画面驱动的视频生成、视频编辑，以及将生成和编辑结合的 All-in-One Reference 能力。

本条记录的是 OpenArt 的平台接入与功能说明，不代表 Kling 4.0 当天首次发布。不同平台的参考图数量、操作方式和权益应分别核对，不能将其他平台的功能参数直接套用于 OpenArt。

🔗 [OpenArt：原始上线与功能公告](https://x.com/openart_ai/status/2112945684647477413)

🔗 [Kling：当天转引与确认](https://x.com/Kling_ai/status/2113156632134005040)

---

### OpenAI 提供 PHP2Shell 自查技能，按版本进行初筛

OpenAI 为此前披露的 PHP2Shell 漏洞提供 Codex 自查技能，支持有服务器访问权限的本地检查，以及仅持有网址时读取 HTTP 响应头。仓库采用 Apache 2.0 许可，可通过技能或命令行使用。

工具依据暴露的 PHP 版本初筛，不发送利用探针。隐藏版本会返回 UNKNOWN，发行版回移补丁也可能无法从版本号识别；即使返回 OK，也不等于已经独立验证安全修复。下方仓库链接固定在当日已有版本，便于核对当时的功能。

🔗 [OpenAI：自查技能发布公告](https://x.com/OpenAI/status/2112945805686604033)

🔗 [OpenAI：截至当日的工具源码、许可与限制](https://github.com/openai/php2shell-checker/tree/40a4746ec4925d4d7510b99f9e134277918b1ac3)

---

## 行业动态

### Wiz 披露 ARTEX 相关攻击活动，多数尝试未成功

Wiz 披露，10 月发现攻击者使用 ARTEX 相关工具持续针对 IT 与软件厂商，活动涉及身份认证、账户恢复、接口枚举及跨租户访问尝试；部分基础设施和行为与微软追踪的 Storm-0940 重叠。

团队观察到连续运行 24 至 30 小时、被拦截后更换地址或端点等自动化行为，但多数攻击尝试失败。ARTEX 作者已于 10 月 8 日关闭源码，报告也未将所有使用该工具的活动归为同一组织。

🔗 [Wiz：调查证据、归因边界与检测信息](https://www.wiz.io/blog/artex-in-the-wild-storm-0940-expands-targeting-of-it-and-software-vendors)

---

### 媒体跟进 Symantec 恶意智能体研究，十万步是配置上限

The Decoder 当天跟进 Symantec 披露的恶意智能体设计。研究者在今年夏季通过模拟开放 AI 服务的蜜罐截获完整指令，其中包含 74 个工具定义，企图盗用无防护模型端点或泄露密钥，以受害者的推理费用支撑攻击。

所谓“Skynet 模式”要求最多连续执行 10 万步，并进行扫描、窃取与挖矿，但这是设计目标。蜜罐未执行相关工具，截获会话在通用回复后结束，不能据此认定智能体已经自主完成大规模攻击。

🔗 [Symantec：截获指令、蜜罐方法与研究限制](https://www.security.com/threat-intelligence/ai-llmjacking-skynet)

🔗 [The Decoder：当天跟进报道](https://the-decoder.com/an-ai-agent-in-skynet-mode-hijacks-unprotected-language-models-to-launch-self-sustaining-cyberattacks/)

---

### 媒体称 DeepSeek 融资接近千亿元，交易仍在收尾

Bloomberg 报道 DeepSeek 新一轮融资约 1,000 亿元人民币、约合 150 亿美元。Reuters 随后依据独立知情人士报道，融资正在收尾，宁德时代与腾讯是主要投资方之一；本轮目标较最初约 500 亿元提高了一倍。

Reuters 称交易预计未来几天完成，财务条款与投资方名单仍可能变化，相关公司当时未立即回应置评请求。因此，这属于匿名信源支持的融资进展，尚不能作为公司已正式确认全部交割的公告，也不能将融资额等同于估值。

🔗 [Bloomberg：本轮融资报道](https://www.bloomberg.com/news/articles/2026-10-22/deepseek-raises-15-billion-in-challenge-to-leading-us-labs)

🔗 [Reuters：独立采访与交易状态，由 The Standard 刊载](https://www.thestandard.com.hk/china/article/346171/DeepSeek-wrapping-up-15-billion-fundraising-to-fuel-AI-race)

---

## 论文研究

### 微软介绍 KLS 猜想证明，展示人类主导的 AI 数学研究

微软研究院介绍 Xinzhi Zhang 与 Zhao Song 对 KLS 猜想的证明：对于对数凹分布，最优平面切割与任意形状最优切割之间的差距，可由不随维度增长的常数控制。研究者指导 AI 探索约百条候选路线，再筛选、推进并核验数学论证。

这是当天发布的研究介绍，完整证明已在 10 月 4 日版本论文中出现。方向选择、递归方法和最终论证由研究者负责；团队在同等量级预算下的无指导模型尝试没有完成目标，不能表述为 AI 独立解决了猜想。

🔗 [Microsoft Research：证明进展与人机协作方法](https://www.microsoft.com/en-us/research/blog/solving-a-31-year-old-grand-challenge-in-mathematics-the-kls-conjecture/)

---

### Sierra 发布 τ-Entity，检验语音智能体能否记准关键资料

Sierra 发布 τ-Entity，围绕姓名、电话、地址、邮箱等十类信息设置 200 个任务，覆盖六种语言。每次通话只收集一个字段，来电者会配合准确拼读；系统提交值必须与预期完全匹配，并分别接受普通、噪声和人声干扰条件测试。

当日六语言榜单中，GPT Live 1 在普通通话中的成功率为 60.3%，同一任务三种条件全部成功的比例为 34.0%。这些是受控资料采集任务的结果，不代表完整客服业务成功率；增加确认与拼读可提高可靠性，也会延长通话。

🔗 [Sierra：τ-Entity 任务、结果与验证成本](https://sierra.ai/blog/tau-entity-can-voice-agents-get-the-details-right)

---

### METR 与 Redwood 披露 OpenAI 内部监控压力测试

METR 与 Redwood Research 各派一名员工，在 7 月 21 日至 8 月 11 日对 OpenAI 内部失准监控系统开展高权限试点测试，形成 61 页内部报告。团队发现监控覆盖、压缩事件触发及系统隔离等方面的问题，并建议持续核对流量、定期触发监控和隔离执行环境。

评估对象是 7 月 21 日及此前的历史系统，不能据此描述当前全部防护状态。OpenAI 称影响生产防护的相关漏洞已修复，并扩大监控覆盖；评估团队尚未核验这些后续声明。部分绕过路径只是原则上可行，也未证明真实智能体曾加以利用。

🔗 [Redwood Research：测试范围、发现与未验证事项](https://blog.redwoodresearch.org/p/red-teaming-openais-internal-agent)

---

*AI 热点日报 · 作者 ZestJT · 数据来源 AI HOT（aihot.virxact.com）*
