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

#' Edit writing
#'
#' Provides the ability to correct English sentences
#'
#' @param q writing content
#'
#' @export
chat_edit_writing <- function(q) {
  x=ask_chatgpt(
    q,
    context=compile_prompt(list(pe_edit_eng_writing()))
  )
  x %>% write_clip()
  x
}

#' Topic checker
#'
#' Checking topic and produce results
#'
#' @param q Sentence to check
#' @param topic_keyword string vector, topics
#'
#' @export
chat_topic_check <- function(q,topic_keyword) {
  x=ask_chatgpt(
    q,
    context=compile_prompt(list(pe_topic_flag(),
              paste0(topic_keyword,collapse = ",")))
  )
  x %>% write_clip()
  x
}
