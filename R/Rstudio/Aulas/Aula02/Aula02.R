# Item A
animais = c('Cachorro', 'Gato', 'Peixe', 'Peixe', 'Lagarto')
alimentos = c('Pão', 'Laranja', 'Chocolate', 'Cenoura', 'Leite')

df = data.frame(animais, alimentos)

# Item B
setwd("C:/Users/J.ABREU/OneDrive - ESPM/4° SEMESTRE/R/Aula02")
write.csv2(df, "Aula02.csv", row.names = FALSE)



# # # # # # # # # # # # # # 
install.packages("tidyverse", dependencies = TRUE)
library(tidyverse)

cces = read_csv("cces_sample.csv")
cces = drop_na(cces) # dropar linhas que possuem valores N/A

# filter diminui o número de linhas
mulheres = filter(cces, gender == 2) # filtrar por mulheres
mulheres_solteiras = filter(cces, gender == 2 & marstat == 5) # Mulheres solteiras
mulheres_graduadas = filter(mulheres, educ >= 4)

base_menor = select(mulheres_solteiras, "race", "Hispanis") # Diminui a dimensão das colunas e seleciona apenas as variáveis especificadas

tudo_de_uma_vez = cces %>%
  drop_na() %>%
  filter(gender == 2 & marstat == 2 | marstat == 5 & educ >=4) %>%
  select("race", "hispanic")

exemplo = arrange(tudo_de_uma_vez, desc(race), hispanic) # Ordenar

exemplo = rename(exemplo, ethinic = race) # Renomear variável

exemplo = recode(exemplo$ethinic,
                 `1`= "White",
                 `2`= "Black",
                 `3`= "Hispanic",
                 `4`= "Asian",
                 `5`= "Native American",
                 `6`= "Mixed",
                 `7`= "Other",
                 `8`= "Middle Eastern") # Recodificar valores 

exemplo = data.frame(exemplo)
exemplo = rename(exemplo, ethinic = exemplo)

######### como usar um recurso semelhante a tabela dinâmica no excel
# CTRL + ALT + W = ?

grupo = group_by(cces, race) # agrupar por raça e grupos foram formados na ram e se for feito uma media o r vai saber q já existe um grupo
grupo = drop_na(grupo)
recodificada = recode(grupo$race,
                 `1`= "White",
                 `2`= "Black",
                 `3`= "Hispanic",
                 `4`= "Asian",
                 `5`= "Native American",
                 `6`= "Mixed",
                 `7`= "Other",
                 `8`= "Middle Eastern") # Recodificar valores 

grupo$recodificada = recodificada

grupo = group_by(grupo, recodificada)

library(knitr) # Para fazer tabela

tabela = summarise(grupo, media= mean(faminc_new),freq = n())
kable(tabela, caption = "Título")

