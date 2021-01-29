#POSTWORK 2

library(dplyr)
#1
url1718 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
url1819 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
url1920 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"
datos1718 <- read.csv(file = url1718) 
datos1819 <- read.csv(file = url1819)
datos1920 <- read.csv(file = url1920)

#2
str(datos1718); str(datos1819); str(datos1920)
head(datos1718); head(datos1819); head(datos1920)
View(datos1718); View(datos1819); View(datos1920)
summary(datos1718); summary(datos1819); summary(datos1920)

#3
lista <- list(datos1718, datos1819, datos1920)
nlista <- lapply(lista, select, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)

lapply(nlista, str)

#4
nlista[[1]] <- mutate(nlista[[1]], Date = as.Date(Date, "%d/%m/%y"))
nlista[[2]] <- mutate(nlista[[2]], Date = as.Date(Date, "%d/%m/%Y"))
nlista[[3]] <- mutate(nlista[[3]], Date = as.Date(Date, "%d/%m/%Y"))
data <- do.call(rbind, nlista)
dim(data)
str(data)
tail(data)
View(data)
summary(data)
write.csv(data,"datos.csv")
