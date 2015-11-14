howmany = function(directory = getwd()) {
  nrow(as.data.frame(list.files(directory)))
}