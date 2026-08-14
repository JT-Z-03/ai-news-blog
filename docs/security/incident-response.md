# 网站安全事件恢复手册

目标：在账户仍可访问时，发现损坏版本后 30 分钟内恢复可用页面。不要挑衅、反击或继续与可疑人员交换链接和文件。

## 先判断是哪一类问题

1. 只有网页显示异常，但 GitHub 账户和源码正常：执行“恢复 Cloudflare 版本”。
2. GitHub 出现不认识的提交、分支或授权：先执行“保护账户”，再执行“清理源码”。
3. 无法登录邮箱、GitHub 或 Cloudflare：立即使用对应平台的账户恢复流程，30 分钟目标不再保证。

## 恢复 Cloudflare 版本

1. 登录 Cloudflare，进入 Workers & Pages → ai-news-blog → Deployments。
2. 找到异常发生前最后一个确认正常的 Production 部署。
3. 打开该部署右侧菜单，选择 Rollback to this deployment 并确认。
4. 不删除任何部署记录；记录回滚时间和目标版本。

## 保护账户

1. 先保护登录邮箱：修改密码、撤销陌生会话、检查转发规则并确认双重验证。
2. 修改 GitHub 与 Cloudflare 密码，撤销陌生会话、应用、密钥和令牌。
3. 不在公开 Issue 中描述仍可利用的细节，不把验证码或恢复码发给任何人。

## 清理源码

1. 在 GitHub 查看 main 最近提交和仓库安全日志，记下不认识的提交哈希。
2. 从正常 main 建立新分支，用 git revert 撤销恶意提交；不要强制推送、删除历史或直接改 main。
3. 创建拉取请求，等待 repository-validation 与 Cloudflare Pages 均通过后合并。

## 恢复后验证

1. 在 GitHub Actions 手动运行 Site monitor。
2. 确认首页、搜索页、sitemap.xml 和安全响应头全部通过。
3. 确认 main 仍禁止强制推送和删除，并要求两个必过检查。
4. 记录发生时间、发现方式、受影响提交或部署、采取的措施和最终恢复时间，但不要记录秘密。

## 定时监控被暂停

公开仓库连续 60 天没有活动时，GitHub 可能暂停定时任务。进入 Actions → Site monitor，选择 Enable workflow，再手动运行一次确认恢复。
