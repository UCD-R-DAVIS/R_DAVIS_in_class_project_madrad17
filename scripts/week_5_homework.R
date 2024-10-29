# Homework 5

# 1

library (tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

surveys %>%
  filter(!is.na(hindfoot_length)) %>% 
  group_by(genus, plot_type) %>% 
  summarize(mean_hf_lnth = mean(hindfoot_length)) %>% 
  pivot_wider(names_from = plot_type, values_from = mean_hf_lnth) %>% 
  arrange(Control)
  
# Create column for genus and a column named after every plot type, with each of 
# these columns containing the mean hindfoot length of animals in that plot 
# type and genus. So every row has a genus and then a mean hindfoot length 
# value for every plot type. The dataframe should be sorted by values in the 
# Control plot type column.

unique(survey$plot_type)
str(surveys_wide)
surveys_wide
