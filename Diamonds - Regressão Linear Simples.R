#############Analytics
##17/08/2018 - Diamonds
##BioInformatica
##Larissa Fernandes 
##############################################################

install.packages("ggplot2")
library(ggplot2)
library(dplyr)

# Plotando um gráfico para exemplo:
x = rnorm(1000, mean = 1) # mil numeros aleatorios com a distribuicao normal com media 1
y = 3*x + 2*rnorm(1000, mean = 1)

ggplot(NULL, aes(x, y)) + #geom_point() +  # geom_point adiciona os pontos
  geom_vline(xintercept = 0) + geom_hline(yintercept = 0) + #vline e hline é para definir os eixos principais
  stat_smooth(method = 'lm', se = F, col = 'red') #se é para intervalo de confianca


# Studying the DIAMONDS data
data("diamonds")

dim(diamonds) #dimensao do banco
str(diamonds) #estrutura
names(diamonds) # nomes das variaveis
diamonds # primeiros casos da
help("diamonds") #mostra a ajuda do pacote

# Verificando o peso do diamante
summary(diamonds$carat)
# Verificando o preço do diamente
summary(diamonds$price)

# Vamos investigar se há relação entre o peso e o preço  - NO GRÁFICO 
ggplot(diamonds,aes(x = carat, y = price))+
  geom_point()

# correlacao de preço e peso 
cor(diamonds$carat, diamonds$price)

# Agora, vamos estimar um modelo de regressão linear com a seguinte formula
# price = b0 + b1*carat + e
reg = lm(price ~ carat, data = diamonds)
summary(reg) # Verifica resultados

