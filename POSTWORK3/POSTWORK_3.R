#POSTWORK 3


library(dplyr)
library(reshape2)
library(ggplot2)

data <- read.csv("datos.csv")
dim(data)
str(data)
tail(data)
View(data)
summary(data)

#Con ayuda de la función table obtenemos las estimaciones de probabilidades solicitadas
(probcasa <- round(table(data$FTHG)/dim(data)[1], 3)) # Probabilidades marginales estimadas para los equipos que juegan en casa

(probvisita <- round(table(data$FTAG)/dim(data)[1], 3)) # Probabilidades marginales estimadas para los equipos que juegan como visitante

(probconjunta <- round(table(data$FTHG, data$FTAG)/dim(data)[1], 3)) # Probabilidades conjuntas estimadas para los partidos

probcasa <- as.data.frame(probcasa)
str(probcasa)

probcasa <- probcasa %>% rename(goles = Var1, FRel = Freq)
tail(probcasa)

p <- ggplot(probcasa, aes(x = goles, y = FRel)) + 
  geom_bar (stat="identity", fill = 'blue') +
  ggtitle('Equipo de casa')
p


probvisita <- as.data.frame(probvisita)
probvisita <- rename(probvisita, goles = Var1, FRel = Freq)
tail(probvisita)

p <- ggplot(probvisita, aes(x = goles, y = FRel)) + 
  geom_bar (stat="identity", fill = 'red') +
  ggtitle('Equipo visitante')
p

probconjunta <- melt(probconjunta)
probconjunta <- rename(probconjunta, gcasa = Var1, gvisita = Var2, ProbEst = value)
probconjunta %>% ggplot(aes(gcasa, gvisita)) + 
  geom_tile(aes(fill = ProbEst)) + 
  ggtitle('Probabilidades conjuntas estimadas') +
  scale_fill_gradient(low = 'blue', high = 'red') +
  theme(axis.text.x = element_text(angle = 90, hjust = 0))