#Question 3
#Load the Gross Domestic Product data for the 190 ranked countries in this 
#data set: 
  
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 

#Load the educational data from this data set: 
  
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 

#Match the data based on the country shortcode. How many of the IDs match? 
#Sort the data frame in descending order by GDP rank (so United States is 
#last). What is the 13th country in the resulting data frame? 

#Original data sources: 
#http://data.worldbank.org/data-catalog/GDP-ranking-table 
#http://data.worldbank.org/data-catalog/ed-stats

#a 189 matches, 13th country is St. Kitts and Nevis
#b 189 matches, 13th country is Spain
#c 190 matches, 13th country is St. Kitts and Nevis
#d 234 matches, 13th country is Spain
#e 190 matches, 13th country is Spain
#f 234 matches, 13th country is St. Kitts and Nevis

old.wd <- getwd()
new.wd <- ("E:/Cursos/Coursera/Data_Analisys/Getting&Cleaning/W3")
setwd(new.wd)

if (!file.exists("data")) {dir.create("data")}

fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

destfile1 <- "data/FGDP.csv"
destfile2 <- "data/FEDSTATS_Country.csv"

download.file(fileUrl1, destfile1, mode = "wb")
download.file(fileUrl2, destfile2, mode = "wb")

list.files("data")

dat1 <- read.csv(destfile1, skip = 5, header = F, nrows = 231, col.names = c("CountryCode", "Ranking", "V3", "Economy", "millions of US dollars", "V6", "V7", "V8", "V9", "V10"))
dat1 <- dat1[,1:5]
dat1 <- dat1[,-3]

dat2 <- read.csv(destfile2)

str(dat1)
str(dat2)

names(dat1)
names(dat2)

head(dat1, 16)
tail(dat1, 20)

tail(arrange(dat1,desc(Ranking)), 60)

head(arrange(dat1,desc(Ranking)), 16)

sum(is.na(dat1$CountryCode))

dat1$CountryCode

summary(dat1$CountryCode)

head(dat1$CountryCode, 16)


head(dat2)

summary(dat2)

names(dat2)

dat2$CountryCode
summary(dat2$CountryCode)
str(dat2)

table(dat2$CountryCode,useNA="ifany")


mergeData = merge(dat1, dat2, by.x="CountryCode",by.y="CountryCode")
head(mergeData$CountryCode, 16)

str(mergeData)

names(mergeData)

summary(mergeData$CountryCode)
sum(is.na(mergeData$CountryCode))
head(mergeData$CountryCode)
tail(mergeData$CountryCode)


head(arrange(mergeData,desc(Ranking)), 16)

tail(arrange(mergeData,desc(Ranking)), 16)
