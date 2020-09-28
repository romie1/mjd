-- sequence /2

alter session set current_schema = me;

-- create with a given setting
create sequence my_seq start with 201 increment by 2;

insert into execs
values(my_seq.nextval, 'Bertrand', 'Meyer', SYSDATE, 20000);

select *
from execs;

-- info on sequences
select *
from user_sequences;

-- get rid of it
drop sequence my_seq;
