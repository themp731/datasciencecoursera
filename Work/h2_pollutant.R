all_files <- list.files("specdata", full.names=TRUE)
pollutantmean <- function(file, pollutant, id = 1:332){
  pollutant_data = numeric()
  for(i in id){
    newFrame <- read.csv(all_files[i])
    newMean <- na.omit(newFrame[pollutant])
    pollutant_data <- rbind(pollutant_data, newMean)
  }
  return(mean(pollutant_data[[1]]))
}

complete <- function(directory, id = 1:332) {
  nobs = numeric()
  for(i in id){
    newFrame = read.csv(all_files[i])
    nobs = c(nobs, sum(complete.cases(newFrame)))
  }
  return(data.frame(id, nobs))
}

corr <- function(directory, threshold = 0){
  df = complete(directory)
  ids = df[df["nobs"] > threshold, ]$id
  corr_r = numeric()
  for(i in ids){
    newFile = read.csv(all_files[i])
    dff = newFile[complete.cases(newFile), ]
    corr_r = c(corr_r, cor(dff$sulfate, dff$nitrate))
  }
  return(corr_r)
}