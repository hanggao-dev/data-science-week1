#Initial exploration script
# Week 1: Initial Data Exploration ====
# Author: [Your Name]
# Date: [Today's Date]

# Load packages ====
library(tidyverse)
library(here)
library(naniar)
library(janitor)
library(skimr)

# Load data ====
mosquito_egg_raw <- read_csv(here("data", "mosquito_egg_data.csv"),
                             name_repair = janitor::make_clean_names)

# Basic overview ====
glimpse(mosquito_egg_raw)
summary(mosquito_egg_raw)
skim(mosquito_egg_raw)

# React table====
# view interactive table of data
view(mosquito_egg_raw)


# Counts by site and treatment====

mosquito_egg_raw |> 
  group_by(site, treatment) |> 
  summarise(n = n())

# Observations ====
# Your observations (add as comments below):
# - What biological system is this?
#   Mosquito
# - What's being measured?
#   Mosquito egg count
# - How many observations?
#   205 observations and 9 variable
# - Anything surprising?
#   Collector is missing
# - Any obvious problems?
# - Collector is missing

next go over the tutorial think about it and then pick 2 chapter that you owuld use to apply into your own dataset. that is what you need to do before next lesson.