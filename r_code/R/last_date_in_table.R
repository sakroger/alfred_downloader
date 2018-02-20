last_date_in_table <- function(){
  start_date <- sql_query(paste0('SELECT max(dt) as dt from',get_title_for_db(),';'))
  if (nchar(start_date) > 12)
    {
    return(01-01-1950)
    }
  else
    {
    start_date <- start_date[1,1]
    start_date <- paste0('cosd=',start_date)
    return(start_date)
    }
  }
