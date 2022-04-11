library(tidyverse)
gapminder_yearly_pop <- read_csv("data/gapminder_yearly_population_total.csv") %>% mutate(across(-country, ))

gapminder_yearly_pop_long <- gapminder_yearly_pop %>% pivot_longer(-country, names_to = "year", values_to = "population") %>% mutate(year = as.numeric(year))

gapminder_yearly_pop_long <- gapminder_yearly_pop_long %>% mutate(suffix = str_extract(population, pattern = '[A-Za-z]$'),
                                                                  pop_n = parse_number(population)) %>%
  mutate(population_millions = case_when(
    suffix == "B" ~ pop_n * 1000,
    suffix == "k" ~ pop_n / 1000,
    suffix == "M" ~ pop_n,
    TRUE ~ pop_n / 1e6)) %>% select(country, year, population_millions)

gapminder_wide <- gapminder_yearly_pop_long %>% pivot_wider(names_from = "year", values_from = "population_millions")


write_csv(gapminder_wide, "data/gapminder_yearly_population_millions_total.csv")
