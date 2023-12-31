% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/Methods-GbsrGenotypeData.R
\name{getMeanReadRef}
\alias{getMeanReadRef}
\alias{getMeanReadRef,GbsrGenotypeData-method}
\title{Obtain mean values of total reference read counts per
SNP or per sample}
\usage{
getMeanReadRef(object, target = "marker", valid = TRUE, ...)

\S4method{getMeanReadRef}{GbsrGenotypeData}(object, target, valid)
}
\arguments{
\item{object}{A \link{GbsrGenotypeData} object.}

\item{target}{Either of "marker" and "sample".}

\item{valid}{A logical value. See details.}

\item{...}{Unused.}
}
\value{
A numeric vector of the mean values of
reference allele reads per marker.
}
\description{
Obtain mean values of total reference read counts per
SNP or per sample
}
\details{
You need to execute \code{\link[=countRead]{countRead()}} to calculate summary statistics to be
obtained via this function.
If \code{valid = TRUE}, the chromosome information of markers which are
labeled \code{TRUE} in the \link{sample} slot will be returned.
\code{\link[=validMar]{validMar()}} tells you which samples are valid.
}
\examples{
gds_fn <- system.file("extdata", "sample.gds", package = "GBScleanR")
gds <- loadGDS(gds_fn)
gds <- countRead(gds)
getMeanReadRef(gds)
closeGDS(gds) # Close the connection to the GDS file

}
