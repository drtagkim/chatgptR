#list util
append_lists <- function(...) {
  r=NULL
  args <- list(...)
  for(i in args) r=append(r,i)
  r
}
#learn knowledge
learn_knoweldge <- function(dir_name) {
  fnames = list.files(dir_name,full.names = TRUE)
  x=NULL
  for(f in fnames) {
    x=append(x,list(list(role="system",content=paste0(readLines(f),collapse = ' '))))
  }
  x
}

#' Transform Excel conversation data to JSON data
#' @param input_excel Excel file with an extension (i.e., .xlsx)
#' @param output_json Output JSON file with an extension (i.e., .json)
#' @export
transform_excel_data_to_json <- function(input_exel,output_json) {
  suppressMessages({
    dt=read_excel(input_exel,col_names = FALSE)
  })
  user = dt[[1]]
  assistant = dt[[2]]
  user_dt = tibble(role="user",content=user)
  assistant_dt = tibble(role="assistant",content=assistant)
  1:nrow(user_dt) %>%
    map_dfr(function(x) {
      bind_rows(user_dt[x,],assistant_dt[x,])
    }) %>% toJSON() %>% write(output_json)
}

#' Create Session History
#'
#' Create session history
#'
#' @param tmp_file temporar file
#' @export
#' @examples
#' sesison <- tempfile()
#' create_knowledge_repository(session)
#' ask_chatgpt("Remember following information.",
#'   history_file = session,
#'   update = TRUE)
#' ask_chatgpt("I like an apple.",
#'             history_file = session,
#'             update = TRUE)
#' ask_chatgpt("And, I like an orange.",
#'             history_file = session,
#'             update = TRUE)
#' ask_chatgpt("What are my favorite fruit?",
#'             history_file = session,
#'             update = TRUE)
#' file.remove(session)
create_knowledge_repository <- function(tmp_file) {
  user_dt = tibble(role="user",content="Please be my best assistant.")
  assistant_dt = tibble(role="assistant",content="I'm here to assist you to the best of my abilities!")
  1:nrow(user_dt) %>%
    map_dfr(function(x) {
      bind_rows(user_dt[x,],assistant_dt[x,])
    }) %>% toJSON() %>% write(tmp_file)
}
write_session_history <- function(session,session_file) {
  mssg_previous=c(fromJSON(session,simplifyDataFrame = FALSE))
  file_path=session_file
  file_con=file(file_path,'w',encoding='utf-8')
  writeLines(toJSON(mssg_updated,auto_unbox = TRUE),file_con)
  close(file_con)
}
load_session_history <- function(sesison_data) {

}
#' Teach GPT with session
#'
#' Teach GPT with session
#'
#' @param tmp_file session temporary file
#' @param intent (option) context information
#' @param me (option) your quesiton
#' @param you (option) answer by GPT
#' @export
#' @exmaples
#' session <- tempfile()
#' create_knowledge_repository(session)
#' session %>%
#'   teach_gpt(intent = "Answer anything in one sentence")
#' ask_chatgpt("What happen if you die?",history_file=session,update=TRUE)
#' ask_chatgpt("What happen if you die?")
#' file.remove(session)
#'
teach_gpt <- function(tmp_file,intent=NULL,me=NULL,you=NULL) {
  mssg_previous=c(fromJSON(tmp_file,simplifyDataFrame = FALSE))
  if(is.null(intent) & is.null(me) & is.null(you)) return()
  if(!is.null(intent) & is.null(me) & is.null(you)) {
    mssg_added1=list(list(role="system",content = intent))
    mssg_updated=append_lists(mssg_previous,mssg_added1)

  }
  if(is.null(intent) & !is.null(me) & !is.null(you)) {
    mssg_added1=list(list(role="user",content = me))
    mssg_added2=list(list(role="assistant",content = you))
    mssg_updated=append_lists(mssg_previous,mssg_added1,mssg_added2)
  }
  file_path=tmp_file
  file_con=file(file_path,'w',encoding='utf-8')
  writeLines(toJSON(mssg_updated,auto_unbox = TRUE),file_con)
  close(file_con)
  file_path
}
#' Compile prompt engineering functions
#'
#' Compile prompt engineering functions
#'
#' @param pe_list list of prompt engineering functions
#'
#' @export
compile_prompt <- function(pe_list) {
  p=paste0(pe_list,collapse = " ")
  p
}

#' Chat Operator: Concatenate conversation output
#'
#' Chat Operator: Concatenate conversation output
#'
#' @export
`%>>%` <- function(a,b) {
  paste0(a,' ',b)
}

