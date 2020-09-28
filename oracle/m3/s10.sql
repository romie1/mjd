-- aggregate functions

alter session set current_schema = hr;

-- count, count distinct
select count(*), count(ROWID), count(ROWNUM)
from employees;

-- beware of null
select count(manager_id)
from employees;

-- distinct values
select count(distinct manager_id)
from employees;

-- max, min
select max(salary), min(salary)
from employees;

-- sum
select sum(salary)
from employees
where department_id = 50;

-- average
select avg(salary)
from employees
where department_id = 50;

-- standard deviation, variance, median
select stddev(salary), variance(salary), median(salary)
from employees;

-- who has the most common salary
select first_name, last_name
from employees
where salary = (select median(salary) from employees);
