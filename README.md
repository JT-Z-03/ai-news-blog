# AI 热点追踪

基于 Hugo 与 PaperMod 的中文 AI 新闻博客，包含 AI 热点日报和深度分析文章。

- 线上地址：https://ai-news-blog-cg8.pages.dev/
- 部署平台：Cloudflare Pages
- 主题：PaperMod Git submodule

## 本地开发

Hugo Extended 版本以 [`.hugo-version`](.hugo-version) 为准，当前为 `0.162.0`。构建入口会拒绝不匹配的版本和非 Extended 版本。需要 Node.js 18+、PowerShell 7 和 Git。

```powershell
git submodule update --init --recursive
.\hugo.exe server
```

访问 `http://localhost:1313/`。

## 构建验证

```powershell
pwsh -NoProfile -File ./scripts/validate-all.ps1
```

Windows 和 Linux 使用相同入口：自动发现项目内的 Hugo 或 PATH 中的 Hugo，也可通过 `-HugoPath` 显式指定路径。完整检查包含内容、安全头、首页/全站、元数据、图标、工具链回归及隔离生产构建；任一失败均返回非零状态。夹具和最终构建写入临时目录，不覆盖正式 `public/`。

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

## 内容结构

- `content/posts/`：日报与深度分析
- `content/about.md`：关于页面
- `content/search.md`：客户端全文搜索
- `layouts/`：页面模板
- `assets/css/extended/`：站点样式
- `hugo.toml`：站点、菜单、搜索和 SEO 配置

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
npx wrangler pages deploy public --project-name ai-news-blog
```

## Cloudflare Pages

构建配置（production 和 preview 均需保持一致）：

- Build command：`node scripts/build-site.mjs`
- Build output directory：`public`
- Environment variable：`HUGO_VERSION=0.162.0`，须与 `.hugo-version` 一致
- Production branch：`main`

Cloudflare 不会自动读取本项目的 `.hugo-version`；该文件用于本地、CI 与构建入口校验，平台安装版本仍由 `HUGO_VERSION` 选择。升级时先更新 preview 变量并验收 PR 预览，随后同步 production 并合并；以构建日志和线上首页 generator 的实际版本为准。版本不匹配时构建会停止，避免静默使用平台默认版本。

## 内容质量要求

- 所有现有与新发布内容（包括日报、深度分析和关于页）的作者、发布人及正文署名统一为 `ZestJT`。页面作者默认继承 `hugo.toml` 中的 `params.author`；如显式填写 frontmatter 作者或正文署名，也必须使用 `ZestJT`，不得从旧稿或写作 Skill 继承其他署名。
- 每条日报资讯必须附原文链接。
- 重大结论优先引用官方来源；没有官方来源时至少使用两个独立来源交叉核验。
- 深度分析中的数字和直接引语必须提供可点击来源。
- 不依据模型记忆补写新闻事实。
