complete <- function(directory, id = 1:332) {
  dy <- list.files(directory, full.names = T)
  dx <- data.frame()
  for(i in id){ 
    dx <- data.frame()
    df <- read.csv(dy[i])
    df_subset <- df[complete.cases(df),]
    nobs1 <- nrow(df_subset)
    dx <- data.frame(id,nobs)
  }
  dx
}