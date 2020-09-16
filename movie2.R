library(rvest)
site <- "https://movie.daum.net/moviedb/grade?movieId=131576&type=netizen&page="
movie.review <- NULL

for(i in 1:5){
  url <- paste0(site,i)
  text <- read_html(url)
  
  # 평점
  nodes <- html_nodes(text, ".emph_grade")
  point <- html_text(nodes)
  
  # 리뷰글
  nodes <- html_nodes(text, ".desc_review")
  review <- html_text(nodes, trim=TRUE)
  if(length(review) == 10){
    page <- data.frame(point, review)
    movie.review <- rbind(movie.review, page)
  }
}

write.csv(movie.review, "daummovie2.csv")