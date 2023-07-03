1.List the following details of each employee: employee number, last name, 
first name, sex, and salary.

SELECT e.emp_no ,e.last_name ,e.first_name ,e.sex,
(SELECT s.salary 
FROM "Salaries" AS s 
WHERE e.emp_no = s.emp_no) AS salary FROM "Employees" AS e
;

2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.last_name ,e.first_name ,e.hire_date 
FROM "Employees" AS e
WHERE DATE_PART('year', e.hire_date) = 1986

3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM "Dept_Manager" AS dm
LEFT JOIN "Employees" AS e
ON e.emp_no = dm.emp_no
LEFT JOIN "Departments" as d
on d.dept_no = dm.dept_no;

4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_emp" as de
LEFT JOIN "Departments" as d
ON de.dept_no = d.dept_no
LEFT JOIN "Employees" as e
ON e.emp_no = de.emp_no;

5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT e.first_name, e.last_name, e.sex
FROM "Employees" as e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM "Dept_emp" as de 
LEFT JOIN "Departments" as d
ON de.dept_no = d.dept_no
LEFT JOIN "Employees" as e
ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_emp" as de 
LEFT JOIN "Departments" as d
ON de.dept_no = d.dept_no
LEFT JOIN "Employees" as e
ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "count_of_last_name"
FROM "Employees"
GROUP BY last_name
ORDER BY "count_of_last_name" DESC;


