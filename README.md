# AI 热点追踪

基于 Hugo 与 PaperMod 的中文 AI 新闻博客，包含 AI 热点日报和深度分析文章。

- 线上地址：https://ai-news-blog-cg8.pages.dev/
- 部署平台：Cloudflare Pages
- 主题：PaperMod Git submodule

## 本地开发

项目当前使用 Hugo Extended `0.162.0`。

```powershell
git submodule update --init --recursive
.\hugo.exe server
```

访问 `http://localhost:1313/`。

## 构建验证

```powershell
.\scripts\validate-content.ps1
.\hugo.exe --gc --minify --cleanDestinationDir --printPathWarnings
```

构建产物写入 `public/`。该目录、Wrangler 本地状态和 Hugo 构建锁文件均不会提交到 Git。

## 内容结构

- `content/posts/`：日报与深度分析
- `content/about.md`：关于页面
- `content/search.md`：客户端全文搜索
- `layouts/index.html`：定制首页
- `assets/css/extended/custom.css`：首页响应式样式
- `hugo.toml`：站点、菜单、搜索和 SEO 配置

## 发布流程

1. 从真实来源生成或更新文章。
2. 检查文章日期、frontmatter、来源链接和正文内容。
3. 运行本地构建。
4. 只提交本次文章与必要配置变更。
5. 推送到 `main`，由 Cloudflare Pages 自动部署。
6. 验证线上文章 URL 返回 `200`。

不要在仓库、脚本或 Skill 中保存 Cloudflare API Token。需要手动部署时，通过环境变量提供凭据：

```powershell
$env:CLOUDFLARE_API_TOKEN = "..."
npx wrangler pages deploy public --project-name ai-news-blog
```

## Cloudflare Pages

建议构建配置：

- Build command：`hugo --gc --minify`
- Build output directory：`public`
- Hugo version：`0.162.0`
- Production branch：`main`

## 内容质量要求

- 每条日报资讯必须附原文链接。
- 重大结论优先引用官方来源；没有官方来源时至少使用两个独立来源交叉核验。
- 深度分析中的数字和直接引语必须提供可点击来源。
- 不依据模型记忆补写新闻事实。
