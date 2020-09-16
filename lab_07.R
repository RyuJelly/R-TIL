# 문제1

# 문제2
vmSum <- function(x){
  if(!is.vector(x)) return("벡터만 전달하숑!")
  else{
    if(!is.numeric(x)){
      print("숫자 벡터를 전달하숑!")
      return(0)}
    else{
      sum <- 0;
      for(i in x) sum <- sum + i
      return(sum)
    }
  }
}
a <- c(10,20,30); b <- c(10,20,"오"); c <- 7
vmSum(a); vmSum(b); vmSum(c);
