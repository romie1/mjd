-- regex

alter session set current_schema = hr;

-- plain LIKE
select last_name
from employees
where last_name like 'A%' or last_name like 'E%';

-- LIKE with regular expression
-- seleziono i nomi che iniziano con A e E
select last_name
from employees
where regexp_like(last_name, '^[AE].*');

select last_name
from employees
where regexp_like(last_name, '.*[nt]$');
