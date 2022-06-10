library(readxl)
library(ggplot2)
ResiduosPerCapita <- read_excel("ResiduosPerCapita.xlsx", range = "A12:C43")
dados_2004 = c(ResiduosPerCapita$`2004`[21],ResiduosPerCapita$`2004`[9],ResiduosPerCapita$`2004`[31]); dados_2018 = c(ResiduosPerCapita$`┴ 2018`[21],ResiduosPerCapita$`┴ 2018`[9],ResiduosPerCapita$`┴ 2018`[31])
Países = c(ResiduosPerCapita$Anos[21], ResiduosPerCapita$Anos[9], ResiduosPerCapita$Anos[31]); Paises_data = data.frame(Países, dados_2004, dados_2018)

print(ggplot(Paises_data, aes(Países, fill = Anos)) +
  geom_bar(aes(y = dados_2004, fill = "2004"), stat = "identity", width = .3, position = position_nudge(x = -.15)) + 
  geom_bar(aes(y = dados_2018, fill = "2018"), stat = "identity", width = .3, position = position_nudge(x = .15)) + 
  labs(title = "Produção de Resíduos per Capita", y = "Resíduos Produzidos"))