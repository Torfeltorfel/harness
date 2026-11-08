---
name: retro
description: Retrospective on the current session. Finds friction, corrections and repeated work, and turns them into concrete changes to the harness (CLAUDE.md, skills, hooks, settings, memory). Use at the end of a session or after something went wrong.
disable-model-invocation: true
argument-hint: "[focus, e.g. 'the failed deploy']"
---

# Retro

The harness gets better one session at a time. A retro looks back at what just
happened and proposes the smallest change that would have made it go better.

If an argument is given, focus the retro on that part of the session.

## 1. Collect evidence

Go through the conversation and list, with short quotes or tool results:

- **Corrections**: every time the user said no, redirected, or redid something.
- **Friction**: failed commands, wrong assumptions, files read twice, permission
  prompts that kept coming back, questions the code could have answered.
- **Repetition**: a sequence of steps done by hand that will clearly happen again.
- **What worked**: approaches the user confirmed or praised. Worth keeping too.

Only use what is in the session. Do not invent problems to fill the list.

## 2. Diagnose

For each item, one line: what was missing that caused it. Typical causes:
missing project fact, missing convention, a workflow that should be a skill, a
check that should be a hook, a permission that should be allowlisted, or a
plain one-off mistake (no change needed).

## 3. Propose changes

Pick the right home for each fix, smallest first:

| Fix | Home |
|---|---|
| Project fact or convention | project `CLAUDE.md` |
| Personal preference across projects | memory or `~/.claude/CLAUDE.md` |
| Repeatable workflow, reusable across projects | skill in the `torben` marketplace (this repo) |
| Workflow only for this project | `.claude/skills/` in the project |
| Must happen every time, deterministically | hook in settings |
| Recurring permission prompt | `permissions.allow` in settings |

Present the proposals as a numbered list: the change, where it goes, and the
session evidence behind it. Show the exact text for CLAUDE.md lines and skill
edits. Skip anything that would only have helped this one session.

## 4. Apply

Ask which proposals to apply, then apply exactly those. Keep CLAUDE.md
additions short; edit an existing line instead of adding a near-duplicate.
If a change goes into the `torben` marketplace, bump that plugin's version and
mention that it needs a commit and push to reach other projects.
