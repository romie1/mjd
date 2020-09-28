-- conversion

select to_char(12345.67), to_char(12345.67, '99,999.999'), to_char(12345.67, '9.9')
from dual;

-- not fitting -> ####
select to_char(12345.67, '9.9')
from dual;

select to_char(2020, 'RN'), to_number('970,13') * 2
from dual;

-- from string to date, then increase
select cast('05-APR-20' as date) + 2
from dual;

-- cast to NUMBER following its rules, rounding when required
select cast(12345.678 as number(10,2))
from dual;

-- not fitting -> error
select cast(12345.678 as number(4))
from dual;
