% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/Methods-GbsrGenotypeData.R
\name{setCallFilter}
\alias{setCallFilter}
\alias{setCallFilter,GbsrGenotypeData-method}
\title{Filter out each genotype call meeting criteria}
\usage{
setCallFilter(
  object,
  dp_count = c(0, Inf),
  ref_count = c(0, Inf),
  alt_count = c(0, Inf),
  dp_qtile = c(0, 1),
  ref_qtile = c(0, 1),
  alt_qtile = c(0, 1),
  ...
)

\S4method{setCallFilter}{GbsrGenotypeData}(
  object,
  dp_count,
  ref_count,
  alt_count,
  dp_qtile,
  ref_qtile,
  alt_qtile
)
}
\arguments{
\item{object}{A \link{GbsrGenotypeData} object.}

\item{dp_count}{A numeric vector with length two specifying lower and
upper limit of total read counts (reference reads + alternative reads).}

\item{ref_count}{A numeric vector with length two specifying lower and
upper limit of reference read counts.}

\item{alt_count}{A numeric vector with length two specifying lower and
upper limit of alternative read counts.}

\item{dp_qtile}{A numeric vector with length two specifying lower
and upper limit of quantile of total read counts in each sample.}

\item{ref_qtile}{A numeric vector with length two specifying lower
and upper limit of quantile of reference read counts in each sample.}

\item{alt_qtile}{A numeric vector with length two specifying lower
and upper limit of quantile of alternative read counts in each
sample.}

\item{...}{Unused.}
}
\value{
A \link{GbsrGenotypeData} object with filters on genotype calls.
}
\description{
Perform filtering of each genotype call, neither markers
nor samples. Each genotype call is supported by its read counts
for the reference allele and the alternative allele of
a marker of a sample. \code{setCallFilter()} set missing to
the genotype calls which are not reliable enough and set zero
to reference and alternative read counts of the genotype calls.
}
\details{
\code{dp_qtile}, \code{ref_qtile},
and \code{alt_qtile} use quantile values of read counts
of each sample to decide the lower and upper limit of read counts.
This function generate two new nodes in the GDS file linked with
the given \link{GbsrGenotypeData} object. The filtered read counts and genotype
calls will be stored in the data node in the "FAD" folder and the data node
in the "FGT" folder, while the data node in the "CFT" stores call fitering
informatin.
To reset the filter applied by setCallFilter(), run \code{\link[=resetCallFilter]{resetCallFilter()}}.
}
\examples{
# Create a GDS file from a sample VCF file.
vcf_fn <- system.file("extdata", "sample.vcf", package = "GBScleanR")
gds_fn <- tempfile("sample", fileext = ".gds")
gbsrVCF2GDS(vcf_fn = vcf_fn, out_fn = gds_fn, force = TRUE)

# Load data in the GDS file and instantiate a [GbsrGenotypeData] object.
gds <- loadGDS(gds_fn)

# Filter out genotype calls supported by less than 5 reads.
gds <- setCallFilter(gds, dp_count = c(5, Inf))

# Filter out genotype calls supported by reads less than
# the 20 percentile of read counts per marker in each sample.
gds <- setCallFilter(gds, dp_qtile = c(0.2, 1))

# Reset the filter
gds <- resetCallFilter(gds)

# Close the connection to the GDS file.
closeGDS(gds)

}
