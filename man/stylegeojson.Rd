\name{stylegeojson}
\alias{stylegeojson}
\title{Style a data.frame prior to converting to geojson.}
\usage{
  stylegeojson(input, var = NULL, var_col = NULL,
    var_sym = NULL, var_size = NULL, color = NULL,
    symbol = NULL, size = NULL)
}
\arguments{
  \item{input}{A data.frame}

  \item{var}{A single variable to map colors, symbols,
  and/or sizes to.}

  \item{var_col}{The variable to map colors to.}

  \item{var_sym}{The variable to map symbols to.}

  \item{var_size}{The variable to map size to.}

  \item{color}{Valid RGB hex color}

  \item{symbol}{An icon ID from the Maki project
  \url{http://www.mapbox.com/maki/} or a single
  alphanumeric character (a-z or 0-9).}

  \item{size}{One of "small", "medium", or "large"}
}
\description{
  Style a data.frame prior to converting to geojson.
}
\examples{
\dontrun{
# Get data and save map data
splist <- c('Accipiter erythronemius', 'Junco hyemalis', 'Aix sponsa')
out <- occurrencelist_many(splist, coordinatestatus = TRUE, maxresults = 50)
dat <- gbifdata(out)
names(dat)[names(dat) \%in\%
   c("decimalLatitude","decimalLongitude")] <- c("latitude","longitude")
dat2 <- stylegeojson(input=dat, var="taxonName", color=c("#976AAE","#6B944D","#BD5945"),
   size=c("small","medium","large"))
head(dat2)
}
}
\seealso{
  \code{\link{togeojson}}
}

