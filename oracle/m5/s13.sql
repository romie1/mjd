-- execute procedure
-- set serveroutput on

declare
    v_id coders.coder_id%type := 105;
    v_salary coders.salary%type;
begin
    get_coder_salary(v_id, v_salary);
    dbms_output.put_line('Salary is ' || v_salary);
exception
    when others then
        dbms_output.put_line('Can''t get salary for ' || v_id);
end;
/
