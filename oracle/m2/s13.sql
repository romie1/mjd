alter session set current_schema = hr;

-- right outer join
select first_name, last_name, department_name, department_id
from employees right outer join departments
using (department_id)
where department_id between 110 and 120;

-- full outer join (combinazione tra right e left)
select first_name, last_name, department_name, department_id
from employees full outer join departments
using (department_id)
where department_id between 110 and 120 or last_name = 'Grant';