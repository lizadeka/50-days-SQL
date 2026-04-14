use 50_days_sql;

-- Find employees with salary record or they got paid atleast once(using exist and subquery)

select e.emp_id, e.emp_name
from cleaned_employees e
where exists 
(select 1 from cleaned_salaries s 
where s.emp_id = e.emp_id);

-- Find employees with no salary record or they never got paid atleast once(using not exist and subquery)

select e.emp_id, e.emp_name
from cleaned_employees e
where not exists
(select 1 from cleaned_salaries s 
where s.emp_id = e.emp_id);

-- Find employees with attendance record or they attended atleast once(using exist and subquery)

select e.emp_id, e.emp_name
from cleaned_employees e
where exists
(select 1 from cleaned_attendance a 
where a.emp_id = e.emp_id);

-- Find employees with no attendance record or they never attended atleast once(using not exist and subquery)

select e.emp_id, e.emp_name
from cleaned_employees e
where not exists
(select 1 from cleaned_attendance a 
where a.emp_id = e.emp_id);