library(tidyverse)
library(readxl)


# Read 2020 data
vet_2020 <- read_excel('/3. Import Data/Census ACS/2020/veteran-2020.xlsx', sheet='Sheet1')

# Remove commas from values
vet_2020 <- vet_2020 %>%
  mutate_all(~gsub(",", "", .))

# Change to numeric
vet_2020 <- vet_2020 %>% 
  mutate_at(c(2:4), as.numeric)



##


Veteran <- read.csv('/3. Import Data/Census ACS/Veteran.csv')

# Select relevant columns
Veteran <- Veteran %>%
  select(NAME, estimate, year, var)

# Reshape
wide_vet <- Veteran %>%
  pivot_wider(names_from = var, values_from = estimate)

# Rename columns
wide_vet_clean <- wide_vet %>%
  rename(veteran = B21001_002,
         nonveteran = B21001_003)

# Select relevant columns
wide_vet_clean <- wide_vet_clean %>%
  select(NAME, year, veteran, nonveteran)

##


# Merge data
vet_clean_all <- rbind(wide_vet_clean, vet_2020)

# Export CSV
write.csv(vet_clean_all, '/3. Import Data/Census ACS/Final-Cleaned/veteran.csv')

