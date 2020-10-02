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
end;
/

-- Scrivere la procedura day_after_procedure() che ha parametri
-- Input: una data
-- Output: la data di domani
create or replace procedure day_after_procedure(
    p_day in date,
    p_next_day out date) is
begin
    p_next_day := p_day + 1;
end day_after_procedure;
/

declare
    v_day date := sysdate;
    v_next_day date;
begin
    day_after_procedure(v_day, v_next_day);
    dbms_output.put_line('The day after this date ' || v_day || ' is ' || v_next_day);
end;
/

-- Riscrivere la day_after_function() come funzione. data di domani è return
create or replace function get_after_function(
    p_day date)
    return date as
    v_next_day date;
begin
    return p_day + 1;
end get_after_function;
/

declare
    v_day date := sysdate;
    v_next_day date;
begin
    v_next_day := get_after_function(v_day);
    dbms_output.put_line('The day after this date ' || v_day || ' is ' || v_next_day);
end;
/
-- Scrivere la procedura get_coder_procedure() con parametri
-- Input: id di un coder
-- Output: nome e cognome associato
create or replace procedure get_coder_procedure(
    p_coder_id in coders.coder_id%type,
    p_first_name out coders.first_name%type,
    p_last_name out coders.last_name%type) is
begin
    select first_name, last_name
    into p_first_name, p_last_name
    from coders
    where coder_id = p_coder_id;
end get_coder_procedure;
/

declare
    v_coder_id coders.coder_id%type := 103;
    v_first_name coders.first_name%type;
    v_last_name coders.last_name%type;
begin
    get_coder_procedure(v_coder_id, v_first_name,v_last_name );
    dbms_output.put_line('First name: ' || v_first_name || ' - Last name: ' || v_last_name);
exception
    when others then
        dbms_output.put_line('Can''t get coder with id ' || v_coder_id);
end;
/

-- Riscrivere la get_coder() come funzione
create or replace function get_coder_function(
    p_coder_id coders.coder_id%type)
return varchar2 as
    v_first_last_name coders.first_name%type;
begin
    select first_name || ' ' || last_name
    into v_first_last_name
    from coders
    where coder_id = p_coder_id;
    return v_first_last_name;
end get_coder_function;
/

declare
    v_coder_id coders.coder_id%type := 103;
    v_first_last_name coders.first_name%type;
begin
    v_first_last_name := get_coder_function(v_coder_id);
    dbms_output.put_line('Coder with id ' || v_coder_id || ' has name ' || v_first_last_name);
exception
    when others then
        dbms_output.put_line('Can''t get coder with id ' || v_coder_id);
end;
/