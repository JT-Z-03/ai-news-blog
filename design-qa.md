# Orbit Site Design QA

## Comparison

- Source: `docs/design-references/orbit-reading-first-article-reference.png` (1487 × 1058 original; normalized evidence at `C:\Users\28717\.codex\visualizations\2026\08\22\01a027ba-1a2a-7cf3-a202-a16cf58874a0\orbit-site-qa\source-reference-normalized-1440x1024.png`).
- Implementation: `http://127.0.0.1:1313/posts/deepseek-v4-agent-platform/` with final unfocused evidence at `C:\Users\28717\.codex\visualizations\2026\08\22\01a027ba-1a2a-7cf3-a202-a16cf58874a0\orbit-site-qa\desktop-article-light-fix-round-1-final-baseline.png`.
- Viewport: `1440 × 1024`, light theme, DPR `1.0000000149` (effectively 1×). DOM measurement confirmed `innerWidth = 1440`, `innerHeight = 1024`, document client/scroll width `1425`, visual viewport `1424.8 × 1024` at scale 1, and no horizontal overflow. The default in-app Browser bitmap is 1425 × 1013 because it excludes the 15px vertical scrollbar and 11px browser-surface region; its top 1425 × 843 region was paired with the equally sized normalized source at `desktop-article-light-fix-round-1-final-baseline-top-1425x843.png` and `source-reference-normalized-top-1425x843.png`.
- Comparison method: the normalized source and matching final implementation were returned together in one full-view image output. Because this review specifically challenged title typography, both were also cropped from the same x/y/width/height to 900 × 330 and returned together as `source-reference-title-focus-900x330.png` and `desktop-article-title-focus-fix-round-1-900x330.png`. The focused comparison confirms the title span/scale and exact description phrase break without browser chrome or density noise.

## Required Fidelity Surfaces

- Fonts and typography: loaded-font checks returned `true` for Outfit 700 and Inter 400. The final title is Outfit 60px/700 with 68.4px line-height, -2.7px tracking, an independent 864px surface, and a two-line 136.8px measured height. Source title dark-pixel bounds are 815 × 133; final implementation bounds are 830 × 130, versus the reviewed baseline's undersized 774 × 121. The final 672px description breaks after `竞争单位`, exactly where the source breaks, while the Inter 17.6px body remains 800px wide.
- Spacing and layout rhythm: the header and body retain the 800px reading measure and the shared 1200px site shell, while only the display title is allowed to span 54rem from the same left edge at source-comparison desktop widths. Between the mobile and full-desktop surfaces, the title collapses to the header's 800px/available width so the wider display treatment cannot escape the page. The source header divider measures 808px and the implementation header measures 800px; the body begins at 588.375px. Progress, breadcrumb, eyebrow, two-line title, metadata, and body preserve the compact reading-first sequence, with no sidebar or header card.
- Colors and visual tokens: light mode uses the warm neutral background `rgb(251, 251, 249)` and Orbit lime `#d4ff3f`; dark captures retain readable neutral contrast and the same lime accent. Active navigation and keyboard focus use the lime token rather than an unrelated gray treatment.
- Image quality and asset fidelity: all three homepage editorial images loaded at natural dimensions (1200 × 854, 1200 × 854, and 1200 × 850). Article images correctly remained lazy above the fold, then loaded without broken sources after scrolling at 1280 × 2025, 1280 × 1720, and 1280 × 1000; evidence is `desktop-article-progress-and-images.png`.
- Copy and content: the reference title and description are unchanged, the body remains the authored DeepSeek analysis, and article metadata now renders as `2026 年 8 月 14 日 · 3 分钟 · 469 字 · 钟懿`. The breadcrumb is intentionally retained for orientation and was compacted so it does not displace the reference hierarchy. The source's illustrative 12% progress differs from the real top-of-page state, which correctly reports 0%.

## Findings

- P2 (fixed in fix round 1) — desktop article title and description geometry — the review baseline measured the source title at 815 × 133 dark pixels versus 774 × 121 in the implementation, and the implementation description wrapped later — the undersized display surface left materially more right-side whitespace — added a failing declaration contract, then gave the title an independent 54rem surface and 60px desktop cap while preserving the 800px body; the first 44rem description pass still stranded `从一` on line one, so a second failing contract narrowed only that measure to 42rem. Final evidence measures the title at 830 × 130 dark pixels and breaks the description at the same phrase as the source.
- P1 (fixed) — desktop article title and vertical hierarchy — iteration 0 wrapped the title to three lines and pushed opening copy below the reference fold — weakened the selected reading-first composition — first established the compact progress/breadcrumb/eyebrow rhythm and a stable two-line hierarchy, then fix round 1 independently increased the display surface and cap to match the measured source without changing the 800px body.
- P1 (fixed) — article metadata — iteration 0 exposed the theme's English date and reading labels — contradicted the Chinese source copy and locale — rendered the article date, reading time, word count, and author as the Chinese reference string while retaining the existing metadata partial for non-article pages.
- P2 (fixed) — shared desktop header shell — iteration 0 used the narrower legacy navigation width — broke alignment between the header and the reference's 1200px content shell — applied the Orbit shell width to `.header-nav`.
- P2 (fixed) — deep-analysis article navigation context — the article route did not underline `深度分析` — removed location feedback present in the source language — derived a category body class and applied the inset lime active underline.
- P2 (fixed) — article reading density — iteration 1 body copy measured smaller than the reference — reduced parity and line rhythm — increased the article body to 1.1rem while preserving the 800px reading measure.
- P2 (fixed) — deep-analysis list title wrapping — the first desktop list title left a single-character orphan — created an avoidable ragged wrap — reduced the list-title maximum from 2.15rem to 2.05rem; final evidence is `desktop-deep-analysis-light.png`.
- P2 (fixed) — populated-search keyboard focus — the first result initially inherited a thin gray outline — obscured the Orbit interaction language and weakened keyboard visibility — added a 3px lime `:focus-visible` outline with 3px offset; computed evidence is `rgb(212, 255, 63) solid 2.4px` at the Browser's rendered scale and the corrected capture is `desktop-search-results-deepseek.png`.
- P2 (fixed in fix round 2) — intermediate-width article-title containment — the 54rem title surface introduced for the 1440px source match extended beyond the page between the mobile and full-desktop layouts; at the first post-fix 929 boundary request (actual inner/client 930/914), restoring the 864px title placed its right edge at 921.2px, expanded root/body scroll width to 922/921px, and returned the H1 in the outside-elements check — horizontal page overflow makes the article harder to read and pan-free navigation unreliable — added a failing intermediate-width declaration contract, then limited only the article title to `min(100%, var(--orbit-reading-width))` from 761px through the scrollbar-safe 943px boundary. Final 900px evidence measures an 800px title from x42.4 to 842.4 inside an 885px client width; final 943/944 requests restore the 864px surface only when it fits exactly or with remaining space, with root/body scroll widths equal to client width and `outside = []`.
- Remaining P0/P1/P2 findings — none — final same-input comparison and the full state/interaction sweep found no blocking, high, or medium mismatch — no remaining user-impacting fidelity or interaction defect — no further change required.

### Comparison History

- Iteration 0: `desktop-article-light-iteration-0.png` versus `source-reference-normalized-top-1425x843.png`; blocked for the three-line title, low opening fold, English metadata, and narrow header shell.
- Iteration 1: `desktop-article-light-iteration-1.png`; the primary composition and metadata were corrected, but active deep-analysis navigation and body reading density remained P2.
- Iteration 2: `desktop-article-light-iteration-2.png`; a 59.2px title experiment regressed to three lines, so the comparison remained blocked and the experiment was reverted.
- Iteration 3: `desktop-article-light-iteration-3.png`; a 57.6px title experiment also regressed to three lines, so the comparison remained blocked and the experiment was reverted.
- Initial Task 7 handoff candidate: `desktop-article-light-final.png`; title was two lines at 56px and the earlier P1/P2 issues were fixed, but review reopened the comparison because the source title remained materially wider/larger and the description wrapped later.
- Fix round 1 baseline: `desktop-article-light-final.png` versus `source-reference-normalized-top-1425x843.png`; source title dark bounds measured x322–1136/y257–389 (815 × 133), while the implementation measured x311–1084/y265–385 (774 × 121). Source description dark bounds measured 684 × 58 versus 715 × 52 in the implementation. Result stayed blocked.
- Fix round 1 iteration A: `desktop-article-light-fix-round-1-root-top-1425x843.png`; the 54rem/60px title measured 829 × 130 dark pixels and closed the title P2, but the 44rem description still placed `从一` at the end of line one, unlike the source. Result stayed blocked and a second red/green contract narrowed the description.
- Fix round 1 final: `desktop-article-light-fix-round-1-final-baseline-top-1425x843.png` plus the 900 × 330 focused pair; title measures 830 × 130 dark pixels against source 815 × 133, both retain the selected two lines, and the 42rem description breaks after `竞争单位` exactly like the source. The 800px body, lime/neutral tokens, Chinese metadata, progress placement, and absence of sidebar/header card remain intact. No P0/P1/P2 mismatch remains.
- Fix round 2 iteration A: the first 761–928px containment rule made the exact `tablet-900-article-light-fix-round-2-exact.png` state clean, but boundary probing showed the wide title returned too early. At a requested 929px (actual inner/client 930/914), the title ended at 921.2px, the root/body scroll widths grew beyond the client, and the H1 appeared in the outside-elements result. QA remained blocked and the boundary contract was revised before CSS.
- Fix round 2 final: the isolated containment range now extends through 943px. The 900 × 1024 screenshot was reopened together with the selected source in one image-view output; the source remains the 1440px fidelity target, while the 900px implementation check visibly preserves its reading-first hierarchy without clipped title text. DOM evidence supplies the responsive judgment: at 900px the title/header share x42.4, width800, and right842.4 inside client width885; requested 943 restored 864px at x64/right928 exactly equal to client928 because of the Browser backend's fractional media-boundary evaluation; requested 944 measured right928.4 inside client929. Both returned root/body scroll width equal to client width and `outside = []`. The query does not alter the previously approved 1440px or <=760px geometry.

## Responsive and Interaction Checks

- Desktop light/dark: the affected 1440 × 1024 article was repeated after the final CSS in light mode (`desktop-article-light-fix-round-1-final-root.png`) and through a light → dark → light theme round trip. The final state measured document scroll width 1425 against inner width 1440, no clipped text, a lime 2.4px keyboard outline with 2.4px offset, no warning/error logs, and the same two-line title in both themes. Earlier unchanged deep-analysis list, search, 404, and homepage evidence remains at `desktop-deep-analysis-light.png`, `desktop-search-light.png`, `desktop-404-light.png`, and `desktop-home-dark.png`.
- Intermediate-width light: final exact evidence is `tablet-900-article-light-fix-round-2-exact.png` at 900 × 1024. CSS inner/client/visual widths were 900/885/884.8 at DPR `1.0000000149` and scale 1; the header and title both measured 800px wide from x42.4 to 842.4, the title rendered at 44.25px/50.445px, and root/body scroll widths stayed 885 with `outside = []`, `broken images = []`, empty warning/error logs, and visible lime keyboard focus. Boundary checks remained clean at requested 760, 761 (backend inner 762), and 928px. The first 929 request exposed the scrollbar-safe cutoff defect and was not accepted; after the second red/green cycle, requested 943 and 944 measured no overflow at the exact-fit and first-restored-wide states.
- Mobile light/dark: all six required 390 × 844 states and all four 320 × 844 overflow states were repeated after the final CSS. Each returned `outside = []`, `broken images = []`, `logs = []`, and a visible lime keyboard focus outline. Exact layout-origin clips persist at the requested pixel dimensions; the default visible-surface bitmap mapping is also recorded below so density/crop differences are explicit rather than inferred.

| Mobile state | CSS inner size | Client / visual viewport | DPR / scale | Exact PNG | Default visible-surface mapping |
|---|---:|---:|---:|---|---|
| 390 light homepage | 390 × 844 | 375 × 844 / 375.2 × 844 | 1.0000000149 / 1 | `mobile-390-home-light-fix-round-1-final.png` — 390 × 844 | 375 × 811 = client width at 1×; height excludes 33px app surface inset |
| 390 light article | 390 × 844 | 375 × 844 / 375.2 × 844 | 1.0000000149 / 1 | `mobile-390-article-light-fix-round-1-final.png` — 390 × 844 | 375 × 811; exact clip maps 1 CSS px to 1 PNG px from layout origin |
| 390 light daily list | 390 × 844 | 375 × 844 / 375.2 × 844 | 1.0000000149 / 1 | `mobile-390-daily-light-fix-round-1-final.png` — 390 × 844 | 375 × 811; 15px width difference is the vertical scrollbar region |
| 390 light search | 390 × 844 | 375 × 844 / 375.2 × 844 | 1.0000000149 / 1 | `mobile-390-search-light-fix-round-1-final.png` — 390 × 844 | 375 × 811; same layout-origin mapping |
| 390 dark article | 390 × 844 | 375 × 844 / 375.2 × 844 | 1.0000000149 / 1 | `mobile-390-article-dark-fix-round-1-final.png` — 390 × 844 | 375 × 811; same density and crop mapping |
| 390 dark daily list | 390 × 844 | 375 × 844 / 375.2 × 844 | 1.0000000149 / 1 | `mobile-390-daily-dark-fix-round-1-final.png` — 390 × 844 | 375 × 811; same density and crop mapping |
| 320 light homepage | 320 × 844 | 305 × 844 / 304.8 × 844 | 1.0000000149 / 1 | `width-320-home-light-fix-round-1-final.png` — 320 × 844 | 305 × 804; width excludes 15px scrollbar and height excludes 40px app surface inset |
| 320 light article | 320 × 844 | 305 × 844 / 304.8 × 844 | 1.0000000149 / 1 | `width-320-article-light-fix-round-1-final.png` — 320 × 844 | 305 × 804; exact clip maps 1 CSS px to 1 PNG px from layout origin |
| 320 light daily list | 320 × 844 | 305 × 844 / 304.8 × 844 | 1.0000000149 / 1 | `width-320-daily-light-fix-round-1-final.png` — 320 × 844 | 305 × 804; table descendants remain inside their intentional horizontal scroller while page scroll width stays 305 |
| 320 light search | 320 × 844 | 305 × 844 / 304.8 × 844 | 1.0000000149 / 1 | `width-320-search-light-fix-round-1-final.png` — 320 × 844 | 305 × 804; same density and crop mapping |

- Navigation, search, theme toggle, reading progress, pagination, 404 action: the earlier complete interaction sweep still verifies header destinations, article-row navigation, daily pagination, real-keyword search, and 404 return. The affected interactions were repeated after fix round 1: theme changed `rgb(251, 251, 249)` light → `rgb(17, 17, 16)` dark → light, and article progress changed from visible/ARIA 0% at the top to 23% at `scrollY = 2200`.
- Console errors and horizontal overflow: the final desktop article, final 900px intermediate state, all ten repeated mobile states, and the affected interactions returned no warning/error logs. At 900px, document/body scroll width stayed 885 against client width 885; at the final 943/944 boundary requests, root/body scroll width stayed 928/929 against client width 928/929 and `outside = []`. At 390px, document/body client and scroll width stayed 375 against `innerWidth = 390`; at 320px it stayed 305 against `innerWidth = 320`. No visible text escaped the page viewport after excluding descendants contained by the intentionally scrollable table wrapper.

## Final

Fix round 1 closes the reviewed typography P2 with measured source geometry, two red/green declaration cycles, a final full-view and focused same-input comparison, and fresh rendered desktop evidence. Fix round 2 closes the derived intermediate-width containment P2 with two additional red/green boundary cycles, an exact 900 × 1024 recapture, and DOM checks through the scrollbar-safe 943/944 transition. Every mobile state records CSS inner size, client/visual viewport, DPR/scale, exact PNG dimensions, and the default bitmap mapping. The source-match desktop geometry, mobile geometry, theme, progress, focus, overflow, image, and console checks pass, and no P0/P1/P2 finding remains.

## Sticky Reading Progress Follow-up — 2026-08-23

### Comparison

- Source visual truth: `C:\Users\28717\AppData\Local\Temp\codex-clipboard-d47a90fd-a55e-40b6-9c86-d4c43d2ec729.png` (1920 × 1020 browser capture, with the page occupying the lower 1920 × 911 pixels at an effective 1.25× capture scale).
- Implementation top state: `C:\Users\28717\.codex\visualizations\2026\08\23\sticky-reading-progress\article-progress-top-normalized-1536x729.png` (1521 × 722 visible page bitmap from a 1536 × 730 CSS viewport at DPR 1).
- Density normalization: the source page area was cropped at `0,109` and scaled from 1920 × 911 to 1521 × 722 in `source-progress-normalized-1521x722.png`, matching the implementation bitmap.
- Full-view comparison: `comparison-full-source-left-implementation-right.png`.
- Focused progress comparison: `comparison-progress-focus-source-left-implementation-right.png`; the focused view was required because the progress line and label are too small for reliable judgment in the full-page pair.
- Sticky desktop evidence: `article-progress-sticky-offset-1920x912.png` (1905 × 905 visible bitmap). At `scrollY = 1500`, the control measured `top = 12px`, `width = 880px`, remained visible, and reported `阅读进度 13%` with `aria-valuenow="13"`.
- Sticky mobile evidence: `article-progress-sticky-mobile-390x844.png` (375 × 811 visible bitmap). At `scrollY = 1300`, the control measured `top = 12px`, remained within the 375px client width, and reported `阅读进度 5%` with `aria-valuenow="5"`.

### Required Fidelity Surfaces

- Fonts and typography: unchanged; the progress label retains the approved size, weight, and single-line desktop treatment, while the existing compact mobile stack remains legible.
- Spacing and layout rhythm: the top-state comparison preserves the original progress position (`top = 126.4px`) and the surrounding article rhythm. The sticky state uses a 12px viewport offset so the bar and label do not touch the browser edge.
- Colors and visual tokens: the sticky surface uses the existing page background token and lime progress token, so scrolling does not introduce a new color or elevation system.
- Image quality and asset fidelity: no image assets were added or changed.
- Copy and content: article copy is unchanged; the visible and accessible percentage continue to update together.

### Findings

- P1 (fixed) — reading progress scrolled out of view — the source capture showed a useful progress control, but the previous static layout removed it as soon as the reader passed the article header — added viewport-sticky positioning so it remains visible throughout the article while the existing script continues updating the percentage.
- P2 (fixed in visual iteration 1) — first sticky pass touched the viewport edge — the initial `top = 0` capture made the line and label feel clipped against the browser boundary — changed the sticky offset to 12px and retained an opaque page-token backing surface; post-fix desktop and mobile captures show clear separation from the edge.
- Remaining P0/P1/P2 findings: none.

### Comparison History

- Red test: the generated site CSS did not provide sticky positioning and `validate-site-orbit.ps1` failed with `Built reading progress should stick to the viewport top after reaching it.`
- Green iteration 0: `article-progress-sticky-1920x912.png` proved persistent progress at `top = 0`, but visual review identified the edge-spacing P2.
- Red/green iteration 1: the contract was tightened to the 12px offset, failed against the first pass, then passed after the CSS change. Final evidence is `article-progress-sticky-offset-1920x912.png` and `article-progress-sticky-mobile-390x844.png`.
- Return-state check: after scrolling back to the top, `article-progress-restored-1920x912.png` measured `scrollY = 0`, `top = 126.4px`, and `阅读进度 0%`, confirming that the control returns to its original layout position.
- Browser console warnings/errors: none. Desktop and mobile document scroll widths equaled their client widths.

final result: passed

## Homepage Editorial Image Follow-up — 2026-08-23

### Comparison

- Source visual truth: `C:\Users\28717\.codex\generated_images\01a027ba-1a2a-7cf3-a202-a16cf58874a0\exec-135c6148-06b1-4b73-ad2f-3eeac71ee0cd.png` (1672 × 941).
- Browser-rendered implementation: `C:\Users\28717\.codex\visualizations\2026\08\23\ai-blog-editorial-images\homepage-feature.png` and `C:\Users\28717\.codex\visualizations\2026\08\23\ai-blog-editorial-images\homepage-small-cards.png` (1265 × 712 each).
- Viewport and density: 1280 × 720 CSS px, DPR 1; the in-app Browser bitmap excludes the 15px scrollbar and 8px browser-surface region. Source and implementation were compared for art direction and card crop rather than pixel-identical page layout because the source is a three-image concept board, not a webpage mock.
- Full-view evidence: the concept board and `homepage-feature.png` were opened together to compare the primary image's palette, print texture, focal aperture, and 16:9 crop.
- Focused evidence: the concept board and `homepage-small-cards.png` were opened together to compare the network and horizon images at their real 380:270 card crop.

### Required Fidelity Surfaces

- Fonts and typography: unchanged from the approved Orbit homepage; headline, metadata, label, and daily-brief hierarchy remain intact.
- Spacing and layout rhythm: the existing 16:9 lead slot and 380:270 analysis slots are unchanged. The generated focal points stay inside both crops and preserve the existing card rhythm.
- Colors and visual tokens: all three images consistently use aged ivory, vermilion, cobalt, warm yellow, and charcoal. The existing lime label remains as a deliberate site-level accent rather than being baked into the reusable artwork.
- Image quality and asset fidelity: all three WebP files render at 1600 × 900 natural size, load successfully, and retain visible paper fibers, halftone dots, torn edges, and screen-print registration at both desktop card sizes. No placeholder, CSS drawing, SVG substitute, logo, or watermark is present.
- Copy and content: article titles, descriptions, dates, author names, and links are unchanged. The fixed images now use empty alt text and `aria-hidden="true"`, correctly identifying them as decorative reusable artwork rather than literal article illustrations.

### Findings

- P3 — Orbit lime labels sit outside the selected print palette. This is acceptable because the label is interface chrome and preserves existing site recognition; a future site-wide palette pass could replace lime with the artwork's warm yellow, but that is outside this image-only change.
- Remaining P0/P1/P2 findings: none.

### Responsive and Interaction Checks

- Desktop: all three assets loaded completely at 1600 × 900 natural size; rendered sizes were 654 × 368 for the lead and 264 × 188 for each analysis card. Document scroll width remained below the 1280px viewport width, with no warning or error console logs.
- Mobile: a 390 × 844 pass confirmed that the centered network and horizon focal points survive the stacked card crop without clipping or horizontal page overflow.
- Primary navigation: the `阅读深度分析` link navigated successfully to the local deep-analysis category and the browser returned to the homepage.

### Comparison History

- Initial generated board: established the approved three-part system but was unsuitable as a single cropped sprite.
- Final asset pass: generated three independent 16:9 files from the approved system, then compressed them to 1600 × 900 WebP. The first browser comparison found no P0/P1/P2 crop, palette, loading, accessibility, or layout issue, so no corrective visual iteration was required.

final result: passed

## Monochrome UI Follow-up — 2026-08-23

### Comparison

- Source visual truth: the approved Orbit layout before this color revision, captured at `C:\Users\28717\.codex\visualizations\2026\08\23\ai-blog-editorial-images\homepage-feature.png` (1265 × 712) and `C:\Users\28717\.codex\visualizations\2026\08\23\sticky-reading-progress\article-progress-top-normalized-1536x729.png` (1521 × 722), together with the user's explicit direction to replace fluorescent-green interface chrome with ordinary white surfaces and black details while preserving the colorful editorial images.
- Browser-rendered implementation: `C:\Users\28717\.codex\visualizations\2026\08\23\ai-blog-monochrome-ui\home-desktop-cards.png` (1265 × 712) and `C:\Users\28717\.codex\visualizations\2026\08\23\ai-blog-monochrome-ui\article-top-1536x729.png` (1521 × 722).
- Viewport and density: homepage comparison used a 1280 × 720 CSS viewport; article comparison used a 1536 × 729 CSS viewport. Both used DPR 1, and the in-app Browser bitmaps exclude the scrollbar/browser-surface region in the same way for each matched pair.
- State: light theme, unchanged content and scroll position for each source/implementation pair. The homepage source and implementation were opened together at equal pixel dimensions; the article source and implementation were also opened together at equal pixel dimensions.
- Full-view comparison evidence: the matched pairs show that page geometry, typography, card imagery, copy, and reading-progress placement are unchanged while the green eyebrow marks, image labels, active-navigation underline, and article eyebrow are converted to black/white.
- Focused-region comparison: a separate crop was not needed because the affected marks and pills remain clearly readable at native 1× size in both equal-dimension full-view pairs. Computed-style checks additionally measured `rgb(255, 255, 255)` surfaces and `rgb(18, 18, 18)` borders/text on homepage buttons and labels.

### Required Fidelity Surfaces

- Fonts and typography: unchanged; Outfit display hierarchy and Inter reading/UI hierarchy preserve the approved weights, line breaks, and measurements on the homepage and article page.
- Spacing and layout rhythm: unchanged; the hero, cards, article header, body measure, and sticky progress bar remain in their approved positions. Desktop and 390 × 844 mobile checks returned zero horizontal overflow.
- Colors and visual tokens: light mode now uses white page/surface backgrounds with `#121212` as the neutral accent; dark mode uses off-white `#f5f5f4` for the corresponding accent. Buttons, image labels, and read-more pills use outlined monochrome surfaces. Active navigation, progress, eyebrow marks, link underlines, and focus rings now inherit the same neutral accent. No `#d4ff3f` or `rgba(212, 255, 63, …)` remains in the shipped Orbit styles.
- Image quality and asset fidelity: the three editorial WebP files are unchanged and all loaded at 1600 × 900 natural size. Their vermilion, cobalt, yellow, charcoal, and ivory print palette remains the only non-neutral color system on the homepage.
- Copy and content: unchanged across the homepage, article, daily list, and search surface.

### Findings

- P2 (fixed) — fluorescent-green interface chrome conflicted with the newly approved editorial image palette — green labels, dots, underlines, progress, and focus cues competed with the artwork rather than framing it — replaced the site accent with adaptive black/off-white tokens and changed filled green pills to white/black outlined pills without changing layout or content.
- Remaining P0/P1/P2 findings: none. The equal-size visual comparisons and rendered state checks found no color residue, lost contrast, layout shift, or responsive regression.

### Responsive and Interaction Checks

- Desktop homepage: `home-desktop-top.png` and `home-desktop-cards.png` confirm white page/surfaces, black button/label borders, all three 1600 × 900 images loaded, and zero horizontal overflow.
- Desktop article: `article-top-1536x729.png` matches the prior geometry at the same pixel dimensions. `article-desktop-sticky.png` confirms the black reading-progress bar remains sticky at `top = 12px` and updates to `阅读进度 46%` while scrolling.
- Mobile homepage: `home-mobile-390.png` confirms the three hero buttons remain equal-width white/black controls and the page has no horizontal overflow.
- Dark mode: the homepage theme round-trip measured an `rgb(25, 25, 24)` button surface with off-white text/border and an off-white eyebrow mark; no overflow was introduced.
- Search and daily list: keyboard focus, the daily active-navigation underline, and the daily eyebrow mark all computed to `rgb(18, 18, 18)` in light mode. Search, daily, article, homepage, and dark-mode checks returned no browser warning or error logs.

### Comparison History

- Red contract: both Orbit validators failed against the previous CSS because the fluorescent-green token still shipped and the required neutral light/dark accent tokens and outlined controls were missing.
- Green implementation: the minimal token and component changes made both validators pass. The first equal-size browser comparison found no P0/P1/P2 layout, typography, imagery, copy, contrast, or interaction regression, so no corrective visual iteration was required.

final result: passed

## Homepage Weekly Copy Follow-up — 2026-08-23

### Comparison

- Source visual truth: `C:\Users\28717\.codex\visualizations\2026\08\23\homepage-weekly-copy\source-feature-dark.png` and `C:\Users\28717\.codex\visualizations\2026\08\23\homepage-weekly-copy\source-hub-dark.png` (both 748 × 684), together with the user's request to describe the featured analysis as weekly rather than daily.
- Browser-rendered implementation: `C:\Users\28717\.codex\visualizations\2026\08\23\homepage-weekly-copy\implementation-feature-dark.png` and `C:\Users\28717\.codex\visualizations\2026\08\23\homepage-weekly-copy\implementation-hub-dark.png` (both 748 × 684).
- Viewport and density: matched 763 × 698 CSS viewports at DPR 1 in dark mode; the in-app Browser excludes its scrollbar and surface area from each saved bitmap consistently.
- Full-view same-input comparison: the matched pairs preserve layout, typography, imagery, spacing, colors, and scroll state. A separate crop was unnecessary because all changed copy is legible in the matched views.

### Required Fidelity Surfaces

- Fonts and typography: unchanged; the new weekly heading fits on the same line at the checked viewport.
- Spacing and layout rhythm: unchanged; rendered document overflow remained 0px.
- Colors and visual tokens: unchanged.
- Image quality and asset fidelity: unchanged.
- Copy and content: `TODAY'S SIGNAL` is now `WEEKLY SIGNAL`, `今天最值得关注的变化` is now `本周最值得关注的变化`, and `当天` was removed from the tracking description. Article content and links are unchanged.

### Findings

- P2 (fixed) — daily wording implied a deep-analysis publishing cadence the site does not follow — aligned the featured section with the intended weekly cadence and removed the unnecessary day-specific qualifier from the tracking copy.
- Remaining P0/P1/P2 findings: none.

### Verification and Comparison History

- The first post-change matched comparison passed without a corrective visual iteration.
- Browser DOM checks returned the exact requested copy, zero horizontal overflow, and no warning or error logs.

final result: passed
