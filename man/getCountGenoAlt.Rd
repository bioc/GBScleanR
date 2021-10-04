% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/Methods-GbsrGenotypeData.R
\name{getCountGenoAlt}
\alias{getCountGenoAlt}
\alias{getCountGenoAlt,GbsrGenotypeData-method}
\title{Obtain total alternative genotype counts per SNP or per scan (sample)}
\usage{
getCountGenoAlt(object, target = "snp", valid = TRUE, prop = FALSE, ...)

\S4method{getCountGenoAlt}{GbsrGenotypeData}(object, target = "snp", valid = TRUE, prop = FALSE)
}
\arguments{
\item{object}{A GbsrGenotypeData object.}

\item{target}{Either of "snp" and "scan".}

\item{valid}{A logical value. See details.}

\item{prop}{A logical value whether to return values as proportions of total alternative genotype counts to total non missing genotype counts or not.}

\item{...}{Unused.}
}
\description{
Obtain total alternative genotype counts per SNP or per scan (sample)
}
\details{
You need to execute \code{\link[=countGenotype]{countGenotype()}} to calculate sumaary statisticsto be
obtained via this function.
If \code{valid = TRUE}, the chromosome information of markers which are labeled \code{TRUE}
in the ScanAnnotationDataSet slot will be returned. \code{\link[=getValidSnp]{getValidSnp()}} tells you
which samples are valid.
}