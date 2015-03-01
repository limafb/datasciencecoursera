old.wd <- getwd()
new.wd <- ("D:/Cursos/Coursera/DataScience/GettingAndCleaningData/W1")
setwd(new.wd)

if (!file.exists("data")) {
    dir.create("data")
}


fileUrl <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")

download.file(fileUrl, destfile = "data/housing.csv")
list.files("data")

dateDownloaded <- date()
dateDownloaded

housingData <- read.csv("./data/housing.csv", sep = ",", header = TRUE)
head(housingData)

bad <- is.na(housingData$VAL)
bad

housingData$VAL[housingData$VAL == 24 & !is.na(housingData$VAL)]

