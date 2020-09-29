-- group by

alter session set current_schema = hr;

-- average salary for each department
select department_name, round(avg(salary), 0) as "avg salary"
from employees join departments using(department_id)
group by department_name
order by 1;

select department_id, round(avg(salary), 0) as "avg salary"
from employees
where department_id is not null
group by department_id
order by 2 desc;
