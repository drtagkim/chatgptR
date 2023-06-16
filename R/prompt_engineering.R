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

#' Prompt Engineering Function - Generate a script for Powerpoint presentation
#'
#' Generate a script for Powerpoint presentation
#'
#' @export
pe_eng_script_writing <- function(seconds=20) {
  paste0(
    "Input: words representing ideas and topics",
    "You should translate user input into English first.",
    "Output: English paragraph containing presentation scripts.",
    "Suppose that a human will read it in front of academic audiance.",
    "It should be natural, fluenct and friendly.",
    "The output script is not in start nor in end. It is in the middle of presentatin.",
    "Do not add information that is not provided by a user.",
    "Keep in mind that the reading should be finished within specific duration.",
    "For exmaple, the length of speaking will be:",seconds," seconds",
    collapse=" "
  )
}

#' Prompt Engineering Function - Generating a news title in English
#'
#' Prompt Engineering Function - Generating a news title in English
#'
#'
#' @export
pe_eng_title <- function() {
  paste0(
    "Make a news title based on the input.",
    "English output",
    collapse=" "
  )
}
