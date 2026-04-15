use 50_days_sql;

-- Total salary per employee

select e.emp_id, e.emp_name, sum(s.salary) as total_salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
group by e.emp_id, e.emp_name;

-- Average salary per employee

select e.emp_id, e.emp_name, avg(s.salary) as average_salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
group by e.emp_id, e.emp_name;

-- Count of salary records for each employee

select e.emp_id, e.emp_name, count(s.salary) as salary_records
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
group by e.emp_id, e.emp_name;

-- Maximum salary for each employee

select e.emp_id, e.emp_name, max(s.salary) as max_salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
group by e.emp_id, e.emp_name;