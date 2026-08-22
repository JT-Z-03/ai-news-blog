# Orbit Site Design QA

## Comparison

- Source: `docs/design-references/orbit-reading-first-article-reference.png` (1487 × 1058 original; normalized evidence at `C:\Users\28717\.codex\visualizations\2026\08\22\01a027ba-1a2a-7cf3-a202-a16cf58874a0\orbit-site-qa\source-reference-normalized-1440x1024.png`).
- Implementation: `http://127.0.0.1:1313/posts/deepseek-v4-agent-platform/` with final evidence at `C:\Users\28717\.codex\visualizations\2026\08\22\01a027ba-1a2a-7cf3-a202-a16cf58874a0\orbit-site-qa\desktop-article-light-final.png`.
- Viewport: `1440 × 1024`, light theme. DOM measurement confirmed `innerWidth = 1440`, `innerHeight = 1024`, and no horizontal overflow. The in-app Browser's persisted visible-surface bitmap is 1425 × 843, so the source was also normalized and cropped to 1425 × 843 at `source-reference-normalized-top-1425x843.png` for the final same-input comparison.
- Comparison method: the normalized source and matching implementation capture were returned together in one image-view output before each visual judgment. A further focused crop was unnecessary because the shared 1425 × 843 top-region input kept the navigation, progress, title typography, metadata, reading width, and opening body copy legible.

## Required Fidelity Surfaces

- Fonts and typography: loaded-font checks returned `true` for Outfit 700 and Inter 400. The final title is Outfit 56px/700 with 63.84px line-height, -2.52px tracking, an 800px measured width, and a two-line 127.68px measured height. The reading body is Inter 17.6px with 32.56px line-height and an 800px measured width.
- Spacing and layout rhythm: the header and content use the shared 1200px shell; the progress row, breadcrumb, eyebrow, two-line title, metadata, and body follow the reference's compact reading-first sequence. The body begins at 579.25px in the exact desktop state. No sidebar or header card is rendered.
- Colors and visual tokens: light mode uses the warm neutral background `rgb(251, 251, 249)` and Orbit lime `#d4ff3f`; dark captures retain readable neutral contrast and the same lime accent. Active navigation and keyboard focus use the lime token rather than an unrelated gray treatment.
- Image quality and asset fidelity: all three homepage editorial images loaded at natural dimensions (1200 × 854, 1200 × 854, and 1200 × 850). Article images correctly remained lazy above the fold, then loaded without broken sources after scrolling at 1280 × 2025, 1280 × 1720, and 1280 × 1000; evidence is `desktop-article-progress-and-images.png`.
- Copy and content: the reference title and description are unchanged, the body remains the authored DeepSeek analysis, and article metadata now renders as `2026 年 8 月 14 日 · 3 分钟 · 469 字 · 钟懿`. The breadcrumb is intentionally retained for orientation and was compacted so it does not displace the reference hierarchy. The source's illustrative 12% progress differs from the real top-of-page state, which correctly reports 0%.

## Findings

- P1 (fixed) — desktop article title and vertical hierarchy — iteration 0 wrapped the title to three lines and pushed opening copy below the reference fold — weakened the selected reading-first composition — tightened the progress/breadcrumb/eyebrow rhythm and set the article title to a 56px maximum, 700 weight, 1.14 line-height, and -0.045em tracking; the final DOM measures exactly two lines.
- P1 (fixed) — article metadata — iteration 0 exposed the theme's English date and reading labels — contradicted the Chinese source copy and locale — rendered the article date, reading time, word count, and author as the Chinese reference string while retaining the existing metadata partial for non-article pages.
- P2 (fixed) — shared desktop header shell — iteration 0 used the narrower legacy navigation width — broke alignment between the header and the reference's 1200px content shell — applied the Orbit shell width to `.header-nav`.
- P2 (fixed) — deep-analysis article navigation context — the article route did not underline `深度分析` — removed location feedback present in the source language — derived a category body class and applied the inset lime active underline.
- P2 (fixed) — article reading density — iteration 1 body copy measured smaller than the reference — reduced parity and line rhythm — increased the article body to 1.1rem while preserving the 800px reading measure.
- P2 (fixed) — deep-analysis list title wrapping — the first desktop list title left a single-character orphan — created an avoidable ragged wrap — reduced the list-title maximum from 2.15rem to 2.05rem; final evidence is `desktop-deep-analysis-light.png`.
- P2 (fixed) — populated-search keyboard focus — the first result initially inherited a thin gray outline — obscured the Orbit interaction language and weakened keyboard visibility — added a 3px lime `:focus-visible` outline with 3px offset; computed evidence is `rgb(212, 255, 63) solid 2.4px` at the Browser's rendered scale and the corrected capture is `desktop-search-results-deepseek.png`.
- Remaining P0/P1/P2 findings — none — final same-input comparison and the full state/interaction sweep found no blocking, high, or medium mismatch — no remaining user-impacting fidelity or interaction defect — no further change required.

### Comparison History

- Iteration 0: `desktop-article-light-iteration-0.png` versus `source-reference-normalized-top-1425x843.png`; blocked for the three-line title, low opening fold, English metadata, and narrow header shell.
- Iteration 1: `desktop-article-light-iteration-1.png`; the primary composition and metadata were corrected, but active deep-analysis navigation and body reading density remained P2.
- Iteration 2: `desktop-article-light-iteration-2.png`; a 59.2px title experiment regressed to three lines, so the comparison remained blocked and the experiment was reverted.
- Iteration 3: `desktop-article-light-iteration-3.png`; a 57.6px title experiment also regressed to three lines, so the comparison remained blocked and the experiment was reverted.
- Final: `desktop-article-light-final.png`; title is two lines at 56px, the body measure is 800px, the opening copy enters the captured fold, active navigation and Chinese metadata are present, and the lime/neutral hierarchy matches the selected source. Passed after the later list-orphan and search-focus P2 checks were also fixed and recaptured.

## Responsive and Interaction Checks

- Desktop light/dark: checked 1440 × 1024 light article, deep-analysis list, search, and 404 (`desktop-article-light-focus.png`, `desktop-deep-analysis-light.png`, `desktop-search-light.png`, `desktop-404-light.png`), plus dark article and homepage (`desktop-article-dark.png`, `desktop-home-dark.png`). Every state returned no clipped visible text, `scrollWidth <= innerWidth`, a visible lime keyboard focus treatment, and loaded visible editorial images where applicable.
- Mobile light/dark: checked 390 × 844 light homepage, article, daily list, and search (`mobile-home-light.png`, `mobile-article-light.png`, `mobile-daily-light.png`, `mobile-search-light.png`), plus dark article and daily list (`mobile-article-dark.png`, `mobile-daily-dark.png`). Every state returned an empty visible-text-outside array, no horizontal overflow, visible keyboard focus, and loaded visible images where applicable.
- Navigation, search, theme toggle, reading progress, pagination, 404 action: header clicks opened 首页, 深度分析, 日报, 搜索, and 关于 and each destination heading was confirmed. The theme toggle changed `rgb(251, 251, 249)` light to `rgb(17, 17, 16)` dark and back. The first article row opened `/posts/deepseek-v4-agent-platform/`. Daily pagination opened `/page/2/`, changed the first item, and returned to page 1. Search accepted `DeepSeek`, rendered 29 article links, exposed the full first title as its accessible name, and opened that article. Article progress changed from 0% at the top to 34%, 56%, and 83% while scrolling. The `/missing-orbit-qa/` return action navigated to `/`.
- Console errors and horizontal overflow: the in-app Browser returned no warning or error console entries after the full sweep. The additional 320 × 844 light checks for homepage, article, daily list, and search (`width-320-home-light.png`, `width-320-article-light.png`, `width-320-daily-light.png`, `width-320-search-light.png`) measured root/body `scrollWidth = 305` against `innerWidth = 320`, no visible text outside the viewport, and visible keyboard focus.

## Final

All previously recorded P0/P1/P2 findings have a concrete implementation fix, validator coverage, a fresh rendered check, and persistent screenshot evidence. The exact desktop/mobile light/dark routes, 320px overflow states, primary interactions, focus treatment, console, image loading, and progress behavior pass.

final result: passed
