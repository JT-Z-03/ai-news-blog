# Unified Orbit Site Design

**Date:** 2026-08-22

**Status:** Approved visual direction; awaiting written-spec review

**Selected visual target:** [Reading-first article reference](../../design-references/orbit-reading-first-article-reference.png)

## Goal

Turn AI 热点追踪 into one coherent editorial website. The approved Orbit homepage remains the visual foundation, and every non-home page adopts the same typography, lime accent, spacing, surfaces, interaction states, light/dark themes, and responsive behavior without changing existing content or URLs.

## User Outcome

Readers should be able to move from a daily signal or deep-analysis card into a calm, focused reading experience without feeling that they have entered a different website. Lists should support fast scanning; article pages should prioritize sustained reading; search and utility pages should remain simple and predictable.

## Design Direction

The selected direction is **reading first**.

- Light mode uses a warm near-white page, black ink, muted gray text, thin neutral dividers, and a restrained `#d4ff3f` lime accent.
- Dark mode uses near-black neutral surfaces, off-white ink, muted gray text, and the same lime accent.
- Outfit is the display face and Inter is the interface/body face, with system fallbacks.
- Long-form article text stays within a `780–820px` reading column and a comfortable line length.
- Spacing, alignment, typography, and dividers create hierarchy before tinted surfaces, borders, or shadows.
- Pills are reserved for compact controls and taxonomy links. Normal content lists use rows and dividers rather than independent floating cards.
- The homepage composition and content hierarchy remain unchanged except for shared global-shell adjustments required for site consistency.

## Architecture

Use Hugo project-level overrides and extended CSS. Do not edit files inside `themes/hugo-PaperMod`; keeping the theme untouched preserves upgradeability.

1. Keep PaperMod's content pipeline, metadata partials, search index, pagination, taxonomy data, and theme-toggle behavior.
2. Override only the page templates whose information hierarchy must change: article/static single pages, lists/terms, search, archives when present, and 404.
3. Reuse the existing PaperMod header and footer markup where possible, styling their current semantic structure instead of duplicating behavior.
4. Add one shared Orbit site stylesheet for global tokens and non-home page primitives. Retire obsolete teal and pre-Orbit homepage rules after confirming that no live template consumes them.
5. Add a small progressively enhanced reading-progress script for regular article pages only. The page remains usable if JavaScript is unavailable.

## Page-Type Mapping

### Global Shell

- Preserve the existing text logo, moon theme toggle, five navigation destinations, and current URLs.
- Use the same `1200px` maximum shell width as the homepage, a thin bottom divider, and a quiet translucent surface without gradients.
- Active, hover, and keyboard-focus states use lime plus a dark/light contrast outline; hover alone is never the only indicator.
- The footer becomes a restrained divider-led row with copyright, existing attribution, and utility links already supplied by PaperMod.

### Homepage

- Preserve the approved Orbit hero, featured-intelligence panel, unified analysis cards, and daily-news stream.
- Share global design tokens with the rest of the site so header height, navigation states, typography, and dark-mode surfaces are identical everywhere.

### Regular Article

- Render a slim reading-progress line above the article header and update it as the reader scrolls.
- Use a small lime marker plus the first category, followed by the title, description, and compact metadata.
- Remove the large enclosing header card and sidebar. The title block and body sit on the base page surface.
- Keep the reading column between `780px` and `820px`; headings, paragraphs, links, quotations, tables, code blocks, images, tags, and previous/next navigation inherit Orbit tokens.
- Preserve breadcrumbs semantically but shorten their visual weight. Preserve table of contents when content explicitly enables it, presenting it inline rather than as a permanent sidebar.

### Static Content Page

- About and future static pages use the same reading column and heading system without article progress, category marker, or article-specific previous/next navigation.

### Category, Tag, Section, and Paginated Lists

- Use an editorial page heading with breadcrumb, title, optional description, and item count.
- Render articles as one grouped list with lightweight row separators. Each row shows category/date context, title, short summary, and metadata.
- Deep-analysis and daily-report routes share the same component; content taxonomy, not bespoke markup, supplies the label.
- Preserve existing pagination URLs and controls, restyling them as quiet pill actions.
- If a list has no entries, render a concise empty state in the same surface rather than a blank page.

### Search

- Preserve the required `searchInput` and `searchResults` hooks and PaperMod's current client-side search behavior.
- Use an Orbit page heading, one prominent rounded search field, keyboard-visible focus treatment, and divider-led results.
- Preserve loading/disabled behavior. Show concise initial, empty, and no-match states without introducing filters or new search features.

### Archives

- Style archive output when an archive page exists, using year/month hierarchy and divider-led entries.
- Do not add a new archive route or navigation item as part of this redesign.

### 404

- Replace the bare numeric page with an Orbit error page containing `404`, a short Chinese explanation, and one working action back to the homepage.

## Responsive Behavior

- Desktop target: `1440 × 1024`, matching the selected visual reference.
- Tablet: retain the reading column and reduce outer margins; navigation may wrap only when necessary.
- Mobile target: `390 × 844`. Stack header navigation cleanly, keep touch targets at least `44px`, reduce title scale without clipping, make tables horizontally scrollable, and keep all content inside the viewport.
- Avoid layout shift when switching themes or loading fonts.

## Interactions and Data Flow

- Navigation, article links, taxonomy links, pagination, previous/next links, tags, theme toggle, and search remain real Hugo/PaperMod interactions.
- Reading progress derives from the regular article's scrollable distance and updates `aria-valuenow`; it is hidden when the page cannot scroll.
- No API, CMS, database, authentication, or persistence changes are introduced.
- The redesign consumes existing Hugo page data and front matter. Missing descriptions or categories degrade gracefully without placeholder copy.

## Accessibility

- Preserve semantic `header`, `nav`, `main`, `article`, `footer`, heading order, link destinations, and search labels.
- Meet WCAG AA contrast for body text, controls, and focus indicators in both themes.
- Provide visible `:focus-visible` states, respect `prefers-reduced-motion`, and never encode meaning with lime alone.
- Maintain readable zoom behavior and prevent horizontal page overflow at `320px` and above.

## Error and Empty States

- Empty taxonomy/list: explanatory line plus a homepage link.
- Search before input: instructional text; no matches: explicit no-result message; unavailable script: input remains understandable and the page does not break visually.
- Missing optional metadata: omit the missing item and retain valid separators.
- 404: direct path back to the homepage.

## Verification

1. Extend the Hugo output validator before each implementation slice and observe the new assertion fail against the current site.
2. Verify representative outputs for homepage, regular article, static page, deep-analysis list, daily list, search, taxonomy, paginated list, and 404.
3. Run existing content and security validators plus a clean minified Hugo production build.
4. Compare the implemented regular article against the selected reference at the same desktop viewport in light mode, then repeat visual checks for dark mode and `390 × 844` mobile.
5. Exercise navigation, theme toggle, article links, pagination, search input/results, tags, previous/next links, and the 404 return action.
6. Record the visual comparison and final status in `design-qa.md`; handoff requires `final result: passed` with no unresolved P0/P1/P2 findings.

## Non-Goals

- No content rewriting, new content categories, archive route, navigation destination, CMS, analytics, comments, authentication, or deployment changes.
- No edits inside the PaperMod theme directory.
- No replacement of the approved homepage content hierarchy.
- No new raster assets are required for the reading-first article design; existing editorial imagery remains where content already supplies it.

## Acceptance Criteria

- Every current user-facing route visibly belongs to the Orbit design system in light and dark themes.
- The selected reading-first article hierarchy is faithfully reproduced on regular posts.
- Existing content, routes, search, pagination, taxonomy, metadata, and theme behavior continue to work.
- Desktop and mobile layouts have no clipped content or horizontal page overflow.
- Automated validation and the minified production build pass.
- `design-qa.md` reports `final result: passed`.
