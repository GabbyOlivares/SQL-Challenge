# Modify this code to update the DB schema diagram.
# To reset the sample schema, replace everything with
# two dots ('..' - without quotes).

Employees
-
emp_no INT PK FK >- dept_emp.emp_no
emp_title_id VARCHAR FK >- titles.title_id
birth_date DATE
first_name VARCHAR
last_name VARCHAR
sex VARCHAR
hire_date DATE


department
-
dept_no VARCHAR PK
dept_name VARCHAR


dept_emp
----
emp_no INT
dept_no VARCHAR FK >- department.dept_no


salaries
-
emp_no INT FK >- Employees.emp_no
salary INT



titles
-
title_id VARCHAR PK
title VARCHAR


dept_manager
-
dept_no VARCHAR FK >- department.dept_no
emp_no INT FK >- Employees.emp_no