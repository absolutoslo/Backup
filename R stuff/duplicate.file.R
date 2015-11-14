## Copy one file several times - DUplicate files
# WORKS WITH ALL FILE TYPES!!!!!
#
# Source with
# source('C:/Users/cdiloreto/Google Drive/Programming/Backup/R functions/duplicate.file.R')
#
# Recommended usage:
# - Move to the directory
# - Run `file = as.character(list.files())[indexnumber]`
# - Then `duplicate.pdf(file,10)`
#
# This copies the file only one time:
#
# duplicate = function(file, times = 1) {
#  dest = NULL
#  dest = file.path("C:/users/cdiloreto/google drive/programming/duplicate files",paste("copy",times,
#                   file))
#  file.copy(file, dest)
#  print("Done!")
# }
#
#
## Copy one pdf file several times
duplicate.file = function(file, times = 1) {
  ## create a list of *times* elements with different names, i.e. 1,2,3,etc.
  files_list = paste("Copy",seq(1,times,1),file)
  ##For Loop
  for (i in 1:times) {
  file.copy(file, files_list[i])
  }
  ##Message when finished
  message("Done! Check your working directory.")
}
#
#
# To then eliminate the function from the environment use
# rm(list = ls())
#