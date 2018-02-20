format_fred_csv <- function(file)
  {
  file <- readr::read_csv(file)
  title <- get_title_for_db()

  names(file) <- c('col1','col2')
  file $col2 <- as.numeric(file$col2)
  names(file) <- c('dt',paste(title))
  file <- file[complete.cases(file),]
  }
