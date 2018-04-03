create_fred_list <- function(path, keyword_list)
  {
  if (file.exists(path))
    {
    file.remove(path)
    }

  fred_id_list <- c()

  for (keyword in keyword_list)
    {
    temp_list <- list_of_series(keyword)
    temp_list <- temp_list[,'seriess.id']
    fred_id_list <- union(fred_id_list,temp_list)
    }

  fred_id_list <- data.frame(fred_id_list)
  write.csv(fred_id_list, file = path, row.names = FALSE)

  }



