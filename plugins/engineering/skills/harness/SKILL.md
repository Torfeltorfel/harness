---
name: harness
description: Show which plugins, skills and hooks make up this project's Claude harness, or set one up. Use with no argument to inspect, `init` to declare a harness for a new project.
disable-model-invocation: true
argument-hint: "[init]"
---

# Harness

The harness of a project is the set of plugins it enables in its committed
`.claude/settings.json` under `enabledPlugins`. Plugins from the `torben`
marketplace (https://github.com/Torfeltorfel/torben-harness) are the reusable
building blocks; project-specific commands and conventions live in the
project's own CLAUDE.md and settings.

## No argument: inspect

1. Read `enabledPlugins` from `~/.claude/settings.json`,
   `.claude/settings.json` and `.claude/settings.local.json` (later wins).
2. Also list project-local skills in `.claude/skills/` and hooks in the
   project settings, since those are part of the harness too.
3. Report a compact table: plugin or skill, where it is declared
   (global / project / local), one-line purpose.
4. Flag drift: project-local skills that duplicate a `torben` plugin, and
   global plugins that only make sense for some projects (suggest moving
   them into project `enabledPlugins`).

## `init`: declare a harness

1. Look at the project (package.json, pyproject, README, existing
   `.claude/`) and ask at most two questions about what it is for.
2. Propose the plugins to enable, with a one-line reason each. Available in
   the `torben` marketplace:
   - `engineering@torben`: `/harness`. Always on.
   - `research@torben`: startup work: `/office-hours`, `discovery`,
     `research`, writing to `projects/<slug>/`.
3. After the user confirms, merge into `.claude/settings.json` (create it if
   missing, keep existing keys):

   ```json
   {
     "extraKnownMarketplaces": {
       "torben": { "source": { "source": "github", "repo": "Torfeltorfel/torben-harness" } }
     },
     "enabledPlugins": { "engineering@torben": true }
   }
   ```

4. Tell the user the harness takes effect in the next session.
