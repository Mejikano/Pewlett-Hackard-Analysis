--DELIVERABLE 1. Number of retiring Employees
DROP TABLE retirement_titles;
-- Use retirement_titles
SELECT
e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees e
INNER JOIN titles t ON t.emp_no=e.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

DROP TABLE unique_titles;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
t.title,
--t.from_date,
t.to_date
INTO unique_titles
FROM employees e
INNER JOIN titles t ON t.emp_no=e.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no ASC, t.to_date DESC;

DROP TABLE retiring_titles;
SELECT COUNT(ut.title) AS title_cnt, ut.title
INTO retiring_titles
FROM unique_titles ut
GROUP BY ut.title 
ORDER BY title_cnt DESC;

--DELIVERABLE 2. Mentorship Eligibility 
DROP TABLE mentorship_eligibilty;
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
ORDER BY e.emp_no
--According to me, this should be the right order to return the current title
--but challente steps/instructions indicate otherwise
--ORDER BY e.emp_no ASC, t.to_date DESC
-- For corroboration below two queries can be used the current titles
--do not correspond with the table image shown on the challenge

--select * from titles where emp_no=10291;--current title is Senior Staff instead of Staff
--select * from titles where emp_no=12155;--current title is Senior Engineer instead of Engineer
;

