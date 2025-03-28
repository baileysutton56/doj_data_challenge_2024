library(tidyverse)
library(readxl)


# Read 2020 data
pov_2020 <- read_excel('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/2020/poverty-by-age-2020.xlsx', sheet='Sheet1')

# Remove commas from values
pov_2020 <- pov_2020 %>%
  mutate_all(~gsub(",", "", .))

# Change to numeric
pov_2020 <- pov_2020 %>% 
  mutate_at(c(2:4), as.numeric)



##


Poverty <- read.csv('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Poverty.csv')

# Select relevant columns
Poverty <- Poverty %>%
  select(NAME, estimate, year, var)

# Reshape
wide_pov <- Poverty %>%
  pivot_wider(names_from = var, values_from = estimate)

# Rename columns
wide_pov_clean <- wide_pov %>%
  rename(below_poverty = B17020_002,
         at_above_poverty = B17020_010)

##


# Merge data
pov_clean_all <- rbind(wide_pov_clean, pov_2020)

# Export CSV
write.csv(pov_clean_all, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Final-Cleaned/poverty.csv')







