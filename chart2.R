library(dplyr)
library(ggplot2)
prison_pop <- read_csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")
comparison_data <- prison_pop %>%
  filter(!is.na(total_prison_pop) & !is.na(black_prison_pop))

ggplot(data = comparison_data, aes(x = total_prison_pop, y = black_prison_pop)) +
  geom_point(color = "pink") +
  geom_smooth(method=lm, color= "blue",  se=FALSE) +
  labs(title = paste("Relationship Between Prison Population and Black",
                     "Prison Population"),
       x = "Total Prison Population",
       y = "Black Prison Population")
