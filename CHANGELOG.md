# Changelog

## [1.0.1] - 2026-02-19

- Fixed label snapshot semantics so references keep the originally defined value
  (affects `\\constr`, `\\termr`, `\\remainr`, and generic `\\labelref` lookups).
- Added duplicate-label protection that warns when a label is redefined with a
  different value in the same run.
- Added l3build regression tests for snapshot behavior and duplicate-label warnings.
- Added CI workflow to run `l3build check` and `l3build ctan`.

## [1.0] - 2026-02-17

- First public release.
- Added generalized sequence API:
  - `\\xrfDeclareSeries`, `\\xrfDeclareCounterSeries`, `\\xrfSetSeries`
  - `\\xrfItem`, `\\xrfItemL`, `\\xrfItemR`
  - `\\xrfVarItem`, `\\xrfVarItemL`, `\\xrfVarItemR`
- Included built-in wrappers for constants, remainders, and terms.
- Added repository packaging and docs for CTAN workflow.
