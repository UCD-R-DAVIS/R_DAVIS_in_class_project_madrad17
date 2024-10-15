#Weekly Challenge

### Load your survey data frame with the read.csv() function. Create a new data frame called surveys_base with only 
### the species_id, the weight, and the plot_type columns. Have this data frame only be the first 5,000 rows. 

surveys <- read.csv("data/portal_data_joined.csv")
surveys.base <- surveys[0:5000,c(6,9,13)]

### Remove all rows where there is an NA in the weight column. 
surveys.base <- surveys.base[complete.cases(surveys.base$weight), ]
surveys.base

### Convert both species_id and plot_type to factors. 
surveys.base$species_id <- factor(surveys.base$species_id) #call species_id column and convert to factor
class(surveys.base$species_id)
surveys.base$plot_type <- factor(surveys.base$plot_type) #call plot_type column and convert to factor
class(surveys.base$plot_type)

### Explore these variables and try to explain why a factor is different from a character. 
### Why might we want to use factors? Can you think of any examples?

### 

### CHALLENGE: Create a second data frame called challenge_base that only consists of individuals 
### from your surveys_base data frame with weights greater than 150g.

challenge_base <- surveys.base[surveys.base$weight>150,]
challenge_base





### NOTES

surveys <- read.csv("data/portal_data_joined.csv")


str(surveys)
surveys
class(surveys)

nrow(surveys)
ncol(surveys)
str(surveys)

head(survey)
tail(survey)
head(surveys,n=11)

summary(surveys)


### brackets tell R that we're "yanking" data out of an object

surveys[1,]
surveys[,1]


surveys[1:3]

### colons are a good way to produce sequences in R e.g. 1:3


surveys[,1:3]



### tidyverse and other stuff
library(tidyverse)

t_surveys <- read_csv('data/portal_data_joined.csv')
class(t_surveys)

class(surveys.base)

data.frame(surveys.base)

