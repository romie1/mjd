-- date functions

select add_months(sysdate, 3), months_between(sysdate, '01-FEB-2019')
from dual;

select last_day(sysdate), next_day(sysdate, 'lun')
from dual;

select round(sysdate, 'year'), round(sysdate, 'month')
from dual;

select trunc(sysdate, 'year'), trunc(sysdate, 'month')
from dual;
