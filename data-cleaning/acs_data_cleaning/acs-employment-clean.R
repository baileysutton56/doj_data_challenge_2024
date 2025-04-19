library(tidyverse)
library(readxl)

# Employment

# B23025_002 in labor force
# B23025_003 in labor force + civilian
# B23025_004 in labor force + civilian + employed
# B23025_005 in labor force + civilian + unemployed
# B23025_006 in labor force + armed forced
# B23025_007 not in labor force


# Read file with all years except 2020
Employment <- read.csv('/3. Import Data/Census ACS/Employment.csv')

# Select relevant columns
Employment <- Employment %>%
  select(NAME, estimate, year, var)

# Reshape
wide_employment <- Employment %>%
  pivot_wider(names_from = var, values_from = estimate)

# Rename and select variables

wide_employment <- wide_employment %>%
  rename(
    labor_force = B23025_002,
    labor_force_civ = B23025_003 ,
    labor_force_civ_emp = B23025_004 ,
    labor_force_civ_unemp = B23025_005 ,
    labor_force_mil = B23025_006 ,
    not_labor_force = B23025_007)

wide_employment_clean <- select(wide_employment, 
                                NAME, 
                                year, 
                                labor_force,
                                labor_force_civ,
                                labor_force_civ_emp,
                                labor_force_civ_unemp,
                                labor_force_mil,
                                not_labor_force)

# Read 2020 data
employment_2020 <- read_excel('/3. Import Data/Census ACS/2020/employment-2020.xlsx', sheet='Sheet1')

# Remove commas from values
employment_2020 <- employment_2020 %>%
  mutate_all(~gsub(",", "", .))

# Merge data
employment_clean_all <- rbind(wide_employment_clean, employment_2020)

# Ensure all values are numeric
employment_clean_all <- employment_clean_all %>% 
  mutate_at(c(2:8), as.numeric)

# Export CSV
write.csv(employment_clean_all, '/3. Import Data/Census ACS/Final-Cleaned/employment.csv')
