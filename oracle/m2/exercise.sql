-- Nome degli employees e del loro department
SELECT E.first_name || ' ' || E.last_name AS Employee, D.department_name AS Department
FROM employees E JOIN departments D 
USING(department_id)
ORDER BY E.first_name;

SELECT E.first_name || ' ' || E.last_name AS Employee, D.department_name AS Department
FROM employees E LEFT OUTER JOIN departments D 
USING(department_id)
ORDER BY E.first_name;

-- Nome degli employees e job title (da JOBS)
SELECT E.first_name || ' ' || E.last_name AS Employee, J.job_title AS "Job Title"
FROM employees E JOIN jobs J 
USING(job_id)
ORDER BY E.first_name;

SELECT E.first_name || ' ' || E.last_name AS Employee, J.job_title AS "Job Title"
FROM employees E FULL JOIN jobs J 
USING(job_id)
ORDER BY E.first_name;

-- Nome degli employees che hanno il salario minimo o massimo previsto per il loro job title
SELECT E.first_name || ' ' || E.last_name AS Employee, E.salary ,J.job_title, J.min_salary MIN, J.max_salary MAX
FROM employees E JOIN jobs J 
USING(job_id)
WHERE E.salary IN (J.min_salary, J.max_salary)
ORDER BY E.first_name;

SELECT E.first_name || ' ' || E.last_name AS Employee, E.salary ,J.job_title, J.min_salary MIN, J.max_salary MAX
FROM employees E FULL JOIN jobs J 
USING(job_id)
WHERE E.salary IN (J.min_salary, J.max_salary)
ORDER BY E.first_name;

-- Nome degli employees basati in UK (LOCATIONS)
SELECT E.first_name || ' ' || E.last_name AS Employee, L.country_id AS country
FROM employees E JOIN departments D USING (department_id)
                 JOIN locations L USING (location_id)
WHERE L.country_id = 'UK'
ORDER BY E.first_name;

SELECT E.first_name || ' ' || E.last_name AS Employee, L.country_id AS country
FROM employees E RIGHT OUTER JOIN departments D USING (department_id)
                 RIGHT OUTER JOIN locations L USING (location_id)
WHERE L.country_id = 'UK'
ORDER BY E.first_name;

-- Nome dei departments e manager associato
SELECT D.department_name AS Department, M.first_name || ' ' || M.last_name AS Manager
FROM departments D  JOIN employees M ON D.manager_id = M.employee_id
ORDER BY D.department_name;

SELECT D.department_name AS Department, M.first_name || ' ' || M.last_name AS Manager
FROM departments D  RIGHT OUTER JOIN employees M ON D.manager_id = M.employee_id
ORDER BY D.department_name;

SELECT DISTINCT D.department_name AS Department, M.first_name || ' ' || M.last_name AS Manager
FROM departments D  FULL OUTER JOIN employees M ON D.manager_id = M.employee_id
ORDER BY D.department_name;

-- Nome di ogni department e, se esiste, del relativo manager
SELECT D.department_name AS Department, M.first_name || ' ' || M.last_name AS Manager
FROM departments D  LEFT OUTER JOIN employees M ON D.manager_id = M.employee_id
ORDER BY D.department_name;

-- Nome dei department che non hanno un manager associato
SELECT D.department_name AS Department
FROM departments D 
WHERE D.manager_id IS NULL
ORDER BY D.department_name;

-- Nome degli employees e del loro manager
SELECT E.first_name || ' ' || E.last_name AS Employee,  M.first_name || ' ' || M.last_name AS Manager
FROM employees E JOIN employees M
ON E.manager_id = M.employee_id
ORDER BY E.first_name;
