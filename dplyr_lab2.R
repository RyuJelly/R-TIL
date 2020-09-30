library(dplyr)
library(ggplot2)
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
###### 문제1
# 1-1
str(mpg)

# 1-2
nrow(mpg)
ncol(mpg)

# 1-3
head(mpg, 10)

# 1-4
tail(mpg, 10)

# 1-5
View(mpg)

# 1-6
summary(mpg) #열단위 요약

# 1-7
mpg %>% 
  group_by(manufacturer) %>%
  tally

# 1-8
mpg %>%
  group_by(manufacturer, model) %>%
  summarise(n = n())

###### 문제2
# 2-1
mpg %>%
  rename(city = cty, highway = hwy) -> mpg2

# 2-2
mpg2 %>%
  filter(manufacturer == "audi" & model == "a4") %>%
  arrange(displ) %>%
  head(6)

###### 문제3
# 3-1
midwest <- as.data.frame(ggplot2::midwest)
str(midwest)

# 3-2
midwest %>%
  rename(total = poptotal, asian = popasian) -> midwest

# 3-3
midwest %>%
  mutate(a_ratio = (asian / total) * 100) -> midwest

# 3-4
midwest %>%
  mutate(population = ifelse(a_ratio > mean(a_ratio), "large", "small"))

###### 문제4
# 4-1
mpg %>% 
  filter(displ <= 4) %>%
  summarise(mean(hwy))
  
mpg %>%
  filter(displ >= 5) %>%
  summarise(mean(hwy))

# 4-2
mpg %>%
  filter(manufacturer == "audi") %>%
  summarise(mean(cty))
mpg %>%
  filter(manufacturer == "toyota") %>%
  summarise(mean(cty))

mpg %>% 
  filter(manufacturer %in% c("audi", "toyota")) %>% 
  group_by(manufacturer) %>% 
  summarise(mean(cty))

# 4-3
mpg %>%
  filter(manufacturer %in% c("chevrolet", "ford", "honda")) %>%
  summarise(mean(hwy))

###### 문제5
# 5-1
mpg %>%
  select(class, cty) -> mpg3

head(mpg3)

# 5-2
mpg3 %>%
  filter(class == "suv") %>%
  summarise(mean(cty))
mpg3 %>%
  filter(class == "compact") %>%
  summarise(mean(cty))

mpg3 %>% 
  filter(class %in% c("suv", "compact")) %>% 
  group_by(class) %>% 
  summarise(mean(cty))

###### 문제6
mpg %>%
  filter(manufacturer == "audi") %>%
  arrange(desc(hwy)) %>%
  head(5)
