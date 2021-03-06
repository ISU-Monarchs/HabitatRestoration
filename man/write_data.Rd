% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_data.R
\name{write_data}
\alias{write_data}
\title{Write all package \code{data.frame}s as csv files}
\usage{
write_data(path = "./", ...)
}
\arguments{
\item{path}{string containing directory to write files to}

\item{...}{passed to \code{write.csv} except \code{row.names} which is set 
to FALSE}
}
\description{
Writes all \code{data.frame}s in the ISUmonarch package as csv files to the 
path specified.
}
\examples{
\dontrun{
write_data()
}
}
