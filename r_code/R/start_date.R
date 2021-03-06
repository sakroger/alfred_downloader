start_date <- function(fred_id)
  {
  table_name <- fred_id
  #temp_table_name <- paste0(table_name,'_temp')
  #table_state <-table_exists(fred_id)
  default_start_date <- '2017-01-01'

  start_date <- sql_query(sprintf('SELECT max(dt) as dt from %s;',table_name))
  if (is.character(start_date == TRUE))
    {
    start_date <- default_start_date
    }
  if(is.character(start_date) == FALSE)
    {
    start_date <- start_date[1,1]
    if (is.na(start_date))
      {
      start_date<- default_start_date
      }
    }

  return(start_date)
  }
