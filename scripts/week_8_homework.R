library(tidyverse)
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

# Timezone UTC

# Remove missing values from the following: 
# 7: WIND SPEED -999.9
# 10: TEMPERATURE at 2 Meters -999.9
# 13: RELATIVE HUMIDITY -99

mloa <- mloa %>% filter(
  windSpeed_m_s != -999.9 &
  temp_C_2m != -999.9 &
  rel_humid != -99
) %>% 
# Generate a column called “datetime” using the year, month, day, hour24, and min columns.
  mutate(
    
  )
# Create a column called “datetimeLocal” that converts the datetime column to 
# Pacific/Honolulu time (HINT: look at the lubridate function called with_tz()). 
# Then, use dplyr to calculate the mean hourly temperature each month using the 
# temp_C_2m column and the datetimeLocal columns. (HINT: Look at the lubridate 
# functions called month() and hour()).