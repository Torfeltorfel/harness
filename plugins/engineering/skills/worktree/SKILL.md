---
name: worktree
description: Set up an isolated git worktree for a JS/TS/Node project - create it, install dependencies, bring over .env files, check that the baseline is green. Use when starting feature work that should not touch the current checkout, or before running a plan in parallel with other work.
argument-hint: "[branch name]"
---

# Worktree

> Simplified from [obra/superpowers](https://github.com/obra/superpowers/blob/main/skills/using-git-worktrees/SKILL.md) (MIT, see [LICENSE](LICENSE)).

Do the work in its own worktree so the current checkout stays untouched.

## 1. Already isolated?

If `git rev-parse --git-dir` differs from `git rev-parse --git-common-dir`,
you are already in a worktree: skip to step 3. Unless the user asked for a
worktree, ask once before creating one.

## 2. Create it

- **Prefer the `EnterWorktree` tool.** It owns placement, branch and cleanup.
- **Otherwise** use `.worktrees/<branch>` at the repo root. Check
  `git check-ignore -q .worktrees` first; if it is not ignored, add it to
  `.gitignore` and commit that. Then
  `git worktree add .worktrees/<branch> -b <branch>` and work from there.

Branch name: the argument, else `<type>/<short-slug>` (`feat/`, `fix/`, ...).

## 3. Set up

1. **Env files.** Untracked files are not in the new worktree. Copy `.env*`
   files (and `.npmrc` if untracked) from the main checkout if they are missing.
2. **Install** with the package manager the lockfile names:
   `pnpm-lock.yaml` → `pnpm install`, `yarn.lock` → `yarn`,
   `bun.lock`/`bun.lockb` → `bun install`, else `npm install`.
   In a monorepo, install at the repo root.
3. **Baseline.** Run the project's checks from `package.json` (e.g. `test`,
   `typecheck`, `lint`) or the commands named in CLAUDE.md.

If the baseline fails, report it and ask whether to continue: a red baseline
makes every later failure ambiguous.

Report: path, branch, baseline result.

## 4. Finish

When the work is merged or abandoned: `ExitWorktree` if you entered with it,
else `git worktree remove .worktrees/<branch>` and delete the branch if it was
merged. Never remove a worktree with uncommitted changes without asking.
