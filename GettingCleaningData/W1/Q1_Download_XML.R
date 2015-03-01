old.wd <- getwd()
new.wd <- ("D:/Cursos/Coursera/DataScience/GettingAndCleaningData/W1")
setwd(new.wd)

library(XML)

if (!file.exists("data")) {
    dir.create("data")
}


fileUrl <- ("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml")

doc <- xmlTreeParse(fileUrl, useInternal = TRUE)

dateDownloaded <- date()
dateDownloaded

rootNode <- xmlRoot(doc)
rootNode

names(rootNode)

rootNode[[1]][[1]][[2]]

zipcode <- (xpathSApply(rootNode, "//zipcode", xmlValue))
zipcode

zipcode[zipcode == 21231]

setwd(old.wd)
