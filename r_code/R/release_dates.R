release_dates <- function(fred_id)
  {
  release_id <- get_release_id(fred_id)
  start_date <- start_date(fred_id)
  endpoint <- 'release/dates?release_id='

  data <- call_fred_api(endpoint, release_id)
  dates <- as.Date(data[['release_dates.date']])
  dates_to_download <- dates[dates >= start_date]
  if (length(dates_to_download) %% 2 != 0)
  {
    dates_to_download <- dates_to_download[-1]
  }

  return(dates_to_download)
  }
