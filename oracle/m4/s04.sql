-- delete

alter session set current_schema = me;

-- check the current status
select * from clients;

-- create a test row
insert into clients (client_id, name)
values (42, 'Z');

-- delete a single row
delete from clients
where client_id = 42;

-- multiline delete - careful here!
delete from clients
where client_id > 10;
