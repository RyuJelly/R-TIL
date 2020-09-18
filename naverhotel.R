library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
url <- "https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2"
remDr$navigate(url)
Sys.sleep(3)
reple <- NULL
pageLink <- NULL
endPageLink <- NULL

repeat{
  doms <- remDr$findElements(using = "css selector", ".review_desc")
  Sys.sleep(1)
  reple_v <- sapply(doms, function(x) {x$getElementText()})
  reple <- append(reple, unlist(reple_v))
  pageLink <- remDr$findElements(using = "css", "body > div > div.ng-scope > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > a.direction.next")
  endPageLink <- remDr$findElements(using = "css", "body > div > div.ng-scope > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > a.direction.next.disabled")
  remDr$executeScript("arguments[0].click();", pageLink)
  Sys.sleep(2)
  if(length(endPageLink) == 1) break;
}

cat(length(reple), "개의 댓글 추출\n")
write(reple,"naverhotel.txt")