#-----------
# Libraries
library(tidyverse)
library(plyr)
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
library(knitr)
library(magick)
library(corrr)

#-----------
# line graph
plot <- function(df, location) {
ggplot(df, aes(Date, NO2, color = ID)) +
  geom_line(size = 1, alpha = 0.5) +
  scale_x_datetime(breaks = "1 day", date_labels = "%b %d") +
  # scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
  #               labels = trans_format("log10", math_format(10^.x))) +
  theme_bw() +
  theme(axis.text.x = element_text(size = 10)) + #angle = 45, hjust = 1)) +
  theme(axis.text.y = element_text(size = 10)) +
  labs(x = "Date", y = "NO2 (ppm)") +
  ggtitle(paste0(location, ": NO2 by Date (12 hour)")) + 
  scale_color_manual(name = "Sensor ID",
                     values = c("darkgreen","darkblue"),
                     labels = c("015", "021"))
  
}
