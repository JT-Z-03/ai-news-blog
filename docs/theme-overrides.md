# 主题覆盖与升级检查

当前主题固定在 PaperMod `969bebdc5600a1639158b5ef4eff9cf6cbb511ac`。自定义文件位于项目 `layouts/`，不修改子模块源码。下表的“来源基线”仍指覆盖最初参考的 `154d006e0182dfc7da38008323976b02e6bfab4a`，不随依赖升级改写。

2026-10-24已审阅来源基线至当前版本的9个上游提交、19个文件：直接继承正文CSS和日期元信息修复，继续使用本站head/footer、搜索、RSS及结构化数据实现。上游最低Hugo版本为0.158.0，本站0.162.0满足。正文CSS移除了列表代码块负边距和旧高亮表格规则，升级验收重点覆盖代码、表格、窄屏、深色与文字放大。多语言分支仍沿用覆盖来源的API；本站当前单语，未据此声称多语言已验收。

| 项目文件 | 上游来源 / 所有权 | 保留行为与必要差异 |
|---|---|---|
| `layouts/partials/orbit-head.html` | 上游 `layouts/_partials/head.html`，来源基线 | 保留 CSS 打包、搜索资源、验证标签、alternate/RSS、无 JS 样式、Twitter cards；canonical 接收显式分页参数，图标按资源存在性直接生成，主题初始化使用本地有指纹脚本。避免对上游生成的整段 HTML 做字符串替换。 |
| `layouts/partials/orbit-list-head.html` | 项目局部入口 | 将分页 URL 传给 head；frontmatter canonicalURL 仍优先。 |
| `layouts/partials/footer.html` | 上游 `layouts/_partials/footer.html`，来源基线 | 保留版权与 Hugo/PaperMod 链接、回顶按钮和扩展入口；辅助名称中文化，所有可执行脚本移至本地资源。 |
| `layouts/partials/templates/opengraph.html` | 上游同名 partial，来源基线 | 仅 posts 输出 article 类型和非零文章日期；语言改用 `site.Language.Locale`，静态页面输出 website；复用head已解析的canonical，避免分页分享回到第一页。 |
| `layouts/partials/templates/twitter_cards.html`、`templates/_funcs/orbit-share-images.html` | 项目分享元数据 | Open Graph和Twitter共用图片解析，优先页面图片，再用站点默认图片；本地资源输出实际宽高、类型及替代文字。 |
| `layouts/partials/templates/schema_json.html` | 项目语义实现；参考上游同名 partial | 用字典和 JSON 序列化构造合法数据；文章为 BlogPosting，关于为 AboutPage，搜索为 SearchResultsPage；其他普通页为 WebPage。面包屑取真实祖先。省略正文副本 articleBody，保留标题、摘要、作者、图片、实际日期和数值字数。保留可用图标检查。 |
| `layouts/rss.xml` | 上游 `layouts/rss.xml`，来源基线 | 改用 Locale；RSS 只收录 posts，避免静态页零日期；空集合不读取首篇 Lastmod。 |
| `layouts/partials/extend_footer.html` | 项目扩展点 | 只在 posts 加载外部阅读进度脚本；footer 的 partialCached 键须包含 Section。 |
| `layouts/baseof.html`、各页面模板、`header.html`、`orbit-responsive-image.html`、`layouts/_markup/` | 项目阅读界面 | 由本站负责维护；主题升级不能直接覆盖这些入口。其他未覆盖 partial 继续来自固定主题。 |

## 外部脚本与 CSP

- `orbit-theme.js` 在 head 同步执行，尽早应用偏好，存储不可用时使用默认/系统主题。
- `orbit-ui.js` 负责导航横向位置、目录/跳到正文/回顶的滚动与焦点、主题切换，以及启用时的代码复制。减少动画偏好仍有效；剪贴板失败不显示成功。
- `orbit-reading-progress.js` 使用 requestAnimationFrame 合并滚动更新，内容高度变化时重新计算；值未变化时跳过对应DOM写入。
- Orbit配色由 `orbit-tokens.css` 统一维护；无JS自动主题使用同一组深色值，首页仅选择专用软背景。
- 三类资源均经 Hugo 构建、压缩、指纹及 integrity 输出；搜索仍由站点搜索 bundle 承担。
- `script-src` 仅允许本站和现有 Cloudflare Analytics 脚本域；`script-src-attr 'none'` 禁用内联事件。保留 Analytics 上报域。
- JSON-LD 的 `application/ld+json` 是不可执行数据块；通过 JSON 序列化转义，不需要将 `unsafe-inline` 加回策略，也不需要构建后对 HTML 计算脚本 hash。样式策略仍有 `unsafe-inline`，兼容现有主题样式和动态进度 transform，本次只收紧脚本策略。
- 启用此前未使用的第三方分析或主题扩展时，须重新检查它是否带来新的可执行内联脚本，不能为了通过部署直接放宽 CSP。

## 每次 Hugo / PaperMod 升级

1. 确认子模块目标提交，逐个比较上述上游文件，判断上游变化是否应带入项目覆盖。
2. 运行现有 metadata/icon 回归与 `test-share-metadata.ps1`、`test-topics.ps1`、`test-seo-security.ps1`、`test-security-validation.ps1`，检查构建没有新增弃用警告。
3. 对首页、分类分页、文章、关于、归档、主题和搜索检查 canonical、Open Graph、Twitter、JSON-LD；XML feed 必须可解析。
4. 在实际 HTTP CSP 下验证首屏主题和切换、键盘跳过导航、目录焦点、阅读进度、回顶、搜索；如果启用代码复制，还需实际点击验收。检查浏览器 CSP 违规记录。
5. 上线后再次核对响应头与部署资源。模板通过不能替代浏览器行为或线上状态。

依据：[Hugo Language API](https://gohugo.io/methods/site/language/)、[HTML script data blocks](https://html.spec.whatwg.org/multipage/scripting.html#data-block)、[AboutPage](https://schema.org/AboutPage)、[SearchResultsPage](https://schema.org/SearchResultsPage)。
