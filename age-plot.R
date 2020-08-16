require(ggplot2)
require(showtext)

font_add_google(name = "Merriweather", family = "merriweather")
font_add_google(name = "Open Sans", family = "open-sans")
showtext_auto()

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
    plot.caption = element_text(family = "merriweather", lineheight = 1,
                                hjust = c(0, 1)),
    plot.margin = unit(c(2, 1, 1, 1), "cm"), #sets axis further in
    plot.title = element_text(family = "merriweather", vjust = 1),
    plot.subtitle = element_text(family = "merriweather", size = 10)
  )
  }
  