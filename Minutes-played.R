require(StatsBombR)
require(tidyverse)

Comp <- FreeCompetitions()
Comp <- FreeCompetitions() %>% filter(season_id==42)

Matches <- FreeMatches(Comp)
