# setup

Skills that set a repo up, each run once per project.

| Skill | What it does |
|---|---|
| `/setup:engineering` | Configures the repo for the `engineering` skills: issue tracker, triage labels, domain doc layout. Writes `docs/agents/*.md` and an `## Agent skills` block in `CLAUDE.md`. |
| `/setup:guardrails` | Reviews the project's current state and sets up the CI practices and tools from [`guardrailsList.md`](skills/guardrails/guardrailsList.md) that pay off now. |

To add a tool or practice, edit `skills/guardrails/guardrailsList.md`.

`/setup:engineering` started as a copy of [mattpocock/skills](https://github.com/mattpocock/skills) (MIT, see [`LICENSE-mattpocock`](LICENSE-mattpocock)).
