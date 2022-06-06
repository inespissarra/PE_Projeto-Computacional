library(ggplot2)

set.seed(106)

x = c()
ma=c()
maC=c() 
quantis = qnorm(1-0.05/2)
epsilon = 0.25
lambda = 1.32
lambdaC = 0.01

for(i in 1:25){
  amp=c()
  ampC=c()
  n = i*100
  x = append(x, n)
  for (j in 1:1500){
    amostra = rexp(n*(1-epsilon), lambda)
    amostraC = rexp(n*epsilon, lambdaC) 
    amostraC = append(amostraC, amostra) # amostra contaminada
    
    amostra=append(amostra, rexp(n*epsilon, lambda)) # amostra não contaminada
    
    lambdaC_mle = 1/mean(amostraC)
    a = lambdaC_mle * (1-quantis/sqrt(n))
    b = lambdaC_mle * (1+quantis/sqrt(n))
    ampC<-append(ampC, b-a)
    
    lambda_mle = 1/mean(amostra)
    a = lambda_mle * (1-quantis/sqrt(n))
    b = lambda_mle * (1+quantis/sqrt(n))
    amp<-append(amp, b-a)    
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



# ALTERNATIVA
library(ggplot2)

set.seed(106)

x = c()
ma=c()
maC=c() 
quantis = qnorm(1-0.05/2)

for(i in 1:25){
  amp=c()
  ampC=c()
  n = i*100
  x = append(x, n)
  for (j in 1:1500){
    amostra = rexp(n, 1.32)
    amostraC = append(sample(amostra, n*0.25), rexp(n*0.25, 0.01))
    
    lambdaC_mle = 1/mean(amostraC)
    a = lambdaC_mle * (1-(qnorm(1-(0.05/2), mean=0, sd=1))/sqrt(n))
    b = lambdaC_mle * (1+(qnorm(1-(0.05/2), mean=0, sd=1))/sqrt(n))
    ampC<-append(ampC, b-a)
    
    lambda_mle = 1/mean(amostra)
    a = lambda_mle * (1-(qnorm(1-(0.05/2), mean=0, sd=1))/sqrt(n))
    b = lambda_mle * (1+(qnorm(1-(0.05/2), mean=0, sd=1))/sqrt(n))
    amp<-append(amp, b-a)    
  }
  ma<-append(ma, mean(amp))
  maC<-append(maC, mean(ampC))
}

data<-data.frame(x, ma, maC)

ggplot(data, aes())+
  geom_point(aes(x, ma, color="Não contaminada"), size=1.5)+
  geom_point(aes(x, maC, color="Contaminada"), size=1.5)+
  scale_color_manual(name="Amostra", values=c("Não contaminada"="blue", "Contaminada"="red"))+
  labs(title = "Variação da amplitude de intervalos de confiança", x = "Dimensão da amostra", y = "Amplitude dos intervalos de confiança")
