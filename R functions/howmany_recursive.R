howmany_recursive = function(directory) {
  nrow(as.data.frame(list.files(directory, recursive = TRUE)))
}