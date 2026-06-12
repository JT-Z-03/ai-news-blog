$ErrorActionPreference = "Stop"

$requiredFields = @("title", "date", "draft", "tags", "categories", "slug", "description")
$errors = @()

Get-ChildItem "$PSScriptRoot\..\content\posts\*.md" | ForEach-Object {
    $content = [IO.File]::ReadAllText($_.FullName, [Text.Encoding]::UTF8)
    $frontMatter = [regex]::Match($content, "(?s)\A---\s*(.*?)\s*---").Groups[1].Value

    foreach ($field in $requiredFields) {
        if ($frontMatter -notmatch "(?m)^$([regex]::Escape($field)):") {
            $errors += "$($_.Name): missing frontmatter field '$field'"
        }
    }

    if ($content -match "(?m)^# ") {
        $errors += "$($_.Name): body must not repeat the page title as an H1"
    }

    if ($content -notmatch "https?://") {
        $errors += "$($_.Name): no source link found"
    }
}

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Content validation passed."
