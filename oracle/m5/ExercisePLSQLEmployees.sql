--passare un job_id e deve ritornare il salario medio per quei employees di quel job_id
-- set serveroutput on

-- CREATE PROCEDURE
create or replace procedure get_avg_salary(
    p_job_id in employees.job_id%type,
    p_avg_salary out employees.salary%type) is
begin
    select avg(salary)
    into  p_avg_salary
    from employees
    where job_id =  p_job_id;
end get_avg_salary;
/

-- EXECUTE PROCEDURE
declare
    v_job_id employees.job_id%type := 'ST_CLERK';
    v_avg_salary employees.salary%type;
begin
    get_avg_salary(v_job_id, v_avg_salary);
    dbms_output.put_line('Average salary for ' || v_job_id || ' is ' || v_avg_salary);
exception
    when others then
        dbms_output.put_line('Can''t get average salary for ' || v_job_id);
end;
/

-- scrivere una funzione con parametro di input manager_id e come return il salary integer. per ogni manager_id, trovare il salario più alto employee
-- CREATE FUNCTION
create or replace function get_higher_salary(
    p_manager_id in employees.manager_id%type)
return integer as
    v_higher_salary employees.salary%type;
begin
    select max(salary)
    into v_higher_salary
    from employees
    where manager_id= p_manager_id;
    return v_higher_salary;
end get_higher_salary;
/

-- EXECUTE FUNCTION
declare
    v_id employees.manager_id%type := 100;
    v_salary employees.salary%type;
begin
    v_salary := get_higher_salary(v_id);
    if v_salary is not null then
        dbms_output.put_line('For Manager id ' || v_id || ', the higher salary is ' || v_salary);
    else
        dbms_output.put_line('Can''t get higher salary for Manager id ' || v_id);
    end if;
end;
/
