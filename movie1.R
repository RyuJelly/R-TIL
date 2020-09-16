library(rvest)
url <- "https://movie.daum.net/moviedb/grade?movieId=131576"
text <- read_html(url)

# 평점
nodes <- html_nodes(text, ".emph_grade")
point <- html_text(nodes)

# 댓글
nodes <- html_nodes(text, ".desc_review")
nodes <- html_text(nodes, trim=TRUE)
review <- nodes[nchar(nodes) > 0]
page <- data.frame(point,review)
View(page)
write.csv(page, "daummovie1.csv")
