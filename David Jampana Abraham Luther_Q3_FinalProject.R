# Load the necessary libraries
library(ggplot2)
library(dplyr)

# Load the data
air_traffic_data <- read.csv("C:/Users/david/OneDrive/Documents/AIT 580/air-traffic-passenger-statistics-1.csv")

# Summarize passenger counts by terminal and boarding area, distinguishing by domestic and international flights
terminal_boarding_summary <- air_traffic_data %>%
  group_by(Terminal, Boarding.Area, GEO.Summary) %>%
  summarise(Passenger.Count = sum(Passenger.Count)) %>%
  ungroup()

# Create a bar plot to compare passenger activity between terminals and boarding areas
ggplot(terminal_boarding_summary, aes(x = Terminal, y = Passenger.Count, fill = Boarding.Area)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  facet_wrap(~GEO.Summary) +
  labs(title = "Passenger Counts by Terminal and Boarding Area",
       x = "Terminal",
       y = "Passenger Count") +
  theme_minimal()

# Summarize passenger counts also by airline
terminal_boarding_airline_summary <- air_traffic_data %>%
  group_by(Terminal, Boarding.Area, Operating.Airline, GEO.Summary) %>%
  summarise(Passenger.Count = sum(Passenger.Count)) %>%
  ungroup()

ggplot(terminal_boarding_airline_summary, aes(x = Operating.Airline, y = Passenger.Count)) +
  geom_bar(stat = 'identity', aes(fill = Operating.Airline)) +
  coord_flip() +  # Flips the bar graph to horizontal
  theme_minimal() +
  theme(legend.position = "none") + # This removes the legend
  labs(title = 'Passenger Counts by Airline within Terminals and Boarding Areas',
       y = 'Passenger Count', x = '') + # Remove the x-axis label as it's now on the y-axis
  facet_wrap(~GEO.Summary) # Add facets for GEO Summary

