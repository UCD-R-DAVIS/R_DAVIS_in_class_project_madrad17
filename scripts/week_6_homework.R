# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Week 6 Homework
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

# Mean life expectancy on each continent, and then how life expectancy has 
# changed over time by continent

gapminder %>% 
  group_by(continent, year) %>% 
  summarise(mean_lifeExp = mean(lifeExp)) %>% 
  ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color = continent))+
    geom_smooth(aes(color = continent)) +
    labs(y = "Life Expectancy", x = "Year", color = "Continent") +
    theme_clean()
  

# What is scale_x_log10() achieving? What about geom_smooth()?

#this seems to globally remove scientific notation from the plot... but is it the best way? 
options(scipen = 999)
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  # size points in proportion to country population
  geom_point(aes(color = continent, size = pop)) + 
  scale_x_log10(labels = function(x) format(x, scientific = FALSE)) +
  # puts it on a log10 scale so that the distribution is more even, 
  # and also removes scientific notation in the x-axis title with 
  # labels = function(x) format(x, scientific = FALSE)
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  # inserts a linear regression line per the specified characteristics
  labs(y = "Life Expectancy", x = "GDP Per Capita", color = "Continent", 
       size = 'Population', 
       title = 'Continental Life Expectancy by GDP Per Capita',
       subtitle = 'From 1952 - 2007') +
  theme_classic()


#boxplot of life expectency in Brazil, China, El Salvador, Niger, and the US

five_countries <- gapminder %>% filter(
  country == 'Brazil' | 
  country == 'China' | 
  country == 'El Salvador' | 
  country == 'Niger' |
  country == 'United States'
)
# is the vector method better here and if so, why? 
  ggplot(data = five_countries, aes(x = country, y = lifeExp)) + 
    geom_boxplot(aes(color = country)) +
    geom_jitter(aes(alpha = lifeExp)) + 
    labs(y = "Life Expectancy", x = "Country", color = "Country", 
         # What if you wanted the country labels to be color coded? 
         title = 'Life Expectancy of Five Countries', 
         subtitle = 'Mean distribution from 1952 - 2007') +
    guides(alpha = FALSE, color = FALSE) +
    theme_fivethirtyeight() 
  
    
# alpha of the geom_jitter doesn't seem to change point opacity.. or color
  
view(five_countries)



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Week 6 questions
# What is the options() function doing? 
# Is there a better way to remove scientific notation from the plot? options()
# vs. labels = function(x) format(x, scientific = FALSE)
# Why wasn't alpha adjusting the point opacity? 
# What if you want the x-axis to be color coded? 
# Is the vector method better for filtering than using filter()? 


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Week 6 notes
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
