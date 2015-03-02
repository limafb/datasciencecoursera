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
    ##Create variables
    columnID <- 0
  
    ## Read outcome data
    dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    colnames(dat)  <- 1:46
        
    ## Check that state and outcome are valid
    if(sum(dat$"7" == state) == 0) {stop("invalid state")} 

    outcomeMatch <- match(outcome, c("heart attack", "heart failure", "pneumonia"))
    if (is.na(outcomeMatch)){
        stop("invalid outcome")
    }
    columnID <- c(13, 19, 25)[outcomeMatch]
 
    ## Return hospital name in that state with lowest 30-day death rate
    datSub <- subset(dat, dat$"7" == state, select = c("2", "7", columnID))
    datSub[,3] <- suppressWarnings(as.numeric(datSub[,3]))
    datSort <- datSub[order(datSub[,3], decreasing = F, na.last = T), ]
    hospitalName <- datSort[1,1]
    hospitalName
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

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  colnames(dat)  <- 1:46
  
  
  ## Check that state and outcome are valid
  if(sum(dat$"7" == state) == 0) {stop("invalid state")} 
  
  outcomeMatch <- match(outcome, c("heart attack", "heart failure", "pneumonia"))
  if (is.na(outcomeMatch)){
    stop("invalid outcome")
  }
  
  columnID <- c(11, 17, 23)[outcomeMatch]
  
  ## Return hospital name in that state with the given rank 30-day death rate
  datSub <- subset(dat, dat$"7" == state, select = c("2", "7", columnID))
  datSub[,3] <- suppressWarnings(as.numeric(datSub[,3]))
  if (is.character(num)){
      numMatch <- match(num, c("best", "worst"))
      if (is.na(numMatch)){
          stop("invalid num")
      } 
      if (num == "best") {
          datSort <- datSub[order(datSub[,3], datSub[,1], decreasing = F, na.last = T), ]
          hospitalName <- datSort[1,1]
      } 
      if (num == "worst"){
          datSort <- datSub[order(datSub[,3], datSub[,1], decreasing = T, na.last = T), ]
          hospitalName <- datSort[1,1]
      }
  } else {
      if (num > nrow(dat)){
          hospitalName <- NA
      } else {
          datSort <- datSub[order(datSub[,3], datSub[,1], decreasing = F, na.last = T), ]
          hospitalName <- datSort[num,1]
        
      }
  }
  hospitalName
}

#Here is some sample output from the function.
#> source("rankhospital.R")
#> rankhospital("TX", "heart failure", 4)
#[1] "DETAR HOSPITAL NAVARRO"
#> rankhospital("MD", "heart attack", "worst")
#[1] "HARFORD MEMORIAL HOSPITAL"
#> rankhospital("MN", "heart attack", 5000)
#[1] NA

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  dat <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
  colnames(dat)  <- 1:46
  
  ## Check that outcome are valid
  outcomeMatch <- match(outcome, c("heart attack", "heart failure", "pneumonia"))
  if (is.na(outcomeMatch)){
    stop("invalid outcome")
  }
  
  ## For each state, find the hospital of the given rank
  columnID <- c(11, 17, 23)[outcomeMatch]
  datSub <- subset(dat, select = c("2", "7", columnID))
  datSub[,3] <- suppressWarnings(as.numeric(datSub[,3]))
  datSort <- datSub[order(datSub[,2], datSub[,3], datSub[,1], decreasing = F, na.last = T), ]
  datSplitState <-  split(datSort, datSort[,2])
  
  if (is.character(num)){
    numMatch <- match(num, c("best", "worst"))
    if (is.na(numMatch)){
      stop("invalid num")
    } 
    if (num == "best") {
        datlapply <- lapply(datSplitState, function(x) {x[1,,drop=F]})       
        datRankall <- do.call(rbind, datlapply)
#        datRankallSub <- subset(datRankall, select = c("1", "2"))
    } 
    if (num == "worst"){
        datlapply <- lapply(datSplitState, function(x) {x[nrow(x),,drop=F]})       
        datRankall <- do.call(rbind, datlapply)
#        datRankallSub <- subset(datRankall, select = c("1", "2"))
    }
  } else {
      datlapply <- lapply(datSplitState, function(x) {x[num,,drop=F]})       
      datRankall <- do.call(rbind, datlapply)
#      datRankallSub <- subset(datRankall, select = c("1", "2"))
  }
  ## Return a data frame with the hospital names and the (abbreviated) state name
  datRankallSub
}  

#Here is some sample output from the function.
#> source("rankall.R")
#> head(rankall("heart attack", 20), 10)
#hospital state
#AK <NA> AK
#AL D W MCMILLAN MEMORIAL HOSPITAL AL
#AR ARKANSAS METHODIST MEDICAL CENTER AR
#AZ JOHN C LINCOLN DEER VALLEY HOSPITAL AZ
#CA SHERMAN OAKS HOSPITAL CA
#CO SKY RIDGE MEDICAL CENTER CO
#CT MIDSTATE MEDICAL CENTER CT
#DC <NA> DC
#DE <NA> DE
#FL SOUTH FLORIDA BAPTIST HOSPITAL FL
#> tail(rankall("pneumonia", "worst"), 3)
#hospital state
#WI MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC WI
#WV PLATEAU MEDICAL CENTER WV
#WY NORTH BIG HORN HOSPITAL DISTRICT WY
># tail(rankall("heart failure"), 10)
#hospital state
#TN WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL TN
#TX FORT DUNCAN MEDICAL CENTER TX
#UT VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER UT
#VA SENTARA POTOMAC HOSPITAL VA
#VI GOV JUAN F LUIS HOSPITAL & MEDICAL CTR VI
#VT SPRINGFIELD HOSPITAL VT
#WA HARBORVIEW MEDICAL CENTER WA
#WI AURORA ST LUKES MEDICAL CENTER WI
#WY CHEYENNE VA MEDICAL CENTER WY