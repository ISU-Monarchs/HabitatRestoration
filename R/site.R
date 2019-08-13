#' Site
#'
#' This data set contains data detailing in-plot milkweed and grass native status in 2016 before site prep began, site preparation (mowing/herbicides) in 2016, and soil series information.
#' 
#' @section Variable Notes:
#' 
#' All soils and drainage class information is sourced from USDA-NRCS Web Soil Survey.
#'
#' @format A data frame with the following variables:
#' \itemize{
#'   \item siteID: id of the site
#'   \item transectID: id of the transect
#'   \item 2016_milkweed_in_plot: 'yes' 'no' presence/absence for if milkweed was present in plot in 2016
#'   \item 2016_csg_native_status: native status of cool season grass present in plots in 2016. 
#'   This data can inform 'csg' variable in 'cover' dataset.
#'   Options are 'introduced' 'native and introduced' and 'native'.
#'   \item 2016_wsg_native_status: native status of warm season grass present in plots in 2016. 
#'   This data can inform 'wsg' variable in 'cover' dataset.
#'   Options are 'introduced' 'native and introduced' and 'native'.
#'   \item previous_mowing: historical site mowing/residue removal frequency/type prior to 2016.
#'   Options are 'none' 'once' 'monthly' 'hayed often' 'harvest' 'lawn'
#'   \item 2016_mowing: mowing/residue removal activity and frequency in 2016 as a component of site preparation.
#'   Options are 'none' 'once' 'monthly' 'hayed once' 'hayed often' 'harvest' 'lawn'.
#'   \item 2016_herbicide: herbicide product applied and number of applications. 
#'   Each herbicide name equals 1 herbicide application.
#'   Options are: 'glyphosate' 'glyphosate glyphosate' 'glyphosate glufosinate glyphosate' 'clethodim' and 'clethodim glyphosate'  
#'   \item drainage_class1: drainage class of 'soil_series1'
#'   \item soil_series1: soil series comprising the largest area of the plot
#'   \item soil_texture1: soil texture of 'soil_series1'
#'   \item drainage_class2: drainage class of 'soil_series2'
#'   \item soil_series2: soil series comprising the second largest area of the plot
#'   \item soil_texture2: soil texture of 'soil_series2'
#'   \item drainage_class3: drainage class of 'soil_series3'
#'   \item soil_series3: soil series comprising the third largest area of the plot
#'   \item soil_texture3: soil texture of 'soil_series3'
#' }
#' @format A data frame with the variables above.
"site"