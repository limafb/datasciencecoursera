#Question 2 - Using the jpeg package read in the following picture of your instructor into R 

#https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg 

#Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? 
#(some Linux systems may produce an answer 638 different for the 30th quantile)

#a -14191406 -10904118
#b -15259150 -10575416 (X)
#c -10904118 -10575416
#d -16776430 -15390165

old.wd <- getwd()
new.wd <- ("E:/Cursos/Coursera/Data_Analisys/Getting&Cleaning/W3")
setwd(new.wd)

install.packages("jpeg")
library(jpeg)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

if (!file.exists("data")) {dir.create("data")}

download.file(fileUrl, destfile = "data/jeff.jpg", mode = "wb")

dat <- readJPEG("data/jeff.jpg", native = T)
head(dat)
summary(dat)

str(dat)

quantile(dat, probs=c(0.3, 0.8))
