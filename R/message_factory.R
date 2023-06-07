message_factory <- function(user_prompt,context=NULL,conversation=NULL) {
  append_lists(
    context,
    conversation,
    list(list(role="user",content=user_prompt))
  )
}
