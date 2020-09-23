install.packages("rJava")
install.packages("RJDBC")
install.packages("DBI")
library(rJava)
library(RJDBC)
library(DBI)

# 드라이버 로딩과 데이터베이스 연동
drv <- JDBC(driverClass = 'org.mariadb.jdbc.Driver', 'mariadb-java-client-2.6.2.jar')
#JDBC URL
#                                    //localhost:(port번호)/(db명)
conn <- dbConnect(drv, 'jdbc:mariadb://127.0.0.1:3306/work', 'scott', 'tiger')

# 데이터베이스로부터 레코드 검색, 추가, 수정, 삭제
query <- "select * from goods"
goodsAll <- dbGetQuery(conn, query)
goodsAll
dbReadTable(conn, "goods")

query = "select * from goods where su >=3"
goodsOne <- dbGetQuery(conn,query)
goodsOne

query = "select *from goods order by dan desc"
dbGetQuery(conn, query)

# 데이터프레임 자료를 테이블에 저장하기
insert.df <- data.frame(code=5, name='식기 세척기', su=1, dan=250000)
dbWriteTable(conn, "goods", insert.df)
dbWriteTable(conn, "goods1", insert.df)

query <- "select * from goods1"
goodsAll <- dbGetQuery(conn, query)
goodsAll
dbReadTable(conn, 'goods1')

# csv 파일의 자료를 테이블에 저장하기
recode <- read.csv("data/recode.csv")
dbWriteTable(conn, "goods2", recode)

query = "select * from goods2"
goodsAll <- dbGetQuery(conn, query)
goodsAll

# 테이블에 자료 추가, 수정, 삭제하기
query = "insert into goods2 values(6, 'test', 1, 1000)"
dbSendUpdate(conn, query)
query = "select *from goods2"
goodsAll <- dbGetQuery(conn, query)
goodsAll

query = "update goods2 set name= '테스트' where code = 6"
dbSendQuery(conn, query)
query = "select *from goods2"
goodsAll <- dbGetQuery(conn, query)
goodsAll

delquery = "delete from goods2 where code = 6"
dbSendUpdate(conn, delquery)
query = "select *from goods2"
goodsAll <- dbGetQuery(conn, query)
goodsAll

dbSendUpdate(conn, "drop table goods2")




dbWriteTable(conn,"book",data.frame(bookname=c("파이썬 정복","하둡 완벽 입문","R 프로그래밍"),
                                    price=c(25000,25000,28000)))
dbGetQuery(conn, "SELECT * FROM book")


dbWriteTable(conn, "mtcars", mtcars[1:5, ])
dbReadTable(conn, "mtcars")

dbWriteTable(conn, "mtcars", mtcars[6:10, ], append = TRUE)
dbReadTable(conn, "mtcars")

dbWriteTable(conn, "mtcars", mtcars[1:2, ], overwrite = TRUE)
dbReadTable(conn, "mtcars")



dbWriteTable(conn,"cars",head(cars,3))
dbGetQuery(conn, "SELECT * FROM cars")


# 데이터 수정
dbSendUpdate(conn,"INSERT INTO cars(speed, dist) VALUES(1,1)")
dbSendUpdate(conn,"INSERT INTO cars(speed, dist) VALUES(2,2)")
dbReadTable(conn,"cars")
dbSendUpdate(conn,"UPDATE CARS SET DIST=DIST*100 WHERE SPEED =1")
dbReadTable(conn,"cars")
dbSendUpdate(conn,"UPDATE CARS SET DIST=DIST*3 WHERE SPEED =1")
dbReadTable(conn,"cars")

# 테이블 삭제
dbRemoveTable(conn,"cars")








# 데이터 전처리(1) - apply 계열의 함수를 알아보자
weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F","M","M","F","F")

df <- data.frame(w=weight, h=height)
df

apply(df, 1, sum, na.rm=TRUE)
apply(df, 2, sum, na.rm=TRUE)
lapply(df, sum, na.rm=TRUE)
sapply(df, sum, na.rm=TRUE)
tapply(1:6, gender, sum, na.rm=TRUE)
tapply(df$w, gender, mean, na.rm=TRUE)
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5])


v<-c("abc", "DEF", "TwT")
sapply(v, function(d) paste("-",d,"-", sep=""))

l<-list("abc", "DEF", "TwT")
sapply(l, function(d) paste("-",d,"-", sep=""))
lapply(l, function(d) paste("-",d,"-", sep=""))

flower <- c("rose", "iris", "sunflower", "anemone", "tulip")
length(flower)
nchar(flower)
sapply(flower, function(d) if(nchar(d) > 5) return(d))
sapply(flower, function(d) if(nchar(d) > 5) d)
sapply(flower, function(d) if(nchar(d) > 5) return(d) else return(NA))
sapply(flower, function(d) paste("-",d,"-", sep=""))

sapply(flower, function(d, n=5) if(nchar(d) > n) return(d))
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), 3)
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), n=4)

count <- 1
myf <- function(x, wt=T){
  print(paste(x,"(",count,")"))
  Sys.sleep(1)
  if(wt) 
    r <- paste("*", x, "*")
  else
    r <- paste("#", x, "#")
  count <<- count + 1;
  return(r)
}
result <- sapply(df$w, myf)
length(result)
result
sapply(df$w, myf, F)
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F)
str(rr1)

count <- 1
sapply(df, myf)
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
rr2[1,"w"]
