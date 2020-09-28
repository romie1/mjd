-- exceptions
-- set serveroutput on

begin
    dbms_output.put_line(6 / 0);
exception
    when zero_divide then
        dbms_output.put_line('Zero divide!');
end;
/

begin
    dbms_output.put_line(1 / 0);
exception
    when others then
        dbms_output.put_line('Exception!');
end;
/
