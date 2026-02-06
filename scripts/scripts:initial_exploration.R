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

#FIX 1: [Fixing negative values of body mass]
#Show the problem: mosquito egg has a negative body mass
mosquito_egg_raw |>
  filter(body_mass_mg <0)

#Fixing 1
mosquito_egg_clean <- mosquito_egg_raw |>
  mutate(body_mass_mg = if_else(body_mass_mg<0, NA_real_, body_mass_mg))
  
#Verify
mosquito_egg_clean |>
  filter(body_mass_mg <0)
  
# What changed and why it matters:
#I changed the negative body mass to NA to avoid error during statistical analysis.

#Fixing 2

# Show the problem: treatment has inconsistent capital letters
mosquito_egg_clean |>
  count(treatment)

#Fix it
mosquito_egg_string <- mosquito_egg_clean |>
  mutate(treatment = str_to_lower(treatment))
  

#Verify
mosquito_egg_string|>
  count(treatment)

#What changed and why it matters:
#Using the mutate function I change all the string to a lower case
#Avoid error during analysis
#Originally it has a 12 rows of overlapping variables now it has been shortened to three distinct variable



