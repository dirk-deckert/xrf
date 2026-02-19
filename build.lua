module = "xrf"

sourcefiles = {"xrf.sty"}
typesetfiles = {"xrf-doc.tex"}
textfiles = {"README.md", "CHANGELOG.md", "LICENSE"}

checkengines = {"pdftex", "luatex", "xetex"}

uploadconfig = {
  pkg = "xrf",
  version = "1.0",
  author = "Pionus GmbH",
  license = "lppl1.3c",
  summary = "Cross-referencing named symbols and generalized sequential markers",
  topic = "crossref",
  ctanPath = "/macros/latex/contrib/xrf",
  repository = "https://github.com/dirk-deckert/xrf",
  bugtracker = "https://github.com/dirk-deckert/xrf/issues",
  description = [[
The xrf package provides cross-referencing of named symbols and generalized
sequential marker series. Built-in wrappers cover constants, indexed
remainders, and boxed terms. Values are persisted in a .xrf sidecar file.
]],
}
