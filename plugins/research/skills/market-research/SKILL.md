---
name: market-research
description: Sourced web research on a startup topic (competitors, pricing, market size, customer pain in public forums), with strength-tagged findings written to projects/<slug>/<topic>.html. Use when a startup knowledge gap can be filled from public sources. Not for technical or library questions (that is engineering:research).
---

# Market research

Fills a startup knowledge gap with real, sourced web research — strength-tagged
evidence, not speculation.

---

## Procedure

1. **Establish the topic.** Ask a clarifying question first if it's not already specific and scoped
   to a project.
2. **Read context.** `projects/<slug>/business-case.md`, if it exists —
   target user, problem, stage — to scope the search.
3. **Search.** A handful of targeted `WebSearch` queries scoped to the
   topic. `WebFetch` promising results to pull verbatim text (quotes, thread
   excerpts, pricing figures) rather than paraphrasing snippets.
4. **Tag every finding** strong / medium / weak (same semantics as
   `../office-hours/references/business-case-template.md` Section 7):
   - **Strong** — specific, dated, sourced; a named competitor with a
     documented, specific gap.
   - **Medium** — real but thin: a single mention, no corroboration.
   - **Weak** — vague, old, or unsourced-feeling even though a URL exists.
5. **Write/update `projects/<slug>/<topic-slug>.html`.** If
   `projects/assets/style.css` doesn't exist yet, copy it from
   `../shared/assets/style.css` (relative to this skill). Read the project
   copy first and build on it — extend it only when a genuinely new reusable
   pattern is needed, don't duplicate what's there.
6. **Update `business-case.md`.** Append or replace a short synthesized line
   in the relevant section, plus a pointer, e.g.: "See competitors.html
   (updated YYYY-MM-DD) for sourced findings."

## Topic-page requirements (non-negotiable)

Every `<topic-slug>.html` page must:
- Link the project's shared stylesheet rather than duplicating styles
  inline: `href="../assets/style.css"` (relative to
  `projects/<slug>/<topic-slug>.html`).
- Show, per finding: the finding/quote, a strength badge (strong/medium/weak
  — use `.badge.badge-strong` / `.badge-medium` / `.badge-weak`), a
  clickable source link, and the date found.
- Render verbatim quotes as pull-quotes/blockquotes with visible attribution
  (`<blockquote>` + `<cite>`) — not buried in a table.
- Be self-contained and openable directly in a browser, no build step.

Everything else — headings, grouping, how many findings, visual emphasis —
is a judgment call per topic. Different topics should look different.