-- transactions

alter session set current_schema = me;

insert into clients (client_id, name)
values (31, 'Mordor');

savepoint sp;

insert into clients (client_id, name)
values (32, 'Rohan');

rollback to sp; -- keep Mordor, rollback Rohan

-- persist Mordor
commit;

select *
from clients;

delete from clients where client_id > 10;