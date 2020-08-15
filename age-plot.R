require(ggplot2)
require(ggrepel)
require(showtext)

font_add_google(name = "Merriweather", family = "merriweather")
font_add_google(name = "Open Sans", family = "open-sans")
showtext_auto()

create_AgePlot <- function(club_name, club_colour, club_shade) {
  theme_AgePlot <- function() {
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
    plot.margin = unit(c(2, 1, 1, 1), "cm"), #sets axis further in
    plot.title = element_text(family = "merriweather")
  )
  }
  
  ymin <- -50 #fewest number of minutes
  ymax <- 1400 #max number of minutes
  xmin <- 16 #lowest player age
  xmax <- 35 #highest player age
  
  ggplot() + xlim(c(xmin, xmax)) + ylim(c(ymin, ymax)) +
    theme_AgePlot() +
    scale_y_continuous(name = "Minute's played",
                       limits = c(ymin, ymax),
                       expand = c(0,0),
                       breaks = c(0, 250, 500, 750, 1000, 1200, 1350)) +
    scale_x_continuous(name = "Age",
                       limits = c(xmin, xmax),
                       breaks = seq(xmin, xmax, 2)) +
    geom_rect(aes(xmin = 25, xmax = 29, ymin = ymin, ymax = ymax),
              fill = club_shade, alpha = 0.03)
}

create_AgePlot("Chelsea", "#0E44D3", "#0EFAF7")
