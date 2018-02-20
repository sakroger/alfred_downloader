sql_query <- function(query, stringsAsFactors = F)
  {
  dbconn <- get_connection()

  if (grepl('SELECT', query))
    {
    x <- RODBC::sqlQuery(dbconn,query,stringsAsFactors = stringsAsFactors)
    }
  else
    {
    x <- RODBC::odbcQuery(dbconn,query)
    }

  RODBC::odbcClose(dbconn)

  return(x)
  }
