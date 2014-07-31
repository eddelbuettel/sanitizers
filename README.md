## sanitizier: Code samples to triger SAN and UBSAN reports

[![Build Status](https://travis-ci.org/eddelbuettel/sanitizers.png)](https://travis-ci.org/eddelbuettel/sanitizers)

Recent gcc and clang compiler versions provide functionality to
memory violations and other undefined behaviour; this is often referred to as
"Address Sanitizer" (or SAN) and "Undefined Behaviour Sanitizer" (UBSAN).
The [Writing R Extension manual]() describes this in some detail in Section 4.9.

This feature has to be enabled in the corresponding binary, eg in R, which
is somewhat involved as it also required a current compiler toolchain which 
is not yet widely available, or in the case of Windows, not available at all
(via the common Rtools mechanism).

As an alternative, the pre-built Docker containers available via the Docker Hub
at https://registry.hub.docker.com/u/eddelbuettel/docker-debian-r/ can be used
on Linux, and via boot2docker on Windows and OS X.

This R package then provides a means of testing the compiler setup as the
known code failures provides in the sample code here should be detected
correctly, whereas a default build of R will let the package pass.

## Author

Dirk Eddelbuettel

## License

GPL (>= 2)

