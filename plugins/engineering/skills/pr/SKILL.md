---
name: pr
description: Turn the current work into a GitHub pull request - branch, commit, push, and open the PR with a clear description. Use when the user asks to open, create or update a PR.
disable-model-invocation: true
argument-hint: "[draft] [base branch]"
---

# PR

Ship the current changes as a pull request with `gh`.

## 1. Check the state

Run in parallel: `git status`, `git diff` (staged and unstaged), `git log` for
commits not on the base branch, and `gh pr view` to see if a PR already exists
for this branch. Base branch is the argument if given, else the repo default.

Stop and ask if:
- the diff contains things that look unrelated to the task, secrets, `.env`
  files, or large generated files;
- there is nothing to ship.

## 2. Branch and commit

- On the default branch: create a branch named `<type>/<short-slug>`
  (`feat/`, `fix/`, `chore/`, `docs/`, `refactor/`).
- Stage the relevant files by name, not `git add -A`.
- Commit messages: imperative subject under 70 characters, body says why.
  Follow the repo's existing style if `git log` shows one.
- Run the project's fast checks (lint, typecheck, tests named in CLAUDE.md or
  package scripts) before pushing. If they fail, fix or report, do not push
  silently.

## 3. Push and open

Push with `-u`. Then `gh pr create` (add `--draft` if requested), or
`gh pr edit` if a PR already exists. Description:

```markdown
## Why
<problem or goal, 1-3 sentences; link issue if there is one>

## What
<the changes, as a short list, grouped by intent not by file>

## How to verify
<commands run and their result, or manual steps>

## Notes
<risks, follow-ups, things the reviewer should look at first; omit if none>
```

Write for a reviewer who has not seen the session. No filler.

## 4. Report

Give the PR URL and one line on CI if `gh pr checks` already shows something.
