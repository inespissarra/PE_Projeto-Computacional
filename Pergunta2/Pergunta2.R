library(readxl)
library(ggplot2)
EsperancaVida <- read_excel("PE_Proj/Pergunta2/EsperancaVida.xlsx", range = "A9:CY69"); Anos = EsperancaVida$...1[43:60]
croacia_homem = EsperancaVida$`HR - Croácia...44`[43:60]; croacia_mulher = EsperancaVida$`HR - Croácia...78`[43:60]
bulgaria_homem = EsperancaVida$`BG - Bulgária...42`[43:60]; bulgaria_mulher = EsperancaVida$`BG - Bulgária...76`[43:60]
grecia_homem = EsperancaVida$`GR - Grécia...52`[43:60]; grecia_mulher = EsperancaVida$`GR - Grécia...86`[43:60]
data = data.frame(Anos, croacia_homem, croacia_mulher, bulgaria_homem, bulgaria_mulher,
                  grecia_homem, grecia_mulher)
print(ggplot(data, aes(Anos, colour = Pais, linetype = Sexo)) +
  geom_line(aes(y = croacia_homem, colour = "HR - Croácia", linetype = "Homem")) + 
  geom_line(aes(y = croacia_mulher, colour = "HR - Croácia", linetype = "Mulher")) + 
  geom_line(aes(y = bulgaria_homem, colour = "BG - Bulgária", linetype = "Homem")) + 
  geom_line(aes(y = bulgaria_mulher, colour = "BG - Bulgária", linetype = "Mulher")) + 
  geom_line(aes(y = grecia_homem, colour = "GR - Grécia", linetype = "Homem")) + 
  geom_line(aes(y = grecia_mulher, colour = "GR - Grécia", linetype = "Mulher")) + 
  ggtitle("Esperança de Vida à Nascença", "de Mulheres e Homens na Bulgária, Croácia e Grécia") + 
  scale_y_continuous(name = "Esperança média de vida"))
