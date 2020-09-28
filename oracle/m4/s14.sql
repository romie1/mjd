-- view
alter session set current_schema = me;

-- create view
create view odd_coders_view as
select * from coders
where mod(coder_id, 2) = 1;

select * from odd_coders_view;

-- get rid of a view
drop view odd_coders_view;
