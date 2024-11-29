#### Preamble ####
# Purpose: Cleans the raw Street Tree Data collected cumulatively by Urban Forestry
# Author: Veyasan Ragulan
# Date: 20 September 2024
# Contact: veyasan.ragulan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(arrow)

#### Clean data ####
raw_data <- read_parquet("data/raw_data/raw_data.parquet")
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  filter(DBH_TRUNK > 0) |> # Remove non-positive diameter readings
  mutate(BOTANICAL_NAME = replace(BOTANICAL_NAME, BOTANICAL_NAME == "alix Ã\u0097 sepulcralis", "Salix x sepulcralis")) |> # Fix the broken botanical name
  mutate(WARD = replace(WARD, OBJECTID == 26388, "15")) |> # Give a tree with no ward allocation its correct ward allocation
  janitor::clean_names() |> # match case on all variable_names
  select(objectid,structid,address,streetname,crossstreet1,crossstreet2,ward,botanical_name,dbh_trunk) |> # Select ids, street location, ward location, species name, and trunk diameter for analysis
  tidyr::drop_na() # Filter out any na values

#### Save data ####
write_parquet(cleaned_data, "data/analysis_data/analysis_data.parquet")
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")

