-- subquery

alter session set current_schema = hr;

-- a) subquery in where:
-- Chen manager name
-- !!! risky !!!
select first_name, last_name
from employees
where employee_id = (
	select manager_id
	from employees
	where last_name = 'Chen');

-- safe version, using "in" and checking for null
select first_name, last_name
from employees
where employee_id in (
	select manager_id
	from employees
	where last_name = 'King' and manager_id is not null);

-- b) subquery in from:
-- get the top salary from the ones specified in the subquery
select max(salary)
from (
	select employee_id, salary
	from employees
	where employee_id between 112 and 115);

-- Let's see if (b) worked correctly
select employee_id, salary
from employees
where employee_id between 112 and 115
order by 2 desc;

-- c) subquery in having
-- c.1) average salaries for each department
select round(avg(salary))
from employees
group by department_id
order by 1 desc;

-- c.2) highest salary among the average salary for each department
select round(max(avg_sal)) from (
	select round(avg(salary)) avg_sal
	from employees
	group by department_id);

-- average salaries for each department, excluding the topmost one
select department_id, round(avg(salary))
from employees
group by department_id having avg(salary) < (
	select max(sal) from (
		select avg(salary) sal
		from employees
		group by department_id))
order by 2 desc;
