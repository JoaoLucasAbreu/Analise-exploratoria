print(hello)


hello <- "Derico"

word = c(1,2,3,4)

numero = c("e","s","p","m")

compara = numero == "p"

compara

class(hello)

remove(hello)

dados = data.frame(numero, word)

write.csv2(dados,"dados.csv", row.names = FALSE)

#Working directory
setwd("C:/Users/J.ABREU/OneDrive - ESPM/4° SEMESTRE/R")

gapMinder = 
  read.delim(file = "https://www.stat.ubc.ca/~jenny/notOcto/STAT545A/examples/gapminder/data/gapminderDataFiveYear.txt", header = TRUE)

write.csv2(gapMinder, "gapminder.csv", row.names = FALSE)

#csv2 separa por ;

#carregar pacote após instalar
library(readxl)

remove(gapMinder)

gapMinder = read_excel("gapminderr.xlsx")

tabela = table(gapMinder$continent)/12

pie(tabela)

barplot(tabela, col = "#255168")

par(mfrow= c(1,2))

pie(tabela)

barplot(tabela, col = "#255168")

#ggplot

library(ggplot2)
ggplot(dados, aes(continent))

z = word
length(z)
dim(z)
z = as.matrix(z)
dim(z)

setwd("C:/Users/J.ABREU/OneDrive - ESPM/4° SEMESTRE/R")
