## sanitizier: Code to trigger ASAN and UBSAN reports

[![Build Status](https://travis-ci.org/eddelbuettel/sanitizers.png)](https://travis-ci.org/eddelbuettel/sanitizers)
[![CI](https://github.com/eddelbuettel/sanitizers/workflows/ci/badge.svg)](https://github.com/eddelbuettel/sanitizers/actions?query=workflow%3Aci)

Recent gcc and clang compiler versions provide functionality to test for
memory violations and other undefined behaviour; this is often referred to as
"Address Sanitizer" (or ASAN) and "Undefined Behaviour Sanitizer" (UBSAN).
The [Writing R Extension
manual](http://cran.r-project.org/doc/manuals/r-release/R-exts.html)
describes this in some detail in Section 4.3 titled 
[Checking Memory Access](http://cran.r-project.org/doc/manuals/r-release/R-exts.html#Checking-memory-access).

This feature has to be enabled in the corresponding binary, eg in R, which
is somewhat involved as it also required a current compiler toolchain which 
is not yet widely available, or in the case of Windows, not available at all
(via the common Rtools mechanism).

As an alternative, the pre-built Docker containers available via the [Docker Hub](
https://registry.hub.docker.com/u/eddelbuettel/docker-debian-r/) can be used
on Linux, and via boot2docker on Windows and OS X.

This R package then provides a means of testing the compiler setup as the
known code failures provides in the sample code here should be detected
correctly, whereas a default build of R will let the package pass.

The code samples are based on the examples from the [Address Sanitizer
Wiki](https://code.google.com/p/address-sanitizer/wiki/AddressSanitizer).

## Author

Dirk Eddelbuettel

## License

GPL (>= 2)

