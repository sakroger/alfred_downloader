get_title_for_db <- function(fred_id)
  {
  endpoint <- 'series?series_id='
  data <- call_fred_api(endpoint, fred_id)
  title <- data[['seriess.title']]
  return(title)
  }
