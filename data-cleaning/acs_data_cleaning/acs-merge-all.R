library(tidyverse)


age <- read_csv('age.csv')
disability <- read_csv('disability.csv')
education <- read_csv('education.csv')
employment <- read_csv('employment.csv')
health_insurance <- read_csv('health_insurance.csv')
hispanic_latino <- read_csv('hispanic_latino.csv')
income <- read_csv('income.csv')
population_sex <- read_csv('population_sex.csv')
poverty <- read_csv('poverty.csv')
race <- read_csv('race.csv')
snap <- read_csv('snap.csv')
veteran <- read_csv('veteran.csv')


acs_controls <- merge(age, disability)
acs_controls <- acs_controls %>%
  merge(education) %>%
  merge(employment) %>%
  merge(health_insurance) %>%
  merge(hispanic_latino) %>%
  merge(income) %>%
  merge(population_sex) %>%
  merge(poverty) %>%
  merge(race) %>%
  merge(snap) %>%
  merge(veteran)

acs_controls <- acs_controls %>% select(-`...1`)

write.csv(acs_controls, 'H:/BPHC/OSBO/Data Lab/Enterprise Analytics Team/Projects/10. DOJ Data Challenge/3. Import Data/Census ACS/Final-Cleaned/ACS_Controls_all.csv')
