# 账户安全清单

完成情况只记录在个人离线清单中。不要把邮箱、手机号、密码、验证码、通行密钥或恢复码写入仓库。

## 登录邮箱

- 开启双重验证或通行密钥。
- 保存离线恢复方式，检查备用邮箱和手机号是否属于本人。
- 检查陌生会话、自动转发规则、应用专用密码和第三方授权。
- 确认 GitHub 与 Cloudflare 的安全通知不会进入垃圾邮件。

## GitHub

- 在 Settings → Password and authentication 中开启双重验证或通行密钥，并离线保存恢复码。
- 在 Sessions、Applications 和 Developer settings 中撤销陌生会话、OAuth 应用、GitHub App、Personal access token 和 SSH key。
- 为 ai-news-blog 订阅 Actions 与 Security alerts 邮件通知。
- 不把 Token 写进仓库、脚本、Issue、聊天截图或构建日志。

## Cloudflare

- 在 My Profile → Authentication 中开启双重验证或安全密钥，并离线保存恢复码。
- 在 My Profile → Sessions 中撤销陌生会话。
- 检查 API Tokens、API Keys 和账户成员，只保留本人确认需要的项目。
- 确认 Pages 项目 ai-news-blog 的生产分支仍为 main。

## 完成确认

账户所有者只需确认“邮箱、GitHub、Cloudflare均已完成”，不得向任何人发送验证码或恢复码。
