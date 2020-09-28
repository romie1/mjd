-- loop
-- set serveroutput on

declare
    v_x integer;
begin
	-- loop w/ if then exit
    v_x := 0;
    
	loop
	    v_x := v_x + 1;
	    if v_x = 3 then exit;
	    end if;
	end loop;

	dbms_output.put_line('a) v_x = ' || v_x);
		
	-- loop w/ exit when
	v_x := 0;
	loop
	    v_x := v_x + 1;
	    exit when v_x = 5;
	end loop;

	dbms_output.put_line('b) v_x = ' || v_x);

	-- loop w/ continue
	v_x := 0;
	loop
	    v_x := v_x + 1;
	    if v_x = 3 then
	        continue;
	    end if;
		dbms_output.put_line('c) v_x = ' || v_x);
	    exit when v_x = 5;
	end loop;
	
	v_x := 0;
	loop
	    v_x := v_x + 1;
	    continue when v_x = 3;
	
		dbms_output.put_line('d) v_x = ' || v_x);
	    exit when v_x = 5;
	end loop;
end;
/
