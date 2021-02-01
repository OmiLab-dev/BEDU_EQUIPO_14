# POSTWORK 6

library(dplyr)

data <- read.csv("match.data.csv")

nd <- data %>% 
  mutate(date = as.Date(date, "%Y-%m-%d"),
         sumagoles = home.score + away.score) %>%
  mutate(Ames = format(date, "%Y-%m")) %>%
  group_by(Ames) %>%
  summarise(promgoles = mean(sumagoles))

(nd <- as.data.frame(nd))

(nd <- nd %>% filter(Ames != "2013-06"))
(nd <- nd[1:95,])

(promgoles <- ts(nd$promgoles, start = 1,
                 frequency = 10))

ts.plot(promgoles)
