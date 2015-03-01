old.wd <- getwd()
new.wd <- ("E:/Cursos/Coursera/Data_Analisys/Getting&Cleaning/W3/data")
setwd(new.wd)

install.packages("downloader")

library(downloader)
download("https://raw.githubusercontent.com/thoughtfulbloke/faoexample/master/appleorange.csv", destfile="appleorange.csv")
download("https://raw.githubusercontent.com/thoughtfulbloke/faoexample/master/stability.csv", destfile="stability.csv")

list.files()

ao <- read.csv("appleorange.csv")
str(ao)

aoraw <- read.csv("appleorange.csv", stringsAsFactors=FALSE, header=FALSE)
str(aoraw)

head(aoraw,10)
tail(aoraw,10)

aodata <- aoraw[3:700,]
names(aodata) <- c("country", "countrynumber", "products", "productnumber", "tonnes", "year")
aodata$countrynumber <- as.integer(aodata$countrynumber)

fslines <- which(aodata$country == "Food supply quantity (tonnes) (tonnes)")
aodata <- aodata[(-1 * fslines),]

aodata$tonnes <- gsub("\xca", "", aodata$tonnes)
aodata$tonnes <- gsub(", tonnes \\(\\)", "", aodata$tonnes)
aodata$tonnes <- as.numeric(aodata$tonnes)

aodata$year <- 2009

str(aodata)
