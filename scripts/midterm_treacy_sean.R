# Midterm

library(tidyverse)
tyler <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv")

tyler_runs <- tyler %>% 
  filter(sport == 'running') %>% 
  filter(minutes_per_mile < 10) %>% 
  filter(minutes_per_mile > 5) %>% 
  filter(total_elapsed_time_s > 60)

tyler_runs$pace <- tyler_runs %>% 
  mutate(
    pace = case_when(
      minutes_per_mile < 6 ~ "fast",
      minutes_per_mile > 6 & minutes_per_mile < 8 ~ "medium",
      TRUE ~ "slow")) %>% 
  select(pace)

tyler_runs$form <- ifelse(tyler_runs$year < 2024, "old", "new")

# Note: I keep running into an issue where when I assign this to tyler_runs$pace 
# it creates a combined column for every column in the sheet when i inspect with 
# view(tyler_runs)... why??? 

tyler_stats <- tyler_runs %>% 
  select(steps_per_minute, pace, form) %>% 
  group_by(form, pace) %>% 
  summarise(mean_steps_pm = mean(steps_per_minute)) %>% 
  pivot_wider(names_from = pace, values_from = pace)

#ok... I ran into issues here:

# Error in `pivot_wider()`:
# ! `spec$.name` must be unique.

# Tried to troubleshoot for a while and then gave up. I think I did something 
# wrong when I initally created the pace and form columns.
