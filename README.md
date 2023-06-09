## sanitizer: Code to trigger ASAN and UBSAN reports

[![CI](https://github.com/eddelbuettel/sanitizers/workflows/ci/badge.svg)](https://github.com/eddelbuettel/sanitizers/actions?query=workflow%3Aci)
[![License](https://eddelbuettel.github.io/badges/GPL2+.svg)](https://www.gnu.org/licenses/gpl-2.0.html)
[![CRAN](https://www.r-pkg.org/badges/version/sanitizers)](https://cran.r-project.org/package=sanitizers)
[![Dependencies](https://tinyverse.netlify.com/badge/sanitizers)](https://cran.r-project.org/package=sanitizers)
[![Last Commit](https://img.shields.io/github/last-commit/eddelbuettel/sanitizers)](https://github.com/eddelbuettel/sanitizers)


The gcc and clang compilers provide functionality to test for memory violations and other undefined behaviour; this is often
referred to as "Address Sanitizer" (or ASAN) and "Undefined Behaviour Sanitizer" (UBSAN).  The [Writing R Extension
manual](https://cran.r-project.org/doc/manuals/r-release/R-exts.html) describes this in some detail in Section 4.3 titled
[Checking Memory Access](https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Checking-memory-access).

This feature has to be enabled in the corresponding binary, eg in R, which is somewhat involved as it also required a current
compiler toolchain which is not yet widely available, or in the case of Windows, not available at all (via the common Rtools
mechanism).

As an alternative, pre-built Docker containers such as [Rocker's r-devel-san](https://hub.docker.com/r/rocker/r-devel-san) or the
SAN builds inside multi-purpose [r-debug](https://hub.docker.com/r/wch1/r-debug/) image can be used.

This R package then provides a means of testing the compiler setup as the known code failures provides in the sample code here
should be detected correctly, whereas a default build of R will let the package pass.

The code samples are based on the examples from the [Address Sanitizer Wiki](https://github.com/google/sanitizers/wiki).

## Author

Dirk Eddelbuettel

## License

GPL (>= 2)

