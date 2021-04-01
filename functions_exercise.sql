use employees;

-- ---------------- Part One --------------------------------

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY last_name;

SELECT *
FROM employees
WHERE last_name LIKE '%q%';

-- ---------------- Part Two --------------------------------

SELECT *
FROM employees
WHERE first_name = 'Irena'
   OR first_name = 'Vidya'
   OR first_name = 'Maya';

SELECT *
FROM employees
WHERE gender = 'M'
  AND (
        first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya'
    );

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%E'
ORDER BY last_name;

-- TODO: Use concat() to combine their first and last name together as a single column in your results.
SELECT CONCAT(first_name, ' ', last_name) AS concat_names
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E'
ORDER BY last_name;

SELECT *
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%';


-- TODO: Find all employees born on Christmas — 842 rows.
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS born_on_christmas
FROM employees
WHERE month(birth_date) = 12
  AND day(birth_date) = 25;


-- TODO: Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT *, DATEDIFF(CURDATE(), hire_date) AS 'Days Worked'
FROM employees
WHERE year(hire_date) BETWEEN 1990 AND 1999
  AND month(birth_date) = 12
  AND day(birth_date) = 25;


-- TODO: Change the query for employees hired in the 90s and born on Christmas
-- such that the first result is the oldest employee who was hired last.
-- It should be Khun Bernini.
SELECT *
FROM employees
WHERE year(hire_date) BETWEEN 1990 AND 1999
  AND month(birth_date) = 12
  AND day(birth_date) = 25
ORDER BY birth_date, hire_date DESC;


SELECT COUNT(gender), gender
FROM employees
WHERE first_name = 'Irena'
GROUP BY gender;