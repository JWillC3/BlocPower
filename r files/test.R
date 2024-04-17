#packages
library(tidyverse)
library(faraway)
library(cowplot)
library(reshape2)
library(corrplot)
library(scales)
library(ggthemes)
library(gridExtra)
library(patchwork)
library(gghighlight)
library(ggdark)
library(viridis)
library(DT)
library(plotly)
library(readxl)
library(lubridate)

#load data for first unit, room
D_01_bedroom <- (read_csv("./data/bedroom_124256.csv")) %>% 
  select(1:7) %>% 
  rename("time" = "timestamp(America/Denver)")


