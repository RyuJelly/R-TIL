library() # 설치된 패키지 리스트
installed.packages()
search()

read_excel()
install.packages("readxl")
install.packages("rvest") 
install.packages("XML")
install.packages("httr")
install.packages("readr")


library(readxl) # require(readxl)
excel_data_ex <- read_excel("data/data_ex.xlsx")
getwd()
View(excel_data_ex)
search()
str(excel_data_ex)



# 정적 웹 크롤링과 스크래핑
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
text <- read_html(url)
text

nodes <- html_nodes(text, "div")  # 태그 선택자
nodes
title <- html_text(nodes)
title

node1 <- html_nodes(text, "div:nth-of-type(1)")
node1
html_text(node1)
html_attr(node1, "style")

node2 <- html_nodes(text, "div:nth-of-type(2)")
node2
html_text(node2)
html_attr(node2, "style")

node3 <- html_nodes(text, "div:nth-of-type(3)")
node3
html_text(node3)


# 단일 페이지(rvest 패키지 사용)
text<- NULL; title<-NULL; point<-NULL; review<-NULL; page=NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?page=1"
text <- read_html(url,  encoding="CP949")
text
# 영화제목
nodes <- html_nodes(text, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(text, ".title em")
point <- html_text(nodes)
point
# 영화리뷰 
nodes <- html_nodes(text, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()")
nodes <- html_text(nodes, trim=TRUE)
nodes
review <- nodes[nchar(nodes) > 0] 
review
page <- data.frame(title, point, review)
write.csv(page, "movie_reviews.csv")



text<- NULL; vtitle<-NULL; vpoint<-NULL; vreview<-NULL; page=NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?page=1"
text <- read_html(url,  encoding="CP949")
text
index <- 2
for (index in 1:10) {
  # 영화제목
  node <- html_nodes(text, paste0("#old_content > table > tbody > tr:nth-child(", index, ") > td.title > a.movie.color_b"))
  title <- html_text(node)
  vtitle[index] <- title
  # 영화평점
  node <- html_nodes(text, paste0("#old_content > table > tbody > tr:nth-child(", index,") > td.title > div > em"))
  point <- html_text(node)
  vpoint <- c(vpoint, point)
  # 영화리뷰 
  node <- html_nodes(text, xpath=paste0('//*[@id="old_content"]/table/tbody/tr[', index,"]/td[2]/text()"))
  node <- html_text(node, trim=TRUE)
  review = node[4]
  vreview <- append(vreview, review)
}
page <- data.frame(vtitle, vpoint, vreview)
write.csv(page, "movie_reviews1.csv")




# 여러 페이지
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
text <- NULL
movie.review <- NULL
for(i in 1: 100) {
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="CP949")
  nodes <- html_nodes(text, ".movie")
  title <- html_text(nodes)
  nodes <- html_nodes(text, ".title em")
  point <- html_text(nodes)
  nodes <- html_nodes(text, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()")
  imsi <- html_text(nodes, trim=TRUE)
  review <- imsi[nchar(imsi) > 0] 
  if(length(review) == 10) {
    page <- cbind(title, point)
    page <- cbind(page, review)
    page <- data.frame(title, point, review)
    movie.review <- rbind(movie.review, page)
  } else {
    cat(paste(i," 페이지에는 리뷰글이 생략된 데이터가 있어서 수집하지 않습니다.ㅜㅜ\n"))
  }
}
write.csv(movie.review, "movie_reviews2.csv")


# 한겨레 페이지(XML 패키지 사용)
library(XML)
imsi <- read_html("http://www.hani.co.kr/")
t <- htmlParse(imsi)
content<- xpathSApply(t,'//*[@id="main-top01-scroll-in"]/div/div/h4/a', xmlValue); 
content
content <- gsub("[[:punct:]]", "", content)
content
content

# httr 패키지 사용 - GET 방식 요청
library(httr)
http.standard <- GET('http://www.w3.org/Protocols/rfc2616/rfc2616.html')
title2 = html_nodes(read_html(http.standard), 'div.toc h2')
title2 = html_text(title2)
title2


# httr 패키지 사용 - POST 방식 요청
library(httr)
otp_url= 'http://marketdata.krx.co.kr/contents/COM/GenerateOTP.jspx'
parameter = list(
  name = 'fileDown',
  filetype = 'csv',
  url = 'MKD/03/0303/03030103/mkd03030103',
  tp_cd = 'ALL',
  date = '20190607',
  lang = 'ko',
  pagePath = '/contents/MKD/03/0303/03030103/MKD03030103.jsp')

my_otp = POST(otp_url, query = parameter) 
my_otp = read_html(data)
my_otp = html_text(data)

download_url = 'http://file.krx.co.kr/download.jspx'
data = POST(download_url, query = list(code = my_otp),
            add_headers(referer = otp_url)) 


library(readr)
data =  read_html(data) 
data = html_text(data)
data = read_csv(data)
as.data.frame(data)

# 뉴스, 게시판 등 글 목록에서 글의 URL만 뽑아내기 
res = GET('https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=001')
htxt = read_html(res)
link = html_nodes(htxt, 'div.list_body a'); length(link)
article.href = unique(html_attr(link, 'href'))
article.href

# 이미지, 첨부파일 다운 받기 
# pdf
res = GET('http://cran.r-project.org/web/packages/httr/httr.pdf')
writeBin(content(res, 'raw'), 'c:/Temp/httr.pdf')


# jpg
h = read_html('http://unico2013.dothome.co.kr/productlog.html')
imgs = html_nodes(h, 'img')
img.src = html_attr(imgs, 'src')
for(i in 1:length(img.src)){
  res = GET(paste('http://unico2013.dothome.co.kr/',img.src[i], sep=""))
  writeBin(content(res, 'raw'), paste('c:/Temp/', img.src[i], sep=""))
} 
