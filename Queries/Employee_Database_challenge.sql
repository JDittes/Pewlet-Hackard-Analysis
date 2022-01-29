SELECT e.emp_no, e.first_name, e.last_name,
	ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees e
JOIN titles ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM most_recent_title
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT COUNT(*) title
FROM unique_titles;

--Retrieve the number of titles from Unique Titles table
SELECT COUNT(*), title
INTO retiring_titles
FROM distinct_onployees
GROUP BY title 
ORDER BY count DESC;
--cOUNT IS 72,457
SELECT * 
FROM retiring_titles;
--Is this the right table?


SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	de.from_date, de.to_date, ti.title
INTO mentorship_eligibility
FROM employees e
	JOIN dept_emp de ON e.emp_no=de.emp_no
	JOIN titles ti ON e.emp_no=ti.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibility;