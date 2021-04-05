USE employees;

-- TODO: Show each department along with the name of the current manager for that department.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_name;

-- TODO: Find the name of all departments currently managed by women.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
  AND e.gender = 'f'
ORDER BY d.dept_name;

-- TODO: Find the current titles of employees currently working in the Customer Service department.
SELECT t.title, COUNT(t.emp_no)
FROM titles AS t
         JOIN dept_emp AS de
              ON de.emp_no = t.emp_no
         JOIN employees e
              ON de.emp_no = e.emp_no
         JOIN departments d
              ON d.dept_no = de.dept_no
WHERE t.to_date = '9999-01-01'
  AND d.dept_name = 'Customer Service'
GROUP BY t.title;

-- TODO: Find the current salary of all current managers.

# salaries
# employees
# dpt_manager
# departments
# Department Name, Department Manager, Salary
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager', s.salary
FROM employees AS e -- Branching out to employees
         JOIN salaries AS s -- Branching out from employees to salaries
              ON e.emp_no = s.emp_no
        JOIN dept_manager AS dm  -- Branching out from employees to dept_manager
            ON e.emp_no = dm.emp_no
        JOIN departments AS d -- Branching out from dept_manager to departments
            ON dm.dept_no = d.dept_no
WHERE e.emp_no = dm.emp_no
  AND dm.to_date = '9999-01-01'
AND s.to_date = '9999-01-01'
ORDER BY d.dept_name;


-- TODO: *BONUS* Find the names of all current employees, their department name, and their current manager's name .