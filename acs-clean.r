library(tidyverse)
library(readxl)

# Disability

# With disability: 4, 13, 22 :: 'B18120_004','B18120_013','B18120_022'
# No disability: 11, 20, 29

wide_disability <- Disability %>%
  pivot_wider(names_from = var, values_from = estimate)

wide_disability_clean <- wide_disability %>%
  mutate(with_disability = case_when(year != 2020 ~ rowSums(across(c(B18120_004,B18120_013,B18120_022))),
                                     .default = with_disability)) %>%
  mutate(no_disability = case_when(year != 2020 ~ rowSums(across(c(B18120_011,B18120_020,B18120_029))),
                                   .default = no_disability))

wide_disability_clean <- select(wide_disability_clean, 
                                NAME, 
                                year, 
                                with_disability, 
                                no_disability)

write.csv(wide_disability_clean, 'disability.csv')


# Education

# less_9th	B15003_002,B15003_003, B15003_004, B15003_005, B15003_006, B15003_007, B15003_008, B15003_009, B15003_010, B15003_011, B15003_012
# hs_no_diploma	B15003_013, B15003_014, B15003_015, B15003_016
# hs_grad	B15003_017, B15003_018
# some_coll	B15003_019, B15003_020
# assoc	B15003_021
# bach B15003_022
# grad_prof B15003_023, B15003_024, B15003_025

# Read file with all years except 2020
Education <- read.csv('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Education.csv')

# Select relevant columns
Education <- Education %>%
  select(NAME, estimate, year, var)

# Reshape
wide_education <- Education %>%
  pivot_wider(names_from = var, values_from = estimate)

# Calculate/sum rows
wide_education_clean <- wide_education %>%
  mutate(less_9th = case_when(year != 2020 ~ rowSums(across(c(B15003_002,B15003_003, B15003_004, B15003_005, B15003_006, B15003_007, B15003_008, B15003_009, B15003_010, B15003_011, B15003_012))))) %>%
  mutate(hs_no_diploma = case_when(year != 2020 ~ rowSums(across(c(B15003_013, B15003_014, B15003_015, B15003_016))))) %>%
  mutate(hs_grad = case_when(year != 2020 ~ rowSums(across(c(B15003_017, B15003_018))))) %>%
  mutate(some_coll = case_when(year != 2020 ~ rowSums(across(c(B15003_019, B15003_020))))) %>%
  mutate(assoc = case_when(year != 2020 ~ rowSums(across(c(B15003_021))))) %>%
  mutate(bach = case_when(year != 2020 ~ rowSums(across(c(B15003_022))))) %>%
  mutate(grad_prof = case_when(year != 2020 ~ rowSums(across(c(B15003_023, B15003_024, B15003_025)))))
  
# Select new variables
wide_education_clean <- select(wide_education_clean, 
                                NAME, 
                                year, 
                               less_9th,
                               hs_no_diploma,
                               hs_grad,
                               some_coll,
                               assoc,
                               bach,
                               grad_prof)

# Read 2020 data
education_2020 <- read_excel('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/2020/education-2020.xlsx', sheet='Sheet1')

# Remove commas from values
education_2020 <- education_2020 %>%
  mutate_all(~gsub(",", "", .))

# Merge data
education_clean_all <- rbind(wide_education_clean, education_2020)

# Ensure all values are numeric
education_clean_all <- education_clean_all %>% 
  mutate_at(c(2:9), as.numeric)

# Export CSV
write.csv(education_clean_all, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Final-Cleaned/education.csv')


