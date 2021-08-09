# Pewlett-Hackard-Analysis

### Resources
- Data source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv and titles.csv
- Software: PostgreSQL 11, pgAdmin 5.5


## Overview

This Analysis determines the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program for an important company that has many senior employees reaching the retirement age to provide insights for putting together a plan. 



## Results



Analysis 1. Number of retiring Employees

- ~55% of the titles are Senior (Senior Engineer, Senior Staff) which will be difficult to backfilled with new hires in the short term
- 2 Out of 9  will have their managers retiring
- There are **17,940 retiring employees with unknown department**

Retiring employees - Title Break down

![Total num of retiring by title](https://github.com/Mejikano/Pewlett-Hackard-Analysis/blob/main/Resources/retiring_titles.png)

Retiring employees - Department Break down

![Total num of retiring by Department](https://github.com/Mejikano/Pewlett-Hackard-Analysis/blob/main/Resources/unique_titles_byDpo.png)

Reference Below SQL group by the number of retiring employees by department:

```

    SELECT d.dept_name, COUNT(*)
    FROM unique_titles ut
    LEFT JOIN (
        SELECT emp_no, dept_no FROM dept_emp WHERE to_date = ('9999-01-01')
        ) de
    ON de.emp_no= ut.emp_no
    LEFT JOIN departments d on d.dept_no=de.dept_no
    GROUP BY d.dept_name ORDER BY d.dept_name

```


Analysis 2. Mentorship Eligibility 

- Finance department has the lowest capacity for the mentorship program  64 elegible mentors vs 3,759 retiring employees
- Part time job for mentorship program might not suffice for 90,398 vs 1,549 elegible mentors. Note that elegible mentors may decline.

Elegible mentors - Department Break down

![Total num of elegible mentors by Department](https://github.com/Mejikano/Pewlett-Hackard-Analysis/blob/main/Resources/mentorship_eligibilty_byDpo.png)

Reference below SQL group by the number of elegible mentors by department:

```
    SELECT d.dept_name, COUNT(*)
    FROM mentorship_eligibilty me
    LEFT JOIN (
        SELECT emp_no, dept_no FROM dept_emp WHERE to_date = ('9999-01-01')
        ) de
    ON de.emp_no= me.emp_no
    LEFT JOIN departments d on d.dept_no=de.dept_no
    GROUP BY d.dept_name ORDER BY d.dept_name

```

### Mentorship Query enhancement

Bason on my analysis the mentorship_eligibilty table does not show the current employee title as the DISTINCT ON statement was instructed to ORDER BY emp_no only this would randomly return the employee title from titles table, in order to fix/force the query for returning the current employe title below order must be applied: 

```
    ORDER BY e.emp_no ASC, t.to_date DESC
```

The complete query would look as follows:

```
    SELECT DISTINCT ON (e.emp_no)
    e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
    INTO mentorship_eligibilty
    FROM employees e
    INNER JOIN dept_emp de ON de.emp_no=e.emp_no
    INNER JOIN titles t ON t.emp_no=e.emp_no
    WHERE de.to_date = ('9999-01-01')
    AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
    ORDER BY e.emp_no ASC, t.to_date DESC;
```

i.e. below employees had two different titles, the fixed query will return their current title. 

```
    select * from titles where emp_no=10291;--current title is Senior Staff instead of Staff

    select * from titles where emp_no=12155;--current title is Senior Engineer instead of Engineer
```


## Summary 

Business Recommendation (assuming that the analyzed data is correct/accurate)

- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
    **90,398 employees**

```
    SELECT SUM(title_cnt) FROM retiring_titles;
```

- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

    ***There are 1,549 elegible mentors for 90,398 retiring employees to be backfilled, this would require around 58 employees to be trained by each mentor (part time job) which does not seem to be doable, PH will require a better strategy**

Below below table summarizes the number of employees to be trained by each mentor for all departments. 

![Retiree vs Mentor By Department](https://github.com/Mejikano/Pewlett-Hackard-Analysis/blob/main/Resources/Retiree_Mentor_byDpo.png)



## Reference 

Entity Relationship Physical Model:

![ER Model](https://github.com/Mejikano/Pewlett-Hackard-Analysis/blob/main/Resources/EmployeeDB.png)

