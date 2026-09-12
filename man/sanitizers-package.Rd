\name{sanitizers-package}
\alias{sanitizers-package}
\alias{sanitizers}
\alias{heapAddressSanitize}
\alias{stackAddressSanitize}
\alias{intOverflowSanitize}
\alias{sanitizers}
\docType{package}
\title{\packageTitle{sanitizers}}
\description{\packageDescription{sanitizers}}
\usage{
stackAddressSanitize(x)
heapAddressSanitize(x)
intOverflowSanitize(x)
}
\arguments{
  \item{x}{integer scalar value}
}
\value{
  Each function returns an integer, but is invoked for the side effect of
  providing a known true positive for the corresponding check. 
}
\section{Package Content}{\packageIndices{sanitizers}}
\author{\packageAuthor{sanitizers}}
\section{Maintainer}{\packageMaintainer{sanitizers}}
\keyword{package}
