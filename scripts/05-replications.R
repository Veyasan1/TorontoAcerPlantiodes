#### Preamble ####
# Purpose: Replicated graphs from paper.qmd
# Author: Veyasan Ragulan
# Date: 20 November 2024
# Contact: veyasan.ragulan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


library(tidyverse)
library(here)
library(arrow)
library(modelsummary)

analysis_data <- read_csv(here("data/analysis_data/analysis_data.csv"))
model_data <- read_parquet(here::here("data/model_data/model_data.parquet"))
model <- readRDS(here("models/model.rds"))

species_count <- analysis_data %>%
  count(botanical_name, sort = TRUE) %>%
  head(10)

species_count |> 
  ggplot(aes(y = botanical_name, x = n)) +
  geom_col() +
  theme_minimal() +
  labs(x = "Planted Trees",
       y = NULL)

# Gather counts of Acer plantiodes per ward
ward_count <- analysis_data %>%
  filter(botanical_name == "Acer platanoides") %>%
  count(ward, sort = TRUE)

ward_count |> 
  ggplot(aes(x = ward, y = n)) +
  geom_col() +
  theme_minimal() +
  labs(x = "Ward",
       y = "Acer platanoides count")

# Gather 10 streets with the highest counts of Acer platanoides
street_count <- analysis_data %>%
  filter(botanical_name == "Acer platanoides") %>%
  count(streetname, sort = TRUE) %>%
  head(10)

street_count |> 
  ggplot(aes(x = n, y = streetname)) +
  geom_col() +
  theme_minimal() +
  labs(x = "Street",
       y = "Acer platanoides count")

# Gather 10 cross streets with the highest counts of Acer platanoides
crossstreet1_count <- analysis_data %>%
  filter(botanical_name == "Acer platanoides") %>%
  count(crossstreet1, sort = TRUE) %>%
  head(10)

crossstreet1_count |> 
  ggplot(aes(x = n, y = crossstreet1)) +
  geom_col() +
  theme_minimal() +
  labs(x = "Cross Street",
       y = "Acer platanoides count")

crossstreet2_count <- analysis_data %>%
  filter(botanical_name == "Acer platanoides") %>%
  count(crossstreet2, sort = TRUE) %>%
  head(10)

crossstreet2_count |> 
  ggplot(aes(x = n, y = crossstreet2)) +
  geom_col() +
  theme_minimal() +
  labs(x = "Cross Street",
       y = "Acer platanoides count")

ggplot(model_data, aes(x = ward)) +
  geom_point(aes(y = botanical_name), color = "black") +
  geom_line(aes(y = fitted_name), color = "blue", linetype = "dotted") +
  theme_classic() +
  labs(y = "Botanical Name", x = "Ward", title = "Linear Model over Ward")

ggplot(model_data, aes(x = streetname)) +
  geom_point(aes(y = botanical_name), color = "black") +
  geom_line(aes(y = fitted_name), color = "blue", linetype = "dotted") +
  theme_classic() +
  labs(y = "Botanical Name", x = "Ward", title = "Linear Model over Ward")

ggplot(model_data, aes(x = crossstreet1)) +
  geom_point(aes(y = botanical_name), color = "black") +
  geom_line(aes(y = fitted_name), color = "blue", linetype = "dotted") +
  theme_classic() +
  labs(y = "Botanical Name", x = "Ward", title = "Linear Model over Ward")