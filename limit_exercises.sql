use employees;

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;


SELECT emp_no
FROM employees.salaries
ORDER BY salary DESC
LIMIT 5;

-- Getting a different answer than the curriculum???
SELECT emp_no
FROM employees.salaries
ORDER BY salary DESC
LIMIT 5 OFFSET 49;