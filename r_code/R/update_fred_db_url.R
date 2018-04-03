update_fred_db_url <- function(fred_id_list)
  {

  download_path <-  paste0(tempdir())

  dbconn <- get_connection()

  for (fred_id in fred_id_list)
      {

      fred_data_filename <- paste0(download_path, fred_id,'.csv')

      file.remove(paste0(download_path, fred_id,'.csv'))

      start_date <- start_date(fred_id)
      download_fred_csv(fred_id, start_date)

      data <- format_fred_csv(fred_id)

      table_name <- fred_id
      temp_table_name <- paste0(fred_id,'_temp')

      sql_query(sprintf("DROP TABLE IF EXISTS %s",temp_table_name))

      varTypes <- list(dt = 'Date')
      varTypes[[fred_id]] <- 'float'

      if (start_date != '2017-01-01')
          #Table exists
        {
        RODBC::sqlSave(dbconn, data, tablename = temp_table_name, rownames=FALSE, append = T, fast=T, varTypes = varTypes)


        sql = sprintf('delete a from %s a inner join %s b on a.dt=b.dt;
                      insert into %s select * from %s;
                      drop table %s;',table_name, temp_table_name, table_name, temp_table_name, temp_table_name)
       sql_query(sql)
        }
      else
        {

        RODBC::sqlSave(dbconn, data, tablename = table_name, rownames=FALSE, append = F, fast=T, varTypes = varTypes)

        sql = sprintf('ALTER TABLE [%s] ALTER COLUMN [dt] DATE NOT NULL', table_name)

        sql_query(sql)

        sql = sprintf('ALTER TABLE %s ADD  CONSTRAINT PK_%s PRIMARY KEY CLUSTERED ([dt] ASC ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]',
                      table_name, table_name)
        sql_query(sql)
        }


    }
  RODBC::odbcClose(dbconn)
  }
