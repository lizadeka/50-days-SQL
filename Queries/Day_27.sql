use 50_days_sql;

-- To compare each employee's salary to overall average salary(> avg → Above Avg, < avg → Below Avg,= avg → Equal)

select emp_id, salary,
avg(salary) over() as overall_avg_salary,
case when salary > avg(salary) over() then "Above average"
    when salary < avg(salary) over() then "Below average"
    else "Equal"
end as comparison
from cleaned_salaries;

-- Compare employee salary with total salary of all employees(salary > 10% of total salary → High Contributor, else → Low Contributor)

select emp_id, salary,
sum(salary) over() as total_salary,
case
    when salary > 0.1 * sum(salary) over() then "High Contributor"
    else "Low Contributor"
end as comparison
from cleaned_salaries;

-- Compare department total salary with overall total salary(dept total > 30% of total → High Dept, else → Low Dept)

select e.dept_id, s.salary,
sum(s.salary) over(partition by e.dept_id) as department_total,
case 
    when sum(s.salary) over(partition by e.dept_id) > (0.3 * sum(s.salary) over()) then "High Department"
    else "Low Department"
end as comparison
from cleaned_salaries s
join cleaned_employees e on e.emp_id = s.emp_id;

