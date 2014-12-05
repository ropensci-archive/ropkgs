#' Install ropensci packages
#'
#' @import devtools
#' @export
#'
#' @param pkgs One or more packages to install
#' @param type character; Only source for now, but hopefully soon support binaries.
#' @param ... Named options passed on to \code{\link[devtools]{install}}
#' @details Only installs source (non-binary) packages from GitHub for now.
#' @examples \donttest{
#' install_ropensci(pkgs = 'musemeta')
#' install_ropensci(pkgs = 'musemeta', quiet = TRUE)
#' install_ropensci(pkgs = c('musemeta','rerddap'))
#' install_ropensci(pkgs = 'alm', ref = "v0.3.0")
#'
#' # not found
#' install_ropensci(pkgs = 'stuffthings')
#' }
install_ropensci <- function(pkgs, type = "source", ...){
  notro <- pkgs[!is_ropensci(pkgs)]
  if(length(notro) > 0) warning(sprintf("Not ropensci packages: %s", paste0(notro, collapse = ", ")), call. = FALSE)
  pkgs <- paste0("ropensci/", pkgs)
  devtools::install_github(pkgs, ...)
}
