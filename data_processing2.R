v <- readLines("data/memo.txt", encoding = 'UTF-8')
memo_new <- NULL

for(i in 1:length(v)){
  if(i == 1) new <- gsub("[[:punct:]]", "", v[i])
  if(i == 2) new <- gsub(pattern = "([[:lower:]])", perl = TRUE, replacement = "\\U\\1", v[i])
  if(i == 3) new <- gsub("[[:digit:]]", "", v[i])
  if(i == 4) new <- gsub("[[:upper:][:lower:]]", "", v[i])
  if(i == 5) new <- gsub("[[:punct:][:digit:]]", "", v[i])
  if(i == 6) new <- gsub("[[:space:]]", "", v[i])
  if(i == 7) new <- gsub(pattern = "([[:upper:]])", perl = TRUE, replacement = "\\L\\1", v[i])
  memo_new <- append(memo_new, new)
}

write(memo_new, "memo_new.txt")