-- Employees
-- Chi è stato assunto nel 2005
SELECT last_name, first_name, email, phone_number, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM TO_DATE(hire_date, 'DD-MON-YY'))= 2005
ORDER BY hire_date;

SELECT last_name, first_name, email, phone_number, hire_date
FROM employees
WHERE hire_date LIKE '%-05'
ORDER BY hire_date;

-- Quali job_id sono presenti, in ordine naturale
SELECT DISTINCT job_id
FROM employees
ORDER BY job_id ASC;

-- Chi ha una commissione
SELECT last_name, first_name, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

-- Chi ha una ‘a’ nel nome o cognome
SELECT last_name, first_name, email, phone_number
FROM employees
WHERE first_name LIKE '%a%' OR last_name LIKE '%a%'
order by last_name;

-- Departments
-- Nomi, in ordine naturale
SELECT department_name
FROM departments
ORDER BY department_name ASC; --order by 1;

-- Locations
-- Indirizzi delle sedi italiane
SELECT street_address, city, country_id
FROM locations
WHERE country_id = 'IT';