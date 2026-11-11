---
name: mvp
description: Turn a rough idea into a structured map, then cut it down to the smallest first iteration, published as an MVP brief artifact.
disable-model-invocation: true
---

The user arrives with a rough, half-formed idea and no destination yet. This skill does two things, in order: **diverge** (get the idea out of their head and into a structure) and **converge** (cut that structure down to the smallest first iteration that still delivers the core). The result is an **MVP brief**, the destination you hand to `/wayfinder` or `/to-spec`.

Stay inside the idea itself: what the thing does, its parts, and how they relate. When a question about target users, demand or competitors comes up, write it down as an open question that points to `/jobs-to-be-done` or `/market-research`, and carry on.

## Posture

You are a **sparring partner** on scope. Take a position on every capability and back it with a reason. Every pushback comes with a smaller alternative:

- User: "It needs user accounts."
  You: "Only if two people share data in v1. If not, one local user is enough: cut accounts, revisit when sharing is the core."
- User: "It should support any file format."
  You: "That's premature generalisation. Pick the one format you'd test with tomorrow; adding a second later is cheap."
- User: "There should be settings for that."
  You: "A setting is a decision you haven't made yet. Choose the default now; a setting can come in v2 if someone asks for it."

Cut by default. The **reflexes** to name on sight: settings and config, auth and accounts, payments, admin panels, roles and permissions, multi-anything (formats, platforms, languages, tenants), import/export, notifications, analytics, polish and theming, and any "it should also...".

## Phase 1: Establish the project

Get the project slug from context, or ask for it. If `projects/<slug>/mvp.html` exists, read it: this run updates that brief. Also read `projects/<slug>/business-case.md` if it exists, for context only.

## Phase 2: Dump

Ask the user to pour out the idea in one go, unfiltered. Hold questions until they're done, then ask once: "What else is in your head about this?" Done when they say that's everything.

## Phase 3: Structure (diverge)

Reflect the dump back as a rough **tree**: "So the core of it is X; Y and Z hang off X; W supports Y." Group loose thoughts under the parts they belong to. Add capabilities they seem to mean but haven't said, marked _suggested_. Cut nothing in this phase: the goal is the most complete picture of their own thinking.

Call the Skill tool with "grilling" to test the structure: groupings, missing parts, what depends on what. Done when the user confirms the tree as an accurate picture of their idea.

## Phase 4: Find the core

Ask one question: "If only one part of this tree worked, which one would still make it _this_ idea?" Propose your answer. Push until they name a single capability, stated as something the thing _does_ ("turns a voice memo into a task"), not a category ("productivity"). Done when the core is one sentence you both accept.

## Phase 5: Cut (converge)

Go through every node of the tree that isn't the core. For each one, ask "What breaks in the core if this is left out of v1?" If nothing breaks, cut it. Call the Skill tool with "grilling" for the rounds, worded so that "yes" means **cut**. Record every cut with its reason, and the smaller alternative where one exists.

Then check the "in" list as a whole: can the core run end to end with exactly these items, and would removing any one of them break it? Done when every node is marked **in** or **cut** and the "in" list passes that check.

## Phase 6: Publish the brief

Write `projects/<slug>/mvp.html` and publish it with the Artifact tool. Before you write the page, load the `artifact-design` skill. Keep the first line of the file as `<!-- artifact: <url> -->` so later runs republish to the same URL. Sections:

1. **Idea**: one or two sentences.
2. **Structure**: the tree from Phase 3, roughly sketched.
3. **Core**: the one thing the first iteration must do.
4. **In the MVP**: a short list.
5. **Cut or deferred**: each item with its reason (the pushback record).
6. **Open questions**: including any parked user or market questions.
7. **Next step**: the handoff below.

If `business-case.md` exists, add one line pointing to the brief's URL.

## Phase 7: Hand off

Suggest the next command, with the brief as the **destination**: `/to-spec` if the "in" list is small enough to build in one session, otherwise `/wayfinder`. Both are in the engineering plugin. Stop there: implementation starts in those skills, never in this one.
