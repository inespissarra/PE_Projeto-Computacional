set.seed(1284)
Médias = c();
for(j in 1:7425){
  amostra = rbinom(147, 8, 0.99)
  Médias = append(Médias, mean(amostra))
}

m = mean(Médias) #Média das médias
esp = 8*0.99 #Por ser ~Bin(8, 0.99), E[X] = n*p

dif = m - esp

#resultado = 0.0002785222 = 0.000279