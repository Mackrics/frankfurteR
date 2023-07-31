#' Retrieve exchange rates over time from frankfurter.app
#'
#' Retrieves a time series of a exchange rate between specified dates 
#'
#' @param from_currency currency you want to convert from
#' @param to_currency currency you want to convert to
#' @param start_date start date of time-series
#' @param end_date end date of time-series
#' @export get_historical_exr
get_historical_exr <- function(from_currency, to_currency, start_date, end_date = Sys.Date()) {
  rate <- rates <- NULL
  base <- "https://api.frankfurter.app/"
  from <- paste0("from=", from_currency)
  to <- paste0("to=", to_currency)
  jsonlite::fromJSON(paste0(base, start_date, "..", end_date, "?", "amount=1&", from, "&", to)) |>
  tibble::as_tibble() |>
  dplyr::mutate(
    date = as.Date(names(purrr::pluck(rates))),
    rate = unlist(purrr::pluck(rates)),
    from = {{ from_currency }},
    to = {{ to_currency }}
  ) |>
  dplyr::select(from, to, date, rate)
}
