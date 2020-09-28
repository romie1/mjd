-- table alias

alter session set current_schema = hr;

select r.region_name as "Region Name", c.country_name as country
from regions r, countries c
where r.region_id = c.region_id;
