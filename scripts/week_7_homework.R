# Week 7 Assignment 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

library(tidyr)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

pop_diff <- gapminder %>% filter(
  continent != 'Oceania' &
  year >= 2002
  ) %>% 
  select(country, year, pop, continent
  )

pop_diff <- pop_diff %>% pivot_wider(names_from = year, values_from = pop, names_prefix = 'pop_') %>% 
  arrange(continent, country) %>% 
  mutate(
    pop_difference = pop_2007 - pop_2002
  )

view(pop_diff)

options(scipen = 999)

library(ggplot2)

ggplot(data = pop_diff, mapping = aes(
  x = reorder(country, pop_difference), 
  y = pop_difference)) +
  facet_wrap(~continent, scales = "free") +
  geom_col(aes(fill = continent)) +
  theme(axis.text.x = element_text(angle=45, vjust=1, hjust=1, size = 5), 
        strip.background = element_rect(color='white', fill='white', size=.5)) +
  labs(y = 'Population change', x = 'Country', title = 'Country population change between 2002 and 2007') +
  guides(fill = FALSE)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Week 7 Answer
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


library(tidyverse)

gapminder <- read_csv("data/gapminder.csv")

pg <- gapminder %>% 
  select(country, year, pop, continent) %>% 
  filter(year > 2000) %>% 
  pivot_wider(names_from = year, values_from = pop) %>% 
  mutate(pop_change_0207 = `2007` - `2002`)

pg %>% 
  filter(continent != "Oceania") %>% 
  ggplot(aes(x = reorder(country, pop_change_0207), y = pop_change_0207)) +
  geom_col(aes(fill = continent)) +
  facet_wrap(~continent, scales = "free") +
  theme_bw() +
  scale_fill_viridis_d() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), 
        legend.position = "none") +
  xlab("Country") +
  ylab("Change in Population Between 2002 and 2007")


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Week 7 Notes
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(diamonds, aes(x=carat, y=price, color=clarity))+
  geom_point(alpha = 0.2)+
  theme_classic()+
  ggtitle("Price by Diamond Quality") + ylab('Price in US$') +xlab('Carat')+
  stat_smooth(method = 'loess')
  
