pollutantmean <- function(directory, pollutant, id = 1:332) { 
  files_list = list.files("specdata", full.names = TRUE) # here I select the files list
  dat = data.frame()                          # create and empty data frame
  for (i in id) {
    dat = rbind(dat,read.csv(files_list[i]))
  }                          # for loop with rbind to fill the data frame - open close
  dat_subset = dat[which(dat[,"ID"] %in% id),]  # subset for id value
  mean(dat_subset[,pollutant], na.rm=TRUE)      # calculate mean
}