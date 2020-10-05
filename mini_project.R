library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.sexoffender.go.kr/m1s2_3.nsc")

sido <- remDr$findElements(using="css selector", "#mSearch > div > ul > li:nth-child(4) > label")
remDr$executeScript("arguments[0].click();", sido)
city <- remDr$findElements(using="css selector", "#city")
remDr$executeScript("arguments[0].click();", city)
selec_sido <- remDr$findElements(using="css selector", "#city1 > option:nth-child(2)") 
remDr$executeScript("arguments[0].click();", selec_sido)

repeat{
  for (i in 2:26){
    # 자치구 선택
    selec_gu <- remDr$findElements(using="css selector", paste0("#city1 > option:nth-child(", i, ")"))  
    doms1 <- remDr$findElements(using='css selector', "#detail_view03 > div.table_list > table > tbody > tr > td:nth-child(3) > a")
    address <- sapply(doms1, function(x) {x$getElementText()})
    
    #페이지 넘기기
    
    
    # 마지막페이지 체크
    doms3 <- remDr$findElements(using="css selector", "#detail_view03 > div.paging > font > strong")
    page <- unlist(sapply(doms3, function(x) {x$getElementText()}))
    doms4 <- remDr$fineElements(using="css selector", "#detail_view03 > div.paging > a.end")
    endPage <- unlist(sapply(doms4, function(x) {x$getElementAttribute('onclick')}))
    endPage <- gsub("[^[:digit:]]", '', endPage)
    if(page == endPage) break;
  }
}