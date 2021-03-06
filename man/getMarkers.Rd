% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getMarkers.R
\name{getMarkers}
\alias{getMarkers}
\title{getMarkers}
\usage{
getMarkers(gs, quant = 0.99, mutualInfo = FALSE, classEnt = FALSE)
}
\arguments{
\item{gs}{The output of \code{sortGenes()}.}

\item{quant}{A number greater than zero and smaller than one. 0.99 by
default. See Details.}

\item{mutualInfo}{Logical. If \code{TRUE}, the mutual information between
gene expression and cell clustering will be returned for each gene. \code{FALSE}
by default.}

\item{classEnt}{Logical. If \code{TRUE}, a "Cluster Shannon Index" is
returned for each cluster. See Details. \code{FALSE} by default.}
}
\value{
\code{getMarkers} returns a list with the following components:
  \item{markers}{A character vector containing the names of selected marker
  features.} \item{maxScaledSpecScore}{A numeric vector of length
  \code{nrow(gs$specScore)}, including the maximum scaled specificity score for
  each gene across all cell clusters.} \item{gene_shannon_index}{A numeric vector
  of the same length as \code{maxScaledSpecScore}, including the Gene Shannon
  Index for each gene. See Details.} \item{mutInfo}{A numeric vector of the
  same length as \code{maxScaledSpecScore}, including the mutual information
  between the expression of each gene and the cell clustering.}
  \item{classEntropy}{A numeric vector of the same length as
  \code{ncol(specScore)}, including the Class Shannon Index for each cluster
  based on the selected marker genes.}
}
\description{
getMarkers processes the output of \code{sortGenes} to select a relatively
small set of marker genes.
}
\examples{
#randomly generated data and cell clusters, almost no markers are found
set.seed(1234)
exp = matrix(sample(0:20,1000,replace=TRUE), ncol = 20)
rownames(exp) = sapply(1:50, function(x) paste0("g", x))
cellType = sample(c("cell type 1","cell type 2"),20,replace=TRUE)
sg = sortGenes(exp, cellType)
mm = getMarkers(sg,quant=0.95)
length(mm$markers) #only one marker gene was found


#"reasonably" separated clusters, with a few clear markers
data(sim)
gs = sortGenes(sim$exp, sim$cellType)
mm = getMarkers(gs,quant=0.95)
length(mm$markers)

#real data with three well separated clusters
data(kidneyTabulaMuris)
gs = sortGenes(kidneyTabulaMuris$exp, kidneyTabulaMuris$cellType)
mm = getMarkers(gs, quant = 0.99)
length(mm$markers) #we found 109 candidate markers
#we want to get a more focused list:
mm = getMarkers(gs, quant = 0.999)
length(mm$markers) #11 genes that can alone descriminate between the cell types
}
\seealso{
getPValues
}
\author{
Mahmoud M Ibrahim <mmibrahim@pm.me>
}
