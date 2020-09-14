# 문제1
exam1 <- function(){
  a <- paste(LETTERS, letters, sep="")
  return(a)
}
exam1()

# 문제2
exam2 <- function(x){
  sum <- 0;
  for(i in 1:x)
    sum <- sum+ i;
  return(sum)
}
exam2(5); exam2(10); exam2(100)

# 문제3
exam3 <- function(x,y){
  a <- abs(x-y)
  return(a)
}
exam3(10,5); exam3(5,10); exam3(10,10)

# 문제4
exam4 <- function(x,y,z){
  if(y=='+') result <- x+z
  else if(y=='-') result <- abs(x-z)
  else if(y=='*') result <- x*z
  else if(y=='/') result <- x/z
  else if(y=='%%'){
    if(x==0) result <- '오류1'
    else if(z==0) result <- '오류2'
    else result <- x%%z
  }
  else if(y=='%/%'){
    if(x==0) result <- '오류1'
    else if(z==0) result <- '오류2'
    else result <- x%/%z
  }
  return(result)
}

exam4(5,'+',5)
exam4(5,'-',5)
exam4(5,'*',5)
exam4(5,'/',5)
exam4(5,'%%',5)
exam4(0,'%%',5)
exam4(5,'%%',0)
exam4(5,'%/%',5)
exam4(0,'%/%',5)
exam4(5,'%/%',0)

# 문제5
exam5 <- function(x,y="#"){
  if (x >0){
    for (i in 1:x){
      cat(y)
    }
    cat('\n')
  }
}
exam5(10,"@"); exam5(-2); exam5(8)

# 문제6
score <- sample(0:100,1)
exam6 <- function(...){
  data <- c(...)
  for (score in data){
    if(is.na(score)){
      print("NA는 처리불가")
    }else{
      if(score>=85) grade <- '상'
      else if (score>=70) gtade <- '중'
      else grade <- '하'
      print(paste(score, "점은 ", grade,"등급입니다.",sep=""))
    }
  }
}
exam6(80,50,70,66,NA,35)
