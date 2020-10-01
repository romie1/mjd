alter session set current_schema = me;

create view programmers_view as
select first_name, last_name, email, phone_number from hr.employees
where job_id like 'IT_PROG';

select * from programmers_view;

