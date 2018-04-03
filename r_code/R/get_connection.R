get_connection<- function()
  {
  server  <- getOption("tsCreds")[['server']]
  username <- getOption("tsCreds")[['uid']]
  password <- getOption('tsCreds')[['pwd']]

  sql_sign_in_info <- paste0('driver={SQL Server};server=',server,';database=fred;Uid=',username,';Pwd=',password)
  dbconn <- RODBC::odbcDriverConnect(sql_sign_in_info)
  return (dbconn)
  }
