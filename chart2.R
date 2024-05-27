library(dplyr)
library(ggplot2)
comparison_data <- prison_pop %>%
  filter(!is.na(male_prison_pop) & !is.na(female_prison_pop))

ggplot(comparison_data, aes(x = male_prison_pop, y = female_prison_pop)) +
  geom_point(alpha = 0.5) +
  labs(
    title = "Comparison of Male and Female Prison Populations by County",
    x = "Male Prison Population",
    y = "Female Prison Population"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5)
  )
