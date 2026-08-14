# DeepSeek V4 与 Harness：一手来源与事实台账

> 核验日期：2026-08-14（Asia/Shanghai）。本台账只收录可链接的一手来源、由其金额复算的算术结果，及明确标注的作者推断；不包含独立 API 实测或生产表现外推。

## 口径与一手来源

- [官方事实] 模型发布、基准数值、Flash 与 Pro 测试条件及产品范围均以 [DeepSeek API Change Log](https://api-docs.deepseek.com/updates/) 的 2026-07-31、2026-08-13 条目为准。
- [官方事实] 人民币价格、峰谷窗口、生效时间及新旧价格均以 [DeepSeek「模型 & 价格」中文页](https://api-docs.deepseek.com/zh-cn/quick_start/pricing/) 为准。
- [官方事实] Harness 的名称、开发者预览状态、Cordis 关系及许可证均以 [DeepSeek 官方仓库 README](https://github.com/deepseek-ai/deepseek-harness#deepseek-harness)、[架构文档](https://github.com/deepseek-ai/deepseek-harness/blob/master/docs/architecture.md#cordis) 与 [LICENSE](https://github.com/deepseek-ai/deepseek-harness/blob/master/LICENSE) 为准。

## 时间线

| 日期（北京时间） | 记录 | 来源 |
| --- | --- | --- |
| 2026-07-31 | [官方事实] DeepSeek-V4-Flash 正式版 API 上线公测（public beta）；此次仅升级 Flash API。 | [Change Log（2026-07-31）](https://api-docs.deepseek.com/updates/#date-2026-07-31) |
| 2026-08-13 | [官方事实] DeepSeek-V4-Pro 正式版（GA）在 APP、网页端和 API 同步上线。 | [Change Log（2026-08-13）](https://api-docs.deepseek.com/updates/#date-2026-08-13) |
| 2026-08-13 | [官方事实] DeepSeek Harness 发布为 v0.1 开发者预览版；产品成熟度以 README 的 developer preview 与可能发生破坏兼容性变更为边界。 | [官方发布帖](https://x.com/deepseek_ai/status/2087887408440164663)、[README](https://github.com/deepseek-ai/deepseek-harness#developer-preview) |
| 2026-08-17 00:00 | [官方事实] 新 API 价格生效；等价 UTC 时刻为 2026-08-16 16:00。 | [中文价格页](https://api-docs.deepseek.com/zh-cn/quick_start/pricing/)、[Change Log](https://api-docs.deepseek.com/updates/#date-2026-08-13) |

## 官方基准值与条件

| 基准 | Flash-0731 | Pro-0813 GA | 记录边界与一手来源 |
| --- | ---: | ---: | --- |
| HLE（无工具 / 有工具） | 官方未发布 | 42.7 / 60.0 | [官方事实] Flash 的 0731 条目未列 HLE；不得补值。[Change Log](https://api-docs.deepseek.com/updates/#date-2026-07-31) / [Pro 条目](https://api-docs.deepseek.com/updates/#date-2026-08-13) |
| Terminal Bench 2.1 | 82.7 | 87.9 | [官方事实] 厂商公布分数；未以此推断生产成功率。[Flash](https://api-docs.deepseek.com/updates/#date-2026-07-31) / [Pro](https://api-docs.deepseek.com/updates/#date-2026-08-13) |
| NL2Repo | 54.2 | 61.5 | [官方事实] 厂商公布分数；未以此推断生产成功率。[Flash](https://api-docs.deepseek.com/updates/#date-2026-07-31) / [Pro](https://api-docs.deepseek.com/updates/#date-2026-08-13) |
| Cybergym | 76.7 | 83.3 | [官方事实] 厂商公布分数；未以此推断生产成功率。[Flash](https://api-docs.deepseek.com/updates/#date-2026-07-31) / [Pro](https://api-docs.deepseek.com/updates/#date-2026-08-13) |
| DeepSWE | 54.4 | 62.7 | [官方事实] 厂商公布分数；未以此推断生产成功率。[Flash](https://api-docs.deepseek.com/updates/#date-2026-07-31) / [Pro](https://api-docs.deepseek.com/updates/#date-2026-08-13) |
| Toolathlon-Verified | 70.3 | 74.1 | [官方事实] Flash 原文为 `Toolathlon verified`；不能自行断言两处名称对应完全相同的 protocol。[Flash](https://api-docs.deepseek.com/updates/#date-2026-07-31) / [Pro](https://api-docs.deepseek.com/updates/#date-2026-08-13) |
| Agents' Last Exam | 25.2 | 25.7 | [官方事实] Flash 原文为 `Agent Last Exam`；不能自行断言两处名称对应完全相同的 protocol。[Flash](https://api-docs.deepseek.com/updates/#date-2026-07-31) / [Pro](https://api-docs.deepseek.com/updates/#date-2026-08-13) |
| AutomationBench（Public） | 25.1 | 31.8 | [官方事实] Flash 原文为 `Automation Bench (Public)`；不得补充未披露的试次或评分定义。[Flash](https://api-docs.deepseek.com/updates/#date-2026-07-31) / [Pro](https://api-docs.deepseek.com/updates/#date-2026-08-13) |
| DSBench-FullStack | 68.7 | 71.1 | [官方事实] Flash 注记称其为内部 full-stack development test set；不得称为外部公开排行榜。[Flash](https://api-docs.deepseek.com/updates/#date-2026-07-31) / [Pro](https://api-docs.deepseek.com/updates/#date-2026-08-13) |
| DSBench-Hard | 59.6 | 67.2 | [官方事实] Flash 注记称其为内部 Coding Agent hard-problem test set；不得称为外部公开排行榜。[Flash](https://api-docs.deepseek.com/updates/#date-2026-07-31) / [Pro](https://api-docs.deepseek.com/updates/#date-2026-08-13) |

- [官方事实] Flash 与 Pro 所列公共基准集的 Code Agent 任务都使用 DeepSeek Harness 极简模式（`minimal mode`）、max 思考强度、`topp=0.95` 和 `temperature=1.0`；Flash 条目当时将 Harness 标为 *to be released soon*。为正文检索兼容，本台账另记为 **top-p 0.95**；不据此改写官方参数名称或推断参数对分数的因果作用。[Change Log（Flash 注记）](https://api-docs.deepseek.com/updates/#date-2026-07-31) / [Pro 条目](https://api-docs.deepseek.com/updates/#date-2026-08-13)
- [证据不足] 两次发布都未完整披露任务版本、工具集、试次、超时等协议细节；不能断言两列分数采用完全相同的协议，也不能据此做严格纵向比较。[Change Log（Flash 条目）](https://api-docs.deepseek.com/updates/#date-2026-07-31) / [Pro 条目](https://api-docs.deepseek.com/updates/#date-2026-08-13)
- [证据不足，不写入正文] 上表是特定厂商披露的基准或内部测试集结果，不是独立复现、SLA 或任意生产工作负载的表现承诺。

## 新 API 价格（人民币）

- [官方事实] 单位均为元／百万 tokens；高峰为北京时间 09:00–12:00、14:00–18:00，其余为空闲时段；空闲价为高峰价的一半；新价于北京时间 2026-08-17 00:00 生效。[中文价格页](https://api-docs.deepseek.com/zh-cn/quick_start/pricing/)

| 模型 | 时段 | 缓存命中输入 | 缓存未命中输入 | 输出 | 单位 | 生效时间 |
| --- | --- | ---: | ---: | ---: | --- | --- |
| DeepSeek-V4-Flash（`deepseek-v4-flash`） | 空闲 | 0.05 | 1.5 | 4.5 | 元／百万 tokens | 2026-08-17 00:00 北京时间 |
| DeepSeek-V4-Flash（`deepseek-v4-flash`） | 高峰 | 0.10 | 3.0 | 9.0 | 元／百万 tokens | 2026-08-17 00:00 北京时间 |
| DeepSeek-V4-Pro（`deepseek-v4-pro`） | 空闲 | 0.15 | 4.5 | 13.5 | 元／百万 tokens | 2026-08-17 00:00 北京时间 |
| DeepSeek-V4-Pro（`deepseek-v4-pro`） | 高峰 | 0.30 | 9.0 | 27.0 | 元／百万 tokens | 2026-08-17 00:00 北京时间 |

- [官方事实] 上表每项金额、单位、窗口与生效时刻均见同一[官方中文价格页](https://api-docs.deepseek.com/zh-cn/quick_start/pricing/)；不将其外推为具体项目成本。

### 官方旧价与可复算变化

- [官方事实] 价格页在新价生效说明前列出旧价：Flash 为缓存命中 0.02、未命中 1.0、输出 2.0；Pro 为缓存命中 0.025、未命中 3.0、输出 6.0，单位均为元／百万 tokens。[中文价格页](https://api-docs.deepseek.com/zh-cn/quick_start/pricing/)
- [官方事实] 下表的变化是按 `(新价 − 旧价) ÷ 旧价 × 100%` 复算的结果；百分比不是 DeepSeek 的直接表述。

| 模型／项目 | 官方旧价 | 空闲新价 | 空闲变化（计算） | 高峰新价 | 高峰变化（计算） |
| --- | ---: | ---: | ---: | ---: | ---: |
| Flash／缓存命中输入 | 0.02 | 0.05 | +150% | 0.10 | +400% |
| Flash／缓存未命中输入 | 1.0 | 1.5 | +50% | 3.0 | +200% |
| Flash／输出 | 2.0 | 4.5 | +125% | 9.0 | +350% |
| Pro／缓存命中输入 | 0.025 | 0.15 | +500% | 0.30 | +1,100% |
| Pro／缓存未命中输入 | 3.0 | 4.5 | +50% | 9.0 | +200% |
| Pro／输出 | 6.0 | 13.5 | +125% | 27.0 | +350% |

- [作者推断] 峰谷价差可能鼓励可延迟、可批处理的调用转至空闲时段；这只是价格规则的使用侧推断，不是 DeepSeek 披露的供需、收入或资源配置结论。
- [证据不足，不写入正文] 官方页面没有说明价格调整是因为算力不足、GPU 成本、收入目标或利润率目标；不得把这些说成企业动机。[中文价格页](https://api-docs.deepseek.com/zh-cn/quick_start/pricing/)、[官方公告](https://api-docs.deepseek.com/news/news260813/)

## DeepSeek Harness

- [官方事实] 官方产品名为 **DeepSeek Harness**，命令名为 `dsh`，官方仓库为 <https://github.com/deepseek-ai/deepseek-harness>；README 将其定义为 DeepSeek AI 开发的开源 agent harness。[README](https://github.com/deepseek-ai/deepseek-harness#deepseek-harness)
- [官方事实] Harness 是 **v0.1 开发者预览版**，README 明确其会快速迭代且将发生破坏兼容性变更；不能写成成熟生产平台。[README：Developer preview](https://github.com/deepseek-ai/deepseek-harness#developer-preview)
- [官方事实] 仓库根目录许可证为 **MIT**；该事实仅适用于 Harness 源码，不外推至模型、API 或第三方插件。[LICENSE](https://github.com/deepseek-ai/deepseek-harness/blob/master/LICENSE)
- [官方事实] Harness 由 Cordis 驱动；架构文档称 Cordis 是 `dsh` 下层框架，插件向共享 context 提供服务、类型化事件和可逆 effect。[README](https://github.com/deepseek-ai/deepseek-harness#deepseek-harness)、[架构文档](https://github.com/deepseek-ai/deepseek-harness/blob/master/docs/architecture.md#cordis)
- [官方事实] 官方插件覆盖模型适配器、工具注册表、会话日志、agent loop；基础 bundle 还覆盖持久化、沙箱与审批策略、设置、凭据和遥测，web/headless bundle 分别覆盖浏览器应用与无服务器一次性运行器。[架构文档](https://github.com/deepseek-ai/deepseek-harness/blob/master/docs/architecture.md#cordis)
- [作者推断] Harness 与模型、工具、会话、沙箱和循环的可组合设计，为 DeepSeek 从模型供应商走向 Agent 平台提供了产品层面的信号；这不是 DeepSeek 已宣布的平台战略。
- [证据不足，不写入正文] Harness 尚不能据官方材料称为“已形成生态”；README 所列插件发现方式、社区和 Discord 不构成生态成熟度或采用率证据。[README](https://github.com/deepseek-ai/deepseek-harness#community-and-support)
- [证据不足，不写入正文] 官方材料不足以证明 Pro 将替代 Flash；两者的发布范围、分数与价格不同，但没有官方替代路线图。[Change Log](https://api-docs.deepseek.com/updates/)

## 正文使用禁区

- [证据不足，不写入正文] 不写独立 API 实测、第一手使用体验，或把官方基准直接外推为生产表现。
- [证据不足，不写入正文] 不将 V4-Flash 的 API public beta 与 Harness 的 developer preview 混同为同一产品状态。
- [证据不足，不写入正文] 不将“调价”“Agent 平台”“生态形成”或“替代关系”等分析结论写成官方直接引语或官方事实。
