library(read.dbc)
library(tidyverse)
library(pdftools)

tabela = read.table("C://Users//Vinicius//Documents//Vinícius//Faculdade//Ferramentas Modelagem//Ferramentas-Computacionais-de-Modelagem-Matem-tica-II//RACA_COR.CNV", skip = 1 , sep = ";" , encoding = "latin1")
print(tabela)

view(tabela)

tabela$V1


cod_ruim <- str_extract(tabela$V1[10] , "1M.*") %>%
  str_split_1(",") %>% trimws("both")
desc_ruim <- rep("RAÇA/COR (OUTROS INDEVIDOS)" , length(cod_ruim))

cod_bom <- tabela$V1 %>%
  gsub("," , "" , .) %>%
  str_extract("\\d+\\s*$") %>% trimws("both")
cod_bom <- cod_bom[1:9]

desc_bom <- tabela$V1[1:9] %>%
  gsub("," , "" , .) %>%
  trimws("both") %>%
  str_extract("(?<=^\\d).* (?=\\d{2}$)") %>%
  gsub("^\\d+" , "" , .) %>%
  trimws("both")

df <- data.frame(desc_final = c(desc_ruim, desc_bom) , cod_final = c(cod_ruim, cod_bom))

##

