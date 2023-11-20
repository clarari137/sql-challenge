CREATE TABLE titles(
	title_id VARCHAR(5),
	title VARCHAR(20),
	PRIMARY KEY(title_id)
);

CREATE TABLE employees (
	emp_no INTEGER, 
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	PRIMARY KEY(emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries(
	emp_no INTEGER,
	salary INTEGER,
	PRIMARY KEY(emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE departments(
	dept_no VARCHAR(4),
	dept_name VARCHAR(20),
	PRIMARY KEY(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
	emp_no INT,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(4),
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);