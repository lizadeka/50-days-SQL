use 50_days_sql;
-- Replaced NULL and empty values with appropriate defaults
update cleaned_employees
set emp_name = 'Unknown'
where emp_name is null or emp_name = '';

update cleaned_employees
set city="Delhi"
where emp_id = 13;

update cleaned_employees
set city = "Delhi NCR"
where city is null or city = '';

update cleaned_performance
set rating_2023 = 0
where rating_2023 = '';

-- find duplicate values

-- employees table
select emp_id, emp_name, city, count(*)
from cleaned_employees
group by emp_id, emp_name, city
having count(*) > 1;

-- attendance table
select attendance_id, emp_id, attendance_date, count(*)
from cleaned_attendance
group by attendance_id, emp_id, attendance_date
having count(*) > 1;

-- performance table
select emp_id, rating_2022, rating_2023, rating_2024, count(*)
from cleaned_performance
group by emp_id, rating_2022, rating_2023, rating_2024
having count(*) > 1;

-- salaries table
select salary_id, salary, count(*)
from cleaned_salaries
group by salary_id,salary
having count(*) > 1;

-- departments table
select dept_id, dept_name, count(*)
from cleaned_departments
group by dept_id, dept_name
having count(*) > 1;
