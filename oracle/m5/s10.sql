-- cursor - for
-- set serveroutput on

declare
    cursor v_coder_cursor is
        select last_name, hire_date from coders;
begin
    for v_cur in v_coder_cursor loop
        dbms_output.put_line('[' || v_cur.last_name || ', ' || v_cur.hire_date || ']');
    end loop;
end;
/

select last_name, hire_date from coders;