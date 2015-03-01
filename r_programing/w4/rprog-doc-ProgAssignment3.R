old.wd <- getwd()
new.wd <- ("C:/Users/FabioDesk/Documents/GitHub/datasciencecoursera/r_programing/w4")
setwd(new.wd)

if (!file.exists("data")) {dir.create("data")}

new.wd <- ("C:/Users/FabioDesk/Documents/GitHub/datasciencecoursera/r_programing/w4/data")
setwd(new.wd)


fileUrl <- ("https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip")

destfile <- ("ProgAssignment3-data.zip")

download.file(fileUrl, destfile, mode = "wb")

unzip(destfile, exdir = ".")

list.files()

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
str(outcome)

ncol(outcome)
nrow(outcome)
names(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])

best <- function(state, outcome) {
    ## Read outcome data
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
      
    ## Check that state and outcome are valid
    if(sum(outcome[,7] == state) == 0) {
        stop("invalid state")
    }
    if((!outcome == "heart attack") or (!outcome == "heart failure") or (!outcome == "pneumonia"){
        stop("invalid outcome")
    }
    
    ## Return hospital name in that state with lowest 30-day death
    if(outcome == "heart attack"){
        head(as.numeric(outcome[,13]))
        str(outcome[,13])
    }
    
    ## rate
}

#Here is some sample output from the function.
#> source("best.R")
#> best("TX", "heart attack")
#[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
#> best("TX", "heart failure")
#[1] "FORT DUNCAN MEDICAL CENTER"
#> best("MD", "heart attack")
#[1] "JOHNS HOPKINS HOSPITAL, THE"
#> best("MD", "pneumonia")
#[1] "GREATER BALTIMORE MEDICAL CENTER"
#> best("BB", "heart attack")
#Error in best("BB", "heart attack") : invalid state
#> best("NY", "hert attack")
#Error in best("NY", "hert attack") : invalid outcome