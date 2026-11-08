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

Local development: `claude plugin marketplace add ~/Coding/torben-harness`.

Rule: workflows and skills go in plugins. Project commands, paths and conventions stay in the project.
