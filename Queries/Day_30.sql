use 50_days_sql;

-- Create a temporary result set using CTE and filter data from it

with cte_salaries as (
    select emp_id, salary_date, salary
    from cleaned_salaries

)
select * from cte_salaries
where emp_id = 121;

-- Combine employee table and salaries table using CTE

with cte_employee_salaries as (
    select e.emp_id, e.dept_id, s.salary_date, s.salary
    from cleaned_employees e
    join cleaned_salaries s on s.emp_id = e.emp_id

) 
select * from cte_employee_salaries
where dept_id = 10;

-- Calculate department avg salary using CTE

with cte_department_avg as (
    select dept_id, round(avg(salary),2) as avg_salary
    from cleaned_employees e
    join cleaned_salaries s on s.emp_id = e.emp_id
    group by dept_id
    order by avg_salary desc

)
select * from cte_department_avg;

-- Find employees earning more than dept avg using CTE

with cte_department_avg as (
    select dept_id, round(avg(salary),2) as avg_salary
    from cleaned_employees e
    join cleaned_salaries s on s.emp_id = e.emp_id
    group by dept_id
    order by avg_salary desc

)
select e.emp_id, e.dept_id, s.salary
from cleaned_employees e
join cleaned_salaries s on s.emp_id = e.emp_id
join cte_department_avg d on e.dept_id = d.dept_id
where s.salary > d.avg_salary;
