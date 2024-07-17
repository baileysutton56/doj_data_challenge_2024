library(tidyverse)
library(readxl)

# Food Stamps/SNAP

# C22001_002 household received snap benefits in past 12 mos
# C22001_003 household did not receive snap



# Read file with all years except 2020
Food_Stamps <- read.csv('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Food Stamps.csv')

# Select relevant columns
Food_Stamps <- Food_Stamps %>%
  select(NAME, estimate, year, var)

# Reshape
wide_snap <- Food_Stamps %>%
  pivot_wider(names_from = var, values_from = estimate)

# Rename and select variables

wide_snap <- wide_snap %>%
  rename(
    household_received_snap = C22001_002,
    household_did_not_receive_snap = C22001_003)

wide_snap_clean <- select(wide_snap, 
                          NAME, 
                          year, 
                          household_received_snap,
                          household_did_not_receive_snap)

# Read 2020 data
snap_2020 <- read_excel('H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/2020/snap-presence-of-children-2020.xlsx', sheet='Sheet1')

# Remove commas from values
snap_2020 <- snap_2020 %>%
  mutate_all(~gsub(",", "", .))

# Merge data
snap_clean_all <- rbind(wide_snap_clean, snap_2020)

# Ensure all values are numeric
snap_clean_all <- snap_clean_all %>% 
  mutate_at(c(2:4), as.numeric)

# Export CSV
write.csv(snap_clean_all, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Final-Cleaned/snap.csv')


