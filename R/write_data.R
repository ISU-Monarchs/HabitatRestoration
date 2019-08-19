#' Write all package \code{data.frame}s as csv files
#' 
#' Writes all \code{data.frame}s in the ISUmonarch package as csv files to the 
#' path specified.
#' 
#' @param path string containing directory to write files to
#' @param ... passed to \code{write.csv} except \code{row.names} which is set 
#' to FALSE
#' @examples 
#' \dontrun{
#' write_data()
#' }
write_data <- function(path = "./",...) {
  packages <- data(package="ISUmonarch")$results[,3]
  for (package in packages) {
    write.csv(get(package), 
              file=paste0(path,package,".csv"),
              row.names = FALSE,
              ...)
  }
}
