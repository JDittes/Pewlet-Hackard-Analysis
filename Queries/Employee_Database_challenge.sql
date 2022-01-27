SELECT e.emp_no, e.first_name, e.last_name,
	ti.title, ti.from_date, ti.to_date
INTO most_recent_title
FROM employees e
JOIN titles ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO distinct_onployees
FROM most_recent_title
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM most_recent_title

--Retrieve the number of titles from Unique Titles table
SELECT COUNT(*), title
INTO retiring_titles
FROM distinct_onployees
GROUP BY title 
ORDER BY count DESC;
--cOUNT IS 72,457
--Is this the right table?
