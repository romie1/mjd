-- create table w/ constraints

alter session set current_schema = me;

create table details (
    detail_id integer,
    status char default 'A',
--	name varchar(20),
	name varchar(20) not null,
    exec_id integer,
    constraint details_pk primary key(detail_id),
    constraint detail_id_ck check (mod(detail_id, 2) = 1),
    constraint detail_status_ck check (status in ('A', 'B', 'X')),
    constraint details_coder_fk foreign key(exec_id) references execs(exec_id),
--    constraint details_coder_fk foreign key(exec_id) references execs(exec_id) on delete cascade,
--    constraint details_execs_fk foreign key(exec_id) references execs(exec_id) on delete set null,
    constraint details_name_status_uq unique(name, status)
);

-- drop table details;

select * from execs where exec_id = 412;

insert into execs values(412, 'Bill', 'Mates', sysdate, 1950);

insert into details(detail_id, name, exec_id) values(1, 'Alpha', 412);
insert into details(detail_id, name, exec_id) values(2, 'Alpha', 412);
insert into details(detail_id, name, exec_id) values(3, 'Beta', 412);
insert into details(detail_id, name) values(5, 'Alpha');
insert into details(detail_id) values(5);
insert into details(detail_id, status, name) values(7, 'X', 'Alpha');

select * from details;

delete from execs where exec_id = 412;

