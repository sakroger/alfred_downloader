download_loop_fred_csv <- function()
  {
  dates_to_download <- release_dates()
  number_of_dates <- length(dates_to_download)

  for (a in 1:number_of_dates)
    {
      real_date_early <- dates_to_download[a]
      real_date_late <- dates_to_download[a+1]
      fred_data_url <- paste0('https://fred.stlouisfed.org/graph/fredgraph.csv?cosd=',real_date_early,'&coed=',real_date_late,'&realtime_start=',real_date_early,'&realtime_end=',real_date_late,'&id=',fred_id)
      if (is.na(real_date_late))
        {
        }
      else
        {
      download.file(fred_data_url, fred_data_filename, quiet = TRUE, mode = 'a')
        }
    }
  }

