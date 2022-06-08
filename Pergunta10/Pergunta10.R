library(ggplot2)
set.seed(106)
x = c() ; ma=c() ; maC=c() 
quantis = qnorm(1-0.05/2)
for(i in 1:25){
  amp=c()
  ampC=c()
  n = i*100
  x = append(x, n)
  for (j in 1:1500){
    amostra = rexp(n, 1.32)
    inv_med = 1/mean(amostra)
    a = inv_med * (1 - quantis/sqrt(n))
    b = inv_med * (1 + quantis/sqrt(n))
    amp<-append(amp, b-a)    
    amostraC = append(sample(amostra, n*0.75), rexp(n*0.25, 0.01))
    inv_medC = 1/mean(amostraC)
    a = inv_medC * (1 - quantis/sqrt(n))
    b = inv_medC * (1 + quantis/sqrt(n))
    ampC<-append(ampC, b-a)
  }
  ma<-append(ma, mean(amp))
  maC<-append(maC, mean(ampC))
}
data<-data.frame(x, ma, maC)
ggplot(data, aes(x))+
  geom_point(aes(y = ma, color="Não contaminada"), size=1.5)+
  geom_point(aes(y = maC, color="Contaminada"), size=1.5)+
  scale_color_manual(name="Amostra", values=c("Não contaminada"="blue", "Contaminada"="red"))+
  labs(title = "Variação da amplitude de intervalos de confiança", x = "Dimensão da amostra", y = "Amplitude dos intervalos de confiança")


library(ggplot2)
set.seed(106)
x = c() ; ma=c() ; maC=c() 
quantis = qnorm(1-0.05/2)
for(i in 1:25){
  amp=c()
  ampC=c()
  n = i*100
  x = append(x, n)
  for (j in 1:1500){
    amostra = rexp(n, 1.32)
    inv_med = 1/mean(amostra)
    a = inv_med * (1 - quantis/sqrt(n))
    b = inv_med * (1 + quantis/sqrt(n))
    amp<-append(amp, b-a)
    
    amostraC = append(sample(amostra, n*0.75), rexp(n*0.25, 0.01))
    a = (mean(amostraC) + quantis * sqrt(var(amostraC)/n))**-1
    b = (mean(amostraC) - quantis * sqrt(var(amostraC)/n))**-1
    ampC<-append(ampC, b-a)
  }
  ma<-append(ma, mean(amp))
  maC<-append(maC, mean(ampC))
}
data<-data.frame(x, ma, maC)
ggplot(data, aes(x))+
  geom_point(aes(y = ma, color="Não contaminada"), size=1.5)+
  geom_point(aes(y = maC, color="Contaminada"), size=1.5)+
  scale_color_manual(name="Amostra", values=c("Não contaminada"="blue", "Contaminada"="red"))+
  labs(title = "Variação da amplitude de intervalos de confiança para o inverso do Valor Esperado", x = "Dimensão da amostra", y = "Amplitude dos intervalos de confiança")