call_fred_api <- function(endpoint, id)
  {
  api_key <- 'api_key=126d3dfc43a4e7dfa2fb15bd3cfaac03'
  url_fred <- 'https://api.stlouisfed.org/fred/'



  call <- paste0(url_fred,endpoint, id,'&',api_key,'&file_type=json')
  data <- httr::GET(call)
  data<- httr::content(data, 'text')
  data <- fromJSON(data, flatten = FALSE)
  data <- as.data.frame(data)

  return(data)
  }
