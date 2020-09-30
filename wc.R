library(htmlwidgets)
library(wordcloud2)
library(KoNLP)
useSejongDic()

words <- readLines("yes24.txt")
word_data <- extractNoun(words)
undata <- unlist(word_data)
undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table <- table(undata2)
word_table <- sort(word_table, decreasing = T)

result <- wordcloud2(word_table, shape = 'pentagon', fontFamily = "휴먼옛체", size=0.5)
result
saveWidget(result, "wc.html", title = "WORDCLOUD 실습", selfcontained = F)