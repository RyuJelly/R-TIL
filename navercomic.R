library(rvest)
site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
naver_comic <- NULL
i <- 1

repeat{
  text <- read_html(paste0(site,i))
  comicName <- html_text(html_nodes(text, "td > div.challengeInfo > h6 > a"), trim = TRUE)
  comicSummary <- html_text(html_nodes(text, ".summary"))
  comicGrade <- html_text(html_nodes(text, "td > div.challengeInfo > div.rating_type > strong"))

  page <- data.frame(comicName, comicSummary, comicGrade)
  if(data.duplicated['page','naver_comic']){
    break;
  }
  naver_comic <- rbind(naver_comic, page)
  i <- i + 1;
}

write.csv(naver_comic, "navercomic.csv")
View(naver_comic)