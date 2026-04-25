use 50_days_sql;

-- Find rank of each employee based on their salary within their department

select e.emp_id, e.dept_id, s.salary,
dense_rank() 
    over(partition by e.dept_id order by s.salary desc) as dept_rank
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id;

-- Compare each employee's salary to the average salary of their department(salary > avg - above average, salary < avg - below average)

select e.emp_id, e.dept_id, s.salary,
avg(s.salary) over(partition by e.dept_id) as avg_department_salary,
case 
    when s.salary > avg(s.salary) over(partition by e.dept_id) then 'Above Average'
    when s.salary < avg(s.salary) over(partition by e.dept_id) then 'Below Average'
    else 'Equal'
end as comparison
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id;

-- Find top 3 highest paid employees in each department

select * from (
select e.emp_id, e.dept_id, s.salary,
rank() over(partition by e.dept_id order by s.salary desc) as dept_rank
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id ) as sub
where dept_rank <= 3;

-- Find lowest salary employee in each department

select * from (
select e.emp_id, e.dept_id, s.salary,
rank() over(partition by e.dept_id order by s.salary asc) as dept_rank
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id ) as sub
where dept_rank = 1;

