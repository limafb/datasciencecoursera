old.wd <- getwd()
new.wd <- ("D:/Cursos/Coursera/DataScience/GettingAndCleaningData/W1")
setwd(new.wd)

library(xlsx)

if (!file.exists("data")) {
    dir.create("data")
}


fileUrl <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx")

download.file(fileUrl, destfile = "data/gov_NGAP.xlsx", mode = "wb")
list.files("data")

dateDownloaded <- date()
dateDownloaded

colIndex <- 7:15
rowIndex <- 18:23

dat <- read.xlsx("./data/gov_NGAP.xlsx", sheetIndex = 1, header = TRUE, colIndex = colIndex, rowIndex = rowIndex)
head(dat)

sum(dat$Zip*dat$Ext,na.rm=T)

setwd(old.wd)
