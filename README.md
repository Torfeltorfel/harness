# torben-harness

Reusable Claude Code plugins. Each project chooses its plugins in its committed `.claude/settings.json`.

| Plugin | What it gives you |
|---|---|
| `engineering` | `/retro`, `/pr`, `/grill-with-docs`, `tdd`, `codebase-design`, `worktree`, and `research` for sourced technical questions |
| `research` | `/office-hours`, `discovery`, `market-research`, which write to `projects/<slug>/` |

Enable in a project:

```json
{
  "extraKnownMarketplaces": { "torben": { "source": { "source": "github", "repo": "Torfeltorfel/torben-harness" } } },
  "enabledPlugins": { "engineering@torben": true, "research@torben": true }
}
```

## Suggested settings

[`suggested-settings.json`](suggested-settings.json) holds personal defaults for `~/.claude/settings.json`. Plugins can't set these, so merge the keys in by hand (don't overwrite the file). Plugins themselves stay enabled per project.

- `outputStyle: Concise` leads with the result and drops preamble, narration and recaps. Needs Claude Code v2.1.237+. The value is case-sensitive: `concise` silently falls back to Default.
- Override per project in `.claude/settings.json`, or per session with `/output-style`. Note that `/output-style` and `/config` write to `.claude/settings.local.json`, which then wins over the user default in that project.

Pick up a new version in a project: `claude plugin marketplace update torben`, then start a new session.

## Experimenting with harness changes

Work on an `experimental` branch in `~/Coding/harness`; `main` is what every project gets.

1. **Iterate in one session.** Load the plugin straight from the working copy (whatever branch is checked out); nothing is installed and other projects stay on `main`. Restart the session to pick up edits.

   ```bash
   claude --plugin-dir ~/Coding/harness/plugins/engineering
   # or all plugins: claude --plugin-dir ~/Coding/harness/plugins
   ```

2. **Live with it in one project.** Push the branch and pin that project to it in `.claude/settings.local.json` (not committed), then run `claude plugin marketplace update torben`:

   ```json
   {
     "extraKnownMarketplaces": {
       "torben": { "source": { "source": "github", "repo": "Torfeltorfel/torben-harness", "ref": "experimental" } }
     }
   }
   ```

3. **Ship it.** Merge into `main`, bump the plugin version, push, and run `claude plugin marketplace update torben` in other projects.

Installed plugins are cached by version: bump it (e.g. `0.4.0-exp.1`) on every pushed experimental change so updates are picked up and `/plugin` shows which build is running. Changes proposed by `/retro` go to `experimental` first.

Rule: workflows and skills go in plugins. Project commands, paths and conventions stay in the project.
