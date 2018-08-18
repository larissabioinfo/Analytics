#ANALYTICS 
#17/08/2018
#Larissa Fernandes
#BioInformática


# Se as bibliotecas necessárias não estiveram instaladas, instale
if (!"readr" %in% installed.packages()) install.packages("readr")
if (!"dplyr" %in% installed.packages()) install.packages("dplyr")
if (!"ggplot2" %in% installed.packages()) install.packages("ggplot2")
if (!"haven" %in% installed.packages()) install.packages("haven")
install.packages("descr")

# Carregando as bibliotecas necessárias
library(readr) #leitura
library(dplyr) #manipulação
library(ggplot2) #plotar gráficos
library(haven) #leitura de bancos de dados que não são do R
library(descr) #análises descritivas

# Carrega uma amostra da PNAD 2014

bd = read_sav("https://github.com/neylsoncrepalde/MODUS/blob/master/PNAD2014_30a50_novo4.sav?raw=true")
dim(bd)
bd #mostra primeiros casos

reg1 = lm(anosesco ~ escpai, data = bd)
summary(reg1)

b0 = reg1$coefficients[1]
b1 = reg1$coefficients[2]


ggplot(bd, aes(x = escpai,
               y = anosesco)) +
         geom_point() +  
         geom_abline(intercept = b0,
              slope = b1,
              col = "red", lwd = 1)
  
