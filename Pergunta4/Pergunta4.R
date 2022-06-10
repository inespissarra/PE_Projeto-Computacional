library(readxl); library(ggplot2)
Utentes <- read_excel("Utentes.xlsx"); Colesterol = Utentes$Colesterol;
TAD = Utentes$TAD
data = data.frame(TAD, Colesterol)
print(ggplot(data, aes(x = TAD, y = Colesterol)) +
  geom_point(colour = "steelblue") + geom_smooth(se = FALSE, colour = "black") + 
  labs(title = "Colesterol em função da Tensão Arterial Diastólica (TAD)"))