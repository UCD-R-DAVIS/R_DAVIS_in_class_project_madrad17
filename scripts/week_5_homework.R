# Homework 5

# 1. Create column for genus and a column named after every plot type, with each of 
# these columns containing the mean hindfoot length of animals in that plot 
# type and genus. So every row has a genus and then a mean hindfoot length 
# value for every plot type. The dataframe should be sorted by values in the 
# Control plot type column.

library (tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

surveys_wide <- surveys %>%
  filter(!is.na(hindfoot_length)) %>% 
  group_by(genus, plot_type) %>% 
  summarize(mean_hf_lnth = mean(hindfoot_length)) %>% 
  pivot_wider(names_from = plot_type, values_from = mean_hf_lnth) %>% 
  arrange(Control)

view(surveys_wide)

# 2. Using the original surveys dataframe, use the two different functions we laid
# out for conditional statements, ifelse() and case_when(), to calculate a new 
# weight category variable called weight_cat. For this variable, define the 
# rodent weight into three categories, where “small” is less than or equal to 
# the 1st quartile of weight distribution, “medium” is between (but not 
# inclusive) the 1st and 3rd quartile, and “large” is any weight greater than 
# or equal to the 3rd quartile. (Hint: the summary() function on a column 
# summarizes the distribution). For ifelse() and case_when(), compare what 
# happens to the weight values of NA, depending on how you specify your arguments.


summary(survey$weight)
surveys$weight_cat
  
surveys$weight_cat <- surveys %>% 
  mutate(
    weight_cat = case_when(
    weight <= 20 ~ "small",
    weight > 20 ~ "medium",
    TRUE ~ "large"))
 
view(surveys$weight_cat)

weight >= 48 ~ "large",

?quantile


  ifelse(weight <= 20, "small"
  <> 2nd quartile (weight) == medium
  >= 3rd quartile (weight) == large
)
case_when(
  )
summarize()

?ifelse

unique(survey$plot_type)
str(surveys_wide)
surveys_wide
