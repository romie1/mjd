--Fattura 1 - n dettaglio fattura

-- table Fatture:
-- -PK surrogata (è un numero, non porta nessuna info)
-- -NR fattura unique
-- -date giorno di emissione
-- -varchar2 destinatario

-- table Dettaglio_fattura:
-- -PK surrogata
-- -varchar2 nome
-- -number(6,2) 
-- -FK fatture

-- create
-- insert
-- select join
-- verificare che non si possa avere due fatture con stesso NR
-- constraints

-- ER diagram

create table fatture (
    fattura_id integer,
    num_fattura integer,
    data_emissione date,
    destinatario varchar2(100),
    constraint fatture_pk primary key(fattura_id),
    constraint fatture_num_fattura_uq unique(num_fattura)
);

create table dettagli_fatture(
    dettaglio_fattura_id integer,
    nome_fattura varchar2(100),
    costo number(6,2),
    fattura_id integer,
    constraint dettagli_fatture_pk primary key(dettaglio_fattura_id),
    constraint dettagli_fatture_fk foreign key(fattura_id) references fatture(fattura_id) on delete cascade
);

drop table fatture;
drop table dettagli_fatture;

delete from fatture;
delete from dettagli_fatture;

select * from fatture;
select * from dettagli_fatture;
select * from fatture join dettagli_fatture using(fattura_id);

insert into fatture(fattura_id, num_fattura, data_emissione, destinatario) values(fattura_id_seq.nextval, 000000001, sysdate, 'Mario Bianchi');
UPDATE fatture SET num_fattura = 100000001 where fattura_id = 1;
insert into fatture values(fattura_id_seq.nextval, 100000002, sysdate, 'Marco rossi');
insert into fatture values(fattura_id_seq.nextval, 100000002, sysdate, 'Giovanni neri'); -- error, no doubled number fatture 
insert into fatture values(fattura_id_seq.nextval, 100000003, sysdate, 'Giovanni neri');

insert into dettagli_fatture values(dettaglio_fattura_id_seq.nextval, 'ciao', 1000.00 , 1);
insert into dettagli_fatture values(dettaglio_fattura_id_seq.nextval, 'ciao2', 1030.10 , 4);  
insert into dettagli_fatture values(dettaglio_fattura_id_seq.nextval, 'ciao3', 530.60 , 2);

UPDATE dettagli_fatture SET nome_fattura = 'books';

insert into dettagli_fatture values(4, 'videogames', 500.00 , 1);

-- alter table dettagli_fatture add constraint dettagli_num_fattura_uq unique(fattura_id);

create sequence fattura_id_seq start with 1 increment by 1;
create sequence dettaglio_fattura_id_seq start with 1 increment by 1;
drop sequence fattura_id_seq;
drop sequence dettaglio_fattura_id_seq;

select fattura_id_seq.currval from dual;

