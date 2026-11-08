# CI

Concepts that make a good CI pipeline.

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
