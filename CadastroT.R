library(tidyverse)
library(pdftools)

pdf <- pdf_text("C://Users//Vinicius//Documents//Vinícius//Faculdade//Ferramentas Modelagem//Tarefa 3 - Cadastro R//cadastro.pdf")
pdf <- str_split_1(pdf, "\\n")
pdf

#grepl: retorna a string desejada
#grepl(string, variável)

x <- pdf[grepl("[Nn]ome:", pdf)]

#gsub: substitui a string desejada
#gsub(string velha, string nova, variável)

x <- gsub("[Nn]ome:", '' , x)
x <- gsub("\\(.*\\)" , '' , x)

x <- trimws(x, "both") # deleta espaços extra

#str_extract(variável, "string") -> extrai a string desejada

y <- pdf[grepl("[Nn]ome:", pdf)]
y <- str_extract(y, "\\(.*\\)")

y <- gsub("\\(\\w+ |\\)" , "" , y)

z <- pdf[grepl("CEP:" , pdf)]
z <- gsub("[^0-9 | -]" , "" , z)
z <- trimws(z , "both")


endereço <- pdf[grepl("Endereço:", pdf)]
endereço <- gsub("Endereço: " , "" , endereço)
endereço <- gsub("CEP: .*" , "" , endereço)


endereço

# Teste :))

