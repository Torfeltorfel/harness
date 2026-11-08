---
name: research
description: Technical research with sources. Use when a decision depends on facts outside the codebase, such as comparing libraries or approaches, checking how an API or tool currently behaves, versions, limits, pricing or known issues. Not for startup or market research (that is research:market-research).
argument-hint: "<question>"
---

# Research

Answer a technical question with current, sourced facts instead of memory.

## Procedure

1. **Pin the question.** Restate it as one concrete question plus the decision it
   feeds. If it is too vague to search for, ask one clarifying question.
2. **Read local context first.** Check the codebase for what is already in use:
   dependency files and versions, existing patterns, related ADRs or docs. The
   answer must fit this project, not a generic one.
3. **Search.** Run several targeted searches in parallel. Prefer primary sources:
   official docs, changelogs, release notes, source code, issue trackers. Fetch
   pages and read them rather than trusting snippets. For a library, check the
   version the project actually uses.
4. **Verify when cheap.** If a claim can be checked locally in a minute (run the
   CLI, read the installed package source, a tiny script in the scratchpad), do it.
5. **Answer.**
   - Lead with the answer and a recommendation.
   - Then the supporting facts, each with a link and, where it matters, the
     version or date it applies to.
   - Mark what is confirmed (primary source or verified locally) versus inferred
     (blog post, single forum answer, your own reasoning).
   - Name what would change the recommendation.

Keep it in chat by default. If the user asks to keep it, or the finding will
matter again, write it to `docs/research/<topic-slug>.md` with the date at the top.
