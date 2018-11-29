## Use this file to follow along with the live coding exercises.
## The csv file containing the data is in the 'data/' directory.
## If you want to save plots you created, place them in the 'figures/' directory.
## You can create additional R files in the 'scripts/' directory.

library(tidyverse)
interviews <- read_csv("data/SAFI_clean.csv", na="NULL")

interviews
as.data.frame(interviews)
View(interviews)

# inspect data
dim(interviews)
nrow(interviews)
ncol(interviews)

head(as.data.frame(interviews))
tail(interviews)

str(interviews)
summary(interviews)

names(interviews)

interviews[1, 1]
interviews[1, 6]
interviews[1:5, 6]
interviews[1, 1:4]
interviews[1, ]
interviews[, 6]
interviews[1:6]

interviews["respondent_wall_type"]
interviews[, -1]


# Create a data frame (interviews_100) containing only the data in row 100 of the interviews dataset.
interview_100 <- interviews[100, ]

#Notice how nrow() gave you the number of rows in a data frame?
#  Use that number to pull out just that last row in the data frame.
interviews[nrow(interviews), ]

#Compare that with what you see as the last row using tail() to make sure it’s meeting expectations.
tail(interviews)

#Pull out that last row using nrow() instead of the row number.

#Create a new data frame (interviews_last) from that last row.
interview_last <- interviews[nrow(interviews), ]

#Use nrow() to extract the row that is in the middle of the data frame. Store the content of this row in an object named interviews_middle.
n_row <- nrow(interviews)
interviews[round(n_row/2),]
interviews[ceiling(n_row/2),]

#Combine nrow() with the - notation above to reproduce the behaviour of head(interviews), keeping just the first through 6th rows of the interviews dataset.
interviews[-(7:nrow(interviews)),]

interviews$affect_conflicts
interviews$affect
as.data.frame(interviews)$affect
