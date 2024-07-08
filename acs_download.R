library(tidycensus)

#('3de9032577b6710ebdf05f8e2fe835a6ccb11a38', install = TRUE)


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

write.csv(median_inc_allyrs, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Population.csv')


