#' Sentence Writer
#'
#' Writing a sentence based on keywords supplied.
#'
#' @param q keywords
#'
#' @export
#'
chat_write <- function(q) {
  x=ask_chatgpt(
    q,
    context=compile_prompt(list(pe_write_eng_sentence_based_idea()))
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
chat_script <- function(q,sec=30) {
  x=ask_chatgpt(
    q,
    context=compile_prompt(list(pe_eng_script_writing(sec)))
  )
  x %>% write_clip()
  x
}
