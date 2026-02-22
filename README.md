# xrf

`xrf` is a LaTeX package for cross-referencing named symbols and generalized sequential markers.

Author: Pionus GmbH.

## Status

This repository is structured to be CTAN-ready:

- LPPL 1.3c licensing and maintainer metadata
- package source (`xrf.sty`)
- user documentation source (`xrf-doc.tex`)
- changelog (`CHANGELOG.md`)
- reproducible build/release helper (`build.lua`)

## Features

- Named labels: `\\labelname`, `\\labelref`, `\\namel`, `\\namer`
- General series API: `\\xrfDeclareSeries`, `\\xrfItem`, `\\xrfItemL`, `\\xrfItemR`
- Variable-base series API: `\\xrfDeclareCounterSeries`, `\\xrfVarItem`, `\\xrfVarItemL`, `\\xrfVarItemR`
- Built-in wrappers: `\\const*`, `\\remain*`, `\\term*`

Data is persisted in `jobname.xrf` between LaTeX runs.

## Label Semantics

- `\\constl`, `\\terml`, and `\\remainl` store a snapshot of the current index.
- `\\constr`, `\\termr`, and `\\remainr` resolve to that stored snapshot value.
- `\\labelname{label}{value}` stores an expanded snapshot of `value`.
- `\\labelnamenx{label}{value}` stores `value` without expansion.
- The package warns if the same label is redefined with a different value in one run.

## Quick example

```tex
\\documentclass{article}
\\usepackage{xrf}
\\xrfDeclareSeries{axiom}{A_{#1}}

\\begin{document}
$\\xrfItemL{axiom}{ax:first}$, then $\\xrfItem{axiom}$,
and later $\\xrfItemR{axiom}{ax:first}$.

Also with remainders:
$\\remainl{r}{rem:first}$ and later $\\remainr{r}{rem:first}$.
\\end{document}
```

Compile at least twice to resolve persisted cross references.

## Build documentation

```sh
latexmk -pdf xrf-doc.tex
```

## CTAN packaging via l3build

```sh
l3build check
l3build ctan
```

This produces a CTAN upload archive at `build/distrib/ctan/xrf-ctan.zip`.

## CI

GitHub Actions runs:

- `l3build check` (regression tests on `pdftex`, `luatex`, `xetex`)
- `l3build ctan` (CTAN artifact build)

## Regression Tests

Regression test files are in `testfiles/`:

- `xrf-snapshots.lvt` validates stable snapshot/reference behavior.
- `xrf-duplicates.lvt` validates duplicate-label warning behavior.

If expected output intentionally changes:

```sh
l3build save -e pdftex xrf-snapshots xrf-duplicates
```

Then rerun:

```sh
l3build check
```

## Release Checklist

1. Run `l3build check`.
2. Build docs: `latexmk -pdf -interaction=nonstopmode -halt-on-error xrf-doc.tex`.
3. Build CTAN archive: `l3build ctan`.
4. Verify artifact exists: `build/distrib/ctan/xrf-ctan.zip`.
5. Keep version fields aligned in `xrf.sty`, `build.lua`, `xrf-doc.tex`, and `CHANGELOG.md`.

## TODO Before Deployment

- Proofread the package documentation (`xrf-doc.tex` and rendered `xrf-doc.pdf`).
- Check the example (`examples/basic.tex`) and verify the rendered output in `examples/basic.pdf`.
