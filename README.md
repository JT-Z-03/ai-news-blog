# AI 热点追踪

基于 Hugo 与 PaperMod 的中文 AI 新闻博客，包含 AI 热点日报和深度分析文章。

- 线上地址：https://ai-news-blog-cg8.pages.dev/
- 部署平台：Cloudflare Pages
- 主题：PaperMod Git submodule

## 本地开发

Hugo Extended 版本以 [`.hugo-version`](.hugo-version) 为准，当前为 `0.162.0`。构建入口会拒绝不匹配的版本和非 Extended 版本。验证使用 Node.js 24、PowerShell 7 和 Git；站点仍由 Hugo 生成静态文件。

```powershell
git submodule update --init --recursive
npm ci --ignore-scripts
.\hugo.exe server
```

访问 `http://localhost:1313/`。

## 构建验证

```powershell
pwsh -NoProfile -File ./scripts/validate-all.ps1
```

Windows 和 Linux 使用相同入口：自动发现项目内的 Hugo 或 PATH 中的 Hugo，也可通过 `-HugoPath` 显式指定路径。完整检查包含内容、安全头、首页/全站、元数据、图标、工具链回归及隔离生产构建；任一失败均返回非零状态。夹具和最终构建写入临时目录，不覆盖正式 `public/`。

Node 验证依赖固定在 `package-lock.json`，使用官方 npm registry。内容校验结构化解析 YAML 与 Markdown，检查非空字段、日期、分类、唯一 slug、ZestJT 署名和日报每条消息的来源链接；这不能替代对新闻事实和来源可信度的人工核查。搜索、监控和 SEO/CSP 的负向夹具也纳入统一入口。

生成可部署产物：

```powershell
node scripts/build-site.mjs
```

该入口先核对版本，再执行生产构建，默认清理 `public/` 中已删除或改名的旧路由，避免手工部署残留文章。可用 `HUGO_BINARY` 环境变量指定二进制，或用 `--destination PATH` 指定输出目录；自定义目录不会自动清理，应使用新的空目录。`public/`、Wrangler 本地状态和 Hugo 构建锁文件均不会提交到 Git。

安全头、中文统计和分页 canonical 的针对性回归检查：

```powershell
.\scripts\test-security-validation.ps1
.\scripts\test-content-metadata.ps1
.\scripts\test-icon-references.ps1
```

回归检查使用隔离临时夹具，不上传访问统计或修改正式内容。仓库 CI 初始化固定主题子模块，从官方 Release 安装 `.hugo-version` 指定的 Extended 二进制并校验 SHA256，然后执行完整验证入口。

浏览器验收使用 Chromium、Firefox、WebKit，覆盖 320/390/768/1024/1440px、文字放大、暗色、键盘、搜索与 CSP；CI 保存截图和失败轨迹7天：

```powershell
node scripts/build-site.mjs --destination .validation-public
npx playwright install chromium firefox webkit
npm run test:browser
```

也可设置 `PLAYWRIGHT_BASE_URL` 对预览域名运行同一测试。模拟视口、合成组合输入事件和文字缩放不等同真实手机、真实输入法及浏览器原生缩放验收。手工抽查记录应注明设备、浏览器、日期和结果。

本地验收服务器仅监听 HTTP loopback，保留全部 CSP 来源限制，仅去掉需要 TLS 的 `upgrade-insecure-requests`；该指令在实际 HTTPS 预览和生产环境单独验证。生产 `_headers` 保持完整策略。

## 搜索、主题覆盖与监控

- 搜索保留完整正文，大小写不敏感，空格分隔的关键词须全部命中；没有字面匹配时提供标题容错。结果最多30条，支持类型筛选、日期和命中摘要，`?q=&type=`保存搜索状态。正文不再逐字执行模糊匹配。
- 原始搜索索引预算为2 MiB，超限时构建失败，不静默截断正文。可运行 `node scripts/benchmark-search.mjs .validation-public/index.json` 生成基准；500/1000篇模拟仅用于评估扩展压力，不代表这些规模已通过网络或真实设备验收。
- 主题固定提交、覆盖文件来源及升级检查见 [主题覆盖清单](docs/theme-overrides.md)。升级需重新验证页面元数据、外部脚本、图标、分页和浏览器行为。
- `scripts/monitor-site.ps1` 检查安全头、生产索引许可、版本、搜索JSON、最新文章与首页/分类/sitemap一致性，以及页面实际引用的CSS/JS；默认期望文章来自当前checkout。部署验收可传 `-BaseUrl` 与 `-ExpectedArticle /posts/目标slug/`。小时监控沿用已有调度，不增加新定时任务。
- Cloudflare Web Analytics保留既有注入与域名许可。脚本存在或请求成功不代表已有流量、搜索转化率或留存数据；查看报表时应单独核实对应时间范围。

## 内容结构

- `content/posts/`：日报与深度分析
- `content/about.md`：关于页面
- `content/search.md`：客户端全文搜索
- `layouts/`：页面模板
- `assets/css/extended/`：站点样式
- `hugo.toml`：站点、菜单、搜索和 SEO 配置

## 主题导航、订阅与分享

页脚提供 `/topics/` 主题导航、`/archives/` 月份归档和 `/index.xml` RSS订阅；关于页也包含订阅说明。归档和RSS只收录文章，不包含搜索、关于等静态页面。

主题映射集中维护在 `data/topics.yaml`：`id` 是公开锚点，应保持稳定；`title`、`description` 面向读者，`tags` 按现有标签逐项列出同义或关联词。匹配忽略大小写和两侧空白，同一篇文章在一个主题内只出现一次，跨主题可以重复。新增文章仍沿用原标签，已有 `/tags/` URL保持可访问；缺少流量依据时不批量合并、删除或屏蔽标签页。修改映射后运行 `scripts/test-topics.ps1` 并抽查主题页和文章回链。

默认分享图复用 `/images/home/orbit/editorial-network.webp`，favicon使用 `/favicon.svg`；文章可通过frontmatter `images` 覆盖分享图。Open Graph和Twitter共用图像元数据，分页 `og:url` 与canonical一致。`scripts/test-share-metadata.ps1` 校验路径、实际图像尺寸和分页地址；公开社交平台的抓取缓存和卡片展示需另外实测。

页面配色统一在 `assets/css/extended/orbit-tokens.css`，保留首页卡片专用的浅色背景。修改色值时运行全站检查和三引擎浏览器验收，确认普通文字、焦点和无JS深色模式仍可读。

## 发布流程

1. 从真实来源生成或更新文章。
2. 检查文章日期、frontmatter、来源链接和正文内容。
3. 运行本地构建。
4. 只提交本次文章与必要配置变更。
5. 推送功能分支并创建 Pull Request。
6. 等待仓库校验和 Cloudflare Pages 检查通过后合并到 `main`。
7. 验证线上文章 URL 返回 `200`。

不要在仓库、脚本或 Skill 中保存 Cloudflare API Token。需要手动部署时，通过环境变量提供凭据：

```powershell
$env:CLOUDFLARE_API_TOKEN = "..."
npx --yes wrangler@4.152.0 pages deploy public --project-name ai-news-blog
```

## Cloudflare Pages

手工部署 CLI 固定为 Wrangler `4.152.0`（Node.js 22+），避免命令在不知情时切换版本。Git 集成仍执行上面的生产构建入口，不依赖全局 Wrangler。

## 依赖维护

`.github/dependabot.yml` 每月检查 npm、GitHub Actions 和 PaperMod 子模块，分别限制为最多3/2/1个未关闭更新PR；不自动合并。更新PR沿用 `repository-validation`，须通过内容/元数据/安全/生产构建与三引擎浏览器检查，预览验收后再合并。Action继续固定提交SHA，npm继续提交锁文件；主题升级还须按 [覆盖清单](docs/theme-overrides.md) 比较上游差异。

Hugo版本和文档中的Wrangler版本保持显式维护：定期核对官方Release，升级时同时更新版本约定和实际验证结果。Dependabot配置不表示这些工具已自动升级，也不替代生产验收。

## Cloudflare 构建配置

构建配置（production 和 preview 均需保持一致）：

- Build command：`node scripts/build-site.mjs`
- Build output directory：`public`
- Environment variable：`HUGO_VERSION=0.162.0`，由 `wrangler.jsonc` 的 `vars` 提供，须与 `.hugo-version` 一致
- Production branch：`main`

Cloudflare 不会自动读取本项目的 `.hugo-version`；该文件用于本地、CI 与构建入口校验。项目使用 Wrangler 配置时，它是构建环境变量的来源，仅修改控制台/API 变量会被仓库配置覆盖。`wrangler.jsonc` 保持无注释 JSON，构建入口核对其 production/preview 的有效 `HUGO_VERSION`，平台据此选择安装版本。升级时在同一 PR 修改版本文件与 Wrangler 变量，先验收预览再合并；以构建日志和线上首页 generator 的实际版本为准。版本不匹配时构建会停止，避免静默使用平台默认版本。

## 内容质量要求

- 所有现有与新发布内容（包括日报、深度分析和关于页）的作者、发布人及正文署名统一为 `ZestJT`。页面作者默认继承 `hugo.toml` 中的 `params.author`；如显式填写 frontmatter 作者或正文署名，也必须使用 `ZestJT`，不得从旧稿或写作 Skill 继承其他署名。
- 每条日报资讯必须附原文链接。
- 重大结论优先引用官方来源；没有官方来源时至少使用两个独立来源交叉核验。
- 深度分析中的数字和直接引语必须提供可点击来源。
- 不依据模型记忆补写新闻事实。
