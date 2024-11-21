library(tidyverse)
library(lubridate)
mloa1 <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv",
                 col_types = "cccccccddddddddd")

# Timezone UTC
view(mloa) 
head(mloa)
glimpse(mloa1)
# Remove missing values from the following: 
# 7: WIND SPEED -999.9
# 10: TEMPERATURE at 2 Meters -999.9
# 13: RELATIVE HUMIDITY -99

mloa <- mloa %>% filter(
  windSpeed_m_s != -999.9 &
  temp_C_2m != -999.9 &
  rel_humid != -99
)


# Generate a column called “datetime” using the year, month, day, hour24, 
# and min columns.
# Create a column called “datetimeLocal” that converts the datetime column to 
# Pacific/Honolulu time (HINT: look at the lubridate function called with_tz()). 

mloa$datetime <- paste(mloa$year, "-", mloa$month,
                        "-", mloa$day, ", ", mloa$hour24, ":",
                        mloa$min, sep = "")

mloa$datetime <- ymd_hm(as.character(mloa$datetime))
                        
tz(mloa$datetimeLocal)

mloa$datetimeLocal <- with_tz(mloa$datetime, tzone = "Pacific/Honolulu")

mloa$datetimeLocal

months <- month(mloa$datetimeLocal)

table(months)

# Then, use dplyr to calculate the mean hourly temperature each month using the 
# temp_C_2m column and the datetimeLocal columns. (HINT: Look at the lubridate 
# functions called month() and hour()).

?month()
?hour()

meanTemp_Month <- mloa %>% 
  mutate(month_name = month(datetimeLocal, label = TRUE, abbr = FALSE)) %>% 
  group_by(month_name, hour24) %>% 
  summarize(meanTemp = mean(temp_C_2m))

view(meanTemp_Month)

hourLocal <- hour(mloa$datetimeLocal) %>% 
  

length(hourLocal)

ggplot(data = meanTemp_Month, mapping = aes(x = month_name, y = meanTemp)) +
  geom_point(aes(color = hour24)


