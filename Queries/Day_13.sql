use 50_days_sql;

-- Find the employees who earn more than the average salary of all employees.

select e.emp_id, e.emp_name, s.salary
from cleaned_employees e
join cleaned_salaries s
on s.emp_id = e.emp_id
where s.salary > (select avg(salary) from cleaned_salaries);
-- I am getting avg salary = 73778.8474 so more number of employees.

-- Find the employees who earn the same as max salary.
select e.emp_id, e.emp_name, s.salary
from cleaned_employees e
join cleaned_salaries s
on s.emp_id = e.emp_id
where s.salary = (
select max(salary) as max_salary
from cleaned_salaries);


-- Find the employees who earn less than avg salary.
select e.emp_id, e.emp_name, s.salary
from cleaned_employees e
join cleaned_salaries s
on s.emp_id = e.emp_id
where s.salary < (select avg(salary) from cleaned_salaries);

-- Find employees with min salary

select e.emp_id, e.emp_name, s.salary
from cleaned_employees e
join cleaned_salaries s
on s.emp_id = e.emp_id
where s.salary = (select min(salary) from cleaned_salaries);