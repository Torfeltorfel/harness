---
name: guardrails
description: "Pick and set up the CI and guardrails this project needs right now, from the harness's tooling list."
disable-model-invocation: true
---

# Guardrails

[`guardrailsList.md`](guardrailsList.md) lists every CI practice and tool worth considering. Your job is to be the skeptic: each one costs setup, maintenance and speed, so only what pays off at the project's *current* stage goes in.

1. **Read the project.** What stage is it at (spike, early build, live with users), who works on it, what it already has (CI, hooks, lint, tests, deploys), and where it actually breaks today.
2. **Judge every entry in `guardrailsList.md`** against that: **now**, **later** (name the trigger, e.g. "once there is a second contributor"), or **skip** (say why). A new project usually needs only a few things now.
3. **Present the verdicts** as one short table, with a single-line reason each. The user picks.
4. **Set up the picks** using each tool's current docs, not memory. Run each check once: fix what's trivial, ask about the rest.

Done when every pick runs green on the current code. Report what was added, and the **later** list with its triggers.
