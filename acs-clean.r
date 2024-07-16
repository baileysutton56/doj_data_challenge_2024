library(tidyverse)

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
