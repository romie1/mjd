-- Indirizzi completi, tra locations e countries
select L.street_address, C.country_name
from locations L join countries C using(country_id);

--Employees
-- Nome di tutti i dipendenti e nome del loro department
SELECT E.first_name || ' ' || E.last_name AS Employee, D.department_name AS Department
FROM employees E JOIN departments D 
USING(department_id)
ORDER BY E.first_name;

-- Come sopra, ma solo per chi è basato a Toronto
SELECT E.first_name || ' ' || E.last_name AS Employee, D.department_name AS Department, L.city
FROM employees E JOIN departments D USING(department_id)
                 JOIN locations L USING(location_id)
WHERE L.city like 'Toronto'
ORDER BY E.first_name;

-- Chi è stato assunto dopo David Lee
select  first_name || ' ' || last_name AS Employee, hire_date
from employees
where hire_date > (
                    select hire_date
                    from employees
                    where first_name like 'David' and last_name like 'Lee');

-- Chi è stato assunto prima del proprio manager
select  E.first_name || ' ' || E.last_name AS Employee, E.hire_date, 
        M.first_name || ' ' || M.last_name AS Manager, M.hire_date
from employees E join employees M on E.manager_id = M.employee_id
where E.hire_date > M.hire_date;

-- Chi ha lo stesso manager di Lisa Ozer
select  first_name || ' ' || last_name AS Employee, manager_id
from employees
where manager_id in (
                        select manager_id
                        from employees
                        where first_name like 'Lisa' and last_name like 'Ozer');

-- Chi lavora in un department in cui c’è almeno un employee con una ‘u’ nel cognome
select  first_name || ' ' || last_name AS Employee, department_id
from employees
where department_id in (
                        select department_id 
                        from employees 
                        where regexp_like(last_name, '[uU]')
                        group by department_id);

-- Chi lavora nel department Shipping
select  E.first_name || ' ' || E.last_name AS Employee, D.department_name
from employees E join departments D using(department_id)
where D.department_name like 'Shipping';

-- Chi ha come manager Steven King
select  first_name || ' ' || last_name AS Employee
from employees
where manager_id = (
                    select employee_id 
                    from employees 
                    where first_name like 'Steven' and last_name like 'King');
                    