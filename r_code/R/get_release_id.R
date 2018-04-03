get_release_id <- function(fred_id)
  {
  endpoint <- 'series/release?series_id='

  data <- call_fred_api(endpoint, fred_id)
  release_id <- toString(data[['releases.id']])

  return(release_id)
  }

