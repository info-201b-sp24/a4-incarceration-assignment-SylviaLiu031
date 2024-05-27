library(dplyr)
library(ggplot2)
trend_data <- prison_pop %>%
  filter(year >= 1990) %>%
  group_by(year) %>%
  summarise(
    black_prison_pop = sum(black_prison_pop, na.rm = TRUE),
    white_prison_pop = sum(white_prison_pop, na.rm = TRUE),
    latinx_prison_pop = sum(latinx_prison_pop, na.rm = TRUE)
  ) %>%
  pivot_longer(cols = c(black_prison_pop, white_prison_pop, latinx_prison_pop), names_to = "race", values_to = "prison_pop")

# Create the line chart
ggplot(trend_data, aes(x = year, y = prison_pop, color = race)) +
  geom_line(size = 1) +
  labs(
    title = "Trends in Prison Population Over Time by Race",
    x = "Year",
    y = "Prison Population",
    color = "Race"
  )
