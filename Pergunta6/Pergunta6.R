library(ggplot2);
n = c(5, 24, 71);
cores = c("steelblue", "lightgreen", "orange");
a = 9 ;
b = 13
for(i in 1:3){
  set.seed(2018); 
  Médias = c(); 
  for(j in 1:1970){
    amostra = runif(n[i], a, b);
    Médias = append(Médias, mean(amostra))
  }
  Esp = (a+b)/2;
  Var = (b-a)^2/12/n[i]
  m = data.frame(Médias)
  print(ggplot(m, aes(x = Médias)) +
          geom_histogram(aes(y = ..density..), fill = cores[i], color = "black", bins = 16) +
          labs(title = paste("Histograma de densidade das Médias de amostras de tamanho", n[i], "\ncom distribuição
uniforme"), y = "Densidade") +
          stat_function(fun = dnorm, color="black", args = list(mean = Esp, sd = sqrt(Var))))
}