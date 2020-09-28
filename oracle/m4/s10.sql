-- alter table

alter session set current_schema = me;

select * from items;

-- add/drop column from table
alter table items add counter decimal(38, 0);
alter table items drop column counter;

-- add check
alter table items add constraint items_status_ck check(status in ('A', 'B', 'X'));

-- this insert violates the check constraint
insert into items values(13, 'Y', 'ciao', 13);

-- this one is OK
insert into items (item_id, status) values(43, 'X');

-- violation, again
update items set status = '?';

-- drop check
alter table items drop constraint items_status_ck;

-- table cleanup
delete from items;

--
select * from execs;

-- add unique
alter table execs add constraint execs_name_uq unique(first_name, last_name);

-- unique constraint (ME.EXECUTIVES_NAME_UQ) violated
insert into execs values(1101, 'Neena', 'Kochhar', sysdate, 15000.00);

-- add pk
alter table execs modify exec_id number(6) primary key;

-- drop pk
-- alter table execs drop primary key;
