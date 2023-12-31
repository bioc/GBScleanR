% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/Methods-GbsrGenotypeData.R
\name{setMarFilter}
\alias{setMarFilter}
\alias{setMarFilter,GbsrGenotypeData-method}
\title{Filter out markers}
\usage{
setMarFilter(
  object,
  id = NA_integer_,
  missing = 1,
  het = c(0, 1),
  mac = 0,
  maf = 0,
  ad_ref = c(0, Inf),
  ad_alt = c(0, Inf),
  dp = c(0, Inf),
  mean_ref = c(0, Inf),
  mean_alt = c(0, Inf),
  sd_ref = Inf,
  sd_alt = Inf,
  ...
)

\S4method{setMarFilter}{GbsrGenotypeData}(
  object,
  id,
  missing,
  het,
  mac,
  maf,
  ad_ref,
  ad_alt,
  dp,
  mean_ref,
  mean_alt,
  sd_ref,
  sd_alt
)
}
\arguments{
\item{object}{A \link{GbsrGenotypeData} object.}

\item{id}{A vector of integers matching with snp ID which can
be retrieve by \code{getMarID()}. The markers with the specified IDs
will be filtered out.}

\item{missing}{A numeric value [0-1] to specify
the maximum missing genotype call rate per marker}

\item{het}{A numeric vector with length two [0-1] to specify
the minimum and maximum heterozygous genotype call rate per marker}

\item{mac}{A integer value to specify the minimum minor allele
count per marker}

\item{maf}{A numeric value to specify the minimum minor allele
frequency per marker.}

\item{ad_ref}{A numeric vector with length two specifying lower
and upper limit of reference read counts per marker.}

\item{ad_alt}{A numeric vector with length two specifying lower
and upper limit of alternative read counts per marker.}

\item{dp}{A numeric vector with length two specifying lower
and upper limit of total read counts per marker.}

\item{mean_ref}{A numeric vector with length two specifying lower
and upper limit of mean of reference read counts per marker.}

\item{mean_alt}{A numeric vector with length two specifying lower
and upper limit of mean of alternative read counts per marker.}

\item{sd_ref}{A numeric value specifying the upper limit of
standard deviation of reference read counts per marker.}

\item{sd_alt}{A numeric value specifying the upper limit of
standard deviation of alternative read counts per marker.}

\item{...}{Unused.}
}
\value{
A \link{GbsrGenotypeData} object with filters on markers.
}
\description{
Search markers which do not meet the criteria and label them as "invalid".
}
\details{
For \code{mean_ref}, \code{mean_alt}, \code{sd_ref}, and \code{sd_alt}, this function
calculate mean and standard deviation of reads obtained for samples
at each SNP marker. If a mean read counts of a marker was smaller
than the specified lower limit or larger than the upper limit,
this function labels the marker as "invalid". In the case of \code{sd_ref}
and \code{sd_alt}, standard deviations of read counts of each marker are
checked and the markers having a larger standard deviation will be
labeled as "invalid". To check valid and invalid
markers, run \code{\link[=validMar]{validMar()}}.
}
\examples{
# Load data in the GDS file and instantiate a [GbsrGenotypeData] object.
gds_fn <- system.file("extdata", "sample.gds", package = "GBScleanR")
gds <- loadGDS(gds_fn)

# Summarize the information needed for filtering.
gds <- countGenotype(gds)
gds <- countRead(gds)

gds <- setMarFilter(gds,
                      id = getMarID(gds)[1:100],
                      missing = 0.2,
                      dp = c(5, Inf))

# Close the connection to the GDS file.
closeGDS(gds)

}
