library(dplyr)
library(ggplot2)
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
midwest <- as.data.frame(ggplot2::midwest)
###### 문제7
# 7-1
mpg %>%
  mutate(sum_v = cty + hwy) -> mpg4

# 7-2
mpg4 %>%
  mutate(avg_v = sum_v/2) -> mpg4

# 7-3
mpg4 %>%
  arrange(desc(avg_v)) %>%
  head(3)

# 7-4
mpg %>%
  mutate(sum_v = cty + hwy, avg_v = sum_v/2) %>%
  arrange(desc(avg_v)) %>%
  head(3)

###### 문제8
# 8-1
mpg %>%
  group_by(class) %>%
  summarise(mean(cty))

# 8-2
mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty))

# 8-3
mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>%
  head(3)

# 8-4
mpg %>% 
  filter(class == "compact") %>%
  group_by(manufacturer) %>%
  tally() %>%
  arrange(desc(n))

###### 문제9
# 9-1
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel

mpg <- left_join(mpg, fuel, by="fl")

# 9-2
mpg %>% 
  select(model, fl, price_fl) %>% 
  head(5)

###### 문제10
# 10-1
midwest %>% 
  mutate(teen_per_total = (poptotal-popadults)/poptotal*100) -> midwest1

# 10-2
midwest1 %>% 
  arrange(desc(teen_per_total)) %>% 
  head(5) %>% 
  select(county, teen_per_total)

# 10-3
df = data.frame(grade = c())