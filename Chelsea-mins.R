require(ggplot2)
require(ggrepel)
require(showtext)
require(dplyr)

font_add_google(name = "Merriweather", family = "merriweather")
font_add_google(name = "Open Sans", family = "open-sans")
showtext_auto()

Chelsea$new.player <- c("0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1", "1", "1", "1")
Chelsea[23, 5] = "0"

ymin <- -50 #fewest number of minutes
ymax <- 1400 #max number of minutes
xmin <- 16 #lowest player age
xmax <- 35 #highest player age

club_colour = "#0E44D3"
club_shade = "#0EFAF7"
club_name = "Chelsea"

ggplot(data = Chelsea, aes(x = Age, y = Minutes.played)) + 
  xlim(c(xmin, xmax)) + ylim(c(ymin, ymax)) +
  geom_point(colour = club_colour) +
  geom_text_repel(data = Chelsea %>%
                    filter(new.player=="0"),
                  aes(label = Player),
                  size = 3, family = "open-sans") +
  geom_text_repel(data = Chelsea %>%
                    filter(new.player=="1"),
                  aes(label = Player),
                  size = 3, family = "open-sans", fontface = "bold") +
  theme_AgePlot() +
  scale_y_continuous(name = "Minute's played (19/20 season)",
                     limits = c(ymin, ymax),
                     expand = c(0,0),
                     breaks = c(0, 250, 500, 750, 1000, 1200, 1350)) +
  scale_x_continuous(limits = c(xmin, xmax),
                     breaks = seq(xmin, xmax, 2)) +
  geom_rect(aes(xmin = 25, xmax = 29, ymin = ymin, ymax = ymax),
            fill = club_shade, alpha = 0.03) +
  labs(title = paste0(club_name, " squad age make-up"),
       subtitle = "Peak years") 
  # geom_text(aes(x = 25, y = ymax), label = "Peak years", size = 3, hjust = 0.5, fontface = "bold")

            