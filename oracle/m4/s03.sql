-- update

alter session set current_schema = me;

-- updating more rows
update clients
set name = 'Client ' || client_id
where client_id > 10;

-- updating more columns
update coders
set first_name = 'Timmy', last_name = 'Eyes'
where coder_id = 108;
