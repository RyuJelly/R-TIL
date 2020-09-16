library(rvest)
text<- NULL; title<-NULL; point<-NULL; review<-NULL; page=NULL
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)

# <h1> 태그의 컨텐츠
h1 <- html_nodes(text, "h1")
html_text(h1)

# <a> 태그의 컨텐츠와 href 속성값
a <- html_nodes(text, "a")
html_text(a)
html_attr(a,"href")

# <img> 태그의 src 속성값
img <- html_nodes(text, "img")
html_attr(img,"src")

# 첫번째 <h2> 태그의 컨텐츠
h2_nth1 <- html_nodes(text, "h2:nth-of-type(1)")
html_text(h2_nth1)

# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
ul <- html_nodes(text, "ul > [style$=green]")
html_text(ul)

# 두 번째 <h2> 태그의 컨텐츠
h2_nth2 <- html_nodes(text,"h2:nth-of-type(2)")
html_text(h2_nth2)

# <ol> 태그의 모든 자식 태그들의 컨텐츠
html_text(html_nodes(text,"ol > *"))

# <table> 태그의 모든 자손 태그들의 컨텐츠


