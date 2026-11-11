---
name: hooks
description: "Install the standard Claude Code hooks into this project: safety hooks as-is, quality hooks adapted to the project's toolchain."
disable-model-invocation: true
---

# Hooks

Installs the standard hooks into the project's committed `.claude/settings.json`, so every project gets them without a decision. No verdict table here: these always go in.

The templates live next to this file:
- [`templates/hooks/`](templates/hooks/): hook scripts.
- [`templates/settings-hooks.json`](templates/settings-hooks.json): the `hooks` block that wires them up.

## Safety hooks (copy as-is)

- `guard-bash.sh` blocks `rm -r` on `/`, `~`, `$HOME` or `..`, and force-pushes to `main`/`master`.
- `protect-env.sh` blocks reading or editing `.env` and `.env.*`, but allows `.env.example`, `.env.sample` and `.env.template`.

Copy both scripts to `.claude/hooks/` and `chmod +x` them. They need `jq`. If `jq` is missing, say so; the hooks then skip their check and print a warning.

## Quality hooks (adapt)

The template assumes Prettier and npm scripts named `typecheck` and `lint`. Read the project and change the commands to fit it:
- **Format on edit** (`PostToolUse`): the project's formatter on the edited file (e.g. `biome format --write`, `ruff format`). Never fails the edit.
- **Check before stopping** (`Stop`): the project's typecheck and lint commands. If they fail, Claude keeps working and sees the errors. Keep the `stop_hook_active` guard so it can't loop.

If the project has no formatter, typechecker or linter yet, leave that hook out, and point to `/setup:guardrails` to add the tool.

## Install

1. Merge the `hooks` block into `.claude/settings.json`. Keep existing hooks and other keys. Don't add a hook twice if it's already there.
2. Test each hook once: pipe a sample JSON input into each script (e.g. `{"tool_input":{"command":"rm -rf ~"}}` must exit 2), and run the Stop command on the current code.

Done when the hooks are in `.claude/settings.json` and every check passes. Report which quality commands you chose, and any hook you left out.
