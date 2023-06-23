#web resource learning


#' Get News Title from Google Search
#'
#' Get the first page results of a news search in Google Search.
#'
#' @param search_query What to search for
#' @return Combine search results into a single sentence
#' @export
#'
get_gs_news_title <- function(search_query) {
  search_url <- paste0("https://www.google.com/search?tbm=nws&q=", URLencode(search_query))
  response <- GET(search_url)
  html_content <- content(response, as = "text")
  parsed_html <- read_html(html_content)
  search_headlines <- parsed_html %>% html_nodes("h3") %>% html_text()
  search_headlines
}
