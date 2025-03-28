library(tidyverse)
library(readxl)

# Hispanic or Latino


# Read 2020 data
hisp_2020 <- read_excel('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/2020/ethnicity-2020.xlsx', sheet='Sheet1')

# Remove commas from values
hisp_2020 <- hisp_2020 %>%
  mutate_all(~gsub(",", "", .))

# Change to numeric
hisp_2020 <- hisp_2020 %>% 
  mutate_at(c(2:4), as.numeric)


##


# Read file with all years except 2020
Hispanic_Latino <- read.csv('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Race Ethnicity.csv')

# Select relevant columns
Hispanic_Latino <- Hispanic_Latino %>%
  select(NAME, estimate, year, var)

# Reshape
wide_hisp <- Hispanic_Latino %>%
  pivot_wider(names_from = var, values_from = estimate)

# Rename and select relevant columns
wide_hisp_clean <- wide_hisp %>%
  rename(not_hispanic_latino = B03002_002,
         hispanic_latino = B03002_012)
wide_hisp_clean <- wide_hisp_clean %>%
  select(NAME, year, not_hispanic_latino, hispanic_latino)

# Merge data
hisp_clean_all <- rbind(wide_hisp_clean, hisp_2020)

# Export CSV
write.csv(hisp_clean_all, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Final-Cleaned/hispanic_latino.csv')
