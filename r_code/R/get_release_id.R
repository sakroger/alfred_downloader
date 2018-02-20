get_release_id <- function()
  {
  endpoint <- 'series/release?series_id='

  data <- call_fred_api(endpoint, fred_id)
  release_id <- toString(data[[3]])

  return(release_id)
  }

