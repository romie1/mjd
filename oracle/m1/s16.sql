-- order by

alter session set current_schema = hr;

-- sorting in natural order
select *
from employees
order by last_name;

-- descending
select first_name, last_name, salary
from employees
order by salary desc;

-- 
select *
from employees
order by last_name desc, first_name asc;

-- positional notation, by 2 per last_name
select first_name, last_name
from employees
order by 2;
