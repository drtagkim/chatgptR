#' Create a template file for writing English papers
#'
#'
#'
#' @export
create_writer_xls <- function(fname) {
  df=data.frame(
    paragraph=numeric(0),
    keyword=character(0),
    intent_type=character(0),
    kor_sentence=character(0)
  )
  if(!endsWith(fname,".xlsx")) {
    fname=paste0(fname,".xlsx")
  }
  writexl::write_xlsx(df,fname)
}

process_writer <- function(row1) {
  prompting = paste0(
    "keyword:",row1$keyword[1],
    ";role:",row1$intent_type[1],
    ";sentence:",row1$kor_sentence[1]
  )
  chat_write(prompting)
}

#' English Thesis Statement Builder
#'
#'
#' @export
qp <- function(input_fname,par_no) {
  df = readxl::read_excel(input_fname) %>%
    mutate(paragraph=as.numeric(paragraph)) %>%
    filter(paragraph %in% par_no)
  output = unique(df$paragraph) %>%
    map(function(par_id) {
      cat("Starting ---- ",par_id," ---\n")
      df1=df %>% filter(paragraph == par_id)
      result=character(nrow(df1))
      for(i in 1:nrow(df1)) {
        cat("[",i,"] Call GPT...")
        result[i]=process_writer(df1[i,])
        cat("OK.\n")
      }
      cat("Editing...")
      result1=chat_edit_writing(paste0(result,collapse = ' '))
      cat("OK.\n")
      result1
    })
  output_fname = paste0("out_",input_fname)
  writexl::write_xlsx(tibble(
    paragraph_number=1:length(output),
    text=unlist(output)
  ),output_fname)
  cat("Writing completed. \n")
}
