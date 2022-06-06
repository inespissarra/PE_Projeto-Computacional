set.seed(1152) 
a = rexp(56, rate= 0.34) #n = 56 e 𝜆= 0.34 Generate random distribution with given seed
FD = ecdf(a) #Distribution function
ev = 1-FD(2) #Empirical value
tv = 1-pexp(2, rate=0.34, log=FALSE) #Theoric value
dif=tv-ev

# resultado = 0.0423312780798754; 0,042331