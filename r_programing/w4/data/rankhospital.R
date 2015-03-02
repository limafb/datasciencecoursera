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