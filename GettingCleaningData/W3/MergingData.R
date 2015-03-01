if (!file.exists("data")) {dir.create("data")}

fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"

destfile1 <- "data/reviews.csv"
destfile2 <- "data/solutions.csv"

download.file(fileUrl1, destfile1, mode = "wb")
download.file(fileUrl2, destfile2, mode = "wb")

reviews = read.csv(destfile1); solutions <- read.csv(destfile2)

head(reviews,2)

head(solutions,2)

names(reviews)

names(solutions)

mergeData = merge(reviews, solutions, by.x="solution_id",by.y="id",all=T)
head(mergeData)

intersect(names(solutions),names(reviews))
mergeData = merge(reviews, solutions, all=T)

#Using join in the plyr package
install.packages("plyr")

library(plyr)

df1 = data.frame(id=sample(1:10), x=rnorm(10))
df2 = data.frame(id=sample(1:10), x=rnorm(10))

arrange(join(df1, df2), id)

df3 = data.frame(id=sample(1:10), x=rnorm(10))

dfList = list(df1,df2,df3)
join_all(dfList)
