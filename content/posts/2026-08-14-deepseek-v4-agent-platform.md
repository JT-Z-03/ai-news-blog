---
title: "V4、涨价与 Harness 同时落地，DeepSeek 想做的已经不只是模型"
date: 2026-08-14T12:00:00+08:00
draft: false
tags: ["DeepSeek", "DeepSeek V4", "AI Agent", "DeepSeek Harness", "大模型定价"]
categories: ["深度分析"]
slug: "deepseek-v4-agent-platform"
description: "从 V4-Flash、V4-Pro、峰谷定价到开源 Harness，DeepSeek 正在把竞争单位从一次模型调用扩展为一次完整的 Agent 任务。"
---

2026 年 7 月 31 日，DeepSeek-V4-Flash 正式版在 API 上线公测。发布说明里有一条很容易被跑分盖过去的注记。公共基准集中的 Code Agent 任务，使用了当时还没有发布的 DeepSeek Harness 极简模式。

十三天以后，那条注记里的产品露面了。

8 月 13 日，三项变化同日通过不同官方渠道出现。DeepSeek-V4-Pro 正式版在 APP、网页端和 API 同步上线，API 更新价格也写入[官方更新日志](https://api-docs.deepseek.com/zh-cn/updates)与[8 月 13 日公告](https://api-docs.deepseek.com/zh-cn/news/news260813)。DeepSeek Harness v0.1 则在[官方产品页](https://deepseek.com/harness/)和[官方仓库](https://github.com/deepseek-ai/deepseek-harness)开放开发者预览。新价格把一天切成高峰与空闲两类时段，并从 8 月 17 日起执行。

若只逐条看，这是两次模型更新、一次调价和一个开源项目。放到同一条时间线上，问题就变了。为什么模型档位、调用接口、价格时段和 Agent 执行框架会在同一阶段落地？

这四件事分别落在一项任务的不同位置。模型先决定每次推理能做到什么，接口决定现有客户端要改多少，价格决定多轮调用会花多少钱，执行框架则决定模型怎样碰到工具、文件和外部动作。单独报道任何一项都没有错，可它解释不了另外三项为什么紧挨着出现。真正需要解释的是这套组合。

我的判断是，DeepSeek 正把竞争单位从一次模型调用扩展到一次完整的 Agent 任务。Flash 和 Pro 分担不同强度的任务，兼容接口降低接入成本，峰谷价格改变任务运行的经济时点，Harness 再把模型、工具和执行过程接起来。这是基于发布节奏与产品组合做出的作者判断，DeepSeek 没有宣布一套这样的路由政策或平台战略。

## 两档 V4 开始回答同一个任务该用多少能力

7 月 31 日的更新范围很窄。V4-Flash 正式版只更新 API，APP、网页端以及当时的 Pro API 都没有变化。它的模型结构和尺寸与 Flash Preview 保持一致，只重新进行了后训练。这个信息把 Flash 的角色说得相当清楚。DeepSeek 没有把它包装成一次规模跃升，而是把已有模型继续往 Agent 任务上调。

“只重新进行了后训练”也划出了一条事实边界。官方材料没有公布一套新的架构变化，本文也不能从基准提升倒推出模型规模、推理吞吐或线上稳定性发生了怎样的改变。能确认的是，DeepSeek 在结构和尺寸不变的前提下更新了 Flash 的任务表现，并把更新入口限定在 API。它更接近面向调用量与 Agent 接入的产品更新，APP 和网页端用户在 7 月 31 日并没有拿到同一次升级。

支持方向也与此一致。Flash 原生支持 OpenAI Responses API 格式，并针对 Codex 做了适配。开发者可以沿用更熟悉的调用形态，把迁移工作压到配置和接口适配这一层。[Responses API 指南](https://api-docs.deepseek.com/zh-cn/guides/responses_api)提供了官方接入说明。接口兼容不会自动带来任务成功，却能减少更换模型时重写整套 Agent 接线的工作。

这一点对 Agent 比对话框更要紧。对话产品换一个模型，常见改动集中在请求与返回。Agent 的模型调用旁边还接着工具、会话和循环，接口差异会沿着整条执行过程向外扩散。Responses API 和 Codex 适配解决的是迁移摩擦，不能证明不同模型在行为、工具选择或结果质量上完全等价。DeepSeek 把接入门槛降下来，后面的验证仍然要由使用者完成。

官方公布的数字可以放在一起看。它们适合观察两档模型在厂商测试中的相对位置，不能直接换算成线上成功率。

| 官方基准 | V4-Flash 0731 | V4-Pro 0813 GA |
| --- | --- | --- |
| HLE 无工具／有工具 | 未披露 | 42.7／60.0 |
| Terminal Bench 2.1 | 82.7 | 87.9 |
| NL2Repo | 54.2 | 61.5 |
| Cybergym | 76.7 | 83.3 |
| DeepSWE | 54.4 | 62.7 |
| Toolathlon-Verified | 70.3 | 74.1 |
| Agents' Last Exam | 25.2 | 25.7 |
| AutomationBench Public | 25.1 | 31.8 |
| DSBench-FullStack | 68.7 | 71.1 |
| DSBench-Hard | 59.6 | 67.2 |

Flash 的测试条件公开得更细。公共基准集里的 Code Agent 任务使用尚未发布的 DeepSeek Harness 极简模式，思考强度设为 max，top-p 为 0.95，temperature 为 1.0。DSBench-FullStack 与 DSBench-Hard 又是 DeepSeek 的内部测试集。Pro 的发布条目没有披露一套可与 Flash 逐项比较的 Harness 模式、采样参数、任务版本和工具集合，因此不能假定两列数字来自完全相同的配置。Toolathlon 与 Agents' Last Exam 在两次发布中的官方写法也略有差别，表格只保留官方数值，不主张测试协议完全相同。

基准读法因此需要收紧。Flash 的分数告诉我们，在官方给出的 Harness、思考强度和采样设置下，模型完成了这批测试；它没有告诉我们，换一套工具、缩短超时或降低思考强度以后还能保留多少表现。Pro 一列缺少可供比较的条件，适合用来认识官方强调的能力上限，不能拿两列差值计算一个生产项目的收益。厂商基准有产品定位价值，独立测试、失败类型和真实调用成本仍然空着。

![DeepSeek V4 正式版发布时间与官方 Agent 基准](images/posts/deepseek-v4-agent-platform/v4-release-benchmarks.png)

*图，DeepSeek 官方更新日志中的 V4 发布时间与官方 Agent 基准。Flash 官方测试条件见页面注释，Pro 未披露可逐项比较的同一组条件。核验日期为 2026-08-14。[来源](https://api-docs.deepseek.com/zh-cn/updates)*

8 月 13 日，V4-Pro 正式版进入 APP、网页端和 API，状态是 GA。官方基准中，Pro 的 Terminal Bench 2.1 为 87.9，NL2Repo 为 61.5，Cybergym 为 83.3，DeepSWE 为 62.7，HLE 在无工具和有工具条件下分别为 42.7 与 60.0。其余 Agent 项目的官方值也在表中列全。它们显示 Pro 在这批厂商基准上整体高于 Flash，仍然不构成独立复现、服务等级承诺或任意生产任务的表现保证。

三个产品状态也不能混写。7 月 31 日的 Flash 是正式版 API 公测，8 月 13 日的 Pro 是覆盖 APP、网页端和 API 的 GA，Harness 则是可能发生破坏兼容性变更的开发者预览。它们同处一个发布时间段，不等于成熟度相同。尤其是 Harness，模型已经进入正式服务，并不能替框架补上一段生产验证历史。

把 Flash 理解成重任务量下的效率层，把 Pro 理解成复杂任务的高能力层，是一种工作解释。DeepSeek 没有公布自动路由政策，也没有说 Pro 会替代 Flash。两者发布范围、基准和价格都不同，开发者仍要根据任务复杂度、等待时间与预算自行选择。模型分层在这里提供的是选择条件，还没有替使用者作出选择。

## 新价格把任务运行时间也放进成本计算

模型分档以后，调用成本并没有停在每百万 tokens 的单一数字上。DeepSeek 的[官方价格页](https://api-docs.deepseek.com/zh-cn/quick_start/pricing/)规定，新价格从北京时间 2026 年 8 月 17 日零时生效。高峰时段为 9 时至 12 时、14 时至 18 时，其余时间为空闲时段，空闲价是高峰价的一半。

下表单位均为元／百万 tokens。括号内涨幅按照旧价复算，属于本文计算，并非 DeepSeek 公布的百分比。

| 模型与计费项 | 旧价 | 空闲新价与计算涨幅 | 高峰新价与计算涨幅 |
| --- | --- | --- | --- |
| Flash 缓存命中输入 | 0.02 | 0.05，+150% | 0.10，+400% |
| Flash 缓存未命中输入 | 1.0 | 1.5，+50% | 3.0，+200% |
| Flash 输出 | 2.0 | 4.5，+125% | 9.0，+350% |
| Pro 缓存命中输入 | 0.025 | 0.15，+500% | 0.30，+1,100% |
| Pro 缓存未命中输入 | 3.0 | 4.5，+50% | 9.0，+200% |
| Pro 输出 | 6.0 | 13.5，+125% | 27.0，+350% |

一个容易被“空闲半价”遮住的事实是，表里六项空闲新价都高于旧价。Flash 缓存未命中输入与 Pro 缓存未命中输入在空闲时段各涨 50%，两档模型的空闲输出价各涨 125%。Pro 缓存命中输入的空闲价从 0.025 元升到 0.15 元，本文计算涨幅为 500%。把这次调整只概括成低价错峰，会漏掉基准价格已经上移。

这里同时存在两套比较基准。拿新价格内部比较，空闲时段确实只有高峰的一半，同一档模型、同一类 tokens 若能完整错峰，费率会下降一半。拿新旧价格比较，所有空闲项仍然涨价。开发者若只在高峰和空闲之间选，会看到明显价差；若拿调整前后的账单比较，即使已经错峰，也不能假定费用下降。

总成本还要把缓存命中输入、缓存未命中输入和输出分别计算。三类 tokens 的费率不同，Flash 与 Pro 的费率又不同。任务的不同调用若分别落在多个时段，成本估算需要使用对应费率。官方价格页没有披露单次跨时段请求如何归属计费窗口，也没有给任何具体项目的输入输出比例。本文因此只复算表内百分比，不补充未公开的计费实现规则，也不用一个虚构任务去演示“能省多少”。

![DeepSeek API 峰谷价格表](images/posts/deepseek-v4-agent-platform/api-peak-offpeak-pricing.png)

*图，DeepSeek API 官方价格与生效时间规则。新价格自北京时间 2026 年 8 月 17 日零时生效，高峰为 9 时至 12 时、14 时至 18 时，其余为空闲时段。核验日期为 2026-08-14。[来源](https://api-docs.deepseek.com/zh-cn/quick_start/pricing/)*

峰谷差价给开发者留下了一道新的工程题。实时对话和同步工作流很难避开白天高峰，可延迟、可批处理的调用则可能被安排到空闲时段。这样的安排能否省钱，要看任务是否允许等待，也要看缓存命中、输入输出比例和所选模型。光看“半价”两个字算不出一个项目的账。

价格时段可能承担资源调度作用，这是本文基于规则作出的推断。公开材料没有证明此次调整源于 GPU 短缺、利润要求或收入目标，也不足以把任何一种公司动机写成事实。可以确认的只有价格、窗口和生效时间。使用侧会怎样调整负载，要等真实工作量给答案。

## Harness 开始接管模型之外的执行过程

如果模型分层回答用哪一档能力，价格回答何时运行更经济，Agent 还缺一套能把任务真正跑起来的执行层。

这个执行层的正式名称是 DeepSeek Harness，命令名为 `dsh`，[官方仓库](https://github.com/deepseek-ai/deepseek-harness)在 8 月 13 日开放 v0.1 开发者预览。代码采用 [MIT 许可证](https://github.com/deepseek-ai/deepseek-harness/blob/master/LICENSE)。README 同时提醒项目会快速迭代，破坏兼容性的变更也在预期之内。现阶段把它称为成熟生产平台，证据远远不够。

Harness 建在 Cordis 插件系统之上。[架构文档](https://github.com/deepseek-ai/deepseek-harness/blob/master/docs/architecture.md)把 Cordis 写作 `dsh` 的下层框架。插件通过共享上下文提供服务、类型化事件和可逆 effect。Cordis 是依赖与框架，不是 Harness 的同义词，公开材料也不能证明两者存在某种公司关系。

官方架构文档给出的插件范围比一个命令行聊天工具宽得多。模型适配器负责接模型，工具注册表负责暴露可调用能力，会话日志和 agent loop 负责记录与推进执行。基础 bundle 还覆盖持久化、沙箱与审批策略、设置、凭据和遥测。web bundle 面向浏览器应用，headless bundle 面向无服务器的一次性运行器。这些部件共同说明 Harness 试图处理的是一段任务如何运行，不只是一轮提示词怎样发给模型。

插件化设计也改变了故障边界。模型返回了什么，只是执行记录的一部分。工具有没有注册、凭据能否使用、文件写到哪里、某个动作要不要审批、会话能不能恢复，都由模型之外的部件决定。Cordis 提供共享上下文、类型化事件和可逆 effect，让这些部件可以组合，也让替换某一项时不必把整个程序重写。后一句是对架构用途的解释，不代表 v0.1 已经验证了所有组合。

普通读者可以把 Harness 理解成任务运行时。模型插件接入不同模型，工具与技能插件告诉 Agent 能做什么，会话插件保存交互记录，沙箱插件限制动作范围，文件系统和存储插件保留任务需要的材料，loop 插件让模型在观察、调用工具与继续推理之间循环。调度与编排插件安排各步何时发生，UI 插件再给浏览器或无界面运行方式提供入口。模型负责生成下一步，Harness 负责让下一步在一套可替换、可组合的部件中执行。[官方 Harness 页面](https://deepseek.com/harness/)把模型、工具、技能、会话、沙箱、存储、循环、调度和 UI 都列为插件化组成。

![DeepSeek Harness 插件化组成](images/posts/deepseek-v4-agent-platform/harness-plugin-architecture.png)

*图，DeepSeek Harness v0.1 开发者预览版的插件化组成。该版本仍可能发生破坏兼容性变更。核验日期为 2026-08-14。[来源](https://deepseek.com/harness/)*

这也让 7 月 31 日的那条基准注记有了新的位置。Flash 发布时，官方已经用尚未公开的 Harness 极简模式运行 Code Agent 测试。8 月 13 日，Harness 才以开发者预览版公开。两件事之间能确认的是时间先后，以及 Harness 同时出现在模型评估和公开产品里。它们不能证明某个因果关系，也不能替 DeepSeek 补出一份未公开的战略说明。

Harness 的价值取决于插件能否好用、接口能否稳定、开发者能否围绕它建立可靠工作流。v0.1 只有设计和开放代码，还没有足够证据说明生态已经形成。MIT 许可证降低了查看和改造源码的门槛，却不会自动带来插件供给、生产采用或长期兼容。

## DeepSeek 正把竞争单位推向一次完成的任务

现在可以把四块重新接起来。

Flash 与 Pro 让开发者在任务量、成本和能力上限之间选档。Responses API 与 Codex 适配减少更换模型时的迁移摩擦。峰谷价格让可延迟工作负载多一个运行时点的选择。Harness 则决定任务怎样调用工具、保留会话状态、读写文件，并在沙箱和循环里继续执行。

过去比较模型，最醒目的尺度往往是基准分数和每百万 tokens 价格。Agent 把问题拉长以后，一次调用只是中间步骤。任务可能连续调用模型，反复读写文件，等待工具返回，在失败后继续尝试，还要保留状态与审批记录。更低的单次价格若伴随更多重试，不一定带来更低的任务成本。更高的基准分数若缺少合适工具和执行边界，也未必能完成工作。

用任务作为比较单位，模型与系统的账才会落到一起。选 Flash 还是 Pro，会改变每轮调用的能力与价格。把任务放到高峰还是空闲，会改变相同 tokens 的单价。采用哪套 Harness 配置，会改变工具、状态、沙箱和重试怎样运作。四项选择互相影响，最终结果由任务有没有完成、用了多久、花了多少钱共同决定。每百万 tokens 价格仍然有用，只是不再足以单独描述 Agent 的经济性。

因此，我更愿意把这批发布看成一次产品边界的外扩。DeepSeek 仍在卖模型调用，同时开始提供任务选模、接口迁移、时间定价和执行框架所需的部件。竞争指标也随之从一百万 tokens 花多少钱，走向一个 Agent 任务能否在合适时间、合适权限与可接受成本下完成。

这个判断眼下有三道清楚的限制。Harness 还在 v0.1 开发者预览，插件生态尚未形成。官方基准来自厂商披露，不能替代独立复现和真实生产验证。峰谷价差能否改变成本，又取决于工作负载有没有错峰空间。实时任务无法为了便宜等到深夜，能够延迟的任务也要承担排队、监控和故障恢复的工程成本。

7 月 31 日，Harness 还只是 Flash 基准脚注里一个“即将发布”的名字。到 8 月 13 日，它与 Pro 正式版和新价格同时摆到开发者面前。脚注变成产品以后，DeepSeek 要回答的问题也多了一层。模型能给出多好的下一步仍然重要，平台能不能让这些下一步持续、可控、经济地走到任务结束，才是下一轮更难的比较。

## 参考资料

- DeepSeek，[API 更新日志](https://api-docs.deepseek.com/zh-cn/updates)
- DeepSeek，[2026 年 8 月 13 日公告](https://api-docs.deepseek.com/zh-cn/news/news260813)
- DeepSeek，[模型与价格](https://api-docs.deepseek.com/zh-cn/quick_start/pricing/)
- DeepSeek，[Responses API 指南](https://api-docs.deepseek.com/zh-cn/guides/responses_api)
- DeepSeek，[思考模式指南](https://api-docs.deepseek.com/zh-cn/guides/thinking_mode)
- DeepSeek，[Harness 产品页](https://deepseek.com/harness/)
- DeepSeek，[Harness 官方仓库](https://github.com/deepseek-ai/deepseek-harness)
- DeepSeek，[Harness MIT 许可证](https://github.com/deepseek-ai/deepseek-harness/blob/master/LICENSE)
- DeepSeek，[Harness 架构文档](https://github.com/deepseek-ai/deepseek-harness/blob/master/docs/architecture.md)

---

> / 作者，钟懿
