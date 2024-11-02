# Week 6 Homework

library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

view(gapminder)

#calculate mean life expectancy for each continent 
 
gapminder %>% 
  group_by(continent, lifeExp) %>% 
  summarise(mean_lifeExp = mean(lifeExp))

mean_lifeExp



#in class demo

surveys <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.)) #remove NAs

#ggplot with individually specified geoms
ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length)) + 
  geom_point(aes(color = genus)) + 
  geom_smooth()

#want universal geoms? try this
ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length, color = genus)) + 
  geom_point(aes(color = genus)) + 
  geom_smooth()


#applied to a categorical variable and a continuous variable from homework 5

ggplot(data = weight_cat, aes(x = weight_cat, y = hindfoot_length)) + 
  geom_boxplot(aes(color = weight_cat)) +
  geom_point(alpha = 0.1)



#more ggplot / geom plotting

yearly_counts <- surveys %>%
  count(year, species_id)

ggplot(data = yearly_counts, mapping = aes(x = year, y = n, group = species_id)) +
  geom_line(aes(color = species_id)) + 
  facet_wrap(~species_id) + 
  theme_light()

#package that has nice themes for data viz
install.packages('ggthemes')

#package that has census shapefiles
install.packages('tigris')

#package that has simple features for R
install.packages('sf')

library(ggthemes)
library(tigris)
library(sf)

ca_counties = tigris::counties(state = 'CA',class='sf', year = 2023)

ggplot(data=ca_counties) + 
  geom_sf(aes(fill = -ALAND)) + theme_map() + 
  scale_fill_continuous_tableau()
