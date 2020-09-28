-- insert

alter session set current_schema = me;

select * from clients;

-- plain insert
insert into clients (client_id, name)
values (20, 'Mordor');

-- nullable / defaulted column could be skipped
insert into clients (client_id)
values (21);

-- insert relying on column definition on table
insert into clients
values (22, 'Rohan');

commit;