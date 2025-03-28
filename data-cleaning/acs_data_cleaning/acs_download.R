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


# Median Income

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


# Household Income

inc_list <- list()
inc_vars <- c(
  'B19001_001',
  'B19001_002',
  'B19001_003',
  'B19001_004',
  'B19001_005',
  'B19001_006',
  'B19001_007',
  'B19001_008',
  'B19001_009',
  'B19001_010',
  'B19001_011',
  'B19001_012',
  'B19001_013',
  'B19001_014',
  'B19001_015',
  'B19001_016',
  'B19001_017')

for (year in years) {
  year_data <- list()  
  
  for (var in inc_vars) { 
    inc <- get_acs(geography = "state", 
                   variables = c(inc = var), 
                   year = year,
                   survey = "acs1")
    
    inc$year <- year
    inc$var <- var
    
    year_data[[var]] <- inc 
  }
  
  inc_list[[year]] <- year_data 
}

flattened_inc_list <- flatten(inc_list)
inc_allyrs <- bind_rows(flattened_inc_list)


write.csv(inc_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Income.csv')



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



# Race/Ethnicity
race_list <- list()
race_vars <- c(
  'B03002_002',
  'B03002_003',
  'B03002_004',
  'B03002_005',
  'B03002_006',
  'B03002_007',
  'B03002_008',
  'B03002_009',
  'B03002_010',
  'B03002_011',
  'B03002_012',
  'B03002_013',
  'B03002_014',
  'B03002_015',
  'B03002_016',
  'B03002_017',
  'B03002_018',
  'B03002_019',
  'B03002_020',
  'B03002_021')

for (year in years) {
  year_data <- list()  
  
  for (var in race_vars) { 
    race <- get_acs(geography = "state", 
                   variables = c(race = var), 
                   year = year,
                   survey = "acs1")
    
    race$year <- year
    race$var <- var
    
    year_data[[var]] <- race 
  }
  
  race_list[[year]] <- year_data 
}

flattened_race_list <- flatten(race_list)
race_allyrs <- bind_rows(flattened_race_list)


write.csv(race_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Race Ethnicity.csv')


# Education

edu_list <- list()
edu_vars <- c(
  'B15003_001',
  'B15003_002',
  'B15003_003',
  'B15003_004',
  'B15003_005',
  'B15003_006',
  'B15003_007',
  'B15003_008',
  'B15003_009',
  'B15003_010',
  'B15003_011',
  'B15003_012',
  'B15003_013',
  'B15003_014',
  'B15003_015',
  'B15003_016',
  'B15003_017',
  'B15003_018',
  'B15003_019',
  'B15003_020',
  'B15003_021',
  'B15003_022',
  'B15003_023',
  'B15003_024',
  'B15003_025')

for (year in years) {
  year_data <- list()  
  
  for (var in edu_vars) { 
    edu <- get_acs(geography = "state", 
                    variables = c(edu = var), 
                    year = year,
                    survey = "acs1")
    
    edu$year <- year
    edu$var <- var
    
    year_data[[var]] <- edu 
  }
  
  edu_list[[year]] <- year_data 
}

flattened_edu_list <- flatten(edu_list)
edu_allyrs <- bind_rows(flattened_edu_list)


write.csv(edu_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Education.csv')



# Food Stamps/SNAP

snap_list <- list()
snap_vars <- c(
  'C22001_001',
  'C22001_002',
  'C22001_003')

for (year in years) {
  year_data <- list()  
  
  for (var in snap_vars) { 
    snap <- get_acs(geography = "state", 
                   variables = c(snap = var), 
                   year = year,
                   survey = "acs1")
    
    snap$year <- year
    snap$var <- var
    
    year_data[[var]] <- snap 
  }
  
  snap_list[[year]] <- year_data 
}

flattened_snap_list <- flatten(snap_list)
snap_allyrs <- bind_rows(flattened_snap_list)


write.csv(snap_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Food Stamps.csv')


# Veteran Status

vet_list <- list()
vet_vars <- c(
  'B21001_001',
  'B21001_002',
  'B21001_003'
)

for (year in years) {
  year_data <- list()  
  
  for (var in vet_vars) { 
    vet <- get_acs(geography = "state", 
                    variables = c(vet = var), 
                    year = year,
                    survey = "acs1")
    
    vet$year <- year
    vet$var <- var
    
    year_data[[var]] <- vet 
  }
  
  vet_list[[year]] <- year_data 
}

flattened_vet_list <- flatten(vet_list)
vet_allyrs <- bind_rows(flattened_vet_list)


write.csv(vet_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Veteran.csv')


# Employment

emp_list <- list()
emp_vars <- c(
  'B23025_001',
  'B23025_002',
  'B23025_003',
  'B23025_004',
  'B23025_005',
  'B23025_006',
  'B23025_007'
)

for (year in years) {
  year_data <- list()  
  
  for (var in emp_vars) { 
    emp <- get_acs(geography = "state", 
                   variables = c(emp = var), 
                   year = year,
                   survey = "acs1")
    
    emp$year <- year
    emp$var <- var
    
    year_data[[var]] <- emp 
  }
  
  emp_list[[year]] <- year_data 
}

flattened_emp_list <- flatten(emp_list)
emp_allyrs <- bind_rows(flattened_emp_list)


write.csv(emp_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Employment.csv')



# Veteran Status

vet_list <- list()
vet_vars <- c(
  'B21001_001',
  'B21001_002',
  'B21001_003'
)

for (year in years) {
  year_data <- list()  
  
  for (var in vet_vars) { 
    vet <- get_acs(geography = "state", 
                    variables = c(vet = var), 
                    year = year,
                    survey = "acs1")
    
    vet$year <- year
    vet$var <- var
    
    year_data[[var]] <- vet 
  }
  
  vet_list[[year]] <- year_data 
}

flattened_vet_list <- flatten(vet_list)
vet_allyrs <- bind_rows(flattened_vet_list)


write.csv(vet_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Veteran.csv')


# Employment

emp_list <- list()
emp_vars <- c(
  'B23025_001',
  'B23025_002',
  'B23025_003',
  'B23025_004',
  'B23025_005',
  'B23025_006',
  'B23025_007'
)

for (year in years) {
  year_data <- list()  
  
  for (var in emp_vars) { 
    emp <- get_acs(geography = "state", 
                   variables = c(emp = var), 
                   year = year,
                   survey = "acs1")
    
    emp$year <- year
    emp$var <- var
    
    year_data[[var]] <- emp 
  }
  
  emp_list[[year]] <- year_data 
}

flattened_emp_list <- flatten(emp_list)
emp_allyrs <- bind_rows(flattened_emp_list)


write.csv(emp_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Employment.csv')


# Health Insurance

ins_list <- list()
ins_vars <- c(
  'C27001_001',
  'C27001_002',
  'C27001_003',
  'C27001_004',
  'C27001_005',
  'C27001_006',
  'C27001_007',
  'C27001_008',
  'C27001_009',
  'C27001_010',
  'C27001_011',
  'C27001_012',
  'C27001_013',
  'C27001_014',
  'C27001_015',
  'C27001_016',
  'C27001_017',
  'C27001_018',
  'C27001_019',
  'C27001_020',
  'C27001_021'
)

for (year in years) {
  year_data <- list()  
  
  for (var in ins_vars) { 
    ins <- get_acs(geography = "state", 
                   variables = c(ins = var), 
                   year = year,
                   survey = "acs1")
    
    ins$year <- year
    ins$var <- var
    
    year_data[[var]] <- ins 
  }
  
  ins_list[[year]] <- year_data 
}

flattened_ins_list <- flatten(ins_list)
ins_allyrs <- bind_rows(flattened_ins_list)


write.csv(ins_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Health Insurance.csv')



# Poverty

pov_list <- list()
pov_vars <- c(
  'B17020_002',
  'B17020_010'
)

for (year in years) {
  year_data <- list()  
  
  for (var in pov_vars) { 
    pov <- get_acs(geography = "state", 
                   variables = c(pov = var), 
                   year = year,
                   survey = "acs1")
    
    pov$year <- year
    pov$var <- var
    
    year_data[[var]] <- pov 
  }
  
  pov_list[[year]] <- year_data 
}

flattened_pov_list <- flatten(pov_list)
pov_allyrs <- bind_rows(flattened_pov_list)


write.csv(pov_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Poverty.csv')




# Disability

dis_list <- list()
dis_vars <- c(
  'B18120_004',
  'B18120_011',
  'B18120_013',
  'B18120_020',
  'B18120_022',
  'B18120_029'
)

for (year in years) {
  year_data <- list()  
  
  for (var in dis_vars) { 
    dis <- get_acs(geography = "state", 
                   variables = c(dis = var), 
                   year = year,
                   survey = "acs1")
    
    dis$year <- year
    dis$var <- var
    
    year_data[[var]] <- dis 
  }
  
  dis_list[[year]] <- year_data 
}

flattened_dis_list <- flatten(dis_list)
dis_allyrs <- bind_rows(flattened_dis_list)


write.csv(dis_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Disability.csv')

