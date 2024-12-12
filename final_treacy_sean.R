#libraries
library(tidyverse)
library(lubridate)
library(ggplot2)
library(ggthemes)
library(tigris)
library(sf)

# Read in .csv
ty <- read_csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv")

# Filter out any non-running activities.You can assume that any lap with a pace 
# above 10 minutes_per_mile pace is walking, so remove those laps. 
# You should also remove any abnormally fast laps (< 5 minute_per_mile pace) 
#and abnormally short records where the total elapsed time is one minute or less.

tyruns <- ty %>%
  filter(sport == 'running') %>% 
  filter(minutes_per_mile < 10 & minutes_per_mile >5) %>% 
  filter(total_elapsed_time_s > 1) %>% 
#Group observations into three time periods corresponding to pre-2024 running, 
  # Tyler’s initial rehab efforts from January to June of this year, 
  # and activities from July to the present.
  mutate(
    time_period = case_when(
      month < 7 & year == 2024 ~ 'Jan-Jun',
      month > 6 & year == 2024 ~ 'July-present',
      year < 2024 ~ 'pre-2024',
      TRUE ~ 'other'
      )) %>% 
  group_by(time_period) %>% 
  select(timestamp, 
         minutes_per_mile, 
         steps_per_minute, 
         avg_heart_rate_bpm, 
         time_period)

view(tyruns)

# Ok... Learned something! It looks like my str() call at the end of this 
# variable was converting tyruns into a null value, which made it impossible to 
# plot. Kind of a bug? 

# Make a scatter plot that graphs SPM over speed by lap.

ggplot(data = tyruns, mapping = aes(x = minutes_per_mile, 
                                    y = steps_per_minute, 
                                    alpha = avg_heart_rate_bpm))+
  geom_jitter(aes())+
  scale_x_continuous(transform = 'reverse')+
  labs(y = "Steps per Minute", x = "Speed (Minutes per Mile)", alpha = "Heart Rate (BPM)")+
  theme_clean()

### WELP — that's as far as I got. Had some major issues with the str() bug 
### that took me forever to figure out. Onward and upward! Thanks for a 
### great class! 


# mutate(date = ymd(paste0(year,"-", 
                                 # month, "-", 
                                  #day))) %>% 
  #ggplot(data = tyruns, mapping = aes(x = steps_per_minute, 
                                  #    y = minutes_per_mile)) + 
        #geom_point() %>% 




