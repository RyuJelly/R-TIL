library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("http://gs25.gsretail.com/gscvs/ko/products/event-goods")
Sys.sleep(1)
TtO <- remDr$findElements(using = "css selector", "#TWO_TO_ONE")
remDr$executeScript("arguments[0].click();", TtO)
name <- NULL
goodsname <- NULL
price <- NULL
goodsprice <- NULL

repeat{
  # 상품명
  doms1 <- remDr$findElements(using = "css selector", "#contents > div.cnt > div.cnt_section.mt50 > div > div > div > ul > li > div > p.tit")
  goodsname_v <- sapply(doms1, function(x) {x$getElementText()})
  name <- unlist(goodsname_v)
  goodsname <- append(goodsname, name[9:16])
  # 가격
  doms2 <- remDr$findElements(using = "css selector", "#contents > div.cnt > div.cnt_section.mt50 > div > div > div > ul > li > div > p.price > span")
  goodsprice_v <- sapply(doms2, function(x) {x$getElementText()})
  price <- unlist(goodsprice_v)
  price <- gsub("[^[:digit:]]", "", price)
  goodsprice <- append(goodsprice, price[9:16])
  
  df <- data.frame(goodsname, goodsprice)
  # 마지막 페이지 체크
  doms3 <- remDr$findElements(using = "css selector", "#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > span > a.on")
  page <- unlist(sapply(doms3, function(x) {x$getElementText()}))
  doms4 <- remDr$findElements(using = "css selector", "#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next2")
  endPage <- unlist(sapply(doms4, function(x) {x$getElementAttribute('onclick')}))
  endPage <- gsub("[^[:digit:]]", '', endPage)
  if(page == endPage) break;
  # 페이지 이동
  pageLink <- remDr$findElements(using = "css selector", "#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next")
  remDr$executeScript("arguments[0].click();", pageLink)
  Sys.sleep(1)
}

cat(length(goodsname), "개의 상품 추출\n")
write.csv(df, "gs25_twotoone.csv")