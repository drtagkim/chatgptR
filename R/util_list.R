#list util
append_lists <- function(...) {
  r=NULL
  args <- list(...)
  for(i in args) r=append(r,i)
  r
}
#learn knowledge
learn_knoweldge <- function(dir_name) {
  fnames = list.files(dir_name,full.names = TRUE)
  x=NULL
  for(f in fnames) {
    x=append(x,list(list(role="system",content=paste0(readLines(f),collapse = ' '))))
  }
  x
}
