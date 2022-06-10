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