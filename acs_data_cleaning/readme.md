# American Community Survey data: Reference

ACS data for the years 2015-2022 (excluding 2020) were downloaded using the `tidycensus` package via the Census API.

Data for 2020 was downloaded separately from [Census.gov](https://www.census.gov/programs-surveys/acs/data/experimental-data/1-year.html) and are ***experimental estimates*** in order to [address nonresponse bias during the COVID-19 pandemic](https://www.census.gov/library/working-papers/2021/acs/2021_Rothbaum_01.html).

## ACS dataset: Data Dictionary

| Variable Label | Definition | ACS Code(s) |
|----------------|------------|-------------|
| state	| State (includes all 50 states and District of Columbia) | N/A |
| year	| Reporting Year, ranging from 2015 to 2022 | N/A | 
| age_under_18	| Aggregated Sex by Age: Total Population Under Age 18; Male and Female | B01001_003,B01001_004,B01001_005,B01001_006,B01001_027,B01001_028,B01001_029,B01001_030 | 
| age_18_24	| Aggregated Sex by Age: Total Population Aged 18 to 24; Male and Female | B01001_007,B01001_008,B01001_009,B01001_010,B01001_031,B01001_032,B01001_033,B01001_034 | 
| age_25_34	| Aggregated Sex by Age: Total Population Aged 25 to 34; Male and Female | B01001_011,B01001_012,B01001_035,B01001_036 |
| age_35_44	| Aggregated Sex by Age: Total Population Aged 35 to 44; Male and Female | B01001_013,B01001_014,B01001_037,B01001_038 |
| age_45_54	| Aggregated Sex by Age: Total Population Aged 45 to 54; Male and Female | B01001_015,B01001_016,B01001_039,B01001_040 |
| age_55_64	| Aggregated Sex by Age: Total Population Aged 55 to 64; Male and Female | B01001_017,B01001_018,B01001_019,B01001_041,B01001_042,B01001_043 |
| age_65_over | Aggregated Sex by Age: Total Population Aged 65 and Over; Male and Female | B01001_020,B01001_021,B01001_022,B01001_023,B01001_024,B01001_025,B01001_044,B01001_045,B01001_046,B01001_047,B01001_048,B01001_049	 |
| with_disability	| Aggregated Employment Status by Disability Status: With a disability; Employed, Unemployed, and Not in Labor Force | B18120_004,B18120_013,B18120_022 |
| no_disability	| Aggregated Employment Status by Disability Status: No disability; Employed, Unemployed, and Not in Labor Force | B18120_011,B18120_020,B18120_029 |
| less_9th	| Aggregated Educational Attainment for the Population 25 Years and Over: Less than 9th grade | B15003_002,B15003_003, B15003_004, B15003_005, B15003_006, B15003_007, B15003_008, B15003_009, B15003_010, B15003_011, B15003_012 |
| hs_no_diploma	| Aggregated Educational Attainment for the Population 25 Years and Over: 9th to 12th grade, no diploma | B15003_013, B15003_014, B15003_015, B15003_016 |
| hs_grad	| Aggregated Educational Attainment for the Population 25 Years and Over: High school graduate (includes equivalency) | B15003_017, B15003_018 |
| some_coll	| Aggregated Educational Attainment for the Population 25 Years and Over: Some college, no degree | B15003_019, B15003_020 |
| assoc	| Educational Attainment for the Population 25 Years and Over: Associate's degree | B15003_021 |
| bach	| Educational Attainment for the Population 25 Years and Over: Bachelor's degree | B15003_022 |
| grad_prof	| Aggregated Educational Attainment for the Population 25 Years and Over: Graduate or professional degree | B15003_023, B15003_024, B15003_025 |
| labor_force	| Employment Status for the Population 16 Years and Over: In labor force | B23025_002 |
| labor_force_civ	| Employment Status for the Population 16 Years and Over: Civilian labor force | B23025_003 |
| labor_force_civ_emp	| Employment Status for the Population 16 Years and Over: Civilian labor force: Employed | B23025_004 |
| labor_force_civ_unemp	| Employment Status for the Population 16 Years and Over: Civilian labor force: Unemployed | B23025_005 |
| labor_force_mil	| Employment Status for the Population 16 Years and Over: Armed Forces | B23025_006 |
| not_labor_force	| Employment Status for the Population 16 Years and Over: Not in labor force | B23025_007 |
| with_coverage	| Aggregated Health Insurance Coverage Status by Sex by Age: With health insurance coverage; Male and Female; All ages | C27001_004,C27001_007,C27001_010,C27001_014,C27001_017,C27001_020 |
| no_coverage	| Aggregated Health Insurance Coverage Status by Sex by Age: No health insurance coverage; Male and Female; All ages | C27001_005,C27001_008,C27001_011,C27001_015,C27001_018,C27001_021 |
| not_hispanic_latino	| Hispanic or Latino Origin: Not Hispanic or Latino | B03002_002 |
| hispanic_latino	| Hispanic or Latino Origin: Hispanic or Latino | B03002_012 |
| inc_less_20k	| Aggregated Household Income in the Past 12 Months (Inflation-Adjusted Dollars): Less than $20,000 | B19001_002,B19001_003,B19001_004 |
| inc_20_39k	| Aggregated Household Income in the Past 12 Months (Inflation-Adjusted Dollars): $20,000 to $39,999 | B19001_005,B19001_006,B19001_007,B19001_008 |
| inc_40_59k	| Aggregated Household Income in the Past 12 Months (Inflation-Adjusted Dollars): $40,000 to $59,999 | B19001_009,B19001_010,B19001_011 |
| inc_60_99k	| Aggregated Household Income in the Past 12 Months (Inflation-Adjusted Dollars): $60,000 to $99,999 | B19001_012,B19001_013 |
| inc_100_149k	| Aggregated Household Income in the Past 12 Months (Inflation-Adjusted Dollars): $100,000 to $149,999 | B19001_014,B19001_015 |
| inc_150_199k	| Household Income in the Past 12 Months (Inflation-Adjusted Dollars): $150,000 to $199,999 | B19001_016 |
| inc_more_200k	| Household Income in the Past 12 Months (Inflation-Adjusted Dollars): $200,000 or more | B19001_017 |
| total_pop	| Total Population | B01003_001 |
| male	| Total Male Population | B01001_002 |
| female | Total Female Population | 	B01001_026 |
| below_poverty	| Poverty Status in the Past 12 Months: Income in the past 12 months below poverty level | B17020_002 |
| at_above_poverty	| Poverty Status in the Past 12 Months: Income in the past 12 months at or above poverty level | B17020_010 |
| white	| Aggregated Hispanic or Latino Origin by Race: White alone; Not Hispanic or Latino and Hispanic or Latino | B03002_003,B03002_013 |
| black	| Aggregated Hispanic or Latino Origin by Race: Black or African American alone; Not Hispanic or Latino and Hispanic or Latino | B03002_004,B03002_014 |
| native | Aggregated Hispanic or Latino Origin by Race: American Indian and Alaska Native alone; Not Hispanic or Latino and Hispanic or Latino | 	B03002_005,B03002_015 |
| asian	| Aggregated Hispanic or Latino Origin by Race: Asian alone; Not Hispanic or Latino and Hispanic or Latino | B03002_006,B03002_016 |
| hi_pacisl	| Aggregated Hispanic or Latino Origin by Race: Native Hawaiian and Other Pacific Islander alone; Not Hispanic or Latino and Hispanic or Latino | B03002_007,B03002_017 |
| other_race	| Aggregated Hispanic or Latino Origin by Race: Some other race alone; Not Hispanic or Latino and Hispanic or Latino | B03002_008,B03002_018 |
| multi_race	| Aggregated Hispanic or Latino Origin by Race: Two or more races; Not Hispanic or Latino and Hispanic or Latino | B03002_009,B03002_019 |
| household_received_snap	| Receipt of Food Stamps/SNAP in the Past 12 Months: Household received Food Stamps/SNAP in the past 12 months | C22001_002 |
| household_did_not_receive_snap	| Receipt of Food Stamps/SNAP in the Past 12 Months: Household did not receive Food Stamps/SNAP in the past 12 months | C22001_003 |
| veteran	| Veteran Status for the Civilian Population 18 Years and Over: Veteran | B21001_002 |
| nonveteran | Veteran Status for the Civilian Population 18 Years and Over: Nonveteran | B21001_003 |

