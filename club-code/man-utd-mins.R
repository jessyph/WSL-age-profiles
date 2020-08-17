require(ggplot2)
require(ggrepel)
require(showtext)
require(dplyr)

font_add_google(name = "Merriweather", family = "merriweather")
font_add_google(name = "Open Sans", family = "open-sans")
showtext_auto()

ymin <- -5 #fewest number of minutes
ymax <- 105 #max number of minutes
xmin <- 15 #lowest player age
xmax <- 35 #highest player age

club_colour = "#C41008"
club_shade = "#B2B2AC"
club_name = "Manchester United"

man.utd <- Minutes.played.1920 %>% filter(team.id=="9")

man.utd <- man.utd %>% mutate_at(vars(mp.percentage), funs(round(., 0)))

ggplot(data = man.utd, aes(x = age, y = mp.percentage)) + 
  xlim(c(xmin, xmax)) + ylim(c(ymin, ymax)) +
  geom_point(colour = club_colour) +
  geom_text_repel(data = man.utd %>% filter(new.signing=="0"),
                  aes(label = player),
                  size = 3, family = "open-sans",
                  point.padding = 0.2) +
  geom_text_repel(data = man.utd %>%
                    filter(new.signing=="1"),
                  aes(label = player),
                  size = 3, family = "open-sans", fontface = "bold",
                  point.padding = 0.2) +
  theme_AgePlot() +
  scale_y_continuous(name = "% minutes played (19/20 season)",
                     limits = c(ymin, ymax),
                     expand = c(0,0),
                     breaks = seq(0, 100, 20)) +
  scale_x_continuous(limits = c(xmin, xmax),
                     breaks = seq(xmin, xmax, 2)) +
  geom_rect(aes(xmin = 25, xmax = 29, ymin = ymin, ymax = ymax),
            fill = club_shade, alpha = 0.01) +
  labs(title = paste0(club_name, " squad profile 2020/21 season"),
       subtitle = paste0("Average age: ", round(mean(man.utd$age), 0)),
       caption = c("New signings in bold \n Peak years shaded",
                   "Jessy Parker Humphreys | @jessyjph \n Source: FBRef"))

