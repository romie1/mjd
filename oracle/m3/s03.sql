-- string function

alter session set current_schema = me;

-- char and its representation
select ascii('A') as A, chr(90) as "90"
from dual;

-- string concatenation
select concat(first_name, last_name) "fullname"
from coders;

-- string concatenation with operator ||
select first_name || ' ' || last_name "fullname"
from coders;

-- capitalized, upper and lower case
select initcap('a new thing') as initcap, lower('NEW') low, upper('old') up
from dual;

-- find substring

-- not found -> 0
select instr('crab', 'ba') as "not found"
from dual;

-- found -> position in [1, n]
select instr('crab abba rabid cab', 'ab') as pos
from dual;

-- search from given position
select instr('crab abba rabid cab', 'ab', 4) as pos
from dual;

-- search from given position the nth occurrence
select instr('crab abba rabid cab', 'ab', 4, 3) as pos
from dual;

-- search cypher in a number
select first_name, salary, instr(salary, '2') as "2 position in salary"
from coders;

-- string size (with implicit conversion)
select length('name'), length(42000), length(-42000.23)
from dual;
