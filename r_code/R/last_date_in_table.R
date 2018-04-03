last_date_in_table <- function(fred_id){
  start_date <- sql_query(paste0('SELECT max(dt) as dt from',fred_id,';'))
  if (nchar(start_date) > 12)
    {
    return(01-01-1950)
    }
  else
    {
    start_date <- start_date[1,1]
    return(start_date)
    }
  }
