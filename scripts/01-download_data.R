#### Preamble ####
# Purpose: Downloads and saves the data from OpenData Toronto
# Author: Veyasan Ragulan
# Date: 20 November 2024
# Contact: veyasan.ragulan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(arrow)


#### Download data ####
# get package
package <- show_package("6ac4569e-fd37-4cbc-ac63-db3624c5f6a2")
package

# get all resources for this package
resources <- list_package_resources("6ac4569e-fd37-4cbc-ac63-db3624c5f6a2")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data


#### Save data ####
write_csv(data, "data/raw_data/raw_data.csv") 
write_parquet(data, "data/raw_data/raw_data.parquet") 

