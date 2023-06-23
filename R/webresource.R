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


#' Get News Title from Naver Search
#'
#' Get the first page results of a news search in Naver Search API.
#'
#' @param search_query What to search for
#' @param client_id Client ID
#' @param client_secret Client secret
#'
#' @export
#'
get_naver_news <- function(search_query,client_id,client_secret) {
  url="https://openapi.naver.com/v1/search/news.json"
  query = list(
    query = search_query,
    display = 10,
    start = 1,
    sort = "sim"
  )
  headers = c(
    "Host" = "openapi.naver.com",
    "User-Agent" = "curl/7.49.1",
    "Accept" = "*/*",
    "X-Naver-Client-Id" = client_id,
    "X-Naver-Client-Secret" = client_secret
  )
  response = GET(url, query = query, add_headers(.headers=headers))
  content = content(response, "text")
  news_data = fromJSON(content[1])$items
  heading = news_data$title
  body = news_data$link %>% map_chr(function(x) {
    read_html(x) %>%
      html_element("div#dic_area") %>%
      html_text() %>%
      str_trim() %>%
      str_remove_all('"') %>%
      str_remove_all("'") %>%
      str_sub(0,200)
  })
  body[is.na(body)]=" "
  #paste(paste("News heading is :",heading,sep=' '),body,sep = ". The content is followed: ")
  body
}
