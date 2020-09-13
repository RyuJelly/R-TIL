# 문제1
m1 <- matrix(data=seq(10, 38, 2), nrow= 3, ncol = 5, byrow=T)
m2 <- m1+100
m_max_v <- max(m1)
m_min_v <- min(m1)
row_max <- apply(m1,1,max)
col_max <- apply(m1,2,max)
m1; m2; m_max_v; m_min_v; row_max; col_max;

# 문제2
n1 <- 1:3
n2 <- 4:6
n3 <- 7:9
m2 <- cbind(n1,n2,n3)
colnames(m2) <- NULL

# 문제3
m3 <- matrix(1:9,nrow=3, byrow=T); m3

# 문제4
m4 <- m3
rownames(m4) = c("row1", "row2", "row3")
colnames(m4) = c("col1", "col2", "col3")
print(m4)

# 문제5
alpha <- matrix(data = letters[1:6], nrow=2, ncol=3)
alpha2 <- rbind(alpha,c('x','y','z')); alpha2
alpha3 <- cbind(alpha,c('s', 'p')); alpha3

# 문제6
a <- array(1:24, dim=c(2,3,4))
a[2,3,4]     # (1)
a[2,,]       # (2)
a[,1,]       # (3)
a[,,3]       # (4)
a + 100      # (5) 
a[,,4] * 100 # (6)
a[1,-1,]     # (7)
a[2,,2] <- a[2,,2]+ 100      # (8)
a[,,1] <- a[,,1] - 2         # (9)
a <- a * 10  # (10)
rm(a)
