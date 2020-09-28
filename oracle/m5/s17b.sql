-- trigger

create or replace trigger salary_update
before update of salary on coders
for each row
begin
    insert into coder_salaries values(
        :old.coder_id, :old.salary, :new.salary);
end salary_update;
/
