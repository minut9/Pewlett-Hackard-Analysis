--Deliverable 1



-- Use Dictinct with Orderby to remove duplicate rows
SELECT em.emp_no, 
        em.first_name, 
        em.last_name,
	    ti.title, 
        ti.from_date, 
        ti.to_date
	INTO retiring_emp_by_title
	FROM employees AS em
	LEFT JOIN titles as ti
	ON (em.emp_no = ti.emp_no)
	WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	ORDER BY em.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, 
	first_name, 
    last_name, 
    title
INTO unique_titles
FROM retiring_emp_by_title
ORDER BY emp_no ASC, to_date DESC;


-- retrieve the number of employees by their most recent job title  who are about to retire.
SELECT COUNT(title), title 
INTO retirment_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;



--Deliverable 2


SELECT DISTINCT ON(e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
--DISTINCT ON(emp_no)
INTO mentorship_table
FROM employees AS e
	INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
	INNER JOIN titles AS t
	ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
