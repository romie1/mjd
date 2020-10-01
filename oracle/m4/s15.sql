-- sequence

alter session set current_schema = me;

-- create 
create sequence my_seq;
create sequence execs_seq start with 200 increment by 1;
drop sequence execs_seq;

select * from execs;

insert into execs(exec_id, first_name, last_name, hire_date, salary)
values(execs_seq.nextval, 'Tommy', 'Brady', sysdate, 1000);

delete from execs where exec_id = 1;

-- next value
select my_seq.nextval
from dual;

-- current value, no increase
-- can't be used before first time nextval is used
select my_seq.currval
from dual;

-- change sequence setting
alter sequence my_seq increment by 2;

-- get rid of it
drop sequence my_seq;
