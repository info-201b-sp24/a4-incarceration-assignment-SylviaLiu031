library(dplyr)

# 1. Average total prison population across all counties
average_total_prison_pop <- prison_pop %>%
  summarise(avg_total_prison_pop = mean(total_prison_pop, na.rm = TRUE))

# 2. Highest Black prison population
highest_black_prison_pop <- prison_pop %>%
  filter(black_prison_pop == max(black_prison_pop, na.rm = TRUE)) %>%
  select(black_prison_pop)

# 3.Lowest White prison population
lowest_white_prison_pop <- prison_pop %>%
  filter(white_prison_pop == min(white_prison_pop, na.rm = TRUE)) %>%
  select(white_prison_pop)

# 4. Average of change in the total prison population over the past 10 years
change_over_time <- prison_pop %>%
  group_by(year) %>%
  summarise(avg_prison_pop = mean(total_prison_pop, na.rm = TRUE)) %>%
  mutate(change = avg_prison_pop - lag(avg_prison_pop)) 

recent_change <- change_over_time %>%
  filter(year %in% (max(year) - 9):max(year))

# Calculate the average change over the past 10 years
average_recent_change <- recent_change %>%
  summarise(avg_change = mean(change, na.rm = TRUE))



# 5. Average female prison population
average_female_prison_pop <- prison_pop %>%
  summarise(avg_female_prison_pop = mean(female_prison_pop, na.rm = TRUE))

# Print the summary values
average_total_prison_pop
highest_black_prison_pop
lowest_white_prison_pop
average_recent_change
average_female_prison_pop