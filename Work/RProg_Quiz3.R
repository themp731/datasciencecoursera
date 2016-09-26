outcome <- read.csv("outcome-of-care-measures.csv", colClasses="character")
head(outcome)
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])

best <- function(state, outcome){
  data_l <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  
  #Convert Column Names
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  longName <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  shortname <- longName[match(outcome,outcomes)]
  
  states <- data_l[data_l$State == state,]
  minimum <- which.min(as.double(states[,shortname]))
  states[minimum, 2]
}

rankhospital <- function(state, outcome, num){
  data_rank <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  longName <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  shortname <- longName[match(outcome,outcomes)]
  states <- data_rank[data_rank$State == state,]
  newdata <- states[order(shortname),]
  if(num=="worst"){
    tail(newdata[,2])
  }
  else{
    newdata[1:num,2]
  }
}

rankhospital2 <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  
  ## Check that state and outcome are valid
  validOutcome = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) { stop("invalid outcome")}
  
  validState = unique(data[,7])
  if (!state %in% validState) stop("invalid state")
  
  ## convert outcome name into column name
  fullColName <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  colName <- fullColName[match(outcome,validOutcome)]
  
  ## Return hospital name in that state with the given rank 30-day death rate
  data.state <- data[data$State==state,]
  
  # order data by outcome
  sorted.data.state <- data.state[order(as.numeric(data.state[[colName]]),data.state[["Hospital.Name"]],decreasing=FALSE,na.last=NA), ]
  
  #handle num input
  if (num=="best") num = 1
  if (num=='worst') num = nrow(sorted.data.state)
  #will automatically return NA if num > nrow, as well as if it's some other text value
  # if someone passes num < 1, they'll get what's expected
  #if (is.numeric(num) & num > nrwo(sorted.data.state) return(NA)
  
  sorted.data.state[num,"Hospital.Name"]
}

rankall <- function(outcome, num){
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  
  #Converting to short names
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  longName <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  shortname <- longName[match(outcome,outcomes)]
  
  hospital <- character(0)
  
  states = unique(data[0,7])
  for(i in states){
    state_rank <- data[data$State==states[i],]
    sorted_state <- state_rank[order(as.numeric(states[[colName]]), states[["Hospital.Name"]],decreasing=FALSE,na.last=NA),]
  }
  rank_size <- num
  if(num == "best"){
    rank_size = 1
  }
  else if(num == "worse"){
    rank_size = nrow(sorted_state)
  }
  else{
    hospital[i]<- sorted_state[rank_size,"Hospital.Name"]
  
    data.frame(hospital=hospital,state=states,rown.names=states)
  }
}
rankall2 <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  
  ## Check that state and outcome are valid
  validOutcome = c("heart attack","heart failure","pneumonia")
  if (!outcome %in% validOutcome) { stop("invalid outcome")}
  
  validState = sort(unique(data[,7]))
  if (!state %in% validState) stop("invalid state")
  
  ## convert outcome name into column name
  fullColName <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  colName <- fullColName[match(outcome,validOutcome)]
  
  ## For each state, find the hospital of the given rank
  hospital<-character(0)
  
  for (i in seq_along(validState)) {
    ## Return hospital name in that state with the given rank 30-day death rate
    data.state <- data[data$State==validState[i],]
    
    # order data by outcome
    sorted.data.state <- data.state[order(as.numeric(data.state[[colName]]),data.state[["Hospital.Name"]],decreasing=FALSE,na.last=NA), ]
    
    #handle num input
    this.num = num
    if (this.num=="best") this.num = 1
    if (this.num=='worst') this.num = nrow(sorted.data.state)
    
    hospital[i] <- sorted.data.state[this.num,"Hospital.Name"]
  }
  
  ## Return a data frame with the hospital names and the (abbreviated) state name
  data.frame(hospital=hospital,state=validState,row.names=validState)
}