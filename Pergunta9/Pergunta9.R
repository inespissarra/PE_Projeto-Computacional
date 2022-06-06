set.seed(788)

x = c()
MA = c()
quantis = qnorm(0.04/2)
for(i in 1:50){
  n = i*100
  x = append(x, n)
  ampl = c()
  for (j in 1:1450){
    amostra = rexp(n, 3.01)
    lambda_mle = 1/mean(amostra)
    a = lambda_mle * (1-(qnorm(1-(0.04/2), mean=0, sd=1))/sqrt(n))
    b = lambda_mle * (1+(qnorm(1-(0.04/2), mean=0, sd=1))/sqrt(n))
    ampl = append(ampl, b - a)
  }
  MA = append(MA, mean(ampl))
}
data = data.frame(x, MA)
ggplot(data, aes(x, MA)) + geom_point(color="steelblue", size=1.5) + 
  labs(title = "Variação da amplitude dos intervalos de Confiança", x = "Dimensão da amostra", y = "Amplitude dos Intervalos de Confiança") + 
  theme_bw()