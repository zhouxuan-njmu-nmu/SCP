% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SCP-analysis.R
\name{RunSCVELO}
\alias{RunSCVELO}
\title{Run scVelo analysis}
\usage{
RunSCVELO(
  srt = NULL,
  assay_X = "RNA",
  slot_X = "counts",
  assay_layers = c("spliced", "unspliced"),
  slot_layers = "counts",
  adata = NULL,
  group_by = NULL,
  linear_reduction = NULL,
  nonlinear_reduction = NULL,
  basis = NULL,
  mode = "stochastic",
  fitting_by = "stochastic",
  magic_impute = FALSE,
  knn = 5,
  t = 2,
  min_shared_counts = 30,
  n_pcs = 30,
  n_neighbors = 30,
  approx = TRUE,
  stream_smooth = NULL,
  stream_density = 2,
  arrow_length = 5,
  arrow_size = 5,
  arrow_density = 0.5,
  denoise = FALSE,
  denoise_topn = 3,
  kinetics = FALSE,
  kinetics_topn = 100,
  calculate_velocity_genes = FALSE,
  top_n = 6,
  n_jobs = 1,
  palette = "Paired",
  palcolor = NULL,
  show_plot = TRUE,
  dpi = 300,
  save = FALSE,
  dirpath = "./",
  fileprefix = "",
  return_seurat = !is.null(srt)
)
}
\arguments{
\item{srt}{A \code{Seurat} object.}

\item{adata}{An \code{anndata} object. Can be created through \code{\link{srt_to_adata}}}

\item{group_by}{group_by.}

\item{linear_reduction}{linear_reduction.}

\item{nonlinear_reduction}{nonlinear_reduction.}

\item{basis}{basis.}

\item{mode}{mode.}

\item{fitting_by}{fitting_by.}

\item{min_shared_counts}{min_shared_counts.}

\item{n_pcs}{n_pcs.}

\item{n_neighbors}{n_neighbors.}

\item{approx}{approx.}

\item{stream_smooth}{stream_smooth.}

\item{stream_density}{stream_density.}

\item{arrow_length}{arrow_length.}

\item{arrow_size}{arrow_size.}

\item{arrow_density}{arrow_density.}

\item{calculate_velocity_genes}{calculate_velocity_genes.}

\item{n_jobs}{n_jobs.}

\item{dpi}{dpi.}

\item{save}{save.}

\item{dirpath}{dirpath.}

\item{fileprefix}{fileprefix.}

\item{return_seurat}{}

\item{h5ad}{h5ad file path.}
}
\value{
A \code{anndata} object.
}
\description{
scVelo is a scalable toolkit for RNA velocity analysis in single cells.
This function performs scVelo workflow in R by reticulate.
}
\examples{
data("pancreas_sub")
pancreas_sub <- RunSCVELO(srt = pancreas_sub, assay_X = "RNA", group_by = "SubCellType", linear_reduction = "PCA", nonlinear_reduction = "UMAP")
head(pancreas_sub[[]])
names(pancreas_sub@assays)

FeatureDimPlot(pancreas_sub, c("stochastic_length", "stochastic_confidence"))
FeatureDimPlot(pancreas_sub, "stochastic_pseudotime")
VelocityPlot(pancreas_sub, reduction = "UMAP", plot_type = "stream")
CellDimPlot(pancreas_sub, group.by = "SubCellType", reduction = "UMAP", pt.size = NA, velocity = "stochastic")

pancreas_sub <- Standard_SCP(pancreas_sub, normalization_method = "SCT", nonlinear_reduction = "tsne")
pancreas_sub <- RunSCVELO(srt = pancreas_sub, assay_X = "SCT", group_by = "SubCellType", linear_reduction = "Standardpca", nonlinear_reduction = "StandardTSNE2D")

}
