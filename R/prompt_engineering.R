#' Prompt Enginnering Function - Sentence Writer Based on Supplied Keywords
#'
#' Sentence Writer Based on Supplied Keywords
#'
#' @export
pe_write_eng_sentence_based_idea <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Output should be in English. ") %>%
    teach_gpt(intent="Output should be one sentence. ") %>%
    teach_gpt(intent="Inputs are list of keywords reflecting ideas. ") %>%
    teach_gpt(intent="Translate all into English") %>%
    teach_gpt(me="metaverse, AR VR avatar important business e-commerce",
              you="The concepts of metaverse, augmented reality (AR), virtual reality (VR), avatars, and their significance in the realm of important business e-commerce.")
}

#' Prompt Enginnering Function - Checking the inclusion of keywords
#'
#' Checking the inclusion of keywords
#'
#' @export
pe_topic_flag <- function(knowledge=NULL,topic_keyword="") {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Check whether the message provided by users ") %>%
    teach_gpt(intent="Contains relevant keywords. ") %>%
    teach_gpt(intent="Value as 0(=has not) or 1(=has), ") %>%
    teach_gpt("Results should be JSON format. ") %>%
    #teach_gpt("Resonse example: \"keyword\":1") %>%
    #teach_gpt("Resonse example: \"keyword\":0") %>%
    teach_gpt(paste0("Keyword:",topic_keyword,collapse = " ")) %>%
    teach_gpt("You should check whether each keyword is included or not. ")
    #teach_gpt("For example, suppose the sentence has words like A, B, C, D. If keywords are A, B and F, then A:1, B:1, F:0 ")
}

#' Prompt Enginnering Function - Editing a paragraph in academic styling
#'
#' Editing a paragraph in academic styling
#'
#' @export
pe_edit_eng_writing <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Edit the sentence in English. ") %>%
    teach_gpt(intent="Write in an academic style. ") %>%
    teach_gpt(intent="Write in an academic style. For example, suppose you're writing a social science paper. ") %>%
    teach_gpt(intent="Answer in English. ")
}

#' Prompt Enginnering Function - Editing a paragraph in academic styling (Korean)
#'
#' Editing a paragraph in academic styling (Korean)
#'
#' @export
pe_edit_kor_writing <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Edit the sentence in Korean. ") %>%
    teach_gpt(intent="Write in an academic style. ") %>%
    teach_gpt(intent="Write in an academic style. For example, suppose you're writing a social science paper. ") %>%
    teach_gpt(intent="Answer in Korean. ")
}

#' Prompt Engineering Function - Generate a script for Powerpoint presentation
#'
#' Generate a script for Powerpoint presentation
#'
#' @export
pe_eng_script_writing <- function(knowledge=NULL,seconds=20) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Input: words representing ideas and topics ") %>%
    teach_gpt(intent="You should translate user input into English first. ") %>%
    teach_gpt(intent="Output: English paragraph containing presentation scripts. ") %>%
    teach_gpt(intent="Suppose that a human will read it in front of academic audiance. ") %>%
    teach_gpt(intent="It should be natural, fluenct and friendly. ") %>%
    teach_gpt(intent="The output script is not in start nor in end. It is in the middle of presentatin. ") %>%
    teach_gpt(intent="Do not add information that is not provided by a user.") %>%
    teach_gpt(intent="Keep in mind that the reading should be finished within specific duration.") %>%
    teach_gpt(intent=paste0("For exmaple, the length of speaking will be:",seconds," seconds",collapse=" "))
}

#' Prompt Engineering Function - Generating a news title in English
#'
#' Prompt Engineering Function - Generating a news title in English
#'
#'
#' @export
pe_eng_title <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Make a news title based on the input. ") %>%
    teach_gpt(intent="One sentence ") %>%
    teach_gpt(intent="Translate the output into English. ")
}

#' Prompt Engineering Function - Reporting news summary
#'
#' Prompt Engineering Function - Reporting news summary
#'
#' @export
#'
pe_news_title <- function(search_query,naver_client_id=NULL,naver_client_secret=NULL) {
  p1 = "Assistant will provide news headline summary. Results should be natural descriptions."
  p2 = "Sentences should be output."
  p3 = "In the following news headlines contains in Google:"
  p4 = paste0(get_gs_news_title(search_query),collapse = " ")
  if(!is.null(naver_client_id) & !is.null(naver_client_secret)) {
    p5 = "And the following are news articles relating to user query in Naver:"
    p6 = paste0(get_naver_news(search_query,naver_client_id,naver_client_secret),collapse=" ")
  } else {
    p5 = ""
    p6 = ""
  }
  paste0(p1,p2,p3,p4,p5,p6,collapse=' ')
}

#' Prompt Engineering Function - Citation at the end of a sentence
#'
#' Prompt Engineering Function - Citation at the end of a sentence
#'
#' @export
#'
pe_citation_end <- function(knowledge=NULL) {
  if(is.null(knowledge)) {
    knowledge = tempfile()
    create_knowledge_repository(knowledge)
  }
  knowledge %>%
    teach_gpt(intent="Output should be in English.") %>%
    teach_gpt(intent="Output should be one sentence.") %>%
    teach_gpt(intent="Translate all into English") %>%
    teach_gpt(intent="Citation should be in APA6th style.") %>%
    teach_gpt(intent="If author names (e.g., Tom) are provided first, the sentence should starts with like Tom (1999)") %>%
    teach_gpt(me="100,000 chatbots, created in less than year, Facebook Messenger. By Jonshon, 2017.",
              you="Over 100,000 chatbots have been created in less than one year on Facebook Messenger alone (Johnson, 2017).") %>%
    teach_gpt(
      me="The technology itself is frequently met with consumer skepticism as shown by market research in several European countries. By Elsner, 2017",
      you="The technology itself is frequently met with consumer skepticism as shown by market research in several European countries (Elsner, 2017)."
    )
}
