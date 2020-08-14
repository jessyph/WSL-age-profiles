require(ggplot2)
require(ggrepel)

ymin <- 0 #fewest number of minutes
ymax <- 1350 #max number of minutes
xmin <- 16 #lowest player age
xmax <- 35 #highest player age

club_colour = "#0E44D3"

ggplot(data = WSL.Squads...Chelsea, aes(x = Age, y = Minutes.played)) + 
  xlim(c(xmin, xmax)) + ylim(c(ymin, ymax)) +
  geom_point(colour = club_colour) +
  geom_text_repel(aes(label = Player),
                  size = 3) +
  theme (
    axis.line = element_line(),
    # axis.text = element_blank(), #removes numbers on axis
    # axis.ticks = element_blank(), #removes ticks on axis
    legend.position = "none",
    panel.background = element_blank(),
    panel.grid.minor = element_blank(), #removes grid lines
    panel.grid.major = element_blank(),
    plot.background = element_blank(),
    plot.margin = unit(c(1, 1, 1, 1), "cm") #sets axis further in
  ) +
  scale_y_continuous(name = "Minute's played",
                      limits = c(0, 1350),
                     breaks = seq(0, 1350, 250)) +
  scale_x_continuous(limits = c(16, 35),
                     breaks = seq(16, 35, 2))
