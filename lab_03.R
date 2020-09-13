# 문제1
str(iris)

# 문제2
df1 <- data.frame(x=1:5, y=seq(2,10,2))

# 문제3
df2 <- data.frame(col1=1:5, col2=letters[1:5], col3=6:10)

# 문제4
제품명 = c("사과", "딸기", "수박")
가격 = c(1800, 1500, 3000)
판매량 = c(24, 38, 30)
df3 = data.frame(제품명, 가격, 판매량) 
# df3 = data.frame(제품명, 가격, 판매량, stringsAsFactors=F); df3
print(df3)

# 문제5
print(mean(df3$가격))
print(mean(df3$판매량))

# 문제6
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)
df4 <- data.frame(name, gender, math); df4
df4$stat <- c(76, 73, 95, 82, 35)
df4$score <- df4$math + df4$stat
df4$grade <- ifelse(df4$score >= 150, "A",
                    ifelse(df4$score >= 100, "B", 
                           ifelse(df4$score >= 70, "C", "D")))

# 문제7
getwd()
emp <- read.csv("data/emp.csv")
str(emp)

# 문제8
print(emp[c(3,4,5),])

# 문제9
print(emp[,-4]) # emp[-4]

# 문제10
print(emp[,"ename",drop=F])

# 문제11
print(emp[,c('ename','sal')])

# 문제12
print(subset(emp,select=c("ename","sal","job"),subset= emp$job =="SALESMAN"))

# 문제13
print(subset(emp, select = c("ename","sal","deptno"),
              subset = emp$sal >=1000 & emp$sal <=3000))

# 문제14
print(subset(emp, job !="ALALYST", c("ename", "job", "sal")))

# 문제15
print(subset(emp, job == "SALESMAN" |job == "ANALYST", c("ename", "job")))

# 문제16
print(subset(emp, is.na(emp$comm), c("ename", "sal")))
emp[is.na(emp$comm), c("ename","sal")]

# 문제17 
emp[order(emp$sal),]
# emp <- emp[c(order(emp$sal)),]
# rownames(emp) = NULL
# print(emp)

# 문제18
nrow(emp)
ncol(emp)
dim(emp)
length(emp)
