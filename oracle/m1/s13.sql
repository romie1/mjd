-- comparison operators /1

alter session set current_schema = hr;

-- that one
select *
from regions
where region_id = 1;

-- the other ones
select *
from regions
where region_id != 2;

-- strictly less than
select *
from regions
where region_id < 3;

-- less or equal to
select *
from regions
where region_id <= 3;

-- more than at least one of the values specified
select *
from regions
where region_id > any(1, 2, 3);

-- more than each one of the values specified
select *
from regions
where region_id > all(1, 2, 3);
