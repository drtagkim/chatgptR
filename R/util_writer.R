#' Create a template file for writing English papers
#'
#'
#'
#' @export
create_writer_xls <- function(fname) {
  df=data.frame(
    keyword=character(0),
    intent_type=character(0),
    kor_sentence=character(0)
  )
  if(!endsWith(fname,".xlsx")) {
    fname=paste0(fname,".xlsx")
  }
  writexl::write_xlsx(df,fname)
}
