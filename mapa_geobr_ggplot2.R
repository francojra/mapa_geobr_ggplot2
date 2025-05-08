
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
library(tidyverse) # para extrair os dados do arquivo csv

# Baixar shapefile do Brasil ---------------------------------------------------------------------------------------------------------------

brasil <- read_country(year = 2020)
glimpse(brasil)
View(brasil)

## Verificar outras funções do pacote geobr

biomas <- geobr::read_biomes()
glimpse(biomas)
View(biomas)

estados <- read_state(year = 2020)
glimpse(estados)
View(estados)

# Visualizar mapas dos shapefiles ----------------------------------------------------------------------------------------------------------

## A função geom_sf do ggplot2 usa as coordenadas que estão em 
## dados_brasil$geom no formato “sfc_MULTIPOLYGON” para fazer as
## fronteiras dos estados.

## Mapa do Brasil

ggplot() +
  geom_sf(data = brasil) +
  theme_minimal()

## Mapa dos estados do Brasil

ggplot() +
  geom_sf(data = estados) +
  theme_minimal()

## Adicionando legendas

ggplot() +
  geom_sf(data = estados) +
  geom_sf_label(data = estados, aes(label = abbrev_state), 
                size = 2) +
  xlab("") +  ylab("") +
  theme_minimal()

# Carregar dados de áreas de risco ---------------------------------------------------------------------------------------------------------

dados <- read_csv("br_geobr_mapas_area_risco_desastre.csv") 

glimpse(dados)
view(dados)

## OBS.: quantidade_poligono = Número de 
## polígonos de áreas de risco incluídas no polígono em questão.

dados_risco <- dados |>
  dplyr::select(quantidade_poligono, sigla_uf) |>
  rename(abbrev_state = sigla_uf) |>
  group_by(abbrev_state) |>
  summarise(soma_poligono = sum(quantidade_poligono))

view(dados_risco)

# Mesclando os dados -----------------------------------------------------------------------------------------------------------------------

dados_risco_estados <- estados %>% 
  left_join(dados_risco, by = c("abbrev_state")) 

view(dados_risco_estados)
