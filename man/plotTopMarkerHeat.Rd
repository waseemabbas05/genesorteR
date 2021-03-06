% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotTopMarkerHeat.R
\name{plotTopMarkerHeat}
\alias{plotTopMarkerHeat}
\title{plotTopMarkerHeat}
\usage{
plotTopMarkerHeat(sg, top_n = 10,
  colors = colorRampPalette(rev(c("orangered4", "orangered", "gray90",
  "dodgerblue", "dodgerblue4")))(n = 100),
  newOrder = 1:length(unique(sg$inputClass)), averageCells = 0,
  gaps = TRUE, outs = FALSE, plotheat = TRUE)
}
\arguments{
\item{sg}{A list, typically the output of \code{sortGenes}.}

\item{top_n}{The number of top genes to plot for each cluster.}

\item{colors}{Color palette used for the heatmap.}

\item{newOrder}{Reorder the clusters in the heatmap? See Examples.}

\item{averageCells}{Plot averages of cells instead of individual cells. You 
can use this when you have a large number of cells. See Details.}

\item{gaps}{Should the heatmap have gaps between cell types and gene clusters? 
TRUE by default.}

\item{outs}{Should the top genes names be returned? FALSE by default.}

\item{plotheat}{Should the heatmap be drawn? TRUE by default.}
}
\value{
If \code{outs} is TRUE, \code{plotMarkerHeat} returns a list containing 
the top \code{n} marker genes for each cluster.
}
\description{
Plot a heatmap of expression values for the top genes in each cluster, 
defined by \code{sortGenes()}.
}
\details{
\code{plotTopMarkerHeat} is a convenience wrapper around \code{plotMarkerHeat}
that plots a heatmap of the top \code{top_n} (10 by default) genes in each cell 
cluster. Unlike \code{plotMarkerHeat}, \code{plotTopMarkerHeat} takes the output
of \code{sortGenes} as the only required input.
}
\examples{
data(kidneyTabulaMuris)
gs = sortGenes(kidneyTabulaMuris$exp, kidneyTabulaMuris$cellType)
plotTopMarkerHeat(gs) # plots the top 10 genes for each cluster

#now plot the top 20 genes and average every 5 cells
plotTopMarkerHeat(gs, top_n= 20, averageCells=5)

#just identify the top 20 genes, do not make a plot
plotTopMarkerHeat(gs, top_n= 20, averageCells=5, outs = TRUE, plotheat = FALSE)

}
\seealso{
plotMarkerHeat
}
\author{
Mahmoud M Ibrahim <mmibrahim@pm.me>
}
