# harness

Reusable Claude Code plugins. Each project chooses its plugins in its committed `.claude/settings.json`.

> **Credit:** the `engineering` and `productivity` skills started as a copy of Matt Pocock's [mattpocock/skills](https://github.com/mattpocock/skills) (MIT, copied at commit `4ae2317`). This repo is my own setup built on that work and changes it freely; see the licenses in [`plugins/engineering/LICENSE-mattpocock`](plugins/engineering/LICENSE-mattpocock) and [`plugins/productivity/LICENSE`](plugins/productivity/LICENSE).

| Plugin | What it gives you |
|---|---|
| `engineering` | Engineering skills from [mattpocock/skills](https://github.com/mattpocock/skills/tree/main/skills/engineering) (MIT, at `4ae2317`), plus `worktree`. Run `/setup` once per repo. |
| `productivity` | Productivity skills from [mattpocock/skills](https://github.com/mattpocock/skills/tree/main/skills/productivity) (MIT). Engineering skills call `grilling` from here, so enable both. |
| `research` | `/office-hours`, `discovery`, `market-research`, which write to `projects/<slug>/` |

## Install and set up

1. **Add the marketplace** (once per machine):

   ```bash
   claude plugin marketplace add Torfeltorfel/harness
   ```

2. **Enable the plugins in a project.** Add this to the project's committed `.claude/settings.json`, keeping only the plugins it needs (`engineering` needs `productivity`):

   ```json
   {
     "extraKnownMarketplaces": { "harness": { "source": { "source": "github", "repo": "Torfeltorfel/harness" } } },
     "enabledPlugins": { "engineering@harness": true, "productivity@harness": true, "research@harness": true }
   }
   ```

   Then start a new Claude Code session in the project and accept the prompt to install the plugins. Or install them by hand: `claude plugin install engineering@harness` (same for `productivity` and `research`).

3. **Set up the repo** (once per project): run `/setup` in a session. It asks where issues live (GitHub, GitLab, local markdown or other) and the triage labels, then writes `docs/agents/*.md` and an `## Agent skills` block in `CLAUDE.md` that the other engineering skills read.

4. **Check it worked:** `/plugin` lists the plugins and their versions. Not sure which skill to use? Run `/ask-matt`.

**Update** to a new version: `claude plugin marketplace update harness`, then start a new session.

## Suggested settings

[`suggested-settings.json`](suggested-settings.json) holds personal defaults for `~/.claude/settings.json`. Plugins can't set these, so merge the keys in by hand (don't overwrite the file). Plugins themselves stay enabled per project.

- `outputStyle: Concise` leads with the result and drops preamble, narration and recaps. Needs Claude Code v2.1.237+. The value is case-sensitive: `concise` silently falls back to Default.
- Override per project in `.claude/settings.json`, or per session with `/output-style`. Note that `/output-style` and `/config` write to `.claude/settings.local.json`, which then wins over the user default in that project.

## Tooling

[`tooling.md`](tooling.md): tools for projects, as ideas, experimental or suggested.

[`ci-best-practices.md`](ci-best-practices.md): concepts for a good CI pipeline.

## Experimenting with harness changes

Work on an `experimental` branch in `~/Coding/harness`; `main` is what every project gets.

1. **Iterate in one session.** Load the plugin straight from the working copy (whatever branch is checked out); nothing is installed and other projects stay on `main`. Restart the session to pick up edits.

   ```bash
   claude --plugin-dir ~/Coding/harness/plugins/engineering
   # or all plugins: claude --plugin-dir ~/Coding/harness/plugins
   ```

2. **Live with it in one project.** Push the branch and pin that project to it in `.claude/settings.local.json` (not committed), then run `claude plugin marketplace update harness`:

   ```json
   {
     "extraKnownMarketplaces": {
       "harness": { "source": { "source": "github", "repo": "Torfeltorfel/harness", "ref": "experimental" } }
     }
   }
   ```

3. **Ship it.** Merge into `main`, bump the plugin version, push, and run `claude plugin marketplace update harness` in other projects.

Installed plugins are cached by version: bump it (e.g. `0.4.0-exp.1`) on every pushed experimental change so updates are picked up and `/plugin` shows which build is running. Changes proposed by `/retro` go to `experimental` first.

Rule: workflows and skills go in plugins. Project commands, paths and conventions stay in the project.
