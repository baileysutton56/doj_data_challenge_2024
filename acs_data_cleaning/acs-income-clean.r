library(tidyverse)
library(readxl)

# Income



# Read 2020 data
inc_2020 <- read_excel('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/2020/household-income-past12mo-2020.xlsx', sheet='Sheet1')

# Remove commas from values
inc_2020 <- inc_2020 %>%
  mutate_all(~gsub(",", "", .))

# Change to numeric
inc_2020 <- inc_2020 %>% 
  mutate_at(c(2:10), as.numeric)


# Select columns
inc_2020_clean <- inc_2020 %>%
  select(-total)

inc_2020_clean <- rename(inc_2020_clean, NAME = '\r\n\r\nLabel')

# Read file with all years except 2020
Income <- read.csv('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Income.csv')

# Select relevant columns
Income <- Income %>%
  select(NAME, estimate, year, var)

# Reshape
wide_inc <- Income %>%
  pivot_wider(names_from = var, values_from = estimate)

# inc_less_20k : B19001_002,B19001_003,B19001_004
# inc_20_39k : B19001_005,B19001_006,B19001_007,B19001_008
# inc_40_59k: B19001_009,B19001_010,B19001_011
# inc_60_99k : B19001_012,B19001_013
# inc_100_149k: B19001_014,B19001_015
# inc_150_199k : B19001_016
# inc_more_200k : B19001_017

# Calculate/sum rows
wide_inc_clean <- wide_inc %>%
  mutate(inc_less_20k = rowSums(across(c(B19001_002,B19001_003,B19001_004)))) %>%
  mutate(inc_20_39k = rowSums(across(c(B19001_005,B19001_006,B19001_007,B19001_008)))) %>%
  mutate(inc_40_59k = rowSums(across(c(B19001_009,B19001_010,B19001_011)))) %>%
  mutate(inc_60_99k = rowSums(across(c(B19001_012,B19001_013)))) %>%
  mutate(inc_100_149k = rowSums(across(c(B19001_014,B19001_015)))) %>%
  rename(inc_150_199k = B19001_016) %>%
  rename(inc_more_200k = B19001_017)

# Select new variables
wide_inc_clean <- select(wide_inc_clean, 
                         NAME, year, 
                         inc_less_20k, 
                         inc_20_39k,
                         inc_40_59k,
                         inc_60_99k,
                         inc_100_149k,
                         inc_150_199k,
                         inc_more_200k)


# Merge data
inc_clean_all <- rbind(wide_inc_clean, inc_2020_clean)

# Export CSV
write.csv(inc_clean_all, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Final-Cleaned/income.csv')











