## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)

pollutantmean <- function(directory, pollutant, id = 1:332) {
        files_list <- dir(directory, full.names=TRUE)               #creates a list with the name of all files in the directory        
        dat_temp <- lapply(files_list[id], read.csv)
        dat <- do.call(rbind, dat_temp)                                         #creates an empety dataframe named "dat"                                    
        mean(dat[, pollutant], na.rm=T)                                          #calculates the mean of the pollutant      
}