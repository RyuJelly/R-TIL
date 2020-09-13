# 문제1
grade <- sample(1:6,1)                    # (1)
if (grade<=3){                            # (2)
  cat(grade, "학년은 저학년입니다.")
}else{
  cat(grade, "학년은 고학년입니다.")
}

# 문제2
choice <- sample(1:5,1)                   # (1)
if (choice==1){                           # (2)
  result <- 300 + 50
}else if (choice==2){
  result <- 300 - 50
}else if (choice==3){
  result <- 300 * 50
}else if (choice==4){
  result <- 300 / 50
}else{
  result <- 300 %% 50
}
cat("결과값 :", result)      #choice

# 문제3
count <- sample(3:10,1)                   # (1)
deco <- sample(1:3,1)                     # (2)
if (deco==1){                             # (3)
  for(i in 1:count)
    cat("*")
}else if (deco==2){
  for(i in 1:count)
    cat("$")
}else{
  for(i in 1:count)
    cat("#")
}

# 문제4
score <- sample(0:100,1)                   # (1)
score <- as.character(score)               # (2)
level <- switch(EXPR=score,
                "100"=,"99"=,"98"=,"97"=,"96"=,"95"=,"94"=,"93"=,"92"=,"91"=,"90"="A 등급",
                "89"=,"88"=,"87"=,"86"=,"85"=,"84"=,"83"=,"82"=,"81"=,"80"="B 등급",
                "79"=,"78"=,"77"=,"76"=,"75"=,"74"=,"73"=,"72"=,"71"=,"70"="C 등급",
                "69"=,"68"=,"67"=,"66"=,"65"=,"64"=,"63"=,"62"=,"61"=,"60"="D 등급",
                "F 등급")

cat(score,"점은 ", level,"입니다.")      # (3) 
#print(score,"점은 ", level,"입니다.")    # 에러

###################
if(score>=90 & score<=100){
  for (i in 90:100)
    level = switch(EXPR=score,
                   i="A 등급")
}else if(score>=80 & score<=89){
  for (i in 80:89)
    level = switch(EXPR=score,
                   i="B 등급")
}else if(score>=70 & score<=79){
  for (i in 70:79)
    level = switch(EXPR=score,
                   i="C 등급")
}else if(score>=60 & score<=69){
  for (i in 60:69)
    level = switch(EXPR=score,
                   i="D 등급")
}else{
  for (i in 1:59)
    level = switch(EXPR=score,
                   i="F 등급")
}
###################

# 문제5
for(i in 1:26){
  alpha[i] <- paste(LETTERS[i],letters[i],sep='')
  cat('"',alpha[i],'" ',sep='')
}
