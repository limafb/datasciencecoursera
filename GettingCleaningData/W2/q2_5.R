?read.fwf
old.wd <- getwd()
new.wd <- ("D:/Cursos/Coursera/DataScience/GettingAndCleaningData/W2")
setwd(new.wd)

if (!file.exists("data")) {
  dir.create("data")
}


fileUrl <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")

download.file(fileUrl, destfile = "data/wksst8110.for", mode = "wb")
list.files("data")

dateDownloaded <- date()
dateDownloaded

dat_1 <- read.fwf("data/wksst8110.for", widths = c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip = 4)

sum(dat_1$V4, na.rm = T)
