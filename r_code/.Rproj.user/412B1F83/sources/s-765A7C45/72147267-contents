library(fred)
library(readr)
library(RODBC)
library(httr)
library(jsonlite)

sql_sign_in_info <- 'driver={SQL Server};server=desktop-m9e5cke;database=fred_stuff;uid=sakroger;pwd=123'
download_path <-  'C:\\Users\\sakro\\Desktop\\derek\\fred-master\\fred_csv\\'
fred_id_list <- c('T10YIE', 'T10Y2Y')
#dbconn <- get_connection()
fred_id_list <- c('FEDFUNDS')
for (fred_id in fred_id_list)
  {
  fred_data_filename <- paste0(download_path, fred_id,'.csv')

  title <- get_title_for_db()

  file.remove(fred_data_filename)
  download_loop_fred_csv()

  data <- format_fred_csv(fred_data_filename)
}
  #result <- sql_query(sprintf("DROP TABLE IF EXISTS %s",tempTableName))

  varTypes <- list(dt = 'Date')
  varTypes[[title]] <- 'float'

  #if (table_exists)
  #  {
#
 #   RODBC::sqlSave(dbconn, data, tablename = tempTableName, rownames=FALSE, append = T, fast=T, varTypes = varTypes)
  #  RODBC::odbcClose(dbconn)
#
 #   sql = sprintf('delete a from %s a inner join %s b on a.dt=b.dt;
  #                insert into %s select * from %s;
   #               drop table %s;',tableName, tempTableName, tableName, tempTableName, tempTableName)
    #result<-sql_query(sql)
    #}
    #else
    #{
#
  #  RODBC::sqlSave(dbconn, data, tablename = tableName, rownames=FALSE, append = F, fast=T, varTypes = varTypes)
  #  RODBC::odbcClose(dbconn)
  #  sql = sprintf('ALTER TABLE %s ADD  CONSTRAINT PK_%s PRIMARY KEY CLUSTERED ([dt] ASC ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]',
  #                tableName, fredId)
  #  result<-sql_query(sql)
  #  }










  #sql <- paste0('TRUNCATE TABLE [', title,' temp]')
  #sql_query(sql)


  #RODBC::sqlSave(dbconn, data, tablename = paste0(title,' temp'),rownames=FALSE, append = T, fast=T, varTypes = varTypes)

  #sql = paste0('delete a from [',title,'] a inner join [',title,' temp] b on a.dt=b.dt;insert into [',title,'] select * from [',title,' temp] ;truncate table [',title,' temp];')
  #sql_query(sql)

  #RODBC::odbcClose(dbconn)
  }

