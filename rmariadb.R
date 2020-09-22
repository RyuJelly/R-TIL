library(rJava)
library(RJDBC)
library(DBI)
drv <- JDBC(driverClass = 'org.mariadb.jdbc.Driver', 'mariadb-java-client-2.6.2.jar')
#JDBC URL
conn <- dbConnect(drv, 'jdbc:mariadb://127.0.0.1:3306/work', 'scott', 'tiger')
#                                    //localhost:(port번호)/(db명)

# (1)
str(iris)
head(iris, 6)

# (2)
names(iris) <- c("slength", "swidth", "plength", "pwidth", "species")

# (3)
dbWriteTable(conn, "iris",iris)
#dbReadTable(conn, "iris")

# (4)
# iris_all <- dbReadTable(conn, "iris")
query = "select *from iris"
iris_all <- dbGetQuery(conn, query)
iris_all

# (5)
query = "select *from iris where species = 'setosa'"
iris_setosa <- dbGetQuery(conn, query)
iris_setosa

# (6)
query = "select *from iris where species = 'versicolor'"
iris_versicolor <- dbGetQuery(conn, query)
iris_versicolor

# (7)
query = "select *from iris where species = 'virginica'"
iris_virginica <- dbGetQuery(conn, query)
iris_virginica

# (8)
productdf <- read.table("data/product_click.log")

# (9)
names(productdf) <- c("clicktime", "pid")

# (10)
dbWriteTable(conn, "productlog", productdf)
#dbReadTable(conn, "productlog")

# (11)
query <- "select *from productlog where pid = 'p003'"
p003 <- dbGetQuery(conn, query)
p003

# (12)
emp <- read.csv("data/emp.csv")

# (13)
dbWriteTable(conn, "emp", emp)

# (14)
query <- "select *from emp order by sal desc"
result1 <- dbGetQuery(conn, query)
result1

# (15)
query <- "select *from emp order by hiredate asc"
result2 <- dbGetQuery(conn, query)
result2

# (16)
query <- "select *from emp where sal >= 2000"
result3 <- dbGetQuery(conn, query)
result3

# (17)
query <- "select *from emp where sal >= 2000 && sal <= 3000"
result4 <- dbGetQuery(conn, query)
result4
