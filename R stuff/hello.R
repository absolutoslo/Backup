hello <- function() {
  cat(paste("Hello, ",system("whoami",T),"!\n",sep="",collapse=""))
}
