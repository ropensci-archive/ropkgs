#' List ropensci packages
#'
#' @importFrom downloader download
#' @importFrom jsonlite fromJSON
#' @export
#'
#' @param ... Named options passed on to \code{\link[devtools]{install}}
#' @examples \donttest{
#' ro_pkgs()
#' }
ro_pkgs <- function(...){
  file <- tempfile(fileext = ".json")
  download(ro_registry(), destfile=file, quiet=TRUE)
  jsonlite::fromJSON(file, ...)
}

ro_registry <- function() 'https://raw.githubusercontent.com/sckott/roregistry/master/registry.json'
