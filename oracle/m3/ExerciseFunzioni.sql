-- Qual è il salario corrente, quale sarebbe con un incremento dell’8.5%, qual è il delta come valore assoluto
select  E.first_name || ' ' || E.last_name AS Employee, E.salary, 
        E.salary * (1.085) AS "Increased Salary", abs(E.salary * (1.085) - E.salary) AS Delta 
from employees E;

-- Quanti giorni sono passati dall’assunzione a oggi
select  E.first_name || ' ' || E.last_name AS Employee, 
        to_date(sysdate, 'DD-MON-YY')-to_date(E.Hire_date, 'DD-MON-YY') datediff 
from employees E;

-- Quant’è la commissione di ognuno o ‘no value’
select E.first_name || ' ' || E.last_name AS Employee, NVL2(E.commission_pct, TO_CHAR(E.salary*E.commission_pct), 'no value') 
from employees E;