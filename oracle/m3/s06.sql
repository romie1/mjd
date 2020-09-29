-- date functions

select add_months(sysdate, 3), months_between(sysdate, '01-FEB-2021')
from dual;

select last_day(sysdate), next_day(sysdate, 'mon')
from dual;

select round(sysdate, 'year'), round(sysdate, 'month')
from dual;

select trunc(sysdate, 'year'), trunc(sysdate, 'month')
from dual;

select sysdate
from dual;

