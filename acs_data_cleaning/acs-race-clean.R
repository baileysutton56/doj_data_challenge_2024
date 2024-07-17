library(tidyverse)
library(readxl)

# Race


# Read 2020 data
race_2020 <- read_excel('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/2020/race-2020.xlsx', sheet='Sheet1')

# Remove commas from values
race_2020 <- race_2020 %>%
  mutate_all(~gsub(",", "", .))

# Change to numeric
race_2020 <- race_2020 %>% 
  mutate_at(c(2:9), as.numeric)


##


# Read file with all years except 2020
Race <- read.csv('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Race Ethnicity.csv')

# Select relevant columns
Race <- Race %>%
  select(NAME, estimate, year, var)

# Reshape
wide_race <- Race %>%
  pivot_wider(names_from = var, values_from = estimate)

## DEFINITIONS
# white :	B03002_003,B03002_013
# black : B03002_004,B03002_014
# native : B03002_005,B03002_015
# asian	: B03002_006,B03002_016
# hi_pacisl	: B03002_007,B03002_017
# other_race : B03002_008,B03002_018
# multi_race : B03002_009,B03002_019

# Calculate/sum rows
wide_race_clean <- wide_race %>%
  mutate(white = rowSums(across(c(B03002_003,B03002_013)))) %>%
  mutate(black = rowSums(across(c(B03002_004,B03002_014)))) %>%
  mutate(native = rowSums(across(c(B03002_005,B03002_015)))) %>%
  mutate(asian = rowSums(across(c(B03002_006,B03002_016)))) %>%
  mutate(hi_pacisl = rowSums(across(c(B03002_007,B03002_017)))) %>%
  mutate(other_race = rowSums(across(c(B03002_008,B03002_018)))) %>%
  mutate(multi_race = rowSums(across(c(B03002_009,B03002_019))))


# Select new variables
wide_race_clean <- select(wide_race_clean, 
                         NAME, year, 
                         white,
                         black,
                         native,
                         asian,
                         hi_pacisl,
                         other_race,
                         multi_race)


# Merge data
race_clean_all <- rbind(wide_race_clean, race_2020)

# Export CSV
write.csv(race_clean_all, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Final-Cleaned/race.csv')



