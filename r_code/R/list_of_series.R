list_of_series <- function(keyword)
{
  endpoint <- 'series/search?search_text='
  data <- call_fred_api(endpoint, keyword)
  frequency_list <- c('Daily')
  filtered <- c()

  #Currently only has top 1000 most popular here is a link to the api
  #https://research.stlouisfed.org/docs/api/fred/series_search.html
  #Probably can get all results using offset

  for (row in 1:nrow(data))
  {
    if (grepl ('DISCONTINUED',  data[[row,'seriess.title']]) == FALSE)
    {
      filtered <- c(filtered, data[[row,'seriess.id']])
    }
  }

  data <- data[(data$seriess.id %in% filtered),]

    return(data)
}
