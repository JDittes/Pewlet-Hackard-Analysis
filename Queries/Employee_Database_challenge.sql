SELECT e.emp_no, e.first_name, e.last_name,
	ti.title, ti.from_date, ti.to_date
INTO most_recent_title
FROM employees e
JOIN titles ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;


SELECT * FROM most_recent_title;