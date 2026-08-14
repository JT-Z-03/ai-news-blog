# DeepSeek V4 与 Agent 平台深度文章实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (\`- [ ]\`) syntax for tracking.

**Goal:** 基于一手来源完成并发布一篇把 DeepSeek-V4-Flash、DeepSeek-V4-Pro、API 调价和 DeepSeek Harness 串成统一战略判断的中文深度文章。

**Architecture:** 先建立可追溯的事实台账，再获取三张官方证据图，随后按「模型分层、价格调度、执行框架」主线写入一篇 Hugo Markdown 文章。事实、测试条件和作者推断分开表达，最终通过内容校验、生产构建和线上 URL 检查闭环。

**Tech Stack:** Hugo Extended 0.162.0、PaperMod、Markdown、PowerShell 7、Git、Cloudflare Pages。

## Global Constraints

- 文章日期固定为 2026 年 8 月 14 日，分类为「深度分析」，作者沿用站点配置中的「钟懿」。
- 不做独立 API 实测，不编造第一手使用体验，不把官方基准直接外推为生产表现。
- Harness 必须写明为 v0.1 开发者预览版与 MIT 许可证项目，不能写成成熟生产平台。
- 调价必须列清生效时间、峰谷规则、缓存命中输入、缓存未命中输入和输出价格，并把企业动机标注为推断。
- 所有重要数字、产品状态、测试条件和直接引语均使用一手来源。
- 正文使用三张事实型图片，每张图片保存到项目素材目录并附日期、限制条件和可点击来源。
- 只修改本计划列出的文章、研究台账和图片文件，不调整站点主题或发布基础设施。

## File Structure

- Create: \`docs/research/2026-08-14-deepseek-v4-agent-platform-sources.md\`，记录事实、数值、测试条件、来源 URL 与推断边界。
- Create: \`assets/images/posts/deepseek-v4-agent-platform/v4-release-benchmarks.png\`，保存官方 V4 发布时间与 Agent 基准证据图。
- Create: \`assets/images/posts/deepseek-v4-agent-platform/api-peak-offpeak-pricing.png\`，保存 2026 年 8 月 17 日生效的官方峰谷价格表。
- Create: \`assets/images/posts/deepseek-v4-agent-platform/harness-plugin-architecture.png\`，保存 Harness 官方架构或插件组成证据图。
- Create: \`content/posts/2026-08-14-deepseek-v4-agent-platform.md\`，承载最终深度文章。

---

### Task 1: 建立一手来源与事实台账

**Files:**
- Create: \`docs/research/2026-08-14-deepseek-v4-agent-platform-sources.md\`

**Interfaces:**
- Consumes: \`docs/superpowers/specs/2026-08-14-deepseek-v4-agent-platform-article-design.md\` 中的论点、范围和来源要求。
- Produces: 供正文和图注使用的已核验事实、计算结果、来源 URL 与「官方事实／作者推断」标记。

- [ ] **Step 1: 获取官方更新、价格、新闻和 Harness 页面**

依次读取以下一手页面，不把 AI HOT 摘要当作正文引用。

\`\`\`text
https://api-docs.deepseek.com/zh-cn/updates
https://api-docs.deepseek.com/zh-cn/news/news260813
https://api-docs.deepseek.com/zh-cn/quick_start/pricing
https://x.com/deepseek_ai/status/2087887408440164663
\`\`\`

从 DeepSeek 官方消息进入 Harness 官方仓库，确认仓库名称、版本、许可证、Cordis 关系和「一切皆插件」覆盖的组件，不根据搜索摘要猜测仓库 URL。

- [ ] **Step 2: 核对四条事件时间线与测试条件**

台账至少记录以下事实。

\`\`\`text
2026-07-31，DeepSeek-V4-Flash 正式版 API 上线公测
2026-08-13，DeepSeek-V4-Pro 正式版在 APP、网页端和 API 同步上线
2026-08-13，DeepSeek Harness v0.1 开发者预览版发布
2026-08-17 00:00（北京时间），新 API 价格生效
\`\`\`

为 Flash 与 Pro 分别记录 HLE、Terminal Bench 2.1、NL2Repo、DeepSWE、Toolathlon-Verified、AutomationBench、DSBench-FullStack 和 DSBench-Hard。Flash 测试条件必须包含 DeepSeek Harness 极简模式、max 思考强度、top-p 0.95 和 temperature 1.0。

- [ ] **Step 3: 建立新旧价格对照并复算变化比例**

以每百万输入或输出 Token 为统一单位，分别记录 Flash 与 Pro 的缓存命中输入、缓存未命中输入和输出价格。将官方旧价格与 8 月 17 日后的高峰价、闲时价逐项放入同一张表，使用以下公式。

\`\`\`text
变化比例 =（新价格 - 旧价格）/ 旧价格 × 100%
闲时折扣 = 闲时价格 / 高峰价格
\`\`\`

若官方当前页面未保留旧价格，只使用可验证的官方旧版页面或网页存档。找不到一手旧价时，正文只陈述新价格和「闲时为高峰一半」，不写旧价涨幅。

- [ ] **Step 4: 标记事实、推断与不可下结论之处**

台账每条判断使用一个固定标签。

\`\`\`text
[官方事实]
[作者推断]
[证据不足，不写入正文]
\`\`\`

「DeepSeek 正在从模型供应商走向 Agent 平台」标为作者推断。「Harness 已形成生态」「涨价是因为算力不足」「Pro 将替代 Flash」标为证据不足，除非出现新的官方材料。

- [ ] **Step 5: 验证台账并提交**

\`\`\`powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -Command "rg -n '\[官方事实\]|\[作者推断\]|\[证据不足，不写入正文\]' 'docs/research/2026-08-14-deepseek-v4-agent-platform-sources.md'; rg -n '2026-07-31|2026-08-13|2026-08-17|top-p 0.95|temperature 1.0|MIT|Cordis' 'docs/research/2026-08-14-deepseek-v4-agent-platform-sources.md'"
git add -- docs/research/2026-08-14-deepseek-v4-agent-platform-sources.md
git commit -m "docs: verify DeepSeek V4 article sources"
\`\`\`

Expected: 搜索命中全部标签和关键事实；每个重要数字附近都有官方 URL；提交只包含研究台账。

### Task 2: 获取并验证三张官方证据图

**Files:**
- Create: \`assets/images/posts/deepseek-v4-agent-platform/v4-release-benchmarks.png\`
- Create: \`assets/images/posts/deepseek-v4-agent-platform/api-peak-offpeak-pricing.png\`
- Create: \`assets/images/posts/deepseek-v4-agent-platform/harness-plugin-architecture.png\`

**Interfaces:**
- Consumes: Task 1 台账中的官方 URL、日期、测试条件和价格单位。
- Produces: 三张可由 Hugo 处理、保留来源身份和关键限制条件的 PNG 图片。

- [ ] **Step 1: 截取 V4 官方更新证据**

从 DeepSeek 官方更新日志或 8 月 13 日新闻页截取能证明 V4-Flash、V4-Pro 正式状态与 Agent 基准的区域。允许纵向拼接同一官方页面的两个区域，但不得删除标题、日期、指标名、测试说明和来源身份。保存为 \`v4-release-benchmarks.png\`。

- [ ] **Step 2: 截取官方峰谷价格表**

从官方价格页截取包含模型名、缓存命中输入、缓存未命中输入、输出、单位、峰时与闲时说明的完整表格，保存为 \`api-peak-offpeak-pricing.png\`。

- [ ] **Step 3: 获取 Harness 官方架构证据**

优先使用 Harness 官方仓库 README 的架构图或插件结构图。若仓库只有文字列表，截取同时包含仓库身份、v0.1 开发者预览状态和插件组件列表的区域，保存为 \`harness-plugin-architecture.png\`。

- [ ] **Step 4: 验证图片格式、尺寸和可读性**

\`\`\`powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -Command "Add-Type -AssemblyName System.Drawing; Get-ChildItem 'assets/images/posts/deepseek-v4-agent-platform/*.png' | ForEach-Object { $img = [Drawing.Image]::FromFile($_.FullName); [PSCustomObject]@{ Name = $_.Name; Width = $img.Width; Height = $img.Height; Bytes = $_.Length }; $img.Dispose() }"
\`\`\`

Expected: 恰好三张 PNG；每张宽度至少 1000 像素；文件可以解码；逐张打开后核心文字在正文缩放尺寸下可读。

- [ ] **Step 5: 提交图片**

\`\`\`powershell
git add -- assets/images/posts/deepseek-v4-agent-platform
git commit -m "content: add DeepSeek V4 source images"
\`\`\`

### Task 3: 撰写深度文章

**Files:**
- Create: \`content/posts/2026-08-14-deepseek-v4-agent-platform.md\`

**Interfaces:**
- Consumes: Task 1 的事实台账和 Task 2 的三张图片。
- Produces: slug 为 \`deepseek-v4-agent-platform\` 的完整 Hugo 页面。

- [ ] **Step 1: 写入精确 frontmatter**

\`\`\`yaml
---
title: "V4、涨价与 Harness 同时落地，DeepSeek 想做的已经不只是模型"
date: 2026-08-14T12:00:00+08:00
draft: false
tags: ["DeepSeek", "DeepSeek V4", "AI Agent", "DeepSeek Harness", "大模型定价"]
categories: ["深度分析"]
slug: "deepseek-v4-agent-platform"
description: "从 V4-Flash、V4-Pro、峰谷定价到开源 Harness，DeepSeek 正在把竞争单位从一次模型调用扩展为一次完整的 Agent 任务。"
---
\`\`\`

- [ ] **Step 2: 完成四层事实叙事**

正文依次写密集发布时间线、Flash 的效率层定位、Pro 的复杂任务能力层定位、峰谷定价的调度作用、Harness 的执行层作用。每层同时包含官方事实、通俗解释和一句回扣主线的判断。

不得把四部分写成互不关联的产品介绍。Flash 与 Pro 使用同口径官方基准；价格使用 Task 1 复核后的数字；Harness 写清 v0.1 与开发者预览状态。

- [ ] **Step 3: 插入三张图片与完整图注**

使用以下路径，并把 Harness 来源替换为 Task 1 核验后的官方仓库 URL。

\`\`\`markdown
![DeepSeek V4 正式版发布时间与官方 Agent 基准](images/posts/deepseek-v4-agent-platform/v4-release-benchmarks.png)

*图，DeepSeek V4 正式版更新与官方 Agent 基准，官方测试条件见页面注释，核验于 2026 年 8 月 14 日。[来源](https://api-docs.deepseek.com/zh-cn/updates)*

![DeepSeek API 峰谷价格表](images/posts/deepseek-v4-agent-platform/api-peak-offpeak-pricing.png)

*图，DeepSeek API 新峰谷价格，价格单位和生效时间以官方页面为准，核验于 2026 年 8 月 14 日。[来源](https://api-docs.deepseek.com/zh-cn/quick_start/pricing)*

![DeepSeek Harness 插件化架构](images/posts/deepseek-v4-agent-platform/harness-plugin-architecture.png)

*图，DeepSeek Harness v0.1 开发者预览版的插件化组成，核验于 2026 年 8 月 14 日。[来源](核验后的官方仓库 URL)*
\`\`\`

- [ ] **Step 4: 完成战略判断、限制与结尾**

论证链固定为「模型分层决定使用哪档能力」「Responses API 与 Codex 适配降低迁移成本」「峰谷价格决定何时运行更经济」「Harness 决定任务如何持续执行」，再推导竞争单位从 Token 调用扩展到完整任务。

结尾前写清三个限制，Harness 生态尚未形成、官方跑分不等于生产结果、峰谷价格影响取决于工作负载能否错峰。最后一个可见内容沿用站点格式。

\`\`\`markdown
---

> / 作者，钟懿
\`\`\`

- [ ] **Step 5: 检查来源、措辞和结构**

\`\`\`powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -Command "$article = 'content/posts/2026-08-14-deepseek-v4-agent-platform.md'; rg -n 'https://api-docs.deepseek.com|github.com/deepseek-ai|x.com/deepseek_ai' $article; rg -n '开发者预览|作者.*判断|官方.*基准|2026 年 8 月 17 日|峰|闲时' $article; if (Select-String -Path $article -Pattern 'TASK_1_|T[B]D|T[O]DO|全面替代|因为算力不足') { exit 1 }"
\`\`\`

Expected: 官方来源、限制条件和生效时间全部命中；占位标记、无证据结论与夸大概括零命中。

- [ ] **Step 6: 提交文章初稿**

\`\`\`powershell
git add -- content/posts/2026-08-14-deepseek-v4-agent-platform.md
git commit -m "content: analyze DeepSeek V4 agent platform strategy"
\`\`\`

### Task 4: 编辑质检与生产构建

**Files:**
- Modify: \`content/posts/2026-08-14-deepseek-v4-agent-platform.md\`
- Modify only for factual correction: \`docs/research/2026-08-14-deepseek-v4-agent-platform-sources.md\`

**Interfaces:**
- Consumes: Task 3 的文章初稿。
- Produces: 事实、图文与 Hugo 输出均通过验证的可发布版本。

- [ ] **Step 1: 做四层编辑检查并修复**

检查硬性事实、叙事节奏、观点支撑和活人感。删除新闻拼盘感、重复跑分、无来源动机判断与「这意味着」「本质上」「综上所述」等模板表达。不得为了口语化编造作者亲测经历。

- [ ] **Step 2: 运行仓库内容校验**

\`\`\`powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\validate-content.ps1
\`\`\`

Expected: 输出 \`Content validation passed.\`，退出码为 0。

- [ ] **Step 3: 运行 Hugo 生产构建**

确认 Hugo Extended 0.162.0 的位置。若仓库根目录存在 \`hugo.exe\`，运行。

\`\`\`powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -Command ".\hugo.exe --gc --minify --cleanDestinationDir --printPathWarnings"
\`\`\`

Expected: 退出码为 0，没有缺失图片或重复 slug 警告，生成 \`public/deepseek-v4-agent-platform/index.html\`。

- [ ] **Step 4: 检查生成页面**

\`\`\`powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -Command "$page = 'public/deepseek-v4-agent-platform/index.html'; Test-Path $page; rg -n 'DeepSeek 想做的已经不只是模型|v4-release-benchmarks|api-peak-offpeak-pricing|harness-plugin-architecture|api-docs.deepseek.com' $page"
\`\`\`

Expected: 页面存在，标题、三张图片和 DeepSeek 官方来源全部命中。

- [ ] **Step 5: 检查变更范围并提交质检修订**

\`\`\`powershell
git status --short
git diff --check
git diff -- content/posts/2026-08-14-deepseek-v4-agent-platform.md docs/research/2026-08-14-deepseek-v4-agent-platform-sources.md
\`\`\`

Expected: 只有计划内文件发生变化，\`git diff --check\` 无输出。若质检产生修订则提交，没有修订则不创建空提交。

### Task 5: 发布并验证线上文章

**Files:**
- No source file changes expected.

**Interfaces:**
- Consumes: Task 4 通过构建的提交历史。
- Produces: \`main\` 分支上的已发布文章和可访问的 Cloudflare Pages URL。

- [ ] **Step 1: 确认提交与工作区**

\`\`\`powershell
git status --short
git log -6 --oneline
git branch --show-current
git remote -v
\`\`\`

Expected: 工作区干净，当前分支为 \`main\`，日志只包含本次计划内提交与原有提交。

- [ ] **Step 2: 使用 GitHub 发布流程推送 main**

执行前读取并遵循 \`github:yeet\` skill，确认推送范围仅包含本次设计、计划、台账、图片和文章。推送后记录远端提交哈希。

- [ ] **Step 3: 验证 Cloudflare Pages 线上 URL**

等待部署时每次不超过 60 秒，验证。

\`\`\`text
https://ai-news-blog-cg8.pages.dev/deepseek-v4-agent-platform/
\`\`\`

Expected: HTTP 200，页面标题正确，正文包含 \`DeepSeek Harness\`，三张图片均返回 HTTP 200。

- [ ] **Step 4: 完成发布证据检查**

确认线上页面显示 2026 年 8 月 14 日、分类「深度分析」、作者「钟懿」，外链指向 DeepSeek 官方页面。对比本地构建与线上正文，确保没有旧缓存或缺图。

- [ ] **Step 5: 报告发布结果**

交付文章文件链接、线上 URL、核心判断、验证结果与仍存在的事实限制。只有线上页面和图片全部通过后才能声称「已发布」。
