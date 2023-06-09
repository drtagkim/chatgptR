#' Sentence Writer
#'
#' Writing a sentence based on keywords supplied.
#'
#' @param q keywords
#'
#' @export
#'
chat_write <- function(q) {
  x=ask_chatgpt_pe(
    q,
    pe_list=list(pe_write_eng_sentence_based_idea)
  )
  x %>% write_clip()
  x
}


#' Script Writer
#'
#' Writing a sentence based on keywords supplied.
#'
#' @param q keywords
#'
#' @export
#'
chat_script <- function(q) {
  x=ask_chatgpt_pe(
    q,
    pe_list=list(pe_eng_script_30s_writing)
  )
  x %>% write_clip()
  x
}
