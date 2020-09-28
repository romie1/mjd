-- Nome degli employees e del loro department
SELECT E.last_name || ' ' || E.first_name AS employee, D.department_name AS department
FROM employees E JOIN departments D 
USING(department_id)
ORDER BY E.last_name;

-- Nome degli employees e job title (da JOBS)
SELECT E.last_name || ' ' || E.first_name AS employee, j.job_title AS "job title"
FROM employees E JOIN jobs j 
USING(job_id)
ORDER BY E.last_name;

-- Nome degli employees che hanno il salario minimo o massimo previsto per il loro job title
SELECT E.last_name || ' ' || E.first_name AS employee, E.salary ,j.job_title, j.min_salary, j.max_salary
FROM employees E JOIN jobs j 
USING(job_id)
WHERE E.salary IN (j.min_salary, j.max_salary);

-- Nome degli employees basati in UK (LOCATIONS)
SELECT E.last_name || ' ' || E.first_name AS employee, L.country_id AS country
FROM employees E JOIN departments D USING (department_id)
                 JOIN locations L USING (location_id)
WHERE L.country_id = 'UK';

-- Nome dei departments e manager associato
SELECT DISTINCT D.department_name AS department, M.first_name || ' ' || M.last_name AS MANAGER
FROM departments D  JOIN employees E ON D.manager_id = E.manager_id
                    JOIN employees M ON E.manager_id = M.employee_id
ORDER BY D.department_name;

-- Nome di ogni department e, se esiste, del relativo manager
SELECT DISTINCT D.department_name AS department, M.first_name || ' ' || M.last_name AS MANAGER
FROM departments D  LEFT OUTER JOIN employees E ON D.manager_id = E.manager_id
                    LEFT OUTER JOIN employees M ON E.manager_id = M.employee_id
ORDER BY D.department_name;

-- Nome dei department che non hanno un manager associato
SELECT DISTINCT D.department_name AS department
FROM departments D  
WHERE D.manager_id IS NULL
ORDER BY D.department_name;

-- Nome degli employees e del loro manager
SELECT E.last_name || ' ' || E.first_name AS employee,  M.first_name || ' ' || M.last_name AS MANAGER
FROM employees E JOIN employees M
ON E.manager_id = M.employee_id
ORDER BY E.last_name;