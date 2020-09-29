--Employees
-- Salary: maggiore, minore, somma, media
select max(salary) max, min(salary) min , sum(salary) sum, round(avg(salary),2) avg
from employees;

-- Salary: maggiore, minore, somma, media. Come sopra, ma per ogni job_id (GROUP BY)
select job_id, max(salary) max, min(salary) min , sum(salary) sum, round(avg(salary),2) avg
from employees
group by job_id;

-- Quanti dipendenti per ogni job_id
select job_id, count(rowid)
from employees
group by job_id
order by 2 desc;

-- Quanti sono gli IT_PROG
select job_id, count(rowid)
from employees
where job_id like 'IT_PROG'
group by job_id;

-- Quanti sono i manager
select count(distinct manager_id)
from employees
where manager_id is not null;

-- Nome dei dipendenti che non sono manager
select  first_name || ' ' || last_name AS Employee
from employees
where employee_id not in (
                    select distinct manager_id 
                    from employees 
                    where manager_id is not null);

-- Qual è la differenza tra il salario maggiore e il minore
select max(salary) Max ,min(salary) Min ,  max(salary) - min(salary) Difference
from employees;

-- Come sopra, ma per ogni job_id, non considerando dove non c’è differenza
select job_id, max(salary) Max ,min(salary) Min ,  max(salary) - min(salary) Difference
from employees
group by job_id
having max(salary) - min(salary) > 0;

-- Qual è il salario minimo(min(salary)) con i dipendenti raggruppati per manager (GROUP BY manager_id), non considerare chi non ha manager, né i gruppi con salario minimo inferiore a 6.000€
select manager_id, min(salary)
from employees
group by manager_id
having manager_id is not null and min(salary) > 6000;