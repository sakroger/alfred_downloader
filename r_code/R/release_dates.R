release_dates <- function()
  {
  release_id <- get_release_id()
  #start_date <- start_date()
  start_date <- '2016-01-01'
  endpoint <- 'release/dates?release_id='

  data <- call_fred_api(endpoint, release_id)

  data <- data[9]
  dates_to_download <- c()
  for(i in 1:nrow(data))
    {
    current_date <- data[i,]

    if(start_date <= current_date)
      {
      dates_to_download <- c(dates_to_download, current_date)
      }
    }


  return(dates_to_download)
  }
