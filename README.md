
[![Project Status: Active ? The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) [![Build Status](https://travis-ci.org/stephlocke/Rtraining.svg?branch=master)](https://travis-ci.org/stephlocke/Rtraining) [![packageversion](https://img.shields.io/badge/Package%20version-1.3.23-orange.svg?style=flat-square)](commits/master) [![minimal R version](https://img.shields.io/badge/R%3E%3D-3.1.2-6666ff.svg)](https://cran.r-project.org/) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/Rtraining)](https://cran.r-project.org/package=Rtraining)

------------------------------------------------------------------------

[![Last-changedate](https://img.shields.io/badge/last%20change-2016--07--15-yellowgreen.svg)](/commits/master)

<!-- README.md is generated from README.Rmd. Please edit that file -->
This package contains Steph Locke's materials for various presentations and hands-on labs about R. View the training materials on [stephlocke.github.io/Rtraining](http://stephlocke.github.io/Rtraining/).

Get it
------

Rtraining is also available for you to download, play with, and amend as you see fit. To get a local copy, use git clone or via Rstudio create a New Project from source control and use <https://github.com/stephlocke/Rtraining.git>

You can install Rtraining if you choose:

``` r
if (!require(devtools)) install.packages("devtools")
devtools::install_github("stephlocke/Rtraining")
```

Packages
--------

Many useful packages will be downloaded when this package of R training notes downloads. These are all contained in a separate package that acts a regularly update-able manifest - whenever I think a new package deserves to go on the list, the package version will be incremented so running `install_github("stephlocke/pkgRecommendations")` will get you the latest packages.

``` r
if (!require(devtools)) install.packages("devtools")
devtools::install_github("stephlocke/pkgRecommendations")
```

Important Contents
------------------

-   [`inst/slidedecks`](./inst/slidedecks) for presentations
-   [`inst/handouts`](./inst/handouts) for standalone docs on topics
-   [`inst/workshops`](./inst/workshops) for any longer materials
