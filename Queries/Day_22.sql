use 50_days_sql;

-- Department avg salary (each employee with avg salary of their department)

select e.emp_id, e.dept_id, s.salary,
       avg(s.salary) over(partition by e.dept_id) as dept_avg_salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id;

-- Total salary of each department(emp_id, dept_id, salary)

select e.emp_id, e.dept_id, s.salary,
       sum(s.salary) over(partition by e.dept_id) as dept_total_salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id;

-- Average performance of each department (emp_id, dept_id)

select e.emp_id, e.dept_id,
(rating_2022 + rating_2023 + rating_2024) / 3 as avg_rating,
avg((rating_2022 + rating_2023 + rating_2024) / 3) over(partition by e.dept_id) as dept_avg_rating
from cleaned_employees e
join cleaned_performance p on e.emp_id = p.emp_id;