-- triggering update
alter session set current_schema = me;

update coders
set salary = salary * 1.3
where coder_id > 103;

select * from coder_salaries;
