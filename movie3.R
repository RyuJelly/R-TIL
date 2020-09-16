library(rvest)
site <- "https://movie.daum.net/moviedb/grade?movieId=131576&type=netizen&page="
movie.review <- NULL
i <- 1

repeat{
  url <- paste0(site,i)
  text <- read_html(url)
  
  # 평점
  nodes <- html_nodes(text, ".emph_grade")
  point <- html_text(nodes)
  
  # 리뷰글
  nodes <- html_nodes(text, ".desc_review")
  review <- html_text(nodes, trim=TRUE)
  page <- data.frame(point, review)
  movie.review <- rbind(movie.review, page)
  if(length(review) == 0){
    break;
  }
  i <- i+1
}

write.csv(movie.review, "daummovie3.csv")