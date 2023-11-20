-- employee number, last name, first name, sex, salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);

-- first name, last name, date hired for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
	AND hire_date <= '1986-12-31';
	
-- manager, department number, department name, employee number, last name, first name
SELECT m.emp_no, m.dept_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager m
JOIN departments d
ON (m.dept_no = d.dept_no)
JOIN employees e
ON (m.emp_no = e.emp_no);

-- department number for each employee along with 
-- that employee’s employee number, last name, first name, and department name
SELECT e.emp_no, de.dept_no, d.dept_name, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de
ON (e.emp_no = de.emp_no)
JOIN departments d
ON (de.dept_no = d.dept_no);

-- first name, last name, and sex of each employee 
-- first name is Hercules, last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

-- each employee in the Sales department
-- employee number, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
WHERE e.emp_no IN
	(SELECT de.emp_no
	FROM dept_emp de
	WHERE de.dept_no IN
		(SELECT d.dept_no
		 FROM departments d
		 WHERE d.dept_name = 'Sales'
		)
	);

-- each employee in the Sales and Development departments
-- employee number, last name, first name, and department name. (USE GROUPS?)
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de
ON (de.emp_no = e.emp_no)
JOIN departments d
ON (de.dept_no = d.dept_no)
WHERE e.emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
			OR dept_name = 'Development'
		)
	)
GROUP BY e.emp_no;

-- frequency counts of all employee last names
SELECT last_name, COUNT(last_name) as "Count of Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Count of Last Name" DESC;

