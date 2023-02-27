-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no; -- join on emp_no that is shared between the tables

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'; -- Only selects those with a hire date within the year of 1986.

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name -- requires information from 3 different tables. Will require 2 joins.
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no -- join on dept_no from dm & d
JOIN employees e ON dm.emp_no = e.emp_no; -- join on emp_no from dm & e

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name -- in order to reach the department name, we will have to reference the dept_emp table.
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no -- join on emp_no from de & e
JOIN departments d ON de.dept_no = d.dept_no; -- join on dept_no from de & d to get department name.

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'; -- set parameters for query results. last name must have 'B' with whatever else trailing the initial character.

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT employees.emp_no, employees.last_name, employees.first_name -- to look if an employee is from the sales dept, we need to reference the dept_emp table and the departments table to get the name. Another option is to search based off the dept_no, but this makes the line easier to read.
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no -- join on emp_no from e & de
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no -- join on dept_no from de & d to get the VARCHAR of the depts.
WHERE departments.dept_name = 'Sales'; -- parameters for the query.

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name -- Similar to query 6, we need to go through dept_emp to get to departments. We can simplify this, but this helps someone read the query.
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no -- join on emp_no from e & de
INNER JOIN departments d ON de.dept_no = d.dept_no -- join on dept_no from de & d to get the VARCHAR of the depts.
WHERE d.dept_name IN ('Sales', 'Development') -- parameters for query.
ORDER BY e.emp_no; -- order by ID

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*) AS frequency -- counts instances of last names and creates a new column called frequency as a return.
FROM employees
GROUP BY last_name -- without groupby, we would get a new column showing the instances of others with the same last name for each person with that last name. This now will show individual rows for all unique last names.
ORDER BY frequency DESC; -- decending order.
