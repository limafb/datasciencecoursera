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