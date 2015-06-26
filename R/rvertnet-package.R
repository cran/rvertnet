#' Search VertNet archives using R
#'
#' There are a variety of ways to search VertNet
#' 
#' @section Search by term:
#' 
#' Search for _Aves_ in the state of _California_, limit to 10 records, e.g.:
#' 
#' \code{searchbyterm(class = "Aves", state = "California", lim = 10, verbose = FALSE)}
#' 
#' Search for _Mustela nigripes_ in the states of _Wyoming_ or _South Dakota_, 
#' limit to 20 records, e.g.:
#' 
#' \code{searchbyterm(genus = "Mustela", specificepithet = "nigripes", 
#'    state = "(wyoming OR south dakota)", limit = 20, verbose=FALSE)}
#' 
#' @section Big data:
#' Specifies a termwise search (like `searchbyterm()`), but requests that all available records 
#' be made available for download as a tab-delimited text file.
#' 
#' \code{bigsearch(genus = "ochotona", rf = "pikaRecords", email = "big@@search.luv")}
#' 
#' @section Spatial search:
#' \code{spatialsearch(lat = 33.529, lon = -105.694, radius = 2000, limit = 10, verbose = FALSE)}
#' 
#' @section Full text search:
#' Find records using a global full-text search of VertNet archives.
#' 
#' \code{vertsearch(taxon = "aves", state = "california")}
#' 
#' @name rvertnet-package
#' @aliases rvertnet
#' @docType package
#' @title Search VertNet archives using R
#' @keywords package
NULL