library(ggplot2); 
set.seed(788)
x = c() ; MA = c()
quantis = qnorm(1-(0.04/2)); 
for(i in 1:50){
  n = i*100;
  x = append(x, n); 
  ampl = c();
  for (j in 1:1450){
    amostra = rexp(n, 3.01);
    inv_med = 1/mean(amostra);
    a = inv_med * (1-quantis/sqrt(n)); 
    b = inv_med * (1+quantis/sqrt(n)); 
    ampl = append(ampl, b - a)
  }
  MA = append(MA, mean(ampl)) 
}
data = data.frame(x, MA);
print(ggplot(data, aes(x, MA)) + geom_point(color="steelblue", size=1.5) +
  labs(title = "Variação da amplitude dos intervalos de Confiança para lambda", 
       x = "Dimensão da amostra", 
       y = "Amplitude dos Intervalos de Confiança"))