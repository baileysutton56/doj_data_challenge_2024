library(tidyverse)
library(readxl)

# Health insurance


# Read 2020 data
ins_2020 <- read_excel('/3. Import Data/Census ACS/2020/health-insurance-2020.xlsx', sheet='Sheet1')

# Remove commas from values
ins_2020 <- ins_2020 %>%
  mutate_all(~gsub(",", "", .))

# Change to numeric
ins_2020 <- ins_2020 %>% 
  mutate_at(c(2:12), as.numeric)

# Calculate/sum rows

ins_2020_clean <- ins_2020 %>%
  mutate(with_coverage = rowSums(across(c('under19_with','19_64_with','65over_with')))) %>%
  mutate(no_coverage = rowSums(across(c('under19_no','19_64_no','65over_no'))))

# Select columns
ins_2020_clean <- ins_2020_clean %>%
  select(NAME, year, with_coverage, no_coverage)


# Read file with all years except 2020
Health_Insurance <- read.csv('/3. Import Data/Census ACS/Health Insurance.csv')

# Select relevant columns
Health_Insurance <- Health_Insurance %>%
  select(NAME, estimate, year, var)

# DEFINITIONS
# with_coverage : C27001_004,C27001_007,C27001_010,C27001_014,C27001_017,C27001_020
# no_coverage : C27001_005,C27001_008,C27001_011,C27001_015,C27001_018,C27001_021

# Reshape
wide_ins <- Health_Insurance %>%
  pivot_wider(names_from = var, values_from = estimate)

# Calculate/sum rows
wide_ins_clean <- wide_ins %>%
  mutate(with_coverage = rowSums(across(c(C27001_004,C27001_007,C27001_010,C27001_014,C27001_017,C27001_020)))) %>%
  mutate(no_coverage = rowSums(across(c(C27001_005,C27001_008,C27001_011,C27001_015,C27001_018,C27001_021))))

# Select new variables
wide_ins_clean <- select(wide_ins_clean, 
                         NAME, year, with_coverage, no_coverage)


# Merge data
ins_clean_all <- rbind(wide_ins_clean, ins_2020_clean)

# Export CSV
write.csv(ins_clean_all, '/3. Import Data/Census ACS/Final-Cleaned/health_insurance.csv')

