# Week 4 Homework




#Week 4 Challenge 

## Create a tibble named surveys from the portal_data_joined.csv file.

library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")
str(surveys)
head(surveys)
summary(surveys$hindfoot_length)
summary(surveys$weight)
surveys$weight 

## Subset surveys using Tidyverse methods to keep rows with weight between 30 
# and 60, and print out the first 6 rows.

select(surveys, weight)
filter(surveys, weight %in% c(30:60))
weight_30_60 <- filter(surveys, weight %in% c(30:60))
weight_30_60[c(1:6),]

#other ways to do this

surveys %>% 
  filter(weight %in% c(30:60))

## Create a new tibble showing the maximum weight for each species + sex 
# combination and name it biggest_critters. Sort the tibble to take a look 
# at the biggest and smallest species + sex combinations. HINT: it’s easier 
# to calculate max if there are no NAs in the dataframe…

biggest_critters <- surveys %>% 
  filter(!is.na(weight))  %>% 
  group_by(species, sex) %>% 
  summarize(max_weight = max(weight)) %>% 
  arrange(max_weight)
  
biggest_critters

                           
## Try to figure out where the NA weights are concentrated in the data- 
# is there a particular species, taxa, plot, or whatever, where there are 
# lots of NA values? There isn’t necessarily a right or wrong answer here, 
# but manipulate surveys a few different ways to explore this. 
## Maybe use tally and arrange here.

# this would look at the number of NA's in each column
colSums(is.na(surveys))

#this would look at the number of NAs in the weight column, per each species,
# then name that column "count"... if you don't specific name, default new 
# name for tally is "n" 

surveys %>%
  filter(is.na(weight)) %>% 
  group_by(species) %>% 
  tally(name = "count") %>% 
  arrange(count)

## Take surveys, remove the rows where weight is NA and add a column that 
# contains the average weight of each species+sex combination to the full 
# surveys dataframe. Then get rid of all the columns except for species, 
# sex, weight, and your new average weight column. 
# Save this tibble as surveys_avg_weight.

surveys_avg_weight <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species, sex) %>% 
  mutate(mean_weight = mean(weight)) %>% 
  select(species, sex, weight, mean_weight)

surveys_avg_weight

## Take surveys_avg_weight and add a new column called above_average that 
# contains logical values stating whether or not a row’s weight is above 
# average for its species+sex combination (recall the new column we made 
# for this tibble).

