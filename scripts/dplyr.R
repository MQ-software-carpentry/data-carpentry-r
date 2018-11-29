# dplyr and tidyr
library(tidyverse)

interviews <- read_csv("data/SAFI_clean.csv", na="NULL")

select(interviews, village, no_membrs, years_liv)
select(interviews, village:rooms)

# filtering
filter(interviews, village == "God", rooms > 2)
filter(interviews, 1:nrow(interviews) %in% 1:10)

interviews2 <- filter(interviews, village == "God")
interviews_god <- select(interviews2, no_membrs, years_liv)

interviews_god <- select(filter(interviews, village == "God"),
                         no_membrs, years_liv)

interviews_god <- interviews %>% filter(village=="God")%>%
  select(no_membrs, years_liv)

# Using pipes, subset the interviews data to include interviews 
#where respondents were members of an irrigation association (memb_assoc)
# and retain only the columns affect_conflicts, liv_count, and no_meals.
interviews %>% filter(memb_assoc == "yes") %>%
  select(affect_conflicts, liv_count, no_meals)

# mutate
interviews <- interviews %>% mutate(people_per_room = no_membrs/rooms)
