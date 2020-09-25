# 문제1
day <- as.POSIXlt("1990-04-11")
cat(paste0("류제룡은 ",weekdays(day), "에 태어났어요"),"\n")

# 문제2
day1 <- format(Sys.Date(),"오늘은 %Y년 %B %d일")
day2 <- as.Date("2020-09-23") - as.Date("1990-04-11")  #unclass(day2)
day2 <- grep("\\d", day2, value = T)
cat(paste0(day1, "이고 내가 태어난지 ", day2, "일째되는 날이다"), "\n")

# 문제3
p <- as.POSIXlt(Sys.time())
format(p, "%Y년 %m월 %d일 %H시 %M분 %S초")

# 문제4
datetime <- c('12/25/2020 23:59:59', '1/25/2021 23:59:59', '2/25/2021 23:59:59')
df <- data.frame(datetime)
as.POSIXlt(df$datetime, format='%m/%d/%Y %H:%M:%S') 
#strptime() = POSIXlt 형식으로 return

# 문제5
day <- as.character(seq(20200601,20200601+6))
day <- as.POSIXlt(day, format = "%Y%m%d")
format(day, "%a-%m%d")

# 문제6
text <- "Happy Birthday to You"
v1 <- unlist(strsplit(text, " "))
length(v1)
sum(nchar(v1))

# 문제7
v2 <- NULL
v2 <- paste0(v1, collape = " ")
for(i in 1:length(v1)) v2 <- paste(v2, v1[i])
length(v2)
nchar(v2)

# 문제8
v1 <- paste(LETTERS[1:10],c(1:10))
v2 <- paste0(LETTERS[1:10],c(1:10))
v1; v2

# 문제9
text <- "Good Morning"
strsplit(unlist(strsplit(x = text, split = " ")), split = " ")

# 문제10
text <- c("Yesterday is history, tommrrow is a mystery, today is a gift!",
          "That's why we call it the present - from kung fu Panda")
text <- gsub("[,-]", "", text)
text <- gsub("\\s+", " ", text) #다중 공백 제거
text <- strsplit(text, " ")
text

# 문제11
ssn <- c("941215-1234567","850605-2345678","760830-1357913")
ssn <- gsub("-\\d*", "-*******", ssn) 
# substr(ssn, nchar(ssn)-6, nchar(ssn)) <- "*******"
ssn

# 문제 12
s1 <- "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."
r1 <- gsub("[가-힣]", "", s1)
r2 <- gsub("[[:punct:]]", "", s1)
r3 <- gsub("[[:punct:]|[가-힣]]", "", s1) # r3 <- gsub("[[:punct:][가-힣]]", "", s1)
r4 <- gsub("100", "백", s1)
r1; r2; r3; r4
