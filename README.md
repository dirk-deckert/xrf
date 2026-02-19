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

## Quick example

```tex
\\documentclass{article}
\\usepackage{xrf}
\\xrfDeclareSeries{axiom}{A_{#1}}

\\begin{document}
$\\xrfItemL{axiom}{ax:first}$, then $\\xrfItem{axiom}$,
and later $\\xrfItemR{axiom}{ax:first}$.
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

This produces a CTAN upload archive under `build/distrib/`.
