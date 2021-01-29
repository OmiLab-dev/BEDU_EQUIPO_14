#Solución al Postwork Sesión 4


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

#Con la función apply primero dividimos cada elemento de las columnas de la matriz de probabilidades conjuntas, por las probabilidades marginales asociadas y que corresponden al equipo de casa. Note como hemos definido una función anómima dentro de apply. Luego dividimos cada elemento de las filas de la matriz que resulta, por las probabilidades marginales asociadas y que corresponden al equivo visitante. Finalmente hacemos obtenemos la transpuesta de la matriz que resulta. Esta última matriz, es la matriz de cocientes buscada, es decir, hemos dividio cada probabilidad conjunta, por el producto de probabilidades marginales correspondientes.
(cocientes <- apply(pcta, 2, function(col) col/pcasa))

(cocientes <- apply(cocientes, 1, function(fila) fila/pvisita))

(cocientes <- t(cocientes))

