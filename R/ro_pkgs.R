#' List ropensci packages
#'
#' @importFrom downloader download
#' @importFrom jsonlite fromJSON
#' @export
#'
#' @param query Query terms, uses \code{grep}
#' @param category Category to get, matches exactly
#' @param on_cran (logical) Whether to select only those on CRAN, default: all
#' @param maintainer (character) A maintainer name
#' @param simplify (logical) Simplify output to more important fields
#' @param ... Named options passed on to \code{\link[devtools]{install}}
#' @examples \donttest{
#' # list all packages
#' ro_pkgs()
#'
#' # query for a pacakage
#' ro_pkgs(category = "history")
#' ro_pkgs(category = "archeology")
#' ro_pkgs(category = "economics")
#' ro_pkgs(maintainer = "Scott Chamberlain")
#' ro_pkgs(on_cran = TRUE)
#' ro_pkgs(query = "species")
#' ro_pkgs(query = "alfjafaksd")
#' }

ro_pkgs <- function(query = NULL, category = NULL, on_cran = NULL,
  maintainer = NULL, simplify = FALSE, ...)
{
  file <- tempfile(fileext = ".json")
  download(ro_registry(), destfile=file, quiet=TRUE)
  out <- jsonlite::fromJSON(file, ...)
  if(length(roc(list(query, category, on_cran, maintainer))) > 1) stop("Can only query on one term", call. = FALSE)
  if(!is.null(query)){
    out <- out$packages[grep(query, out$packages$description),]
    if(NROW(out) == 0) out <- NULL
  }
  if(!is.null(category)) out <- out$packages[out$packages$category %in% category, ]
  if(!is.null(maintainer)) out <- out$packages[out$packages$maintainer %in% maintainer, ]
  if(!is.null(on_cran)) out <- out$packages[out$packages$on_cran, ]
  if(simplify) out[, c("name","type","status","category","on_cran","cran_archived")] else out
}

ro_registry <- function() 'https://raw.githubusercontent.com/ropensci/roregistry/gh-pages/registry.json'
