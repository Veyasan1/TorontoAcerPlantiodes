#### Preamble ####
# Purpose: Models tree name by location variables
# Author: Veyasan Ragulan
# Date: 20 November 2024
# Contact: veyasan.ragulan@mail.utoronto.ca
# License: MIT
# Pre-requisites: Cleaned data from 02_data_cleaning.R


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(lubridate)
library(broom)
library(modelsummary)
library(rstanarm)
library(splines)
library(arrow)
library(here)

#### Read data ####
analysis_data <- read_csv(here("data/analysis_data/analysis_data.csv"))

### Factor Categorical Variables ###
analysis_data$botanical_name <- factor(analysis_data$botanical_name)
analysis_data$ward <- factor(analysis_data$ward)
analysis_data$streetname <- factor(analysis_data$streetname)
analysis_data$crossstreet1 <- factor(analysis_data$crossstreet1)
analysis_data$crossstreet2 <- factor(analysis_data$crossstreet2)

### Model data ####
# Due to size, pick a sample for model
set.seed(304)

model_sample <- 
  analysis_data |> 
  slice_sample(n = 1000)

# Model to predict botanical name by ward, and street/cross streets
model <- lm(botanical_name ~ ward + streetname + crossstreet1 + crossstreet2, data = model_sample)

# Augment data with model predictions
model_data <- model_sample |>
  mutate(
    fitted_name = predict(model),
  )

#### Save Models ####
# Save model to the models directory
saveRDS(model, file = here("models/model.rds"))

#### Write Data to Parquet ####
write_parquet(model_data, here("data/model_data/model_data.parquet"))






