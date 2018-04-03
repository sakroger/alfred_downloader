get_freq_of_release <- function(fred_id)
  {
  endpoint <- 'series?series_id='
  data <- call_fred_api(endpoint, fred_id)
  data<- data[['seriess.frequency']]
  if (data != 'Daily')
    {
    return(FALSE)
    }
  else
    {
    return(TRUE)
    }
}
