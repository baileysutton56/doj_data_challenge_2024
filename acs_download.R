library(tidycensus)
library(tidyverse)

# view variables
v22 <- load_variables(2022, "acs1", cache = TRUE)
View(v22)

#write.csv(v22, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/5. Documentation/ACS_Variables_2022.csv')

unique(v22$concept)

years <- c(2015, 2016, 2017, 2018, 2019, 2021, 2022)
# 2020 estimates must be downloaded separately


# Population
population_list <- list()

for (year in years) {
  
  total_pop <- get_acs(geography = "state", 
                       variables = c(pop = "B01003_001"), 
                       year = year,
                       survey="acs1")
  
  total_pop$year <- year
  
  population_list[[year]] <- total_pop
  
}

total_pop_allyrs <- do.call(rbind, population_list)

write.csv(total_pop_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Population.csv')


# Income

income_list <- list()

for (year in years) {
  
  median_income <- get_acs(geography = "state", 
          variables = c(medincome = "B19013_001"), 
          year = year,
          survey="acs1")
  
  median_income$year <- year
  
  income_list[[year]] <- median_income
  
}

median_inc_allyrs <- do.call(rbind, income_list)

write.csv(median_inc_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Income.csv')


# Age (Sex by Age)

age_list <- list()
sex_by_age_vars <- c(
              # Male by Age
                     'B01001_003',
                     'B01001_004',
                     'B01001_005',
                     'B01001_006',
                     'B01001_007',
                     'B01001_008',
                     'B01001_009',
                     'B01001_010',
                     'B01001_011',
                     'B01001_012',
                     'B01001_013',
                     'B01001_014',
                     'B01001_015',
                     'B01001_016',
                     'B01001_017',
                     'B01001_018',
                     'B01001_019',
                     'B01001_020',
                     'B01001_021',
                     'B01001_022',
                     'B01001_023',
                     'B01001_024',
                     'B01001_025',
              # Female by Age
                     'B01001_027',
                     'B01001_028',
                     'B01001_029',
                     'B01001_030',
                     'B01001_031',
                     'B01001_032',
                     'B01001_033',
                     'B01001_034',
                     'B01001_035',
                     'B01001_036',
                     'B01001_037',
                     'B01001_038',
                     'B01001_039',
                     'B01001_040',
                     'B01001_041',
                     'B01001_042',
                     'B01001_043',
                     'B01001_044',
                     'B01001_045',
                     'B01001_046',
                     'B01001_047',
                     'B01001_048',
                     'B01001_049')

for (year in years) {
  year_data <- list()  # Create an empty list for each year
  
  for (var in sex_by_age_vars) { 
    sex_age <- get_acs(geography = "state", 
                       variables = c(sex_age = var), 
                       year = year,
                       survey = "acs1")
    
    sex_age$year <- year
    sex_age$var <- var
    
    year_data[[var]] <- sex_age  # Append data to the year-specific list
  }
  
  age_list[[year]] <- year_data  # Append the year-specific list to age_list
}

flattened_age_list <- flatten(age_list)
sex_age_allyrs <- bind_rows(flattened_age_list)


write.csv(sex_age_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Sex by Age.csv')


# Sex/Gender

sex_list <- list()
sex_vars <- c(
  # Male Total
  'B01001_002',
  # Female Total
  'B01001_026')

for (year in years) {
  year_data <- list()  
  
  for (var in sex_vars) { 
    sex <- get_acs(geography = "state", 
                       variables = c(sex = var), 
                       year = year,
                       survey = "acs1")
    
    sex$year <- year
    sex$var <- var
    
    year_data[[var]] <- sex 
  }
  
  sex_list[[year]] <- year_data 
}

flattened_sex_list <- flatten(sex_list)
sex_allyrs <- bind_rows(flattened_sex_list)


write.csv(sex_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Sex Total.csv')



# Race

B02001_002
B02001_003
B02001_004
B02001_005
B02001_006
B02001_007
B02001_008
B02001_009
B02001_010
