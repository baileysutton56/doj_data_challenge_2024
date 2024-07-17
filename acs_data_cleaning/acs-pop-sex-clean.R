library(tidyverse)
library(readxl)

# Read 2020 data
pop_2020 <- read_excel('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/2020/population-by-sex-2020.xlsx', sheet='Sheet1')

# Remove commas from values
pop_2020 <- pop_2020 %>%
  mutate_all(~gsub(",", "", .))

# Change to numeric
pop_2020 <- pop_2020 %>% 
  mutate_at(c(2:5), as.numeric)



##



Population <- read.csv('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Population.csv')
Sex <- read.csv('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Sex Total.csv')

# Select relevant columns
Population <- Population %>%
  select(NAME, estimate, year)
Sex <- Sex %>%
  select(NAME, estimate, year, var)

# Reshape
wide_sex <- Sex %>%
  pivot_wider(names_from = var, values_from = estimate)

# Rename columns
wide_sex_clean <- wide_sex %>%
  rename(male = B01001_002,
         female = B01001_026)
wide_pop_clean <- Population %>%
  rename(total_pop = estimate)

pop_sex_clean <- inner_join(wide_pop_clean,wide_sex_clean)


##


# Merge data
pop_sex_clean_all <- rbind(pop_sex_clean, pop_2020)

# Export CSV
write.csv(pop_sex_clean_all, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Final-Cleaned/population_sex.csv')





