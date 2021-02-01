#POSTWORK 4

library(dplyr)
library(reshape2)
library(ggplot2)

data <- read.csv("datos.csv")

(probcasa <- round(table(data$FTHG)/dim(data)[1], 3)) 
(probvisita <- round(table(data$FTAG)/dim(data)[1], 3)) 
(probconjunta <- round(table(data$FTHG, data$FTAG)/dim(data)[1], 3)) 
(cocientes <- apply(probconjunta, 2, function(col) col/probcasa))
(cocientes <- apply(cocientes, 1, function(fila) fila/probvisita))
(cocientes <- t(cocientes))

set.seed(2)
indices <- sample(dim(data)[1], size = 380, replace = TRUE)
newdata <- data[indices, ]
(pcasa <- round(table(newdata$FTHG)/dim(newdata)[1], 3)) 
(pvisita <- round(table(newdata$FTAG)/dim(newdata)[1], 3)) 
(pcta <- round(table(newdata$FTHG, newdata$FTAG)/dim(newdata)[1], 3)) 
(cocientes <- pcta/outer(pcasa, pvisita, "*"))
