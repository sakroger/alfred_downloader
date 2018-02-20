#' checks for valid table
#'
#' @param tableName
#'
#' @return T if exists
#' @export
#'
#' @examples
#' tableExists("not_there")
tableExists <- function(tableName) {
  sql<- paste0("Select count(*) as ct from ", tableName)
  result<- sql_query(sql)
  is.data.frame(result)
}
