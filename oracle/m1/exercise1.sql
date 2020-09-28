-- Tutti i dipendenti, ordinati per cognome e nome
SELECT last_name, first_name, email, phone_number, hire_date
FROM employees
ORDER BY last_name ASC, first_name ASC;

-- Chi ha nome David o Peter in(David,Peter)
SELECT  first_name, last_name, email, phone_number, hire_date
FROM employees
WHERE first_name LIKE 'David' OR first_name LIKE 'Peter'
ORDER BY first_name;

-- Chi appartiene al dipartimento 60
SELECT  first_name, last_name, email, phone_number, hire_date, department_id
FROM employees
WHERE department_id = 60;

-- Chi appartiene ai dipartimenti 30, 50
SELECT  first_name, last_name, email, phone_number, hire_date, department_id
FROM employees
WHERE department_id IN (30,50)
ORDER BY department_id;

-- Chi ha salario maggiore di 10000
SELECT  first_name, last_name, email, phone_number, hire_date, salary
FROM employees
WHERE salary > 10000
ORDER BY salary DESC;

-- Chi ha salario minore di 4000 o maggiore di 15000
SELECT  first_name, last_name, email, phone_number, hire_date, salary
FROM employees
WHERE salary < 4000 OR salary > 15000
ORDER BY salary DESC;

-- Chi ha salario minore di 4000 o maggiore di 15000, ma solo per i dipartimenti 50 e 80
SELECT  first_name, last_name, email, phone_number, hire_date, salary, department_id
FROM employees
WHERE 
    (salary < 4000 OR salary > 15000)
    AND
    (department_id IN (50,80))
ORDER BY salary DESC;
