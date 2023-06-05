gpt_get_completions <- function(prompt, context = NULL,conversation=NULL,openai_api_key = Sys.getenv("OPENAI_API_KEY")) {
  if (nchar(openai_api_key) == 0) {
    stop(literal()$no_api)
  }
  params = get_default_params()
  if (as.logical(Sys.getenv("OPENAI_VERBOSE", TRUE))) {
    cat(literal(prompt=prompt)$echo_user_input_info)
  }
  messages = message_factory(prompt,context,conversation)
  post_res = send_data_to_openai_chat(params,messages,openai_api_key)
  if (!post_res$status_code %in% literal()$normal_status) {
    stop(content(post_res))
  }
  content(post_res)
}
