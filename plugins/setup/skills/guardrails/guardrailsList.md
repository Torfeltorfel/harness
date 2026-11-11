# Guardrails list

Everything worth considering for a project's CI and guardrails. `/setup:guardrails` reads this list and picks what fits the project right now.

## CI practices

- **Run on PRs and on pushes to `main`** (and `develop` if you use it).
- **Cancel stale runs:** a `concurrency` group per PR with `cancel-in-progress`, so only the latest commit gets checked.
- **One job per check:** lint, typecheck and test run in parallel and fail separately, so the failing check is obvious.
- **Reproducible installs:** a frozen lockfile (`yarn install --immutable`, `npm ci`), a pinned Node version and a dependency cache.
- **Annotate the diff:** problem matchers and test reporters (e.g. Vitest's `github-actions` reporter) put errors on the changed lines.
- **Smoke-test a real deploy:** deploy a preview and hit the key endpoints. Fail on 5xx responses.
- **Scope PR scans to the diff:** health checks such as React Doctor report only the new issues on PRs and track the trend on `main`.
- **Least-privilege permissions:** give each workflow and job only the `permissions` it needs.
- **Auto-merge safe dependency bumps:** merge Dependabot's minor and patch updates once every check passes. Majors and GitHub Actions bumps stay manual.
- **Mirror CI locally:** a pre-commit hook runs the same lint and typecheck on staged files, so CI rarely catches surprises.

## Tools

Grouped by what they guard.

### Linting and code quality

- [anti-slop](https://github.com/dmmulroy/anti-slop): Oxlint rules that reject sloppy TS/JS patterns (e.g. double `as` casts, module mocking). You copy the rules into your repo instead of installing a package.
- [knip](https://knip.dev): finds unused files, exports and dependencies.

### Architecture

- [dependency-cruiser](https://github.com/sverweij/dependency-cruiser): enforces import boundaries between layers (e.g. ui must not import db).
- [Archify](https://github.com/tt-a1i/archify): agent skill that turns a codebase or plan into an interactive HTML diagram.

### Testing

- [Stryker](https://stryker-mutator.io/docs/): mutation testing that checks whether tests catch small code changes. JS/TS: `npm init stryker@latest`, then `npx stryker run`.

### Git hooks

- [lefthook](https://github.com/evilmartians/lefthook): runs lint and typecheck on staged files before every commit.

### Agent sandboxing

- [Sandcastle](https://github.com/mattpocock/sandcastle): runs coding agents in a sandbox (macOS Seatbelt, Docker or cloud VMs) and merges their commits back from a branch.
