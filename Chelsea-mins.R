require(ggplot2)
require(ggrepel)
require(showtext)

font_add_google(name = "Merriweather", family = "merriweather")
font_add_google(name = "Open Sans", family = "open-sans")
showtext_auto()

ymin <- -50 #fewest number of minutes
ymax <- 1400 #max number of minutes
xmin <- 16 #lowest player age
xmax <- 35 #highest player age

club_colour = "#0E44D3"
club_shade = "#0EFAF7"

ggplot(data = WSL.Squads...Chelsea, aes(x = Age, y = Minutes.played)) + 
  xlim(c(xmin, xmax)) + ylim(c(ymin, ymax)) +
  geom_point(colour = club_colour) +
  geom_text_repel(aes(label = Player),
                  size = 3, family = "open-sans") +
  theme (
    axis.line = element_line(),
    axis.title = element_text(family = "merriweather"),
    axis.text = element_text(family = "open-sans"),
    # axis.ticks = element_blank(), #removes ticks on axis
    legend.position = "none",
    panel.background = element_blank(),
    panel.grid.minor = element_blank(), #removes grid lines
    panel.grid.major = element_line(colour= "light grey", size = 0.1),
    plot.background = element_blank(),
    plot.margin = unit(c(2, 2, 2, 2), "cm") #sets axis further in
  ) +
  scale_y_continuous(name = "Minute's played",
                     limits = c(ymin, ymax),
                     expand = c(0,0),
                     breaks = seq(ymin, ymax, 250)) +
  scale_x_continuous(limits = c(xmin, xmax),
                     breaks = seq(xmin, xmax, 2)) +
  geom_rect(aes(xmin = 25, xmax = 29, ymin = ymin, ymax = ymax),
            fill = club_shade, alpha = 0.03)
