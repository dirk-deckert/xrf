# AGENTS.md

Instructions for coding agents working in this repository.

## Project Summary

- Package name: `xrf`
- Language/tooling: LaTeX package + `l3build`
- Primary source: `xrf.sty`
- Documentation source: `xrf-doc.tex`
- Regression tests: `testfiles/*.lvt` with expected logs in `testfiles/*.tlg`

## Core Commands

- Run regression tests:
  - `l3build check`
- Re-save expected logs after intentional test-output changes:
  - `l3build save -e pdftex xrf-snapshots xrf-duplicates`
- Build docs:
  - `latexmk -pdf -interaction=nonstopmode -halt-on-error xrf-doc.tex`
- Build CTAN archive:
  - `l3build ctan`

Expected CTAN artifact:
- `build/distrib/ctan/xrf-ctan.zip`

## Behavioral Expectations

- Label values are snapshotted at definition time for:
  - `\constl`, `\terml`, `\remainl`
  - `\labelname` (expanded)
- Raw token storage is available via:
  - `\labelnamenx` (non-expanded)
- Warnings are expected only when a label is redefined with a *different* value in the same run.
- Duplicate same-value writes are intentionally suppressed in `.xrf` output.

## Editing Rules

- Keep changes minimal and targeted.
- Preserve public API compatibility unless explicitly requested.
- Keep version metadata aligned when making release-worthy changes:
  - `xrf.sty` (`\ProvidesPackage`)
  - `build.lua` (`uploadconfig.version`)
  - `xrf-doc.tex` (`\date`)
  - `CHANGELOG.md`

## Validation Before Handoff

- Always run `l3build check` after code changes to `xrf.sty` or `testfiles/*`.
- If packaging/release files changed, also run `l3build ctan`.
- If docs changed, run `latexmk` for `xrf-doc.tex`.

## Repository Hygiene

- Do not commit generated local build artifacts.
- `.pdf`, `.aux`, `.log`, `.xrf`, and `build/` contents are generated and ignored.
- Keep `.lvt`/`.tlg` pairs in sync when tests are intentionally updated.
