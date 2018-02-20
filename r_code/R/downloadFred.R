#' Downloads data from Fred and inserts into table with same name as field
#'
#' @param startDate
#' @param fredId
#'
#' @return nothing
#' @export
#'
#' @examples
#' downloadFred()
downloadFred <- function(fredId = 'T10YIE', startDate = NULL){

  tableName <- trimws(paste0('fred.',fredId))
  tempTableName <- paste0(tableName,'_temp')
  table_exists <-tableExists(tableName)

  if(!table_exists) {
    startDate <-'1990-01-01'
  }

  if(is.null(startDate)){
    startDate <- tsQuery(sprintf('select max(dt) as dt from %s;',tableName))
    startDate <- startDate[1,1]
    if(is.na(startDate)) {
      startDate <-'1990-01-01'
    }
  }

  startDate<- as.Date(startDate)

  #url <- paste0('https://fred.stlouisfed.org/graph/fredgraph.csv?cosd=',startDate,'&coed=', Sys.Date(),'&id=',fredId)
  url <- paste0('https://fred.stlouisfed.org/graph/fredgraph.csv?cosd=',startDate,'&id=',fredId)
  csvFile <- paste0(tempdir(),fredId,".csv")
  download.file(url, csvFile)

  x <- readr::read_csv(csvFile)
  names(x) <- c("dt",fredId)

  x[[fredId]] <- as.numeric(x[[fredId]])
  x <- x[complete.cases(x),]

  result <- tsQuery(sprintf("DROP TABLE IF EXISTS %s",tempTableName))

  varTypes <- list(dt = 'Date')
  varTypes[[fredId]] <- 'float'

  if (table_exists) {
    tscon <- getConnection()
    RODBC::sqlSave(tscon, x, tablename = tempTableName, rownames=FALSE, append = T, fast=T, varTypes = varTypes)
    RODBC::odbcClose(tscon)

    sql = sprintf('delete a from %s a inner join %s b on a.dt=b.dt;
                  insert into %s select * from %s;
                  drop table %s;',tableName, tempTableName, tableName, tempTableName, tempTableName)
    result<-tsQuery(sql)
  } else {
    tscon <- getConnection()
    RODBC::sqlSave(tscon, x, tablename = tableName, rownames=FALSE, append = F, fast=T, varTypes = varTypes)
    RODBC::odbcClose(tscon)
    sql = sprintf('ALTER TABLE %s ADD  CONSTRAINT PK_%s PRIMARY KEY CLUSTERED ([dt] ASC ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]',
                  tableName, fredId)
    result<-tsQuery(sql)
  }

}





