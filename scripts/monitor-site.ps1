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

    $homeResponse = $null
    try {
        $homeResponse = Invoke-WebRequest -Uri "$base/" @requestParameters
    }
    catch {
        $failures.Add("首页请求失败: $($_.Exception.Message)")
    }

    if ($null -ne $homeResponse) {
        if ([int]$homeResponse.StatusCode -ne 200) {
            $failures.Add("首页状态码为 $($homeResponse.StatusCode)，预期 200")
        }
        if ($homeResponse.Content -notmatch [regex]::Escape("AI 热点追踪")) {
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
            $value = $homeResponse.Headers[$rule.Key] -join ", "
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
