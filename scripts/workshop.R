## Use this file to follow along with the live coding exercises.
## The csv file containing the data is in the 'data/' directory.
## If you want to save plots you created, place them in the 'figures/' directory.
## You can create additional R files in the 'scripts/' directory.

library(tidyverse)
interviews <- read_csv("data/SAFI_clean.csv", na="NULL")

interviews
as.data.frame(interviews)
View(interviews)

