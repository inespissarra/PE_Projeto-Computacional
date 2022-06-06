library(readxl)
Utentes <- read_excel("Projeto/Pergunta4/Utentes.xlsx")
library(ggplot2)
Colesterol = Utentes$Colesterol
TAD = Utentes$TAD
data = data.frame(TAD, Colesterol)
ggplot(data, aes(x = TAD, y = Colesterol)) + 
  geom_point(size = 1, colour = "steelblue") + geom_smooth(se = FALSE, colour = "black") + 
  labs(title = "Colesterol em função da Tensão Arterial Diastólica (TAD)")