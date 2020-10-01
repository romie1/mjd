-- set serveroutput on
-- Fatture

declare
    v_num_fattura fatture.num_fattura%type;
    v_data_emissione fatture.data_emissione%type;
    v_destinatario fatture.destinatario%type;
begin
    select num_fattura, data_emissione, destinatario
    into v_num_fattura, v_data_emissione, v_destinatario
    from me.fatture
    where fattura_id = 4;
    dbms_output.put_line('Numero fattura: ' || v_num_fattura || ' - Data emissione: ' || v_data_emissione|| ' - Destinatario: ' || v_destinatario);
end;
/

declare
    cursor v_fatture_cursor is
        select num_fattura, destinatario from fatture;
begin
    for v_cur in v_fatture_cursor loop
        dbms_output.put_line('Numero fattura: ' || v_cur.num_fattura || ' - Destinatario: ' || v_cur.destinatario);
    end loop;
end;
/

declare
    cursor v_fatture_cursor is
        select num_fattura, destinatario, costo from fatture join dettagli_fatture using(fattura_id);
begin
    for v_cur in v_fatture_cursor loop
        dbms_output.put_line('Numero fattura: ' || v_cur.num_fattura || ' - Destinatario: ' || v_cur.destinatario ||  ' - Costo: ' || v_cur.costo);
    end loop;
end;
/

-- CREATE PROCEDURE
create or replace procedure get_fattura_costo(
    p_fattura_id in dettagli_fatture.fattura_id%type,
    p_costo out dettagli_fatture.costo%type) is
begin
    select costo
    into p_costo
    from dettagli_fatture
    where fattura_id = p_fattura_id;
end get_fattura_costo;
/

-- EXECUTE PROCEDURE
declare
    v_id dettagli_fatture.fattura_id%type := 4;
    v_costo dettagli_fatture.costo%type;
begin
    get_fattura_costo(v_id, v_costo);
    dbms_output.put_line('Il costo è ' || v_costo);
exception
    when others then
        dbms_output.put_line('Can''t get cost for ' || v_id);
end;
/
