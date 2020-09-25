library(rJava)
library(RJDBC)
library(DBI)
drv <- JDBC(driverClass = 'org.mariadb.jdbc.Driver',
            'mariadb-java-client-2.6.2.jar')
conn <- dbConnect(drv, "jdbc:mysql://localhost:3306/work", "scott", "tiger")
# 문제1
productlog <- dbReadTable(conn, "productlog")
data <- table(productlog$pid)
xname <- productlog$pid
barplot(productlog$pid, main = "세로바 그래프 실습", xlab="상품ID", ylab="클릭수", col="terrain.colors", names.arg=xname )

substr(data3,9,10)