#' Sentence Writer Based on Supplied Keywords
#'
#' @export
chat_write <- function(q) {
  x=ask_chatgpt(q,
                context="I will give you a keyword and you will write 1 sentence based on it. Answer in English.")
  x %>% write_clip()
  x
}
#' Editing a paragraph in academic styling
#' @export
chat_edit <- function(q) {
  x=ask_chatgpt(q,
                context="
      Edit the sentence in English.
      Write in an academic style. For example, suppose you're writing a social science paper.
      Answer in English.
    ")
  x %>% write_clip()
  x
}
