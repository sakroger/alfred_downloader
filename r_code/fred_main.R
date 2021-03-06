library(fred)
library(readr)
library(RODBC)
library(httr)
library(jsonlite)


path_to_fred_list <- 'C:\\Users\\sakro\\Desktop\\derek\\fred-master\\fred_list.csv'
vector_of_keywords <- c('interest','treasury','employment','gdp')

create_fred_list(path_to_fred_list, vector_of_keywords)


fred_id_list <- 'C:\\Users\\sakro\\Desktop\\derek\\fred-master\\fred_list.csv'
fred_id_list <- readr::read_csv(fred_id_list)
fred_id_list <- fred_id_list[['fred_id_list']]



update_fred_db_url(fred_id_list)

create_fred_master_table(fred_id_list)
