#' Check if an ropensci package is on CRAN.
#'
#' @export
#'
#' @param pkgs One or more package names
#' @param force_update (logical) force update? Default: `TRUE`
#' @examples \donttest{
#' on_cran(pkgs='taxize')
#' on_cran('musemeta')
#' on_cran(pkgs=c('taxize','musemeta'))
#' }
on_cran <- function(pkgs, force_update = TRUE) {
  out <- NULL
  if (!force_update) {
    out <- suppressWarnings(tryCatch(readRDS("~/.rodata/availpkgs.rds"), error = function(e) e))
  }
  if (inherits(out, "simpleError") || is.null(out)) {
    out <- data.frame(utils::available.packages(), stringsAsFactors = FALSE)
    dir.create("~/.rodata/", recursive = TRUE, showWarnings = FALSE)
    saveRDS(out, "~/.rodata/availpkgs.rds")
  }
  on_cran_(pkgs, out)
}

on_cran_ <- function(y, dat){
  as.list(
    vapply(y, function(x) {
      if (is_ropensci(x)) {
        if (x %in% dat$Package) TRUE else FALSE
      } else {
        FALSE
      }
    }, logical(1))
  )
}
