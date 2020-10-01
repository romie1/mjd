-- select into
-- set serveroutput on

declare
    v_first_name coders.first_name%type;
    v_last_name coders.last_name%type;
begin
    select first_name, last_name
    into v_first_name, v_last_name
    from coders
    where coder_id = 103;
    
    dbms_output.put_line('[' || v_first_name || ' ' || v_last_name || ']');
end;
/

