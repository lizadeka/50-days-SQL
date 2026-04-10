use 50_days_sql;

-- employee name, department  and performance rating together

select e.emp_name, d.dept_name, p.rating_2022, p.rating_2023, p.rating_2024
from cleaned_employees e
join cleaned_departments d
on e.dept_id = d.dept_id
join cleaned_performance p
on p.emp_id = e.emp_id;

-- complete profile of each employee

select e.emp_name, d.dept_name, 
s.salary, p.rating_2022, 
p.rating_2023, p.rating_2024
from cleaned_employees e
left join cleaned_departments d
on e.dept_id = d.dept_id
left join cleaned_salaries s
on s.emp_id = e.emp_id
join cleaned_performance p
on p.emp_id = e.emp_id;

-- how many salary records are there for each employee?

select e.emp_id, e.emp_name, count(s.salary) as total_salary_records
from cleaned_employees e
left join cleaned_salaries s
on s.emp_id = e.emp_id
group by e.emp_id, e.emp_name;

-- total salary paid to each employee

select e.emp_id, e.emp_name, sum(s.salary) as total_salary_paid
from cleaned_employees e
left join cleaned_salaries s
on s.emp_id = e.emp_id
group by e.emp_id, e.emp_name;
