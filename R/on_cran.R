#' Check if an ropensci package is on CRAN.
#'
#' @export
#'
#' @param pkgs One or more package names
#' @examples \donttest{
#' on_cran(pkgs='taxize')
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
  on_cran_(pkgs, out)
}

on_cran_ <- function(y, dat){
  as.list(
    vapply(y, function(x){
      if(is_ropensci(x)){
        if(x %in% dat$Package) TRUE else FALSE
      } else {
        FALSE
      }
    }, logical(1))
  )
}
