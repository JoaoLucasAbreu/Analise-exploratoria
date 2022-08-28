library("tidyverse")

# Item A
cces = read_csv("cces_sample.csv")
cces = drop_na(cces)
cces_select = select(cces, "educ", "edloan", "employ", "CC18_308a")


# Item B
recodificada = recode(cces_select$CC18_308a, 
                     `1` = "Approve",
                     `2` = "Approve",
                     `3` = "Disapprove",
                     `4` = "Disapprove")

cces_select$trump_approval = recodificada

# Item C
cces_filter = cces %>% 
              drop_na() %>%
              filter(marstat == 1 & employ == 1)

tabela = summarise(cces_filter, media = mean(pew_religimp), mediana = median(pew_religimp))
library(knitr)
kable(tabela, caption="Medidas de Tendência central")
