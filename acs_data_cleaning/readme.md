# American Community Survey data: Reference

ACS data for the years 2015-2022 (excluding 2020) were downloaded using the `tidycensus` package via the Census API.

Data for 2020 was downloaded separately from [Census.gov](https://www.census.gov/programs-surveys/acs/data/experimental-data/1-year.html) and are ***experimental estimates*** in order to [address nonresponse bias during the COVID-19 pandemic](https://www.census.gov/library/working-papers/2021/acs/2021_Rothbaum_01.html).

## ACS dataset: Data Dictionary

| Variable Label | ACS Code(s) | Definition |
|----------------|-------------|------------|
| state	| N/A | State (includes all 50 states and District of Columbia) |
| year	| N/A | Reporting Year, ranging from 2015 to 2022 | 
| age_under_18	| B01001_003,B01001_004,B01001_005,B01001_006,B01001_027,B01001_028,B01001_029,B01001_030 | Aggregated Sex by Age: Total Population Under Age 18; Male and Female | 
| age_18_24	| B01001_007,B01001_008,B01001_009,B01001_010,B01001_031,B01001_032,B01001_033,B01001_034 | Aggregated Sex by Age: Total Population Aged 18 to 24; Male and Female | 
| age_25_34	| B01001_011,B01001_012,B01001_035,B01001_036 | Aggregated Sex by Age: Total Population Aged 25 to 34; Male and Female |
| age_35_44	| B01001_013,B01001_014,B01001_037,B01001_038 | Aggregated Sex by Age: Total Population Aged 35 to 44; Male and Female |
| age_45_54	| B01001_015,B01001_016,B01001_039,B01001_040 | Aggregated Sex by Age: Total Population Aged 45 to 54; Male and Female |
| age_55_64	| B01001_017,B01001_018,B01001_019,B01001_041,B01001_042,B01001_043 | Aggregated Sex by Age: Total Population Aged 55 to 64; Male and Female |
| age_65_over | B01001_020,B01001_021,B01001_022,B01001_023,B01001_024,B01001_025,B01001_044,B01001_045,B01001_046,B01001_047,B01001_048,B01001_049	 | Aggregated Sex by Age: Total Population Aged 65 and Over; Male and Female |
| with_disability	| B18120_004,B18120_013,B18120_022 | Aggregated Employment Status by Disability Status: With a disability; Employed, Unemployed, and Not in Labor Force |
| no_disability	| B18120_011,B18120_020,B18120_029 | Aggregated Employment Status by Disability Status: No disability; Employed, Unemployed, and Not in Labor Force |
| less_9th	| B15003_002,B15003_003, B15003_004, B15003_005, B15003_006, B15003_007, B15003_008, B15003_009, B15003_010, B15003_011, B15003_012 | Aggregated Educational Attainment for the Population 25 Years and Over: Less than 9th grade |
| hs_no_diploma	| B15003_013, B15003_014, B15003_015, B15003_016 | Aggregated Educational Attainment for the Population 25 Years and Over: 9th to 12th grade, no diploma |
| hs_grad	| B15003_017, B15003_018 | Aggregated Educational Attainment for the Population 25 Years and Over: High school graduate (includes equivalency) |
| some_coll	| B15003_019, B15003_020 | Aggregated Educational Attainment for the Population 25 Years and Over: Some college, no degree |
| assoc	| B15003_021 | Educational Attainment for the Population 25 Years and Over: Associate's degree |
| bach	| B15003_022 | Educational Attainment for the Population 25 Years and Over: Bachelor's degree |
| grad_prof	| B15003_023, B15003_024, B15003_025 | Aggregated Educational Attainment for the Population 25 Years and Over: Graduate or professional degree |
| labor_force	| B23025_002 | Employment Status for the Population 16 Years and Over: In labor force |
| labor_force_civ	| B23025_003 | Employment Status for the Population 16 Years and Over: Civilian labor force |
| labor_force_civ_emp	| B23025_004 | Employment Status for the Population 16 Years and Over: Civilian labor force: Employed |
| labor_force_civ_unemp	| B23025_005 | Employment Status for the Population 16 Years and Over: Civilian labor force: Unemployed |
| labor_force_mil	| B23025_006 | Employment Status for the Population 16 Years and Over: Armed Forces |
| not_labor_force	| B23025_007 | Employment Status for the Population 16 Years and Over: Not in labor force |
| with_coverage	| C27001_004,C27001_007,C27001_010,C27001_014,C27001_017,C27001_020 | Aggregated Health Insurance Coverage Status by Sex by Age: With health insurance coverage; Male and Female; All ages |
| no_coverage	| C27001_005,C27001_008,C27001_011,C27001_015,C27001_018,C27001_021 | Aggregated Health Insurance Coverage Status by Sex by Age: No health insurance coverage; Male and Female; All ages |
| not_hispanic_latino	| B03002_002 | Hispanic or Latino Origin: Not Hispanic or Latino |
| hispanic_latino	| B03002_012 | Hispanic or Latino Origin: Hispanic or Latino |
| inc_less_20k	| B19001_002,B19001_003,B19001_004 | Aggregated Household Income in the Past 12 Months (Inflation-Adjusted Dollars): Less than $20,000 |
| inc_20_39k	| B19001_005,B19001_006,B19001_007,B19001_008 | Aggregated Household Income in the Past 12 Months (Inflation-Adjusted Dollars): $20,000 to $39,999 |
| inc_40_59k	| B19001_009,B19001_010,B19001_011 | Aggregated Household Income in the Past 12 Months (Inflation-Adjusted Dollars): $40,000 to $59,999 |
| inc_60_99k	| B19001_012,B19001_013 | Aggregated Household Income in the Past 12 Months (Inflation-Adjusted Dollars): $60,000 to $99,999 |
| inc_100_149k	| B19001_014,B19001_015 | Aggregated Household Income in the Past 12 Months (Inflation-Adjusted Dollars): $100,000 to $149,999 |
| inc_150_199k	| B19001_016 | Household Income in the Past 12 Months (Inflation-Adjusted Dollars): $150,000 to $199,999 |
| inc_more_200k	| B19001_017 | Household Income in the Past 12 Months (Inflation-Adjusted Dollars): $200,000 or more |
| total_pop	| B01003_001 | Total Population |
| male	| B01001_002 | Total Male Population |
| female | 	B01001_026 | Total Female Population |
| below_poverty	| B17020_002 | Poverty Status in the Past 12 Months: Income in the past 12 months below poverty level |
| at_above_poverty	| B17020_010 | Poverty Status in the Past 12 Months: Income in the past 12 months at or above poverty level |
| white	| B03002_003,B03002_013 | Aggregated Hispanic or Latino Origin by Race: White alone; Not Hispanic or Latino and Hispanic or Latino |
| black	| B03002_004,B03002_014 | Aggregated Hispanic or Latino Origin by Race: Black or African American alone; Not Hispanic or Latino and Hispanic or Latino |
| native | 	B03002_005,B03002_015 | Aggregated Hispanic or Latino Origin by Race: American Indian and Alaska Native alone; Not Hispanic or Latino and Hispanic or Latino |
| asian	| B03002_006,B03002_016 | Aggregated Hispanic or Latino Origin by Race: Asian alone; Not Hispanic or Latino and Hispanic or Latino |
| hi_pacisl	| B03002_007,B03002_017 | Aggregated Hispanic or Latino Origin by Race: Native Hawaiian and Other Pacific Islander alone; Not Hispanic or Latino and Hispanic or Latino |
| other_race	| B03002_008,B03002_018 | Aggregated Hispanic or Latino Origin by Race: Some other race alone; Not Hispanic or Latino and Hispanic or Latino |
| multi_race	| B03002_009,B03002_019 | Aggregated Hispanic or Latino Origin by Race: Two or more races; Not Hispanic or Latino and Hispanic or Latino |
| household_received_snap	| C22001_002 | Receipt of Food Stamps/SNAP in the Past 12 Months: Household received Food Stamps/SNAP in the past 12 months |
| household_did_not_receive_snap	| C22001_003 | Receipt of Food Stamps/SNAP in the Past 12 Months: Household did not receive Food Stamps/SNAP in the past 12 months |
| veteran	| B21001_002 | Veteran Status for the Civilian Population 18 Years and Over: Veteran |
| nonveteran | B21001_003 | Veteran Status for the Civilian Population 18 Years and Over: Nonveteran |

