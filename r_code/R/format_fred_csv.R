format_fred_csv <- function(fred_id)
  {
  file <- paste0(tempdir(),fred_id,'.csv')
  file <- readr::read_csv(file)

  names(file) <- c('col1','col2')
  file $col2 <- as.numeric(file$col2)
  names(file) <- c('dt', fred_id)
  file <- file[complete.cases(file),]
  }
