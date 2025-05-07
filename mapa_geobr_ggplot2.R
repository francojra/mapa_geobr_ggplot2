
# Geração de mapa com geobr e ggplot2 ------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 05/05/25 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://rpubs.com/prisciladalepiane/mapa_brasil ------------------------------------------------------------------------------

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

# Carregar pacotes ---------------------------------------------------------------------------------------------------------------------------

library(geobr) # para obter o shapefile do mapa do Brasil.
library(ggplot2) # para construir os gráficos.
library(dplyr) # para a manipulação dos dados.
library(readxl) # para extrair os dados do excel.

# Baixar shapefile do Brasil ---------------------------------------------------------------------------------------------------------------

brasil <- read_country(year = 2020)
glimpse(brasil)
View(brasil)

## Verificar outras funções do pacote geobr

biomas <- geobr::read_biomes()
glimpse(biomas)
View(biomas)

estados <- read_state(year = 2020)
glimpse(brasil)
View(brasil)

## A função geom_sf do ggplot2 usa as coordenadas que estão em 
## dados_brasil$geom no formato “sfc_MULTIPOLYGON” para fazer as
## fronteiras dos estados.

ggplot() +
  geom_sf(data = brasil) +
  theme_minimal()
