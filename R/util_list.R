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
#' create_session_history(session)
#' ask_chatgpt("Hello!",history_file=session)
#' # if you want to delete the session temp file, run the following:
#' file.remove(session)
create_session_history <- function(tmp_file) {
  user_dt = tibble(role="user",content="Please be my best assistant.")
  assistant_dt = tibble(role="assistant",content="I'm here to assist you to the best of my abilities!")
  1:nrow(user_dt) %>%
    map_dfr(function(x) {
      bind_rows(user_dt[x,],assistant_dt[x,])
    }) %>% toJSON() %>% write(tmp_file)
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
