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


mean(interviews$no_membrs)

interviews %>% group_by(village) %>%
  summarize(mean_no_membrs = mean(no_membrs))

interviews %>% group_by(village) %>%
  filter(memb_assoc == "yes") %>%
  summarize(mean_no_membrs = mean(no_membrs))

interviews %>% summarize(mean_no_membrs = mean(no_membrs))

interviews %>% group_by(village, memb_assoc) %>%
  summarize(mean_no_members = mean(no_membrs), 
            min_members = min(no_membrs))

interviews %>% count(village)
interviews %>% count(village, sort = TRUE)

#Use group_by() and summarize() to find the mean, min, and max 
# number of household members for each village. 
# Also, add the number of observations.
#Hint: see ?n
interviews %>% group_by(village) %>%
  summarise(mean_membrs = mean(no_membrs), 
            min_membrs=min(no_membrs),
            max_membrs = max(no_membrs),
            n=n())

# reshaping
interviews <- interviews %>% mutate(wall_type_logical=TRUE) %>% 
  spread(key = respondent_wall_type, 
         value = wall_type_logical, fill=FALSE)

interviews <- interviews %>% gather(key = respondent_wall_type, 
                                    value="wall_type_logical",
                                    burntbricks:sunbricks)

# prepare
interviews <- read_csv("data/SAFI_clean.csv", na="NULL")
interviews_plotting <- interviews %>%
  mutate(split_items = strsplit(items_owned, ";")) %>%
  unnest() %>%
  mutate(items_owned_logical=TRUE) %>%
  spread(key=split_items, value = items_owned_logical, fill=FALSE) %>%
  rename(no_listed_items=`<NA>`) %>%
  mutate(split_months=strsplit(months_lack_food, ";")) %>%
  unnest() %>%
  mutate(months_lack_food_logical=TRUE) %>%
  spread(key=split_months, value=months_lack_food_logical, fill=FALSE) %>%
  mutate(number_month_lack_food=rowSums(select(., Apr:Sept))) %>%
  mutate(number_items=rowSums(select(., bicycle:television)))

write_csv(interviews_plotting, path="data_output/interviews_plotting.csv")  
