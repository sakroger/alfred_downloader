download_fred_csv <- function(fred_id,start_date)
  {
  fred_data_filename <- paste0(tempdir(), fred_id,'.csv')
  endpoint <- 'series/observations?series_id='
  id <- paste0(fred_id,'&output_type=4&&realtime_start=',start_date,'&')
  #Output Type 4 is as reported



  data <- call_fred_api(endpoint, id)
  data <- data[c('observations.date','observations.value')]
  file.remove(fred_data_filename)
  write.csv(data, file = fred_data_filename, row.names = FALSE)


  }
