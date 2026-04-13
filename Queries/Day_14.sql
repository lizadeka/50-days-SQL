use 50_days_sql;

-- Employees earning more than dept avg salary

select e1.emp_id, e1.emp_name, e1.dept_id, s1.salary
from cleaned_employees e1
join cleaned_salaries s1
on s1.emp_id = e1.emp_id
where s1.salary > (

select avg(salary) from cleaned_salaries s
join cleaned_employees e
on e.emp_id = s.emp_id
where e.dept_id = e1.dept_id

);

-- List those employees whose salary is equal to the highest salary in each dept

select e1.emp_id, e1.emp_name, e1.dept_id, s1.salary
from cleaned_employees e1
join cleaned_salaries s1
on s1.emp_id = e1.emp_id
where s1.salary = (
select max(salary) from cleaned_salaries s
join cleaned_employees e
on e.emp_id = s.emp_id
where e.dept_id = e1.dept_id
);

-- List those employees whose salary is equal to the lowest salary per dept

select e1.emp_id, e1.emp_name, e1.dept_id, s1.salary
from cleaned_employees e1
join cleaned_salaries s1
on s1.emp_id = e1.emp_id
where s1.salary = (
select min(salary) from cleaned_salaries s
join cleaned_employees e
on e.emp_id = s.emp_id
where e.dept_id = e1.dept_id
);



