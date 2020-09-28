-- join on

alter session set current_schema = hr;

-- join-on, more flexible
select region_name, country_name
from regions r join countries c
on r.region_id = c.region_id;
