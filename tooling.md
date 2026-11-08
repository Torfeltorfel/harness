# Tooling

Tools for projects, by status: **ideas** (not tried), **experimental** (trying in a project), **suggested** (use it).

## Ideas

- [Stryker](https://stryker-mutator.io/docs/): mutation testing that checks whether tests catch small code changes. JS/TS: `npm init stryker@latest`, then `npx stryker run`.
- [Archify](https://github.com/tt-a1i/archify): agent skill that turns a codebase or plan into an interactive HTML diagram.
- [anti-slop](https://github.com/dmmulroy/anti-slop): Oxlint rules that reject sloppy TS/JS patterns (e.g. double `as` casts, module mocking). You copy the rules into your repo instead of installing a package.
- [dependency-cruiser](https://github.com/sverweij/dependency-cruiser): enforces import boundaries between layers (e.g. ui must not import db).
- [knip](https://knip.dev): finds unused files, exports and dependencies.
- [Sandcastle](https://github.com/mattpocock/sandcastle): runs coding agents in a sandbox (macOS Seatbelt, Docker or cloud VMs) and merges their commits back from a branch.
- Pre-commit hook: run lint and typecheck on every commit, e.g. with [lefthook](https://github.com/evilmartians/lefthook).

## Experimental

## Suggested
