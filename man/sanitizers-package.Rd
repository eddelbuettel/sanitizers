\name{sanitizers-package}
\alias{sanitizers-package}
\alias{sanitizers}
\alias{heapAddressSanitize}
\alias{stackAddressSanitize}
\alias{intOverflowSanitize}
\alias{sanitizers}
\docType{package}
\title{
  Example code to trigger ASAN and UBSAN reports
}
\description{
  This package provides example for the Address Sanitize and Undefined
  Behaviour Sanitize features provided by recent gcc and clang versions.
}
\details{
  Recent gcc and clang compiler versions provide functionality to test for
  memory violations and other undefined behaviour; this is often referred to as
  \dQuote{Address Sanitizer} (or ASAN) and \dQuote{Undefined Behaviour Sanitizer} 
  (UBSAN). The
  \href{http://cran.r-project.org/doc/manuals/r-release/R-exts.html}{Writing R Extension manual} 
  describes this in some detail in Section 4.3 (titled \dQuote{Checking Memory Access}).

  This feature has to be enabled in the corresponding binary, eg in R, which
  is somewhat involved as it also required a current compiler toolchain which 
  is not yet widely available, or in the case of Windows, not available at all
  (via the common Rtools mechanism).

  As an alternative, the pre-built Docker containers available via the
  \href{https://registry.hub.docker.com/u/eddelbuettel/docker-debian-r/}{Docker
  Hub} can be used on Linux, and via
  \href{http://boot2docker.io/}{boot2docker} on Windows and OS X.

  This R package then provides a means of testing the compiler setup as the
  known code failures provides in the sample code here should be detected
  correctly, whereas a default build of R will let the package pass.

  The code samples are based on the examples from the
  \href{https://code.google.com/p/address-sanitizer/wiki/AddressSanitizer}{Address
  Sanitizer Wiki}.

}
\author{
  Dirk Eddelbuettel
}
\references{
  The
  \href{http://cran.r-project.org/doc/manuals/r-release/R-exts.html}{Writing R Extension manual}, sections
  \href{http://cran.r-project.org/doc/manuals/r-release/R-exts.html\#Using-Address-Sanitizer}{Using the Address Sanitizer} and
  \href{http://cran.r-project.org/doc/manuals/r-release/R-exts.html\#Using-Undefined-Behaviour-Sanitizer}{Using the Undefined Behaviour Sanitizer}.
}
\keyword{package}
