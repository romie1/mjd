-- run this as root

drop user me cascade;

create user me identified by password account unlock;
grant connect, resource to me;
grant create view to me;
grant select on hr.employees to me;

alter user me quota unlimited on users;
