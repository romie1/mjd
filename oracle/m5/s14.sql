-- create function
-- set serveroutput on

create or replace function get_salary(
    p_coder_id in coders.coder_id%type)
return number as
    v_salary coders.salary%type;
begin
    select salary
    into v_salary from coders
    where coder_id = p_coder_id;
    return v_salary;
end get_salary;
/

-- drop function get_salary;
