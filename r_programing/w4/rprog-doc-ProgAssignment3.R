old.wd <- getwd()
new.wd <- ("D:/Cursos/Coursera/DataScience/R-Programing/W4")
setwd(new.wd)

if (!file.exists("data")) {dir.create("data")}

new.wd <- ("D:/Cursos/Coursera/DataScience/R-Programing/W4/data")
setwd(new.wd)


fileUrl <- ("https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip")

destfile <- ("ProgAssignment3-data.zip")

download.file(fileUrl, destfile, mode = "wb")
list.files("data")
list.files()

unzip(destfile, exdir = ".")
