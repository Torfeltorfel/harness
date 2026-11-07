---
name: discovery
description: Use when there is a knowledge gap of what the user tries to achieve
---

## Phase 1: Establish the Project

Determine which project this is for — from context or by asking. If
`projects/<slug>/business-case.md` and/or `projects/<slug>/discovery.html`
already exist, read them first.

## Phase 2: The JTBD Interview

Follow `../shared/voice.md` for tone and pushback. 

### Q1: The Trigger Moment (JTBD "push")
**Ask:** "Walk me through the exact moment this became a problem worth
solving. What was the user doing right before? What happened that made the user stop
and think 'I need something different'?"
**Push until you hear:** A specific moment, in a specific context — not an
ongoing state.
**Red flags:** "We've always known this was an issue." "It's a recurring
pain point." A category, not an event.
**Pushback example:**
- Founder: "It's been an ongoing pain point."
- BAD: "Got it, sounds frustrating — what else can you tell me?"
- GOOD: "An ongoing pain point is a category, not a moment. Think of the
  last time it actually cost you something — a specific job, a specific
  week. Walk me through that one instance."

### Q2: The Specific Friction
**Ask:** "What exactly breaks down today, step by step? Where does it fail,
and how do you know — what do you see, lose, or waste when it does?"
**Push until you hear:** A concrete step in a concrete workflow, with a cost
attached — time, money, errors, embarrassment.
**Red flags:** "It's inefficient." "It's frustrating." An adjective standing
in for a mechanism.
**Pushback example:**
- Founder: "It's just inefficient."
- BAD: "That makes sense, inefficiency adds up."
- GOOD: "'Inefficient' is an adjective doing the work a mechanism should.
  Walk me through the actual step — where does it break, and what do you
  lose when it does?"

### Q3: The Desired Outcome (the job)
**Ask:** "Forget your product for a second. If this were perfectly solved
tomorrow, what would be different in their day? What are they actually
hiring a solution to do for them?"
**Push until you hear:** Progress in the user's life or work, stated as a job
story — "When [situation], I want to [motivation], so I can [outcome]" — not
a feature.
**Red flags:** Restating the product ("they'd use my dashboard"). A feature
list instead of an outcome.
**Pushback example:**
- Founder: "They'd have a dashboard showing all their feedback."
- BAD: "A dashboard sounds useful, let's move on."
- GOOD: "That's your feature, not their outcome. Finish this sentence for
  them: 'When ___, I want to ___, so I can ___.'"

A guess the founder immediately disowns ("I don't actually know, that's just
a guess") counts as unresolved, not named — treat it as a Knowledge Gap
(Phase 3), not a completed answer.

### Optional deepening: the Four Forces
Once all three above are named (or logged as gaps), and time allows, probe
what pushes them away from the status quo, what pulls them toward a new way,
what anxiety a new approach creates, and what habit/allegiance keeps them
with the current approach. This sharpens the picture — it does not gate
closing the interview.

## Phase 3: Handling Unresolved Gaps

If after two push cycles there is still no answer:

1. Name it as its own labeled **Knowledge Gap** — never bury it inside a
   paragraph of findings. State which of the three (trigger / friction /
   outcome) is unresolved and why.
2. Propose next steps to fill the knowledge gap. This can be interviews, web
   research or any other experiment. If the founder wants to run customer
   interviews, hand them the protocol in `references/interviews.md` — it
   covers who to talk to, the interview structure, and how to fold findings
   back into Phase 4 below.

## Phase 4: Save Findings

**Write/update `projects/<slug>/discovery.html`:**
- Use `projects/assets/style.css` (same convention as `research`: copy it
  from `../shared/assets/style.css` if missing), read it first and build on
  it — extend only for a genuinely new reusable pattern. Link it with
  `href="../assets/style.css"`.
- Must show: the JTBD summary (trigger / friction / outcome, quoted in the
  founder's words where possible), the Four Forces if gathered, and a
  **Knowledge Gaps** section using the `.callout-gap` style — never folded
  into prose.
- No fixed skeleton — same non-goal as `research`'s topic pages. Build
  sections from the shared stylesheet's existing classes (`.finding`,
  `.badge`, `.callout-gap`) rather than inventing new markup; layout and
  grouping beyond the two requirements above are your judgment call.
- Re-running discovery on the same project updates this file in place
  rather than creating a new dated file.

**Update `business-case.md`:**
- Synthesize into Section 3 (and Section 2 if the target user got sharper) —
  a short synthesized line plus a pointer, e.g. "See discovery.html (updated
  YYYY-MM-DD) for the full JTBD breakdown." Never dump the raw interview
  transcript into business-case.md.
- Update Section 8 ("Where this stands") with which of trigger / friction /
  outcome is resolved vs. an open Knowledge Gap — this is what the next
  session (this skill, office-hours, or research) resumes from.

---

## Important Rules

- **Never start implementation.** Same hard gate as office-hours/research.
- **Questions ONE AT A TIME.**
- **All three elements or an explicit gap.** The interview never closes on a
  restated vague answer — either the trigger/friction/outcome gets named
  concretely, or it's logged as a Knowledge Gap.
- **Gaps are never buried.** Own labeled section, in conversation and in
  discovery.html.
- **Every session ends with a doc, not a memory.** discovery.html and
  business-case.md carry state forward, not auto-memory.
- **BE BRIEF:** The more words, the less gets read.