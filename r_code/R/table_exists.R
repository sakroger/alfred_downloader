#' checks for valid table
#'
#' @param tableName
#'
#' @return T if exists
#' @export
#'
#' @examples
#' tableExists("not_there")
table_exists <- function(table_name)
  {
  sql<- paste0("SELECT count(*) as ct from ", table_name)
  result<- sql_query(sql)
  is.data.frame(result)
  }
