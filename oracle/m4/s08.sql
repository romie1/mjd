-- create table

alter session set current_schema = me;

create table items (
    item_id integer primary key,
    status char,
    name varchar(20),
    coder_id integer);

select * from items;

insert into items (item_id)
values (23);

update items
set status = 'x'
where item_id = 12;

delete from items;
