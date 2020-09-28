-- cursor
-- set serveroutput on

declare
    v_last_name coders.last_name%type;
    v_hire_date coders.hire_date%type;
    cursor v_coder_cursor is
        select last_name, hire_date from coders;
begin
    open v_coder_cursor;
    loop
        fetch v_coder_cursor
        into v_last_name, v_hire_date;
        exit when v_coder_cursor%notfound;

        dbms_output.put_line('[' || v_last_name || ', ' || v_hire_date || ']');
    end loop;
    close v_coder_cursor;
end;
/
