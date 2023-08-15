# Data wrangling and viz

library(tidyverse)
library(here)
library(janitor)

# --- Set a path to read a file from the data folder
plants <- read_csv(here("data", "power_plants.csv")) %>%
  clean_names()

# --- Apply filter function
alabama_plants <- plants %>%
  filter(state_name == "Alabama" | state_name == "alabama")


alabama_plot <- ggplot(data = alabama_plants,
       aes(x = install_mw, y = total_mw)) +
  geom_point()

ggsave(filename = here("figs", "alabama_power_plants.jpg"), plot = alabama_plot)



