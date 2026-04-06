use 50_days_sql;

-- remove month(invalid) > 12
-- 25-08-2022 = 25-08 = 08
update cleaned_employees
set hire_date = null
where
cast( substring_index(substring_index(hire_date, '-', 2), '-', -1) as unsigned) > 12;

-- convert dd-mm-yyyy to yyyy-mm-dd

update cleaned_employees
set hire_date = concat(right(hire_date,4) , '-' , substring(hire_date, 4, 2), '-', left(hire_date, 2))
where hire_date like '__-__-____';

-- remove invalid dates

update cleaned_employees
set hire_date = null
where cast (right(hire_date,2) as unsigned) > 31;

-- change the datatype

alter table cleaned_employees
modify hire_date date;

select distinct hire_date from cleaned_employees;

-- replace null and empty values with '2024-02-25'

update cleaned_employees
set hire_date = '2024-02-25'
where hire_date is null;

-- fix salary_date

update cleaned_salaries
set salary_date = null
where
cast( substring_index(substring_index(salary_date, '-', 2), '-', -1) as unsigned) > 12;

update cleaned_salaries
set salary_date = concat(right(salary_date,4) , '-' , substring(salary_date, 4, 2), '-', left(salary_date, 2))
where salary_date like '__-__-____';

update cleaned_salaries
set salary_date = null
where cast (right(salary_date,2) as unsigned) > 31;

alter table cleaned_salaries
modify salary_date date;

select distinct salary_date from cleaned_salaries;

update cleaned_salaries
set salary_date = '2024-02-05'
where salary_date is null;

-- fix attendance_date

update cleaned_attendance
set attendance_date = null
where
cast( substring_index(substring_index(attendance_date, '-', 2), '-', -1) as unsigned) > 12;

update cleaned_attendance
set attendance_date = concat(right(attendance_date,4) , '-' , substring(attendance_date, 4, 2), '-', left(attendance_date, 2))
where attendance_date like '__-__-____';

update cleaned_attendance
set attendance_date = null
where cast (right(attendance_date,2) as unsigned) > 31;

alter table cleaned_attendance
modify attendance_date date;

select distinct attendance_date from cleaned_attendance;

update cleaned_attendance
set attendance_date = '2024-02-05'
where attendance_date is null;