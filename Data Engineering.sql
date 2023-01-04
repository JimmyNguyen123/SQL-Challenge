--DATA ENGINEERING

CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	UNIQUE (title_id),
	CONSTRAINT titles_pk PRIMARY KEY (title_id)
);
--Import titles.csv

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	UNIQUE (emp_no),
	CONSTRAINT salaries_pk PRIMARY KEY (emp_no)
);
--Import salaries.csv

CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	UNIQUE(dept_no,dept_name),
	CONSTRAINT departments_pk PRIMARY KEY (dept_no)
);
--Import departments.csv

CREATE TABLE employees(
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	UNIQUE (emp_no),
	CONSTRAINT employees_pk PRIMARY KEY (emp_no),
	CONSTRAINT employees_fk_titles FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	CONSTRAINT employee_fk_salaries FOREIGN KEY (emp_no) REFERENCES salaries(emp_no)
);
--Import employees.csv

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	CONSTRAINT dept_emp_comp_pk PRIMARY KEY (emp_no,dept_no),
	CONSTRAINT dept_emp_fk_employees FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	CONSTRAINT dept_emp_fk_departments FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
--Import dept_emp.csv

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	UNIQUE(emp_no),
	CONSTRAINT dept_manager_pk PRIMARY KEY (emp_no),
	CONSTRAINT dept_manager_fk_departments FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	CONSTRAINT dept_dept_manger_fk_employees FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
--Import dept_manager.csv