#' Retrieve latest exchange rate frankfurter.app
#'
#' Retrieves the latest exchange rate between specified dates
#'
#' @param from_currency currency you want to convert from
#' @param to_currency currency you want to convert to
#' @export get_latest_exr
get_latest_exr <- function(from_currency, to_currency) {
  base <- "https://api.frankfurter.app/latest?amount=1"
  from <- paste0("from=", from_currency)
  to <- paste0("to=", to_currency)
  response <- jsonlite::fromJSON(paste0(base, "&", from, "&", to))
  about <- paste0(response$base,"/", names(response$rates[1]), "_", response$date)
  output <- stats::setNames(response$rates[[1]], about)
  return(output)
}
