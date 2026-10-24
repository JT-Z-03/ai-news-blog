param(
    [string]$ProjectRoot = (Split-Path $PSScriptRoot -Parent),
    [string]$HugoPath,
    [string]$PublicRoot
)

$ErrorActionPreference = 'Stop'
$projectPath = (Resolve-Path -LiteralPath $ProjectRoot).Path
$tempParent = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd([IO.Path]::DirectorySeparatorChar) + [IO.Path]::DirectorySeparatorChar
$tempRoot = Join-Path $tempParent ('ai-news-blog-share-metadata-' + [guid]::NewGuid().ToString('N'))
$errors = [Collections.Generic.List[string]]::new()

function Get-Attribute([string]$tag, [string]$name) {
    $pattern = '(?i)(?:^|\s)' + [regex]::Escape($name) + '\s*=\s*(?:"(?<v>[^"]*)"|''(?<v>[^'']*)''|(?<v>[^\s>]+))'
    return [Net.WebUtility]::HtmlDecode([regex]::Match($tag, $pattern).Groups['v'].Value)
}

function Get-HeadMeta([string]$markup) {
    $meta = @{}
    foreach ($tag in [regex]::Matches($markup, '(?is)<meta\b[^>]*>')) {
        $key = Get-Attribute $tag.Value 'property'
        if (-not $key) { $key = Get-Attribute $tag.Value 'name' }
        if ($key) { $meta[$key] = Get-Attribute $tag.Value 'content' }
    }
    return $meta
}

function Get-ShareErrors([string]$markup, [string]$output) {
    $problems = [Collections.Generic.List[string]]::new()
    $meta = Get-HeadMeta $markup
    $canonical = ''
    foreach ($tag in [regex]::Matches($markup, '(?is)<link\b[^>]*>')) {
        if ((Get-Attribute $tag.Value 'rel') -eq 'canonical') { $canonical = Get-Attribute $tag.Value 'href' }
    }
    if (-not $canonical -or $meta['og:url'] -cne $canonical) { $problems.Add('Open Graph URL must equal canonical.') }
    $image = [uri]$meta['og:image']
    if (-not $image.IsAbsoluteUri -or $image.Scheme -ne 'https') { $problems.Add('Share image must use an absolute HTTPS URL.') }
    if ($meta['twitter:image'] -cne $meta['og:image']) { $problems.Add('Open Graph and Twitter must select the same image.') }
    if ($meta['twitter:card'] -ne 'summary_large_image') { $problems.Add('The configured default image must enable a large Twitter card.') }
    if (-not $meta['og:image:alt'] -or $meta['twitter:image:alt'] -cne $meta['og:image:alt']) { $problems.Add('Both image descriptions must be present and match.') }
    if ($image.IsAbsoluteUri) {
        $asset = Join-Path $output ([uri]::UnescapeDataString($image.AbsolutePath).TrimStart('/'))
        if (-not (Test-Path -LiteralPath $asset -PathType Leaf)) { $problems.Add('The shared image must exist in the generated site.') }
        elseif ((Get-Item -LiteralPath $asset).Length -ge 5MB) { $problems.Add('The shared image must remain below 5 MiB.') }
    }
    if ($meta['og:image:type'] -ne 'image/webp' -or $meta['og:image:width'] -ne '1600' -or $meta['og:image:height'] -ne '900') {
        $problems.Add('Default image metadata must match the existing 1600 x 900 WebP source.')
    }
    $icons = @([regex]::Matches($markup, '(?is)<link\b[^>]*>') | Where-Object { (Get-Attribute $_.Value 'rel') -eq 'icon' })
    if (-not ($icons | Where-Object { (Get-Attribute $_.Value 'href') -eq '/favicon.svg' -and (Get-Attribute $_.Value 'type') -eq 'image/svg+xml' })) {
        $problems.Add('The SVG favicon must be linked with its correct MIME type and a local URL.')
    }
    return $problems.ToArray()
}

try {
    if ($PublicRoot) { $output = (Resolve-Path -LiteralPath $PublicRoot).Path }
    else {
        . (Join-Path $PSScriptRoot 'hugo-toolchain.ps1')
        $hugoExecutable = Resolve-HugoExecutable -ProjectRoot $projectPath -HugoPath $HugoPath
        New-Item -ItemType Directory -Path $tempRoot | Out-Null
        $output = Join-Path $tempRoot 'public'
        & $hugoExecutable --source $projectPath --destination $output --cacheDir (Join-Path $tempRoot 'cache') --minify
        if ($LASTEXITCODE -ne 0) { throw 'Share metadata build failed.' }
    }
    $routes = @('index.html', 'about/index.html', 'search/index.html', 'posts/deepseek-v4-agent-platform/index.html', 'posts/page/2/index.html', 'categories/日报/page/2/index.html')
    foreach ($relative in $routes) {
        $markup = [IO.File]::ReadAllText((Join-Path $output $relative))
        foreach ($problem in @(Get-ShareErrors $markup $output)) { $errors.Add("${relative}: $problem") }
    }
    [xml]$favicon = [IO.File]::ReadAllText((Join-Path $output 'favicon.svg'))
    if ($favicon.svg.viewBox -ne '0 0 64 64' -or -not $favicon.svg.title) { $errors.Add('The SVG favicon must have a square viewBox and accessible title.') }
    if ($favicon.SelectNodes('//*[local-name()="script" or local-name()="foreignObject"]').Count) { $errors.Add('The SVG favicon must not contain active embedded content.') }

    # Verify actual VP8 frame dimensions independently of Hugo's metadata output.
    $bytes = [IO.File]::ReadAllBytes((Join-Path $output 'images/home/orbit/editorial-network.webp'))
    $ascii = [Text.Encoding]::ASCII
    if ($ascii.GetString($bytes, 0, 4) -ne 'RIFF' -or $ascii.GetString($bytes, 8, 4) -ne 'WEBP') { $errors.Add('Default image is not a WebP file.') }
    $width = 0; $height = 0
    for ($offset = 12; $offset + 10 -lt $bytes.Length;) {
        $chunk = $ascii.GetString($bytes, $offset, 4)
        $size = [BitConverter]::ToUInt32($bytes, $offset + 4)
        if ($chunk -eq 'VP8 ') {
            $width = [BitConverter]::ToUInt16($bytes, $offset + 14) -band 0x3fff
            $height = [BitConverter]::ToUInt16($bytes, $offset + 16) -band 0x3fff
            break
        }
        $offset += 8 + $size + ($size % 2)
    }
    if ($width -ne 1600 -or $height -ne 900) { $errors.Add("Default WebP frame is ${width}x${height}; metadata expects 1600x900.") }

    $homeMarkup = [IO.File]::ReadAllText((Join-Path $output 'index.html'))
    $negativeCases = @(
        [regex]::Replace($homeMarkup, '(<meta\b[^>]*property=["'']?og:url["'']?\s+content=)[^>]+', '$1"https://wrong.invalid/"'),
        $homeMarkup.Replace('summary_large_image', 'summary'),
        $homeMarkup.Replace('1600', '0'),
        $homeMarkup.Replace('editorial-network.webp', 'missing-image.webp'),
        $homeMarkup.Replace('image/svg+xml', 'image/png')
    )
    foreach ($fixture in $negativeCases) {
        if (@(Get-ShareErrors $fixture $output).Count -eq 0) { $errors.Add('A corrupted share metadata fixture was not rejected.') }
    }

    # Keep original resources and content intact; add only disposable page bundles.
    . (Join-Path $PSScriptRoot 'hugo-toolchain.ps1')
    $hugoExecutable = Resolve-HugoExecutable -ProjectRoot $projectPath -HugoPath $HugoPath
    $fixtureContent = Join-Path $tempRoot 'content'
    $fixtureCases = @(
        @{ slug = 'share-static-images'; frontmatter = "images: ['images/home/orbit/editorial-network.webp']`nimagesAlt: 'Explicit static image description'"; image = 'images/home/orbit/editorial-network.webp'; alt = 'Explicit static image description' },
        @{ slug = 'share-bundle-images'; frontmatter = "images: ['specific.webp']`nimagesAlt: 'Bundle image description'"; bundle = 'specific.webp'; image = 'posts/share-bundle-images/specific.webp'; alt = 'Bundle image description' },
        @{ slug = 'share-cover'; frontmatter = "cover:`n  image: 'cover.webp'`n  relative: true`n  alt: 'Cover takes priority'`nimages: ['images/home/orbit/editorial-horizon.webp']"; bundle = 'cover.webp'; image = 'posts/share-cover/cover.webp'; alt = 'Cover takes priority' },
        @{ slug = 'share-static-cover'; frontmatter = "cover:`n  image: 'images/home/orbit/editorial-network.webp'`n  alt: 'Explicit cover description'"; image = 'images/home/orbit/editorial-network.webp'; alt = 'Explicit cover description' },
        @{ slug = 'share-external'; frontmatter = "images: ['https://images.example.invalid/share.webp']`nimagesAlt: 'External image description'"; image = 'https://images.example.invalid/share.webp'; alt = 'External image description'; external = $true }
    )
    foreach ($case in $fixtureCases) {
        $bundlePath = Join-Path $fixtureContent ('posts/' + $case.slug)
        New-Item -ItemType Directory -Path $bundlePath -Force | Out-Null
        [IO.File]::WriteAllText((Join-Path $bundlePath 'index.md'), "---`ntitle: $($case.slug)`ndate: 2020-01-01`n$($case.frontmatter)`n---`nShare metadata fixture.`n")
        if ($case.bundle) { Copy-Item -LiteralPath (Join-Path $projectPath 'static/images/home/orbit/editorial-network.webp') -Destination (Join-Path $bundlePath $case.bundle) }
    }
    $fixtureBaseUrl = 'https://share-fixture.invalid/blog/'
    $mounts = [Collections.Generic.List[string]]::new()
    foreach ($directory in @('content', 'static', 'assets', 'layouts', 'data')) {
        $source = Join-Path $projectPath $directory
        if (Test-Path -LiteralPath $source -PathType Container) { $mounts.Add("[[module.mounts]]`nsource = '$($source.Replace('\', '/'))'`ntarget = '$directory'") }
    }
    $mounts.Add("[[module.mounts]]`nsource = '$($fixtureContent.Replace('\', '/'))'`ntarget = 'content'")
    $fixtureConfig = Join-Path $tempRoot 'subdirectory.toml'
    [IO.File]::WriteAllText($fixtureConfig, "baseURL = '$fixtureBaseUrl'`n[params]`nimages = ['images/home/orbit/editorial-network.webp']`n" + ($mounts -join "`n"))
    $fixtureOutput = Join-Path $tempRoot 'subdirectory-public'
    & $hugoExecutable --source $projectPath --config "$projectPath/hugo.toml,$fixtureConfig" --destination $fixtureOutput --cacheDir (Join-Path $tempRoot 'cache') --minify
    if ($LASTEXITCODE -ne 0) { throw 'Subdirectory share metadata fixture build failed.' }
    $fixtureCases += @{ slug = ''; route = 'index.html'; image = 'images/home/orbit/editorial-network.webp'; alt = (Get-HeadMeta $homeMarkup)['og:image:alt'] }
    foreach ($case in $fixtureCases) {
        $relative = if ($case.route) { $case.route } else { 'posts/' + $case.slug + '/index.html' }
        $markup = [IO.File]::ReadAllText((Join-Path $fixtureOutput $relative))
        $meta = Get-HeadMeta $markup
        $expectedImage = if ($case.external) { $case.image } else { $fixtureBaseUrl + $case.image }
        if ($meta['og:image'] -cne $expectedImage -or $meta['twitter:image'] -cne $expectedImage) { $errors.Add("${relative}: cover/images precedence or subdirectory URL is incorrect.") }
        if ($meta['og:image:alt'] -cne $case.alt -or $meta['twitter:image:alt'] -cne $case.alt) { $errors.Add("${relative}: explicit image description must override the site fallback.") }
        if (-not $case.external) {
            if ($meta['og:image:width'] -ne '1600' -or $meta['og:image:height'] -ne '900') { $errors.Add("${relative}: subdirectory assets must retain actual dimensions.") }
            if (-not (Test-Path -LiteralPath (Join-Path $fixtureOutput $case.image) -PathType Leaf)) { $errors.Add("${relative}: configured local share image was not published.") }
        }
        elseif ($meta.ContainsKey('og:image:width') -or $meta.ContainsKey('og:image:height')) { $errors.Add('External image dimensions must not be invented from a local file.') }
        $expectedCanonical = $fixtureBaseUrl + ($relative -replace 'index\.html$', '')
        if ($meta['og:url'] -cne $expectedCanonical) { $errors.Add("${relative}: subdirectory canonical must retain the configured site origin and prefix.") }
        $icon = @([regex]::Matches($markup, '(?is)<link\b[^>]*>') | Where-Object { (Get-Attribute $_.Value 'rel') -eq 'icon' })[0]
        if ((Get-Attribute $icon.Value 'href') -ne '/blog/favicon.svg') { $errors.Add("${relative}: favicon must retain the preview origin and configured subdirectory.") }
    }
    if ($errors.Count) { throw ($errors -join [Environment]::NewLine) }
    Write-Host "Share metadata passed: $($routes.Count) routes, $($fixtureCases.Count) subdirectory/override fixtures, actual 1600x900 image, SVG favicon, $($negativeCases.Count) negative cases."
}
finally {
    if (Test-Path -LiteralPath $tempRoot) {
        $resolved = [IO.Path]::GetFullPath($tempRoot)
        if (-not $resolved.StartsWith($tempParent, [StringComparison]::OrdinalIgnoreCase) -or (Split-Path $resolved -Leaf) -notmatch '^ai-news-blog-share-metadata-[0-9a-f]{32}$') { throw "Refusing to remove unexpected test directory: $resolved" }
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
}
