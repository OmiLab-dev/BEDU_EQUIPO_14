
#Solución al Postwork Sesión 3


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
(pcasa <- round(table(data$FTHG)/dim(data)[1], 3)) # Probabilidades marginales estimadas para los equipos que juegan en casa

(pvisita <- round(table(data$FTAG)/dim(data)[1], 3)) # Probabilidades marginales estimadas para los equipos que juegan como visitante

(pcta <- round(table(data$FTHG, data$FTAG)/dim(data)[1], 3)) # Probabilidades conjuntas estimadas para los partidos

pcasa <- as.data.frame(pcasa)
str(pcasa)

pcasa <- pcasa %>% rename(goles = Var1, FRel = Freq)
tail(pcasa)

p <- ggplot(pcasa, aes(x = goles, y = FRel)) + 
  geom_bar (stat="identity", fill = 'blue') +
  ggtitle('Equipo de casa')
p


pvisita <- as.data.frame(pvisita)
pvisita <- rename(pvisita, goles = Var1, FRel = Freq)
tail(pvisita)

p <- ggplot(pvisita, aes(x = goles, y = FRel)) + 
  geom_bar (stat="identity", fill = 'red') +
  ggtitle('Equipo visitante')
p

pcta <- melt(pcta)
pcta <- rename(pcta, gcasa = Var1, gvisita = Var2, ProbEst = value)
pcta %>% ggplot(aes(gcasa, gvisita)) + 
  geom_tile(aes(fill = ProbEst)) + 
  ggtitle('Probabilidades conjuntas estimadas') +
  scale_fill_gradient(low = 'blue', high = 'red') +
  theme(axis.text.x = element_text(angle = 90, hjust = 0))

