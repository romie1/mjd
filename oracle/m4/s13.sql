-- index
alter session set current_schema = me;

-- index on a column
create index execs_last_name_ix on execs(last_name);

-- index on more columns
create index execs_name_ix on execs(first_name, last_name);

-- get rid of indices
drop index execs_last_name_ix;
drop index execs_name_ix;
