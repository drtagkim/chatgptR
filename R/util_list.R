#list util
append_lists <- function(...) {
  r=NULL
  args <- list(...)
  for(i in args) r=append(r,i)
  r
}
