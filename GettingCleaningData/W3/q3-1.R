#Create a logical vector that identifies the households on greater than 10 acres who sold more 
#than $10,000 worth of agriculture products. Assign that logical vector to the variable 
#agricultureLogical. Apply the which() function like this to identify the rows of the data 
#frame where the logical vector is TRUE. which(agricultureLogical) What are the first 3 values 
#that result?
old.wd <- getwd()
new.wd <- ("E:/Cursos/Coursera/Data_Analisys/Getting&Cleaning/W3")
setwd(new.wd)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
codeBookUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"

if (!file.exists("data")) {dir.create("data")}

download.file(fileUrl, destfile = "data/housing.csv")
download.file(codeBookUrl, destfile = "data/getdata-data-PUMSDataDict06.pdf", mode = "wb")

list.files("data")

dat <- read.csv("data/housing.csv", header = T)
str(dat)

agricultureLogical <- as.logical(dat$ACR == 3 & dat$AGS == 6)

which(agricultureLogical)

