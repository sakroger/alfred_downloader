start_date <- function()
  {
  tableName <- trimws(paste0('fred.',title))
  tempTableName <- paste0(tableName,'_temp')
  table_exists <-tableExists(tableName)

  if(!table_exists)
    {
    #startDate <-'1990-01-01'
    startDate <- '2010-01-01'
    }

  if(is.null(startDate))
    {
    startDate <- sql_query(sprintf('select max(dt) as dt from %s;',tableName))
    startDate <- startDate[1,1]

    if(is.na(startDate))
      {
      startDate <-'1990-01-01'
      }
    }

  startDate<- as.Date(startDate)
  return(startDate)
  }
