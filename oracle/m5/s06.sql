-- if ...
-- set serveroutput on

declare
    v_a integer := 1;
begin
    if v_a > 0 then
        dbms_output.put_line('v_a is positive');
    elsif v_a = 0 then
        dbms_output.put_line('v_a is zero');
    else
        dbms_output.put_line('v_a is negative');
    end if;
end;
/
