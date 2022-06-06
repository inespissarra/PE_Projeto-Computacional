set.seed(906)

amplitude = c()

for(i in 1:950){
  amostra = rexp(1350, 3.81)
  intervalo_confiança = t.test(amostra, conf.level=0.93)$"conf.int"
  amplitude = append(amplitude, intervalo_confiança[2]-intervalo_confiança[1])
}

med = mean(amplitude)

# resultado = 0.0258827986459988 = 0.025883

set.seed(906)

amplitude = c()

n = 1350
lambda = 3.81

for(i in 1:950){
  amostra = rexp(n, lambda)
  quantis = qnorm(1-0.07/2)
  media = mean(amostra)
  a = (1/media) *(1-quantis/sqrt(1350))
  b = (1/media) * (1+quantis/sqrt(1350))
  amplitude = append(amplitude, b-a)
}

med = mean(amplitude) 

# resultado = 0.3761986



set.seed(906)

amplitude = c()

n = 1350
lambda = 3.81

for(i in 1:950){
  amostra = rexp(n, lambda)
  lambda_mle = 1/mean(amostra)
  a = lambda_mle * (1-(qnorm(1-(0.07/2), mean=0, sd=1))/sqrt(n))
  b = lambda_mle * (1+(qnorm(1-(0.07/2), mean=0, sd=1))/sqrt(n))
  amplitude = append(amplitude, b-a)
}

med = mean(amplitude) 

# resultado = 0.3761986