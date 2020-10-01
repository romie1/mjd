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
    v_job_id employees.job_id%type := 'IT_PROG';
    v_avg_salary employees.salary%type;
begin
    get_avg_salary(v_job_id, v_avg_salary);
    dbms_output.put_line('Average salary for ' || v_job_id || ' is ' || v_avg_salary);
exception
    when others then
        dbms_output.put_line('Can''t get average salary for ' || v_job_id);
end;
/
