#' Check if an ropensci package is on CRAN.
#'
#' @export
#'
#' @param pkgs One or more package names
#' @examples \donttest{
#' on_cran('taxize')
#' on_cran('musemeta')
#' on_cran(pkgs=c('taxize','musemeta'))
#' }
on_cran <- function(pkgs){
  out <- suppressWarnings(tryCatch(readRDS("~/.rodata/availpkgs.rds"), error = function(e) e))
  if(is(out, "simpleError")) {
    out <- data.frame(available.packages(), stringsAsFactors = FALSE)
    dir.create("~/.rodata/")
    saveRDS(out, "~/.rodata/availpkgs.rds")
  }
  as.list(vapply(pkgs, function(x) if(x %in% out$Package) TRUE else FALSE, logical(1)))
}
