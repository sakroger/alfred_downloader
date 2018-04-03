create_fred_master_table <- function(fred_id_list)
  {
  description <- c()
  for (fred_id in fred_id_list)
    {
      description <- c(description, get_title_for_db(fred_id))
    }
  fred_id <- fred_id_list
  master_table <- data.frame(fred_id,description)



  varTypes <- list(fred_id = 'varchar(30)',description = 'varchar(500)')

  dbconn <- get_connection()
  RODBC::sqlSave(dbconn, master_table, tablename = 'master_table', rownames=FALSE, append = F, fast=T, varTypes = varTypes)
  }
