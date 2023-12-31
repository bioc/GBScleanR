% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/Methods-GbsrGenotypeData.R
\name{resetFilter}
\alias{resetFilter}
\alias{resetFilter,GbsrGenotypeData-method}
\title{Reset all filters made by \code{\link[=setSamFilter]{setSamFilter()}}, \code{\link[=setMarFilter]{setMarFilter()}},
and \code{\link[=setCallFilter]{setCallFilter()}}.}
\usage{
resetFilter(object, ...)

\S4method{resetFilter}{GbsrGenotypeData}(object)
}
\arguments{
\item{object}{A \link{GbsrGenotypeData} object.}

\item{...}{Unused.}
}
\value{
A \link{GbsrGenotypeData} object after removing all filters.

A \link{GbsrGenotypeData} object after removing all filters on markers.
}
\description{
Return all data intact.
}
\examples{
# Create a GDS file from a sample VCF file.
vcf_fn <- system.file("extdata", "sample.vcf", package = "GBScleanR")
gds_fn <- tempfile("sample", fileext = ".gds")
gbsrVCF2GDS(vcf_fn = vcf_fn, out_fn = gds_fn, force = TRUE)

# Load data in the GDS file and instantiate a [GbsrGenotypeData] object.
gds <- loadGDS(gds_fn)

# `setCallFilter()` do not require summarized information of
# genotype counts and read counts.
gds <- setCallFilter(gds, dp_count = c(5, Inf))

# `setSamFilter()` and `setMarFilter()` needs information of
# the genotype count summary and the read count summary.
gds <- countGenotype(gds)
gds <- countRead(gds)

gds <- setSamFilter(gds,
                       id = getSamID(gds)[1:10],
                       missing = 0.2,
                       dp = c(5, Inf))

gds <- setMarFilter(gds,
                      id = getMarID(gds)[1:100],
                      missing = 0.2,
                      dp = c(5, Inf))

gds <- setInfoFilter(gds, mq = 40, qd = 20)

# Reset all filters applied above.
gds <- resetFilter(gds)

# Close the connection to the GDS file.
closeGDS(gds)
}
