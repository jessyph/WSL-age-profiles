require(ggplot2)

ymin <- 0 #fewest number of minutes
ymax <- 1350 #max number of minutes
xmin <- 16 #lowest player age
xmax <- 35 #highest player age

ggplot() + xlim(c(xmin, xmax)) + ylim(c(ymin, ymax)) +
  theme (
    axis.line = element_line(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    legend.position = "none",
    panel.background = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_blank()
  )
