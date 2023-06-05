parse_response <- function(raw_response) {
  # If the model is from the `gpt-3.5-turbo` family, it parses in a different way.
  if (grepl("gpt-3.5-turbo", Sys.getenv("OPENAI_MODEL", "gpt-3.5-turbo"))) {
    trimws(sapply(raw_response$choices, function(x) x$message$content))
  } else {
    trimws(sapply(raw_response$choices, function(x) x$text))
  }
}
