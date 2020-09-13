# 문제1
L1 <- list(name=c("scott"),sal=c(3000))
result1 <- L1$sal * 2 # L1[[2]] * 2

# 문제2
L2 <- list("scott",c(100,200,300)) 
#L1$sal <- c(100,200,300); names(L1) <- NULL; L2 <- L1

# 문제3
L3 <- list(c(3,5,7), c("A","B","C"))
L3[[2]][1] <- "Alpha"

# 문제4
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
print(L4$alpha+10)
# L4$alpha <- L4$alpha + 10; print(L4)

# 문제5
L5 <- list(data1=LETTERS, data2=emp[1:3,], data3= L4) 
#data2 = head(read.csv("data/emp.csv"), n=3)
print(L5$data1[1])
print(L5$data2$ename)
print(L5$data3$gamma); # print(L5$data3[3])

# 문제6
L6 <- list(math=list(95,90), writing=list(90,85), reading=list(85,80))
print(mean(unlist(L6)))
