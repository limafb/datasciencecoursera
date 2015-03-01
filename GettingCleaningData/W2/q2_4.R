
url <- "http://biostat.jhsph.edu/~jleek/contact.html"

con = url
htmlCode = readLines(con)
close(con)

vector <- cbind(htmlCode[10], htmlCode[20], htmlCode[30], htmlCode[100])
vector

nchar(vector)

save.image("D:/Cursos/Coursera/DataScience/GettingAndCleaningData/W2/q2_4_env.RData")

