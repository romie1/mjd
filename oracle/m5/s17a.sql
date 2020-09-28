-- table for trigger
alter session set current_schema = me;

create table coder_salaries (
    coder_id number(6, 0)
    	references coders(coder_id),
    old_salary number(8, 2),
    new_salary number(8, 2)
);
