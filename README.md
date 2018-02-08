ropkgs
=======

[![Project Status: Abandoned – Initial development has started, but there has not yet been a stable, usable release; the project has been abandoned and the author(s) do not intend on continuing development.](http://www.repostatus.org/badges/latest/abandoned.svg)](http://www.repostatus.org/#abandoned)

`ropkgs` is an R client to discover and install rOpensci packages.

## Installation


```r
# install.packages("devtools")
devtools::install_github("ropensci/ropkgs")
```


```r
library("ropkgs")
```

## List all packages


```r
out <- ro_pkgs()
out$name
```

```
#> [1] "ropensciregistry"
```

```r
out$version
```

```
#> [1] "1.2.6"
```

```r
out$updated
```

```
#> [1] "2017-11-13"
```

```r
head( out$packages )
```

```
#>        name    type        maintainer                    email     status
#> 1       alm package Scott Chamberlain  myrmecocystus@gmail.com       good
#> 2    AntWeb package       Karthik Ram    karthik.ram@gmail.com       good
#> 3     aRxiv package       Karl Broman kbroman@biostat.wisc.edu       good
#> 4       bmc package Scott Chamberlain  myrmecocystus@gmail.com       good
#> 5      bold package Scott Chamberlain  myrmecocystus@gmail.com       good
#> 6 citeulike package Scott Chamberlain  myrmecocystus@gmail.com deprecated
#>   installable ropensci_category   category on_cran on_bioc cran_archived
#> 1       FALSE        altmetrics altmetrics    TRUE   FALSE          TRUE
#> 2        TRUE       data-access    biology    TRUE   FALSE         FALSE
#> 3        TRUE        literature literature    TRUE   FALSE         FALSE
#> 4        TRUE        literature literature   FALSE   FALSE         FALSE
#> 5        TRUE       data-access    biology    TRUE   FALSE         FALSE
#> 6        TRUE        altmetrics altmetrics   FALSE   FALSE         FALSE
#>                                     url root  fork
#> 1       https://github.com/ropensci/alm      FALSE
#> 2    https://github.com/ropensci/AntWeb      FALSE
#> 3     https://github.com/ropensci/aRxiv      FALSE
#> 4       https://github.com/ropensci/bmc      FALSE
#> 5      https://github.com/ropensci/bold      FALSE
#> 6 https://github.com/ropensci/citeulike      FALSE
#>                                                                                                                                                                                            description
#> 1 R wrapper to the almetrics API platform developed by PLoS  API -other publishers have built on this and work out of the box: CrossRef, Copernicus Publishers, and the Public Knowledge Project (PKP)
#> 2                                                                                     Access data from the world's largest ant database. Maintained and developed by the California Academy of Science
#> 3                                                                                                                                                              Access to the aRxiv preprint repository
#> 4                                                                                                                                  An R interface to Biomed Central (BMC) search API and full text XML
#> 5                                                                                                                                                R client for BOLD Systems (Barcode Of Life Database).
#> 6                                                                                                                                                                             R interface to CiteULike
#>   badges
#> 1       
#> 2       
#> 3       
#> 4       
#> 5       
#> 6
```

## Filter packages

Filter by category


```r
ro_pkgs(category = "history", simplify=TRUE)
#>            name    type status category on_cran cran_archived
#> 17       gender package   good  history    TRUE         FALSE
#> 23  historydata package   good  history    TRUE         FALSE
#> 94     musemeta package   good  history   FALSE         FALSE
#> 95        rdpla package   good  history    TRUE         FALSE
#> 98   reuropeana package   good  history   FALSE         FALSE
#> 109  genderdata package   good  history   FALSE         FALSE
```

Filter by maintainer


```r
ro_pkgs(maintainer = "Lincoln Mullen", simplify=TRUE)
#>                  name    type status                category on_cran
#> 17             gender package   good                 history    TRUE
#> 23        historydata package   good                 history    TRUE
#> 87      USAboundaries package   good           history, maps    TRUE
#> 88  USAboundariesData package   good           history, maps   FALSE
#> 104      cartographer package   good                    maps   FALSE
#> 109        genderdata package   good                 history   FALSE
#> 111   internetarchive package   good     history, literature    TRUE
#> 189        tokenizers package   good       text, text-mining    TRUE
#> 248         textreuse package   good text-mining, literature    TRUE
#>     cran_archived
#> 17          FALSE
#> 23          FALSE
#> 87          FALSE
#> 88          FALSE
#> 104         FALSE
#> 109         FALSE
#> 111         FALSE
#> 189         FALSE
#> 248         FALSE
```

## Search for packages


```r
ro_pkgs(query = "species", simplify = TRUE)
#>         name    type status                           category on_cran
#> 36     rAvis package   good                            biology    TRUE
#> 47      Reol package   good                            biology    TRUE
#> 53     rgbif package   good                            biology    TRUE
#> 54    rglobi package   good                            biology    TRUE
#> 81     spocc package   good                            biology    TRUE
#> 84    traits package   good                            biology    TRUE
#> 155     mapr package   good                maps, visualization    TRUE
#> 165 rredlist package   good        conservation, data, ecology    TRUE
#> 166    rwdpa package   good        ecology, data, conservation   FALSE
#> 172  spplist package   good             biology, ecology, data   FALSE
#> 173   spplit package   good biology, ecology, data, literature   FALSE
#> 221 wikitaxa package   good                  biology, taxonomy    TRUE
#>     cran_archived
#> 36          FALSE
#> 47          FALSE
#> 53          FALSE
#> 54          FALSE
#> 81          FALSE
#> 84          FALSE
#> 155         FALSE
#> 165         FALSE
#> 166         FALSE
#> 172         FALSE
#> 173         FALSE
#> 221         FALSE
```

## Check if a package is on CRAN


```r
on_cran('taxize')
#> $taxize
#> [1] TRUE
```

## Install packages


```r
install_ropensci(pkgs = 'musemeta')
```
