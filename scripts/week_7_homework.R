# Week 7 Assignment 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library(tidyr)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

pop_diff <- gapminder %>% filter(
  continent != 'Oceania' &
  year >= 2002
  ) %>% 
  select(country, year, pop, continent
  ) %>% 
  pivot_wider(names_from = year, values_from = pop, names_prefix = 'pop_') %>% 
  arrange(continent, country, pop_diff) %>% 
  mutate(
    pop_difference = pop_2007 - pop_2002
  )

view(pop_diff)

options(scipen = 999)

ggplot(data = pop_diff, mapping = aes(
  x = reorder(country, pop_difference), 
  y = pop_difference)) +
  facet_wrap(~continent, scales = "free") +
  geom_col(aes(fill = continent)) +
  theme(axis.text.x = element_text(angle=45, vjust=1, hjust=1, size = 5), 
        strip.background = element_rect(color='white', fill='white', size=.5)) +
  labs(y = 'Population change', x = 'Country', title = 'Country population change between 2002 and 2007') +
  guides(fill = FALSE)


