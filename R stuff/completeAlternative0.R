complete <- function(directory, id = 1:332) {
  files_list = list.files("specdata", full.names=TRUE)
  dat = data.frame()
  for (i in id) {
    dat = rbind(dat,read.csv(files_list[i]))
    dat_subset = dat[which(dat[,"ID"] %in% id),]
    dat1 = na.omit(dat_subset)
    nobs = nrow(dat1) 
  }
  df = data.frame(id,nobs)
  df
}