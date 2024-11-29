#### Preamble ####
# Purpose: Tests the cleaned dataset for any errors
# Author: Veyasan Ragulan
# Date: 20 November 2024
# Contact: veyasan.ragulan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Test data ####
data <- read_csv("data/analysis_data/analysis_data.csv")

species_test <- data |>
  filter(botanical_name == "alix Ã\u0097 sepulcralis")
species_test

# Does each tree have a corresponding ward
ward_test <- data |>
  filter(ward == "None")
ward_test # Make sure this is a 0*7 tibble

# Test for negative numbers
data$dbh_trunk |> min() <= 0

# Test for NAs in cleaned_data (should be FALSE)
all(is.na(data$ward))
all(is.na(data$streetname))
all(is.na(data$crossstreet1))
all(is.na(data$crossstreet2))