---
name: grill-with-docs
description: Interview the user relentlessly about a plan or feature, one question at a time, until there is a shared understanding, then write the outcome to a doc in the repo. Use when the user wants to be grilled on a plan, or before building something non-trivial.
disable-model-invocation: true
argument-hint: "<plan, feature or doc path>"
---

# Grill with docs

Goal: no open decisions left in the plan, and a doc that records them.

## 1. Load context

Read what the argument points to (a plan, an issue, a doc). Skim the relevant
code, CLAUDE.md and existing docs (`docs/`, ADRs, README) so you only ask what
the repo cannot answer.

## 2. Grill

Walk the decision tree of the plan branch by branch, resolving dependencies
between decisions before moving on.

- **One question per message.** Never a list of questions.
- **Bring a recommendation** with every question: "I'd do X because Y. Agree?"
- **Look it up instead of asking** when the codebase or docs can answer it; say
  what you found.
- **Push on vague answers.** "It should be fast" → how fast, measured where.
  "Users want this" → which users, how do we know.
- Cover, where relevant: the actual goal and non-goals, users and the flow,
  data model and state, edge cases and failure modes, interfaces to existing
  code, migration and rollout, how it is tested, what is explicitly out of scope.
- Keep a running list of decisions. Every few questions, show it in 3-5 lines
  so the user can correct drift.

Stop when the user says so or when the remaining open points are minor. Say
which ones you are leaving open.

## 3. Write the doc

Propose a path and a format, then write it after the user agrees:

- Feature or plan → `docs/plans/<slug>.md`
- A single significant decision → `docs/adr/NNNN-<slug>.md` (next free number)
- Follow an existing docs convention in the repo instead, if there is one.

Plan doc shape:

```markdown
# <Title>
Status: draft · <date>

## Goal
## Non-goals
## Decisions
<each decision, with the reason and the rejected alternative>
## Design
<flow, data, interfaces; only as much as the decisions need>
## Open questions
## Next steps
```

Write the decisions as made, in plain words, not as a transcript of the
interview.
