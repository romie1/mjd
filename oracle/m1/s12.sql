-- null

alter session set current_schema = hr;

-- check null
select first_name, last_name
from employees
where commission_pct is null;

-- null in operations
select first_name, last_name, 12 * salary * commission_pct
from employees;

-- what if null
select employee_id, last_name, 12 * salary * nvl(commission_pct, 0)
from employees;
