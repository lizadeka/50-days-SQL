use 50_days_sql;

-- Find the employees with more than 2 salary records

select e.emp_id, e.emp_name, count(s.salary) as salary_records
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
group by e.emp_id, e.emp_name
having count(s.salary) > 2;

-- Department with more than 3 employees

select d.dept_id, d.dept_name, count(e.emp_id) as employee_count
from cleaned_departments d
join cleaned_employees e on d.dept_id = e.dept_id
group by d.dept_id, d.dept_name
having count(e.emp_id) > 3;

-- Employee with total salary greater than 100000

select e.emp_id, e.emp_name, sum(s.salary) as total_salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
group by e.emp_id, e.emp_name
having sum(s.salary) > 100000;

-- Department with high average salary (>50000)

select d.dept_id, d.dept_name, avg(s.salary) as average_salary
from cleaned_departments d
join cleaned_employees e on d.dept_id = e.dept_id
join cleaned_salaries s on e.emp_id = s.emp_id
group by d.dept_id, d.dept_name
having avg(s.salary) > 50000;