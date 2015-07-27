rbind.csv = function(directory = getwd()) {          ## set default directory as the wd
  message("I am processing your results.csv")
  packageStartupMessage("Please wait ... you stupid monkey", appendLF = FALSE)
    howmany = nrow(as.data.frame(list.files(directory)))   # find how many items
    files_list = list.files(directory, full.names = TRUE) # list files
    result = data.frame()       # empty data frame
    for (i in 1:howmany) {                      # Insert number of items present in the folder
      result = rbind(result, read.csv(files_list[i]))   # for loop to create results data frame
    }       
    write.csv(result, "results.csv")    # write output as csv file to a file called "results.csv"
  packageStartupMessage(" your file is now ready!")
  proc.time()
}