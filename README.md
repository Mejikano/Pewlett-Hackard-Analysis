# Pewlett-Hackard-Analysis

### Resources
- Data source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv and titles.csv
- Software: PostgreSQL 11, pgAdmin 5.5


## Overview

This Analysis determines the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program for an important company that has many senior employees reaching the retirement age to provide insights for putting together a plan. 



## Results

Below statements highlight the main differences for the city type analysis.

Based on the following City Summary table.

![Summary Table - City Type](https://github.com/Mejikano/PyBer_Analysis/blob/main/analysis/Summary_dataframe.png)


These are the main highlights

- Urban, the offer is greater than the demand. According to the analysis Urban type has  2,405 Drivers (offer) vs a 1,625 Total rides (demand)

- According to the 4 months analysis rides per driver ration are too low:
    Rural 1.6 rides per driver
    Suburban 1.3 rides per driver
    Urban 0.67 rides per driver

- Average fare per ride seems to be standard (~ 5 fare avg difference for Urban, Suburban and Rural ) but driver´s fare average is quite different: Rural 1.4 times greater than Suburban, Suburban 2.4 times greater than Urban and Suburban and Rural 3.4 times greater than Urban 

Based on the following Total fare by City Type Chart.

![Total Fare - City Type](https://github.com/Mejikano/PyBer_Analysis/blob/main/analysis/PyBer_fare_summary.png)


These are the main highlights

- The maximum Total Fare per City Type may have different seasonality,  although the three city types fares increase the last week of February; in April Rural reaches its Total Fare peak, Suburban drops and Urban slightly increases but it does not reach the maximum totals. Further seasonality analysis might be required.


## Summary 

Business Recommendation (assuming that the analyzed data is correct/accurate)

- How many roles will need to be filled as the "silver tsunami" begins to make an impact?

- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?




