#### Preamble ####
# Purpose: Simulates the data we will be analysing later
# Author: Veyasan Ragulan
# Date: 20 September 2024
# Contact: veyasan.ragulan@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Simulate data ####
set.seed(304)

data <- 
  tibble(
    #Generating simulation for 1000 individual trees
    "ID" = 1:1000,
    
    # Generating random ward locations (25) for each of the trees with replacement
    "Ward" = sample(
      x = c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25"),
      size = 1000,
      replace=TRUE),
    
    # Generating random tree species from @streettree2021 with replacement
    "Tree Species" = sample(
      x = c("Acer nigrum", "Acer rubrum", "Acer saccharinum", "Acer saccharum", "Aesculus glabra", "Celtis occidentalis", "Gymnocladus dioicus", "Liriodendron tulipifera", "Ostrya virginiana", "Quercus alba", "Quercus bicolor", "Quercus macrocarpa", "Quercus shumardii", "Quercus rubra", "Tilia americana", "Acer x freemanii ‘Autumn Blaze’", "Aesculus flava", "Catalpa speciosa", "Cladrastis lutea", "Gleditsia triacanthos ‘Skyline", "Tilia americana ‘Redmond’", "Ulmus americana ‘Valley Forge’", "Aesculus hippocastanum", "Aesculus carnea ‘Briotii’", "Cercidiphyllum japonicum", "Corylus colurna", "Fagus sylvatica", "Ginkgo biloba", "Platanus x acerifolia", "Tilia cordata"),
      size = 1000,
      replace=TRUE),
    
    # Generating random dbh diameters from 1 to 100 cm for all trees with replacement
    "DBH" = sample(1:100, 1000, replace=TRUE)
  )

#### Write_csv
write_csv(data, file = "data/raw_data/simulated.csv")

