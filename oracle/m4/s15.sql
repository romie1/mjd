-- sequence

alter session set current_schema = me;

-- create 
create sequence my_seq;

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
