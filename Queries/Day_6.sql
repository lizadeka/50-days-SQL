use 50_days_sql;

-- modify table salaries
alter table cleaned_salaries
modify salary int;


-- detect outliers

select 
min(salary) as min_salary,
max(salary) as max_salary,
avg(salary) as avg_salary
from cleaned_salaries
where salary > 0;

-- ask client about the max salary and min salary to detect outliers
-- as per client, max salary is 200000 and min salary is 20000

alter table cleaned_salaries
add column is_outlier int;

-- fll is_outlier column

update cleaned_salaries
set is_outlier =
case when salary < 20000 or salary > 200000 then 1
else 0 
end;

select * from cleaned_salaries
where is_outlier = 1;

-- ask clients about the outliers and fix them

update cleaned_salaries
set salary = 65000
where salary_id = 17 and emp_id = 35;

update cleaned_salaries
set salary = 97000
where salary_id = 37 and emp_id = 262;