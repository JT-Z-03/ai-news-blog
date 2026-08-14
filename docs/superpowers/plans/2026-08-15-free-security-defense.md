# AI 热点追踪免费安全防护实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在不增加数据库、后台或付费服务的前提下，为 AI 热点追踪补齐跨平台发布校验、每小时在线监控、私密漏洞报告、账户安全指引和 30 分钟恢复手册。

**Architecture:** 保持 Hugo 静态站点和 Cloudflare Pages 发布架构不变。发布前由只读 GitHub Actions 运行内容与安全校验，发布后由另一个只读工作流调用 PowerShell 检查线上页面和响应头；失败只通知，由人根据 Git 历史和 Cloudflare 旧部署恢复。

**Tech Stack:** PowerShell 7、GitHub Actions、GitHub REST API、Git、Hugo Extended 0.162.0、Cloudflare Pages。

## Global Constraints

- 正式站点固定为 `https://ai-news-blog-cg8.pages.dev/`，生产分支固定为 `main`。
- 所有自动工作流只授予 `contents: read`，不得持有写入源码、管理账户或回滚 Cloudflare 的权限。
- `main` 必须继续要求拉取请求、严格状态检查、管理员服从保护规则、解决对话；不得强制推送或删除。
- 最终必过检查固定为 `Cloudflare Pages` 和 `repository-validation`。
- 不在 GitHub Actions 中重复搭建 Hugo 发布系统；Cloudflare Pages 继续负责正式构建。
- 在线检查固定在每小时第 17 分钟运行，也允许手动运行；每次运行最多三次完整检查，失败后等待 15 秒。
- 自动任务不得自动回滚、自动封禁、收集访客 IP 或反击任何人。
- 不增加数据库、后台登录、Cloudflare Workers、自建服务器、付费防火墙、付费监控或新运行时依赖。
- GitHub、Cloudflare 和邮箱的密码、验证码、通行密钥及恢复码不得进入仓库或任务日志。
- `actions/checkout` 固定到提交 `3d3c42e5aac5ba805825da76410c181273ba90b1`，对应官方稳定版 v7.0.1。

## File Structure

- Modify: `scripts/validate-security.ps1`，兼容 Windows CRLF 与 Linux LF，并允许对临时测试文件运行。
- Create: `.github/workflows/repository-validation.yml`，在拉取请求和 `main` 更新时运行现有内容与安全校验。
- Create: `scripts/monitor-site.ps1`，只读检查首页、搜索页、站点地图和安全响应头，并负责三次重试。
- Create: `.github/workflows/site-monitor.yml`，每小时及手动调用线上检查脚本。
- Create: `SECURITY.md`，提供私密漏洞报告入口和安全测试边界。
- Create: `docs/security/account-security-checklist.md`，提供 GitHub、Cloudflare 与邮箱账户加固步骤。
- Create: `docs/security/incident-response.md`，提供页面损坏、源码篡改和账户失陷的中文恢复步骤。
- Modify external settings: GitHub 私密漏洞报告与 `main` 必过检查；只核验已开启的密钥扫描和推送保护。

---

### Task 1: 修复安全校验的跨平台误报

**Files:**
- Modify: `scripts/validate-security.ps1`

**Interfaces:**
- Consumes: 默认文件 `static/_headers`，或测试时通过 `-HeadersPath` 传入的 UTF-8 文件路径。
- Produces: 完整配置退出码为 0；文件缺失或任一必需响应头缺失时退出码为 1。

- [ ] **Step 1: 运行现有检查，确认 Windows CRLF 误报**

~~~powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\validate-security.ps1
~~~

Expected: FAIL，包含 `static/_headers: missing or incomplete global rule`。使用 `git ls-files --eol static/_headers` 确认工作区文件为 `w/crlf`，不得把失败误判为响应头文件丢失。

- [ ] **Step 2: 增加可测试的文件参数并做最小正则修复**

在文件第一行前加入参数，并用默认路径回退替换原 `$headersPath` 赋值。

~~~powershell
param(
    [string]$HeadersPath
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($HeadersPath)) {
    $HeadersPath = Join-Path $PSScriptRoot "..\static\_headers"
}
~~~

随后把文件中所有 `$headersPath` 改为 `$HeadersPath`，只修改全局规则表达式以允许行尾存在回车符。

~~~powershell
"global rule" = "(?m)^/\*\r?$"
~~~

不要放宽其他安全头要求，也不要修改 `static/_headers`。

- [ ] **Step 3: 验证默认文件以及 LF、CRLF 两种临时文件**

~~~powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\validate-security.ps1

$testDir = Join-Path ([IO.Path]::GetTempPath()) ("ai-news-eol-" + [Guid]::NewGuid())
New-Item -ItemType Directory -Path $testDir | Out-Null
try {
    $content = [IO.File]::ReadAllText((Resolve-Path ".\static\_headers"), [Text.Encoding]::UTF8)
    $lfContent = $content -replace "\r\n?", "`n"
    $variants = [ordered]@{
        LF = $lfContent
        CRLF = $lfContent.Replace("`n", "`r`n")
    }

    foreach ($variant in $variants.GetEnumerator()) {
        $path = Join-Path $testDir ("_headers-" + $variant.Key)
        [IO.File]::WriteAllText($path, $variant.Value, [Text.UTF8Encoding]::new($false))
        pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\validate-security.ps1 -HeadersPath $path
        if ($LASTEXITCODE -ne 0) {
            throw "$($variant.Key) 换行文件应通过安全校验"
        }
    }
}
finally {
    Remove-Item -LiteralPath $testDir -Recurse -Force
}
~~~

Expected: 默认文件、LF 临时文件和 CRLF 临时文件都输出 `Security header validation passed.`，退出码均为 0。

- [ ] **Step 4: 逐项删除规则，验证所有失败路径**

~~~powershell
$testDir = Join-Path ([IO.Path]::GetTempPath()) ("ai-news-missing-header-" + [Guid]::NewGuid())
New-Item -ItemType Directory -Path $testDir | Out-Null
try {
    $content = [IO.File]::ReadAllText((Resolve-Path ".\static\_headers"), [Text.Encoding]::UTF8)
    $removals = [ordered]@{
        "global rule" = "(?m)^/\*\r?\n"
        "content security policy" = "(?mi)^\s+Content-Security-Policy:.*(?:\r?\n|$)"
        "strict transport security" = "(?mi)^\s+Strict-Transport-Security:.*(?:\r?\n|$)"
        "content type protection" = "(?mi)^\s+X-Content-Type-Options:.*(?:\r?\n|$)"
        "frame protection" = "(?mi)^\s+X-Frame-Options:.*(?:\r?\n|$)"
        "referrer policy" = "(?mi)^\s+Referrer-Policy:.*(?:\r?\n|$)"
        "permissions policy" = "(?mi)^\s+Permissions-Policy:.*(?:\r?\n|$)"
    }

    foreach ($removal in $removals.GetEnumerator()) {
        $brokenHeaders = Join-Path $testDir (($removal.Key -replace " ", "-") + ".txt")
        $brokenContent = [regex]::Replace($content, $removal.Value, "")
        [IO.File]::WriteAllText($brokenHeaders, $brokenContent, [Text.UTF8Encoding]::new($false))
        pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\validate-security.ps1 -HeadersPath $brokenHeaders
        if ($LASTEXITCODE -eq 0) {
            throw "删除 $($removal.Key) 时安全校验不应通过"
        }
    }
}
finally {
    Remove-Item -LiteralPath $testDir -Recurse -Force
}
~~~

Expected: 七个临时损坏文件全部退出码为 1，并分别报告对应规则缺失；临时目录随后被删除。

- [ ] **Step 5: 回归内容校验并提交**

~~~powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\validate-content.ps1
git diff --check
git add -- scripts/validate-security.ps1
git commit -m "fix: validate security headers across platforms"
~~~

Expected: 内容校验和修复后的安全校验均通过；提交只修改 `scripts/validate-security.ps1`。

### Task 2: 添加拉取请求必过校验

**Files:**
- Create: `.github/workflows/repository-validation.yml`

**Interfaces:**
- Consumes: `scripts/validate-content.ps1` 和 Task 1 修复后的 `scripts/validate-security.ps1`。
- Produces: GitHub 检查 `repository-validation`；后续 Task 7 将它加入 `main` 必过检查。

- [ ] **Step 1: 创建只读校验工作流**

写入完整文件：

~~~yaml
name: Repository validation

on:
  pull_request:
    branches:
      - main
  push:
    branches:
      - main
  workflow_dispatch:

permissions:
  contents: read

jobs:
  repository-validation:
    name: repository-validation
    runs-on: ubuntu-latest
    timeout-minutes: 5
    steps:
      - name: Check out repository
        uses: actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1 # v7.0.1

      - name: Validate content
        shell: pwsh
        run: ./scripts/validate-content.ps1

      - name: Validate security headers
        shell: pwsh
        run: ./scripts/validate-security.ps1
~~~

- [ ] **Step 2: 本地执行工作流对应命令**

~~~powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\validate-content.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\validate-security.ps1
~~~

Expected: 两个命令退出码均为 0。

- [ ] **Step 3: 检查权限、触发条件和固定版本**

~~~powershell
$workflow = Get-Content -Raw .\.github\workflows\repository-validation.yml
@(
    "pull_request:",
    "push:",
    "workflow_dispatch:",
    "contents: read",
    "name: repository-validation",
    "actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1"
) | ForEach-Object {
    if (-not $workflow.Contains($_)) {
        throw "repository-validation.yml 缺少: $_"
    }
}

if ($workflow -match "contents:\s*write|pull-requests:\s*write|security-events:\s*write") {
    throw "仓库校验工作流不应拥有写权限"
}
~~~

Expected: 无异常，且文件没有任何写权限。

- [ ] **Step 4: 提交工作流**

~~~powershell
git diff --check
git add -- .github/workflows/repository-validation.yml
git commit -m "ci: validate repository changes"
~~~

### Task 3: 实现只读线上检查与重试

**Files:**
- Create: `scripts/monitor-site.ps1`

**Interfaces:**
- Consumes: 字符串参数 `-BaseUrl`、整数参数 `-MaxAttempts` 和 `-RetryDelaySeconds`；默认值分别为正式站点、3 和 15。
- Produces: 整套检查任一次全部成功则退出码为 0；连续三次仍有失败项目则打印原因并退出码为 1。

- [ ] **Step 1: 先运行不存在的脚本，确认红灯**

~~~powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\monitor-site.ps1
~~~

Expected: FAIL，因为 `scripts/monitor-site.ps1` 尚不存在。

- [ ] **Step 2: 写入最小线上检查脚本**

创建以下完整内容：

~~~powershell
param(
    [string]$BaseUrl = "https://ai-news-blog-cg8.pages.dev",

    [ValidateRange(1, 10)]
    [int]$MaxAttempts = 3,

    [ValidateRange(0, 300)]
    [int]$RetryDelaySeconds = 15
)

$ErrorActionPreference = "Stop"

function Invoke-SiteCheck {
    param(
        [Parameter(Mandatory)]
        [string]$SiteBaseUrl
    )

    $base = $SiteBaseUrl.TrimEnd("/")
    $failures = [Collections.Generic.List[string]]::new()
    $requestParameters = @{
        MaximumRedirection = 5
        TimeoutSec = 20
        UserAgent = "ai-news-blog-health-check/1.0"
    }

    $home = $null
    try {
        $home = Invoke-WebRequest -Uri "$base/" @requestParameters
    }
    catch {
        $failures.Add("首页请求失败: $($_.Exception.Message)")
    }

    if ($null -ne $home) {
        if ([int]$home.StatusCode -ne 200) {
            $failures.Add("首页状态码为 $($home.StatusCode)，预期 200")
        }
        if ($home.Content -notmatch [regex]::Escape("AI 热点追踪")) {
            $failures.Add("首页缺少标题标记「AI 热点追踪」")
        }

        $headerRules = [ordered]@{
            "Content-Security-Policy" = "default-src 'self'.*object-src 'none'.*frame-ancestors 'none'"
            "Strict-Transport-Security" = "max-age=31536000"
            "X-Content-Type-Options" = "^nosniff$"
            "X-Frame-Options" = "^DENY$"
            "Referrer-Policy" = "^strict-origin-when-cross-origin$"
            "Permissions-Policy" = "camera=\(\).*geolocation=\(\).*microphone=\(\)"
        }

        foreach ($rule in $headerRules.GetEnumerator()) {
            $value = $home.Headers[$rule.Key] -join ", "
            if ([string]::IsNullOrWhiteSpace($value) -or $value -notmatch $rule.Value) {
                $failures.Add("首页缺少或未满足安全响应头: $($rule.Key)")
            }
        }
    }

    try {
        $search = Invoke-WebRequest -Uri "$base/search/" @requestParameters
        if ([int]$search.StatusCode -ne 200) {
            $failures.Add("搜索页状态码为 $($search.StatusCode)，预期 200")
        }
    }
    catch {
        $failures.Add("搜索页请求失败: $($_.Exception.Message)")
    }

    try {
        $sitemap = Invoke-WebRequest -Uri "$base/sitemap.xml" @requestParameters
        if ([int]$sitemap.StatusCode -ne 200) {
            $failures.Add("站点地图状态码为 $($sitemap.StatusCode)，预期 200")
        }
        if ($sitemap.Content -notmatch "<urlset") {
            $failures.Add("站点地图缺少 <urlset 标记")
        }
    }
    catch {
        $failures.Add("站点地图请求失败: $($_.Exception.Message)")
    }

    return $failures.ToArray()
}

$lastFailures = @()
for ($attempt = 1; $attempt -le $MaxAttempts; $attempt++) {
    $lastFailures = @(Invoke-SiteCheck -SiteBaseUrl $BaseUrl)
    if ($lastFailures.Count -eq 0) {
        Write-Host "Site monitor passed on attempt $attempt."
        exit 0
    }

    Write-Warning "Site monitor attempt $attempt failed: $($lastFailures -join '; ')"
    if ($attempt -lt $MaxAttempts) {
        Start-Sleep -Seconds $RetryDelaySeconds
    }
}

Write-Host "Site monitor failed after $MaxAttempts attempts." -ForegroundColor Red
$lastFailures | ForEach-Object {
    Write-Host " - $_" -ForegroundColor Red
}
exit 1
~~~

- [ ] **Step 3: 验证正式站点成功路径**

~~~powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\monitor-site.ps1 -MaxAttempts 1 -RetryDelaySeconds 0
~~~

Expected: 输出 `Site monitor passed on attempt 1.`，退出码为 0。若受网络沙箱限制，使用获得授权的联网环境重试，不改变脚本来绕过检查。

- [ ] **Step 4: 验证错误站点失败路径**

~~~powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\monitor-site.ps1 -BaseUrl "https://example.com" -MaxAttempts 1 -RetryDelaySeconds 0
if ($LASTEXITCODE -eq 0) {
    throw "错误站点不应通过 AI 热点追踪的线上检查"
}
~~~

Expected: 退出码为 1，并至少报告缺少站点标题或必需安全响应头。

- [ ] **Step 5: 提交线上检查脚本**

~~~powershell
git diff --check
git add -- scripts/monitor-site.ps1
git commit -m "feat: monitor production site health"
~~~

### Task 4: 添加每小时与手动监控工作流

**Files:**
- Create: `.github/workflows/site-monitor.yml`

**Interfaces:**
- Consumes: Task 3 的 `scripts/monitor-site.ps1`。
- Produces: GitHub Actions 中名为 `site-monitor` 的只读任务；失败使用 GitHub 自带通知，不修改任何外部状态。

- [ ] **Step 1: 创建监控工作流**

写入完整文件：

~~~yaml
name: Site monitor

on:
  schedule:
    - cron: "17 * * * *"
  workflow_dispatch:

permissions:
  contents: read

concurrency:
  group: site-monitor
  cancel-in-progress: true

jobs:
  site-monitor:
    name: site-monitor
    runs-on: ubuntu-latest
    timeout-minutes: 5
    steps:
      - name: Check out repository
        uses: actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1 # v7.0.1

      - name: Check production site
        shell: pwsh
        run: ./scripts/monitor-site.ps1
~~~

- [ ] **Step 2: 检查计划时间、权限和调用路径**

~~~powershell
$workflow = Get-Content -Raw .\.github\workflows\site-monitor.yml
@(
    'cron: "17 * * * *"',
    "workflow_dispatch:",
    "contents: read",
    "name: site-monitor",
    "./scripts/monitor-site.ps1"
) | ForEach-Object {
    if (-not $workflow.Contains($_)) {
        throw "site-monitor.yml 缺少: $_"
    }
}

if ($workflow -match "contents:\s*write|pull-requests:\s*write|deployments:\s*write") {
    throw "监控工作流不应拥有写权限"
}
~~~

Expected: 无异常；工作流只在每小时第 17 分钟或手动触发。

- [ ] **Step 3: 回归脚本并提交**

~~~powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\monitor-site.ps1 -MaxAttempts 1 -RetryDelaySeconds 0
git diff --check
git add -- .github/workflows/site-monitor.yml
git commit -m "ci: schedule production site monitoring"
~~~

### Task 5: 添加报告入口、账户清单与恢复手册

**Files:**
- Create: `SECURITY.md`
- Create: `docs/security/account-security-checklist.md`
- Create: `docs/security/incident-response.md`

**Interfaces:**
- Consumes: GitHub 私密漏洞报告入口、Cloudflare Pages 部署历史、现有 Git 提交历史。
- Produces: 公开报告指引、不会泄露凭据的账户加固步骤，以及非技术用户可以顺序执行的恢复流程。

- [ ] **Step 1: 创建安全报告政策**

`SECURITY.md` 写入：

~~~markdown
# 安全政策

## 报告安全问题

请不要通过公开 Issue、评论或社交平台披露尚未修复的安全问题。请使用 GitHub 的[私密漏洞报告](https://github.com/JT-Z-03/ai-news-blog/security/advisories/new)，说明受影响页面、复现步骤、可能影响和必要证据。

请不要提交密码、验证码、恢复码、访问令牌或他人的个人信息。

## 安全测试边界

允许不会破坏数据、不会影响正常访客的验证。禁止高流量压测、拒绝服务、社交工程、撞库、持久化访问、修改线上内容或访问不属于报告者的数据。

## 支持范围

本站只支持当前线上版本。历史部署发现的问题请同时说明对应日期或提交。
~~~

- [ ] **Step 2: 创建账户安全清单**

`docs/security/account-security-checklist.md` 至少写入以下完整清单：

~~~markdown
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
~~~

- [ ] **Step 3: 创建中文恢复手册**

`docs/security/incident-response.md` 写入以下步骤，并保留所有警告：

~~~markdown
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
~~~

- [ ] **Step 4: 检查文档没有秘密或占位符**

~~~powershell
rg -n "私密漏洞报告|禁止高流量压测" SECURITY.md
rg -n "登录邮箱|GitHub|Cloudflare|恢复码" docs/security/account-security-checklist.md
rg -n "30 分钟|Rollback|git revert|repository-validation|Site monitor" docs/security/incident-response.md

if (Select-String -Path SECURITY.md,docs/security/*.md -Pattern "T[B]D","T[O]DO","填入密码","粘贴 Token") {
    throw "安全文档包含占位符或危险凭据指示"
}
~~~

Expected: 所有关键章节命中；占位符和要求粘贴秘密的文字零命中。

- [ ] **Step 5: 提交安全文档**

~~~powershell
git diff --check
git add -- SECURITY.md docs/security/account-security-checklist.md docs/security/incident-response.md
git commit -m "docs: add security reporting and recovery guides"
~~~

### Task 6: 做本地集成验证并创建拉取请求

**Files:**
- Verify only: 本计划列出的脚本、工作流和安全文档。

**Interfaces:**
- Consumes: Tasks 1–5 的提交。
- Produces: 一个范围清晰、等待 `repository-validation` 与 `Cloudflare Pages` 检查的 GitHub 拉取请求。

- [ ] **Step 1: 运行全部本地检查**

~~~powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\validate-content.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\validate-security.ps1
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\monitor-site.ps1 -MaxAttempts 1 -RetryDelaySeconds 0
git diff --check origin/main...HEAD
git status --short
~~~

Expected: 三项检查通过，`git diff --check` 无输出，工作区干净。

- [ ] **Step 2: 核对变更范围**

~~~powershell
git diff --name-only origin/main...HEAD
~~~

Expected: 仅包含设计与计划文档，以及以下实施文件：

~~~text
.github/workflows/repository-validation.yml
.github/workflows/site-monitor.yml
SECURITY.md
docs/security/account-security-checklist.md
docs/security/incident-response.md
scripts/monitor-site.ps1
scripts/validate-security.ps1
~~~

如果出现文章、主题、`hugo.toml`、`static/_headers` 或凭据文件，停止发布并查明来源。

- [ ] **Step 3: 使用受保护分支流程发布**

执行前读取并遵循 `github:yeet` skill，确认当前分支为 `codex/free-security-defense-design`，然后推送该分支并创建拉取请求。

~~~powershell
git push -u origin codex/free-security-defense-design
gh pr create --base main --head codex/free-security-defense-design --title "Add free security monitoring and recovery" --body "Adds cross-platform repository validation, hourly read-only production monitoring, private reporting guidance, account hardening steps, and a recovery runbook. No database, backend, paid service, automatic blocking, or automatic rollback is introduced."
~~~

- [ ] **Step 4: 等待拉取请求检查**

~~~powershell
$prNumber = gh pr view --json number --jq .number
gh pr checks $prNumber --watch --interval 10
~~~

Expected: `repository-validation` 与 `Cloudflare Pages` 都成功。若 GitHub 拒绝解析工作流，先修复 YAML 并重新通过本任务的本地检查，不得直接合并。

### Task 7: 合并、启用仓库设置并完成线上验收

**Files:**
- No additional source file changes expected.

**Interfaces:**
- Consumes: Task 6 全部通过的拉取请求。
- Produces: 合并到 `main` 的防护文件、启用的私密漏洞报告、两个必过检查、一次成功的手动线上监控，以及账户所有者的非敏感完成确认。

- [ ] **Step 1: 合并已通过检查的拉取请求**

~~~powershell
$prNumber = gh pr view --json number --jq .number
gh pr checks $prNumber
gh pr merge $prNumber --merge --delete-branch=false
~~~

Expected: 只有两项检查均成功后才合并；合并产生正常 merge commit，不绕过 `main` 保护。

- [ ] **Step 2: 等待 `main` 上的仓库校验并手动运行监控**

~~~powershell
$mainSha = gh api repos/JT-Z-03/ai-news-blog/commits/main --jq .sha
$validationRunId = $null
for ($attempt = 1; $attempt -le 10 -and [string]::IsNullOrWhiteSpace($validationRunId); $attempt++) {
    Start-Sleep -Seconds 3
    $validationRuns = gh run list --workflow repository-validation.yml --branch main --event push --limit 5 --json databaseId,headSha | ConvertFrom-Json
    $validationRunId = ($validationRuns |
        Where-Object { $_.headSha -eq $mainSha } |
        Select-Object -First 1).databaseId
}
if ([string]::IsNullOrWhiteSpace($validationRunId)) {
    throw "找不到 main 最新提交的 repository-validation 运行"
}
gh run watch $validationRunId --exit-status

gh workflow run site-monitor.yml --ref main
$monitorRunId = $null
for ($attempt = 1; $attempt -le 10 -and [string]::IsNullOrWhiteSpace($monitorRunId); $attempt++) {
    Start-Sleep -Seconds 3
    $monitorRunId = gh run list --workflow site-monitor.yml --branch main --event workflow_dispatch --limit 1 --json databaseId --jq ".[0].databaseId"
}
if ([string]::IsNullOrWhiteSpace($monitorRunId)) {
    throw "手动触发后找不到 site-monitor 运行"
}
gh run watch $monitorRunId --exit-status
~~~

Expected: `main` 上的 `repository-validation` 成功，手动 `site-monitor` 成功；两个 `gh run watch` 命令退出码均为 0。

- [ ] **Step 3: 启用私密漏洞报告并核验密钥保护**

~~~powershell
gh api --method PUT repos/JT-Z-03/ai-news-blog/private-vulnerability-reporting
gh api repos/JT-Z-03/ai-news-blog/private-vulnerability-reporting
gh api repos/JT-Z-03/ai-news-blog --jq ".security_and_analysis"
~~~

Expected: 私密漏洞报告返回 `"enabled": true`；`secret_scanning` 与 `secret_scanning_push_protection` 都为 `enabled`。

如果任一密钥保护状态不是 `enabled`，使用仓库设置的同一官方 API 做最小修复：

~~~powershell
$securityBody = @{
    security_and_analysis = @{
        secret_scanning = @{ status = "enabled" }
        secret_scanning_push_protection = @{ status = "enabled" }
    }
} | ConvertTo-Json -Depth 4

$securityBody | gh api --method PATCH repos/JT-Z-03/ai-news-blog --input -
~~~

- [ ] **Step 4: 将仓库校验加入主分支必过检查**

先从 `main` 最新提交取得 GitHub Actions 的实际 App ID，再只更新 required status checks 子资源，保留 Cloudflare App 绑定。

~~~powershell
$mainSha = gh api repos/JT-Z-03/ai-news-blog/commits/main --jq .sha
$checkRuns = gh api "repos/JT-Z-03/ai-news-blog/commits/$mainSha/check-runs" | ConvertFrom-Json
$validationCheck = $checkRuns.check_runs |
    Where-Object { $_.name -eq "repository-validation" } |
    Select-Object -First 1

if ($null -eq $validationCheck) {
    throw "main 最新提交没有 repository-validation 检查，不能更新分支保护"
}

$protectionBody = @{
    strict = $true
    checks = @(
        @{ context = "Cloudflare Pages"; app_id = 85455 }
        @{ context = "repository-validation"; app_id = [int]$validationCheck.app.id }
    )
} | ConvertTo-Json -Depth 4

$protectionBody | gh api --method PATCH repos/JT-Z-03/ai-news-blog/branches/main/protection/required_status_checks --input -
~~~

- [ ] **Step 5: 核验完整分支保护没有退化**

~~~powershell
gh api repos/JT-Z-03/ai-news-blog/branches/main/protection
~~~

Expected:

~~~text
required_status_checks.strict = true
required_status_checks.checks 包含 Cloudflare Pages 与 repository-validation
required_pull_request_reviews 存在，required_approving_review_count = 0
enforce_admins.enabled = true
required_conversation_resolution.enabled = true
allow_force_pushes.enabled = false
allow_deletions.enabled = false
~~~

如果任一原有保护项发生变化，停止验收并恢复到以上准确值。

- [ ] **Step 6: 完成生产站点最终检查**

~~~powershell
pwsh.exe -NoLogo -NoProfile -NonInteractive -File .\scripts\monitor-site.ps1 -MaxAttempts 3 -RetryDelaySeconds 15
~~~

Expected: 首页、搜索页、站点地图和全部关键安全响应头通过。再打开 GitHub Actions，确认 `Site monitor` 下次计划运行时间可见。

- [ ] **Step 7: 引导账户所有者完成不可自动化项目**

向账户所有者逐项展示 `docs/security/account-security-checklist.md`，只收集以下一句非敏感确认：

~~~text
邮箱、GitHub、Cloudflare均已完成双重验证或通行密钥设置，恢复码已离线保存，陌生会话和授权已检查。
~~~

不得索取截图中的二维码、验证码、密码、Token 或恢复码。未收到确认前，只能声称代码与仓库防护已完成，不能声称账户加固全部完成。

- [ ] **Step 8: 交付验证证据**

报告拉取请求 URL、merge commit、两个必过检查、手动监控运行 URL、私密漏洞报告状态、密钥扫描状态和线上检查结果。明确免费方案仍不能保证无限规模 DDoS、平台整体故障或电脑与邮箱同时失陷时的 30 分钟恢复。
