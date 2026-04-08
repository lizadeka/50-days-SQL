use 50_days_sql;

-- find the employees who have valid departments

select e.emp_id, e.emp_name, d.dept_name
from cleaned_employees e
join cleaned_departments d
on e.dept_id = d.dept_id;

-- find the employees who have no valid departments

select e.emp_id, e.emp_name, d.dept_name
from cleaned_employees e
left join cleaned_departments d
on e.dept_id = d.dept_id;

-- list employees without department

select e.emp_id,
    e.emp_name,
    d.dept_name
from cleaned_employees e
    left join cleaned_departments d on e.dept_id = d.dept_id
where d.dept_name is null;

-- employee and their salary details

select e.emp_id,
    e.emp_name,
    s.salary
from cleaned_employees e
join cleaned_salaries s
on s.emp_id = e.emp_id;

-- list employees where salary is null

select e.emp_id,
    e.emp_name,
    s.salary
from cleaned_employees e
join cleaned_salaries s
on s.emp_id = e.emp_id
where s.salary is null;

