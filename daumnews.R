library(rvest)
url <- "http://media.daum.net/ranking/popular/"
text <- read_html(url)
news <- NULL

for(index in 1:50){
  title <- html_text(html_nodes(text, paste0("#mArticle > div.rank_news > ul.list_news2 > li:nth-child(", index, ") > div.cont_thumb > strong > a")))
  name <- html_text(html_nodes(text, paste0("#mArticle > div.rank_news > ul.list_news2 > li:nth-child(", index ,") > div.cont_thumb > strong > span")))
  page <- data.frame(title, name)
  news <- rbind(news, page)
}

write.csv(news, "daumnews.csv")
View(news)