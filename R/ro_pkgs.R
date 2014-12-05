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
#   out <- lapply(1:5, gh_repos)
#   pkgs <- sort(unique(sapply(do.call(c, out), "[[", "name")))
#
# gh_repos <- function(page = 1, owner = "ropensci", ...) {
#   req <- GET(sprintf("https://api.github.com/orgs/%s/repos", owner),
#              query=list(page=page), ...)
#   process_result(req)
# }
#
# make_url <- function(x, y, z) {
#   sprintf("https://api.github.com/repos/%s/%s/%s", x, y, z)
# }
#
# process_result <- function(x) {
#   stop_for_status(x)
#   if (!x$headers$`content-type` == "application/json; charset=utf-8")
#     stop("content type mismatch")
#   tmp <- content(x, as = "text")
#   jsonlite::fromJSON(tmp, FALSE)
# }
