#' Sentence Writer
#'
#' Writing a sentence based on keywords supplied.
#'
#' @param q keywords
#'
#' @export
#'
chat_write <- function(q) {
  knowledge=pe_write_eng_sentence_based_idea()
  x=ask_chatgpt(q,history_file=knowledge,update=FALSE)
  x %>% write_clip()
  file.remove(knowledge)
  x
}

#' Script Writer
#'
#' Writing a sentence based on keywords supplied.
#'
#' @param q keywords
#' @param sec length measured in seconds (default = 30 seconds)
#'
#' @export
#'
chat_script <- function(q,sec=30) {
  knowledge=pe_eng_script_writing(NULL,sec)
  x=ask_chatgpt(q,history_file=knowledge,update=FALSE)
  x %>% write_clip()
  file.remove(knowledge)
  x
}

#' Edit writing
#'
#' Provides the ability to correct English sentences
#'
#' @param q writing content
#'
#' @export
chat_edit_writing <- function(q,eng=TRUE) {
  if(eng) {
    knowledge=pe_edit_eng_writing()
  } else {
    knowledge=pe_edit_kor_writing()
  }
  x=ask_chatgpt(q,history_file=knowledge,update=FALSE)
  x %>% write_clip()
  file.remove(knowledge)
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
  knowledge=pe_topic_flag(NULL,topic_keyword)
  x=ask_chatgpt(q,history_file=knowledge,update=FALSE)
  x %>% write_clip()
  file.remove(knowledge)
  x
}

#' Title generator
#'
#' Title generator
#'
#' @param q content
#'
#' @export
chat_title <- function(q) {
  knowledge=pe_eng_title()
  x=ask_chatgpt(q,history_file=knowledge,update=FALSE)
  x %>% write_clip()
  file.remove(knowledge)
  x
}

#' Get News Title Using Google Search Engine
#'
#' Get News Title Using Google Search Engine
#'
#' @param q news query
#' @param kor if TRUE, output is in Korean, o.w., English
#'
#' @export
chat_news <- function(q,naver_client_id=NULL,naver_client_secret=NULL,kor=TRUE) {
  x=ask_chatgpt(
    paste0(q,ifelse(kor," 관련 뉴스를 요약해줘."," Summarize relevant news in English.")),
    context=compile_prompt(list(pe_news_title(q,naver_client_id,naver_client_secret)))
  )
  x %>% write_clip()
  x
}

#' Get an English citation Sentence
#'
#' Get an English citation Sentence
#'
#' @param authors authors name
#' @param year publication year
#' @param q query
#'
#' @export
#'
chat_citation_end <- function(authors,year,q) {
  session_file=pe_citation_end()
  p=paste0(q," By ",authors,", ", year, collapse = '')
  x=ask_chatgpt(p,history_file=session_file,update=FALSE)
  x %>% write_clip()
  file.remove(session_file)
  x
}

#' Rename Article File Name
#'
#' Rename Article File Name
#'
#' @param citation apa6th citation
#'
#' @export
chat_apa_rename <- function(citation) {
  knowledge=pe_rename_article_file_name()
  x=ask_chatgpt(citation,history_file=knowledge,update=FALSE)
  x %>% write_clip()
  file.remove(knowledge)
  x
}

#' Extracting Keywords
#'
#' Extracting Keywords
#'
#' @param q sentence
#'
#' @export
chat_get_keywords <- function(q) {
  knowledge=pe_extract_keywords_ideas()
  x=ask_chatgpt(q,history_file=knowledge,update=FALSE)
  x %>% write_clip()
  file.remove(knowledge)
  x
}

#' Extracting Keywords - textrank
#'
#' Extracting Keywords
#'
#' @param q sentence
#'
#' @export
chat_get_keywords_textrank <- function(q) {
  knowledge=pe_extract_keywords_ideas()
  x=ask_chatgpt(q,history_file=knowledge,update=FALSE)
  x=x %>%
    str_remove(fixed("Keywords: ")) %>%
    str_split(",") %>% .[[1]] %>%
    str_split(fixed("("),simplify = TRUE) %>%
    as.data.frame() %>%
    mutate(V2=str_extract(V2,"[2-3]+")) %>%
    na.omit() %>%
    mutate(V1=str_remove(V1,fixed("\n"))) %>%
    mutate(V1=str_trim(V1)) %>%
    mutate(V2=as.numeric(V2)) %>%
    arrange(desc(V2))
  file.remove(knowledge)
  names(x)=c("keyword","importance")
  x
}


#' Generating a Topic Sentence
#'
#' Generating a Topic Sentence
#'
#' @param q sentence
#'
#' @export
chat_topic <- function(q) {
  knowledge=pe_get_topic_sentece()
  x=ask_chatgpt(q,history_file=knowledge,update=FALSE)
  x %>% write_clip()
  file.remove(knowledge)
  x
}
