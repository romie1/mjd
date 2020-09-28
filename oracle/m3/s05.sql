-- numeric functions

-- absolute value
select abs(10), abs(-10)
from dual;

-- the next integer up
select ceil(5.8), ceil(-5.2)
from dual;

-- the previous integer down
select floor(5.8), floor(-5.2)
from dual;

-- module
select mod(8, 3), mod(8, 4), mod(10.1, 3.2)
from dual;

-- power
select power(2, 1), power(2, 3)
from dual;

-- e raised to the power of
select exp(1)
from dual;

-- square root
select sqrt(25), sqrt(5)
from dual;

-- error!
select sqrt(-2)
from dual;

-- logarithms
select ln(exp(1))
from dual;

select log(10, 100)
from dual;

-- rounding
select round(5.75), round(5.75, 1), round(5.75, -1)
from dual;

-- truncating
select trunc(5.75, 0), trunc(5.75, 1), trunc(5.75, -1)
from dual;

-- check negative, zero, positive
select sign(-2.3), sign(0), sign(42)
from dual;

-- trigonometry
select sin(3.14159265359/6), cos(0), tan(3.14159265359/4)
from dual;
