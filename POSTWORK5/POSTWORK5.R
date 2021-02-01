# POSTWORK 5

library(dplyr)
library(fbRanks)

data <- read.csv("datos.csv")

SmallData <- select(data, date = Date, home.team = HomeTeam, 
                    home.score = FTHG, away.team = AwayTeam, 
                    away.score = FTAG)
write.csv(x = SmallData, file = "soccer.csv", row.names = FALSE)

listasoccer <- create.fbRanks.dataframes(scores.file = "soccer.csv")
anotaciones <- listasoccer$scores
equipos <- listasoccer$teams

fecha <- unique(anotaciones$date)
n <- length(fecha)
ranking <- rank.teams(scores = anotaciones, teams = equipos,
                      max.date = fecha[n-1],
                      min.date = fecha[1])

pred <- predict(ranking, date = fecha[n])

