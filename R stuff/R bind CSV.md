#Rbind two or more CSV's

nrow(as.data.frame(list.files()))  #  Find how many items in the working directory

###Return number of items of a specified folder

Get folder path by right-clicking on the folder
Run this function in RStudio
```
nrow(as.data.frame(list.files("directory name here")))
```
*Name of the directory has to be changed - change the \ to /*
<small>Example</small>
```
nrow(as.data.frame(list.files("C:\Program Files\Sublime Text 3"))) # This has to be changed...
nrow(as.data.frame(list.files("C:/Program Files/Sublime Text 3")))  # To this!
```

#Function to count how many items in a folder!
```
howmany = function(directory) {
  nrow(as.data.frame(list.files(directory)))
}

howmany("C:/Program Files")
[1] 41
```
Sometimes, you may want to find the total number of items contained in a folder, including all the folders in it (recursive = TRUE)
That's why I crafted the howmany_recursive function
```
howmany_recursive = function(directory) {
  nrow(as.data.frame(list.files(directory, recursive = TRUE)))
}

> howmany("U:/")
[1] 33
> howmany_recursive("U:/")
[1] 1667
```


#Rbind CSV's

```
dir.create("prova") # Create an empty directory
setwd("prova") # navigate to the new directory
```
Move all csv files to the new directory
```
howmany = nrow(as.data.frame(list.files()))  # count how many files in the new directory

howmany
[1] 7

files_list = list.files(, full.names = TRUE) # list files
result = data.frame()       # empty data frame
for (i in 1:7) {                      # Insert number of items present in the folder
  result = rbind(result, read.csv(files_list[i]))   # for loop to create results data frame
}       
write.csv(result, "results.csv")    # write output as csv file
```

#Function rbind.csv 
that Rbinds all csv objects in a given directory and returns the results in the working directory in a file called "results.csv"

dir.create(name)  # create an empty directory
Move all csv files that you want to bind together
Run the following function:
```
rbind.csv = function(directory) {
    howmany = nrow(as.data.frame(list.files(directory)))   # find how many items
    files_list = list.files(directory, full.names = TRUE) # list files
    result = data.frame()       # empty data frame
    for (i in 1:howmany) {                      # Insert number of items present in the folder
      result = rbind(result, read.csv(files_list[i]))   # for loop to create results data frame
    }       
    write.csv(result, "results.csv")    # write output as csv file to a file called "results.csv"
}
```

Usage
Call-use function
```
source('U:/rbind.csv.R')
rbind.csv("directory name")
```

#Set default value in a function:
###Set default value as the working directory
Howmany
```
howmany = function(directory = getwd()) {
  nrow(as.data.frame(list.files(directory)))
}
```

#Message executing a function
Rbind.CSV
```
rbind.csv = function(directory = getwd()) {
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
```

###Problems

* if statement to give error if file results.csv exists
If error: "Make sure the file results.csv does not already exist" 
* custom name of the file to create
