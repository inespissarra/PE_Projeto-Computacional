library(ggplot2)
library(readxl)

QualidadeARO3 <- read_excel("PE_Proj/Pergunta3/QualidadeARO3.xlsx"); Ihavo = as.numeric(QualidadeARO3$Ihavo);
Paio_Pires = as.numeric(QualidadeARO3$`Paio-Pires`)
data = data.frame(Ihavo, Paio_Pires)
Estações = c(Ihavo, Paio_Pires)

print(ggplot(data, aes(fill=Estações, color=Estações)) + 
        geom_histogram(aes(x = Ihavo, fill = "Ihavo", color="Ihavo"), bins = 40, alpha=0.4) + 
        geom_histogram(aes(x = Paio_Pires, fill = "Paio-Pires", color="Paio-Pires"), bins = 40, alpha=0.3) + 
        labs(title = "Qualidade do ar registada em 2020 nas estações de Ihavo e Paio-Pires", x ="Nível de Ozono", y = "Frequência"))