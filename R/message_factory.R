message_factory <- function(user_prompt,system_content=NULL,conversation=NULL) {
  # if(is.null(system_content)) {
  #   system_content = "You are a helpful assistant. "
  # } else {
  #   system_content = paste0("You are a helpful assistant. ", system_content," ")
  # }
  # return_language <- Sys.getenv("OPENAI_RETURN_LANGUAGE")
  # if (nchar(return_language) > 0) {
  #   return_language <- paste0(system_content,"You return all your replies in ", return_language, ".")
  # }
  append_lists(
    system_content,
    conversation,
    list(list(role="user",content=user_prompt))
  )
  # if(is.null(system_content)) {
  #   mssg=list(
  #     list(role = "user", content = user_prompt)
  #   )
  # } else {
  #   mssg=list(
  #     list(role="system",content=system_content),
  #     list(role = "user", content = user_prompt)
  #   )
  # }
  # if(!is.null(file)) {
  #   mssg=c(fromJSON(file,simplifyDataFrame = FALSE),mssg)
  # }
  # return(mssg)
}
