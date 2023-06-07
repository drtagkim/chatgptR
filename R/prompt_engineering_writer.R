#' Prompt Enginnering Function - Sentence Writer Based on Supplied Keywords
#'
#' Sentence Writer Based on Supplied Keywords
#'
#' @export
pe_write_eng_sentence_based_idea <- function() {
  paste0("I will give you a keyword and you will write 1 sentence based on it. ",
         "Answer in English. ")
}

#' Prompt Enginnering Function - Checking the inclusion of keywords
#'
#' Checking the inclusion of keywords
#'
#' @export
pe_topic_flag <- function() {
  paste0("Check whether the message provided by users ",
         "contains relevant keywords. ",
         "value as 0(=has) or 1(=has not), ",
         "Results should be JSON format. ",
         "Resonse example: \"keyword\":1",
         "Keywords: ")
}

#' Prompt Enginnering Function - Editing a paragraph in academic styling
#'
#' Editing a paragraph in academic styling
#'
#' @export
pe_edit_eng_writing <- function() {
  paste0("Edit the sentence in English. ",
         "Write in an academic style. ",
         "Write in an academic style. For example, suppose you're writing a social science paper. ",
         "Answer in English. ")
}
