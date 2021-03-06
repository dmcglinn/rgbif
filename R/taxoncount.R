#' Search by taxon to retrieve number of records in GBIF.
#'
#' @import httr XML plyr
#' @param scientificname Scientitic name of taxon (character, see example)
#' @param rank Rank of taxon, see taxrank() (character)
#' @param dataresourcekey Filter records to those provided by the supplied
#'    numeric key for a data resource. See resources(). (character)
#' @examples \dontrun{
#' taxoncount(scientificname = 'Puma concolor')
#' taxoncount(scientificname = 'Helianthus annuus')
#' }
#' \donttest{
#' taxoncount(rank = 'family')
#' }
#' @export
taxoncount <- function(scientificname = NULL, rank = NULL, dataresourcekey = NULL)
{
	url <- "http://data.gbif.org/ws/rest/taxon/count"
	args <- compact(list(scientificname = scientificname, rank = rank,
											 dataresourcekey = dataresourcekey))
	tt <- content(GET(url, query=args))
	as.numeric(xmlGetAttr(getNodeSet(tt, "//gbif:summary", 
                                   namespaces="gbif")[[1]], "totalMatched"))
}
