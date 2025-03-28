library(tidyverse)
library(readxl)

# Age


# Read 2020 data
age_2020 <- read_excel('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/2020/population-by-age-2020.xlsx', sheet='Sheet1')

# Remove commas from values
age_2020 <- age_2020 %>%
  mutate_all(~gsub(",", "", .))

# Change to numeric
age_2020 <- age_2020 %>% 
  mutate_at(c(2:9), as.numeric)


##


# Read file with all years except 2020
Age <- read.csv('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Sex by Age.csv')

# Select relevant columns
Age <- Age %>%
  select(NAME, estimate, year, var)

# Reshape
wide_age <- Age %>%
  pivot_wider(names_from = var, values_from = estimate)

## DEFINITIONS

# age_under_18 : B01001_003,B01001_004,B01001_005,B01001_006,B01001_027,B01001_028,B01001_029,B01001_030
# age_18_24 :	B01001_007,B01001_008,B01001_009,B01001_010,B01001_031,B01001_032,B01001_033,B01001_034
# age_25_34	: B01001_011,B01001_012,B01001_035,B01001_036
# age_35_44	: B01001_013,B01001_014,B01001_037,B01001_038
# age_45_54	: B01001_015,B01001_016,B01001_039,B01001_040
# age_55_64	: B01001_017,B01001_018,B01001_019,B01001_041,B01001_042,B01001_043
# age_65_over : B01001_020,B01001_021,B01001_022,B01001_023,B01001_024,B01001_025,B01001_044,B01001_045,B01001_046,B01001_047,B01001_048,B01001_049

# Calculate/sum rows
wide_age_clean <- wide_age %>%
  mutate(age_under_18 = rowSums(across(c(B01001_003,B01001_004,B01001_005,B01001_006,B01001_027,B01001_028,B01001_029,B01001_030)))) %>%
  mutate(age_18_24 = rowSums(across(c(B01001_007,B01001_008,B01001_009,B01001_010,B01001_031,B01001_032,B01001_033,B01001_034)))) %>%
  mutate(age_25_34 = rowSums(across(c(B01001_011,B01001_012,B01001_035,B01001_036)))) %>%
  mutate(age_35_44 = rowSums(across(c(B01001_013,B01001_014,B01001_037,B01001_038)))) %>%
  mutate(age_45_54 = rowSums(across(c(B01001_015,B01001_016,B01001_039,B01001_040)))) %>%
  mutate(age_55_64 = rowSums(across(c(B01001_017,B01001_018,B01001_019,B01001_041,B01001_042,B01001_043)))) %>%
  mutate(age_65_over = rowSums(across(c(B01001_020,B01001_021,B01001_022,B01001_023,B01001_024,B01001_025,B01001_044,B01001_045,B01001_046,B01001_047,B01001_048,B01001_049))))


# Select new variables
wide_age_clean <- select(wide_age_clean, 
                         NAME, year, 
                         age_under_18,
                         age_18_24,
                         age_25_34,
                         age_35_44,
                         age_45_54,
                         age_55_64,
                         age_65_over)


# Merge data
age_clean_all <- rbind(wide_age_clean, age_2020)

# Export CSV
write.csv(age_clean_all, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Final-Cleaned/age.csv')



