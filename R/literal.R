#' Literal data
#'
#' @export
#'
literal <- function(prompt=NULL) {
  list(
    no_api = "`OPENAI_API_KEY` not provided.",
    gpt3_5 = "gpt-3.5-turbo",
    gpt3_5_16k = 'gpt-3.5-turbo-16k',
    gpt4 = "gpt-4",
    gpt4_32 = "gpt-4-32k",
    echo_user_input_info = paste0("\n ---- Your input ---- :\n\n", prompt, "\n"),
    normal_status = 200:299
  )
}
