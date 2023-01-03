--DATA ANALYSIS

--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no as "Employee Number",
	emp.last_name as "Last Name",
	emp.first_name as "First Name",
	emp.sex as "Sex",
	sal.salary as "Salary"
FROM employees emp LEFT JOIN salaries sal ON emp.emp_no = sal.emp_no
;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp.first_name as "First Name",
	emp.last_name as "Last Name",
	emp.hire_date as "Hire Date"
FROM employees emp
WHERE extract(year from emp.hire_date) = 1986
;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT man.dept_no as "Department Number",
	dep.dept_name as "Department Name",
	man.emp_no as "Employee Number",
	emp.last_name as "Last Name",
	emp.first_name as "First Name"
FROM dept_manager man LEFT JOIN employees emp on man.emp_no = emp.emp_no
	LEFT JOIN departments dep ON man.dept_no = dep.dept_no
;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT depe.dept_no as "Department Number",
	depe.emp_no as "Employee Number",
	emp.last_name as "Last Name",
	emp.first_name as "First Name",
	dep.dept_name as "Department Name"
FROM dept_emp depe LEFT JOIN employees emp ON depe.emp_no = emp.emp_no
	LEFT JOIN departments dep ON depe.dept_no=dep.dept_no
;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT emp.first_name as "First Name",
	emp.last_name as "Last Name",
	emp.sex as "Sex"
FROM employees emp
WHERE emp.first_name = 'Hercules' AND emp.last_name like 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT depe.emp_no as "Employee Number",
	emp.last_name as "Last Name",
	emp.first_name as "First Name"
FROM dept_emp depe LEFT JOIN departments dep ON depe.dept_no = dep.dept_no 
	LEFT JOIN employees emp ON depe.emp_no = emp.emp_no
WHERE dep.dept_name='Sales'
;

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT depe.emp_no as "Employee Number",
	emp.last_name as "Last Name",
	emp.first_name as "First Name",
	dep.dept_name as "Department Name"
FROM dept_emp depe LEFT JOIN departments dep ON depe.dept_no = dep.dept_no 
	LEFT JOIN employees emp ON depe.emp_no = emp.emp_no
WHERE dep.dept_name='Sales' OR dep.dept_name = 'Development'
;

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT emp.last_name as "Last Name",
	count(emp.last_name) as "Frequency Counts"
FROM employees emp
GROUP BY emp.last_name
ORDER BY  "Frequency Counts" DESC
;