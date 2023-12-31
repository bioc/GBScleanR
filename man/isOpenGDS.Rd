% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/Methods-GbsrGenotypeData.R
\name{isOpenGDS}
\alias{isOpenGDS}
\alias{isOpenGDS,GbsrGenotypeData-method}
\title{Check if a GDS file has been opened or not.}
\usage{
isOpenGDS(object, ...)

\S4method{isOpenGDS}{GbsrGenotypeData}(object)
}
\arguments{
\item{object}{A \link{GbsrGenotypeData} object.}

\item{...}{Unused.}
}
\value{
\code{TRUE} if the GDS file linked to the input \link{GbsrGenotypeData} object
has been opened, while \code{FALSE} if closed.
}
\description{
Check if a GDS file has been opened or not.
}
\examples{
# Use a GDS file of example data.
gds_fn <- system.file("extdata", "sample.gds", package = "GBScleanR")

# Instantiation of [GbsrGenotypeData]
gds <- loadGDS(gds_fn)

# Check connection to the GDS file
isOpenGDS(gds)

# Close the connection to the GDS file
closeGDS(gds)

}
