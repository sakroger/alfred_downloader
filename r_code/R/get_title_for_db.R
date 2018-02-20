get_title_for_db <- function()
  {
  endpoint <- 'series?series_id='
  data <- call_fred_api(endpoint, fred_id)
  title <- data[[6]]
  return(title)
  }
