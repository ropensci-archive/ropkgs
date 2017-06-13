ropkgs
=======



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
#> [1] "ropensci_registry"
```

```r
out$version
```

```
#> [1] 0.1
```

```r
out$updated
```

```
#> [1] "2014-12-05"
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
#>     category on_cran cran_archived                                   url
#> 1 altmetrics    TRUE            NA       https://github.com/ropensci/alm
#> 2    biology    TRUE            NA    https://github.com/ropensci/AntWeb
#> 3 literature    TRUE            NA     https://github.com/ropensci/aRxiv
#> 4 literature    TRUE            NA       https://github.com/ropensci/bmc
#> 5    biology    TRUE            NA      https://github.com/ropensci/bold
#> 6 altmetrics   FALSE            NA https://github.com/ropensci/citeulike
#>                                                                                                                                                                                            description
#> 1 R wrapper to the almetrics API platform developed by PLoS  API -other publishers have built on this and work out of the box: CrossRef, Copernicus Publishers, and the Public Knowledge Project (PKP)
#> 2                                                                                     Access data from the world's largest ant database. Maintained and developed by the California Academy of Science
#> 3                                                                                                                                                              Access to the aRxiv preprint repository
#> 4                                                                                                                                  An R interface to Biomed Central (BMC) search API and full text XML
#> 5                                                                                                                                                R client for BOLD Systems (Barcode Of Life Database).
#> 6                                                                                                                                                                             R interface to CiteULike
```

## Filter packages

Filter by category


```r
ro_pkgs(category = "history", simplify=TRUE)
#>              name    type status category on_cran cran_archived
#> 18         gender package   good  history    TRUE            NA
#> 24    historydata package   good  history    TRUE            NA
#> 92  USAboundaries package   good  history    TRUE            NA
#> 98       musemeta package   good  history   FALSE            NA
#> 99          rdpla package   good  history   FALSE            NA
#> 102    reuropeana package   good  history   FALSE            NA
```

Filter by maintainer


```r
ro_pkgs(maintainer = "Lincoln Mullen", simplify=TRUE)
#>             name    type status category on_cran cran_archived
#> 18        gender package   good  history    TRUE            NA
#> 24   historydata package   good  history    TRUE            NA
#> 92 USAboundaries package   good  history    TRUE            NA
```

## Search for packages


```r
ro_pkgs(query = "species", simplify = TRUE)
#>      name    type status category on_cran cran_archived
#> 37  rAvis package   good  biology    TRUE            NA
#> 50   reol package   good  biology    TRUE            NA
#> 56  rgbif package   good  biology    TRUE            NA
#> 85  spocc package   good  biology    TRUE            NA
#> 89 traits package   good  biology   FALSE            NA
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
