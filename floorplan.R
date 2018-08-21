library(png)
library(grid)
library(tidyverse)

rooms<- read_csv("roomdata.csv")
g <- rasterGrob(readPNG("floorplan.png"), interpolate=TRUE) 

p <- ggplot(rooms, aes(x = x, y = y)) +
  xlim(0,255) + ylim(0,156) +
  annotation_custom(g, xmin = -Inf, xmax = Inf, ymin = -Inf,  ymax = Inf) +
  geom_text(aes(label = first), hjust = 0, size = 1.6, nudge_x = 1, nudge_y = 6, na.rm = TRUE) +
  geom_text(aes(label = last), hjust = 0, size = 1.6, nudge_x = 1, nudge_y = 4, na.rm = TRUE) +
  theme_void()

ggsave("FindMyTutor.png", p, width=25.5, height = 15.6, units='cm')



