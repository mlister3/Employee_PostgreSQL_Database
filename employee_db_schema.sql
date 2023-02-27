DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_no VARCHAR(5) UNIQUE NOT NULL,
    dept_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (dept_name)
);

DROP TABLE IF EXISTS titles;

CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(20) UNIQUE NOT NULL,
	PRIMARY KEY (title_id)
);

DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL,
	emp_no INTEGER NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

DROP TABLE IF EXISTS dept_emp;

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
