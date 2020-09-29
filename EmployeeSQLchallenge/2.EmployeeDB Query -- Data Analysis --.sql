-- DATA ANALYSIS --
-- Query * FROM Each Table Bringing Data
SELECT * FROM department;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--Checking for possible duplicates 
SELECT
  emp_no,
  salary,
  count(*)
FROM salaries
GROUP BY
    emp_no,
	salary
HAVING count(*) > 1;

--1. List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, 
		employees.last_name, 
		employees.first_name, 
		employees.sex, 
		salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2.List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, 
		last_name, 
		hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';


--3.List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT department.dept_no, 
		department.dept_name, 
		dept_manager.emp_no, 
		employees.last_name, 
		employees.first_name 
FROM department
INNER JOIN dept_manager
ON department.dept_no = dept_manager.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;



--4.List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no
INNER JOIN department
ON dept_emp.dept_no = department.dept_no;



--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no
INNER JOIN department
ON dept_emp.dept_no = department.dept_no
WHERE department.dept_name = 'Sales';



--7.List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, department.dept_name
FROM dept_emp
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no
INNER JOIN department
ON dept_emp.dept_no = department.dept_no
WHERE department.dept_name = 'Sales' 
OR department.dept_name = 'Development';



--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;


--9. BONUS table for CSV and jupyter salary by title analysis
SELECT employees.emp_no, 
		titles.title_id,
		titles.title,
		employees.last_name, 
		employees.first_name, 
		employees.sex, 
		salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no
INNER JOIN titles
ON employees.emp_title_id = titles.title_id;