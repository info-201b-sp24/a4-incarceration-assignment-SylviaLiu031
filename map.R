state_abbrev_to_name <- data.frame(
  state = state.abb,
  full_name = tolower(state.name)
)

state_data <- prison_pop %>%
  group_by(state) %>%
  summarise(total_prison_pop = sum(total_prison_pop, na.rm = TRUE)) %>%
  left_join(state_abbrev_to_name, by = "state")

state_data <- state_data %>%
  rename(region = full_name)

us_states <- map_data("state")

map_data <- merge(us_states, state_data, by = "region", all.x = TRUE)

ggplot(map_data, aes(long, lat, group = group, fill = total_prison_pop)) +
  geom_polygon(color = "white") +
  scale_fill_gradient(low = "yellow", high = "red", na.value = "grey50") +
  labs(
    title = "Geographic Distribution of Total Prison Population by State",
    fill = "Total Prison Population"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),
    legend.title = element_text(hjust = 0.5)
  ) +
  coord_map()
