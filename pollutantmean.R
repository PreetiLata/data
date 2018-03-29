library("data.table")


pollutantmean <- function(directory, pollutant, id = 1:332) {
      
      
      filenames <- paste0(directory, '/', formatC(id, width=3, flag="0"),".csv" )
      
      ##try filenames <- paste0(directory, '/', ".csv" ) gives  Error in FUN(X[[i]], ...) : File 'specdata/.csv' does not exist.
      ##try filenames <- paste0(directory, '/', "*.csv" ) gives File 'specdata/*.csv' does not exist.
      ##try filenames <- paste0(directory, '/', formatC(id, width=3, flag="0"),"*.csv" ) gives File 'specdata/001*.csv' does not exist.
      
      lst <- lapply(filenames, fread)
      dt<- rbindlist(lst)
      
      if (c(pollutant) %in% names(dt)){  ##  %in% searches for pollutant in column names
      
        return(dt[, lapply(.SD, mean, na.rm = TRUE), .SDcols = pollutant][[1]])
        
        ##[[1]] returns (1,1) of selected SD(.SD stands for something like "Subset of Data.table". )
        ##DT[, c(.(y=max(y)), lapply(.SD, min)), by=rleid(v), .SDcols=v:b]      # compute 'j' for each consecutive runs of 'v'
        ##For more, use ?.SD
        
       } 
      pollutants_mean
}

