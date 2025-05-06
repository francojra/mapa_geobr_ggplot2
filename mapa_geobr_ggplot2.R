
# Geração de mapa com geobr e ggplot2 ------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 05/05/25 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://www.youtube.com/watch?v=N1Ash3OZkg0&t=37s ----------------------------------------------------------------------------

# Fluxo da produção de mapas ---------------------------------------------------------------------------------------------------------------

## Shape:

## Obter formatos/contornos das localidades (países, cidades, estados, etc.)
## O pacote geobr trará as informações do IBGE

## Dados:

## Obter os dados para juntar ao dados do shapefile
## Precisa de uma coluna para juntar dados (merge ou join)
## Cuidado com dimensões, acentos, espaços e caracteres que possam interferir na junção

## Plotagem:

## Fazer o cartograma por meio do pacote ggplot2

# Baixar pacotes ---------------------------------------------------------------------------------------------------------------------------

library(geobr)
library(ggplot2)
library(sf)
library(dplyr)
library(rio)
library(readr)
