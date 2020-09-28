-- while / for
-- set serveroutput on

declare
    v_x integer;
begin
	-- while loop
	v_x := 0;
	while v_x < 5 loop
		dbms_output.put_line('while: v_x = ' || v_x);
	    v_x := v_x + 1;
	end loop;

	-- for loop
	for i in 1..5 loop
	    dbms_output.put_line('for loop: ' || i);
	end loop;

	-- for loop reverse
	for i in reverse 1..5 loop
	    dbms_output.put_line('reverse: ' || i);
	end loop;	
end;
/
