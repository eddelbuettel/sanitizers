## sanitizer: Code to trigger ASAN and UBSAN reports

[![CI](https://github.com/eddelbuettel/sanitizers/workflows/ci/badge.svg)](https://github.com/eddelbuettel/sanitizers/actions?query=workflow%3Aci)
[![License](https://eddelbuettel.github.io/badges/GPL2+.svg)](https://www.gnu.org/licenses/gpl-2.0.html)
[![CRAN](https://www.r-pkg.org/badges/version/sanitizers)](https://cran.r-project.org/package=sanitizers)
[![r-universe](https://eddelbuettel.r-universe.dev/badges/sanitizers)](https://eddelbuettel.r-universe.dev/sanitizers)
[![Dependencies](https://tinyverse.netlify.app/badge/sanitizers)](https://cran.r-project.org/package=sanitizers)
[![Last Commit](https://img.shields.io/github/last-commit/eddelbuettel/sanitizers)](https://github.com/eddelbuettel/sanitizers)

### Motivation

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

### Example

We can use the [Rocker Project](https://rocker-project.org/) container [r-devel-san](https://hub.docker.com/r/rocker/r-devel-san)
I also maintain.  Launching it in, say, a checkout of this repo as 

```sh
docker run --rm -ti -v $PWD:/work -w /work rocker/r-devel-san bash
```

launches a `bash` shell in the current directory which should contain the checked-out repo. We can
then install this package _using the sanitizer build_ (important: using `RD` aka r-devel, not `R`
the standard package version) via

```sh
RD CMD INSTALL .
```

When we then launch `RD` we can tickle the sanitizer vioaliations by calling the respective functions:

```r
> sanitizers::stackAddressSanitize()
stack_address.cpp:16:32: runtime error: index 110 out of bounds for type 'int [100]'
stack_address.cpp:16:11: runtime error: load of address 0x7ffd22bcb7b8 with insufficient space for an object of type 'int'
0x7ffd22bcb7b8: note: pointer points here
 fd 7f 00 00  38 f3 bd d3 0f 7f 00 00  40 b8 bc 22 fd 7f 00 00  09 69 b7 d3 0f 7f 00 00  20 d4 4f da
              ^ 
[1] -742526152
> sanitizers::heapAddressSanitize()
heap_address.cpp:16:11: runtime error: load of address 0x558eda5d9a58 with insufficient space for an object of type 'int'
0x558eda5d9a58: note: pointer points here
 8e 55 00 00  40 d8 5d da 8e 55 00 00  80 9a 5d da 8e 55 00 00  78 fd c7 d7 8e 55 00 00  20 fe c7 d7
              ^ 
[1] -631384000
> sanitizers::intOverflowSanitize()
int_overflow.cpp:17:11: runtime error: signed integer overflow: -2147483648 - 1 cannot be represented in type 'int'
[1] 2147483647
> 
```

This demonstrates that the `r-devel-san` container is correctly instrumented, and that we launched
the appropriate R(-devel) instance triggering the true positives manifested in this package.

### Author

Dirk Eddelbuettel

### License

GPL (>= 2)

