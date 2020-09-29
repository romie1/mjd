-- string / null function

alter session set current_schema = hr;

-- left and right padding
select lpad('tom', 30, '.') tom, rpad('tim', 30, '_- -_') tim
from dual;

-- left, right, both trim
select ltrim(' Hi!'), rtrim('Hi!abab', 'ab'), trim('0' from '00Hi!000')
from dual;

-- replace
select replace('Begin here', 'Begin', 'End') replaced
from dual;

-- substring, parti dall'indice 3 e prendi 4 caratteri
select substr('ABCDEFG',3,4) sub
from dual;

-- a value, defaulted
select employee_id, nvl(commission_pct, 0)
from employees;

-- value chosen by null check
select employee_id, nvl2(commission_pct, 'value', 'no value')
from employees;
