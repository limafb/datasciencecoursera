old.wd <- getwd()
new.wd <- ("D:/Cursos/Coursera/DataScience/GettingAndCleaningData/W2")
setwd(new.wd)


install.packages("sqldf")

library(sqldf)

if (!file.exists("data")) {
  dir.create("data")
}


fileUrl <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")

download.file(fileUrl, destfile = "data/AmericanComunitySurvey.csv", mode = "wb")
list.files("data")

dateDownloaded <- date()
dateDownloaded

acs <- read.csv("data/AmericanComunitySurvey.csv", header = TRUE)
head(acs)
names(acs)

acs$pwgtp1

query <- ("select pwgtp1 from acs where AGEP < 50")

acs_sub <- sqldf(query)
acs_sub$pwgtp
