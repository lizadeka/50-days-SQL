use 50_days_sql;

-- Find latest salary per employee along with total salary till that point

select * from (
select emp_id, salary_date, salary,
rank() over(partition by emp_id order by salary_date desc) as salary_rank,
sum(salary) over(partition by emp_id order by salary_date) as total_salary
from cleaned_salaries) as latest_salaries
where salary_rank = 1;

-- Rank employees based on salary and compare with department average salary

select e.emp_id, e.dept_id, s.salary,
avg(s.salary) over(partition by e.dept_id) as dept_avg_salary,
rank() over(partition by e.emp_id order by s.salary) as salary_rank
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id;


-- Check whether salary has increased or decreased compared to previous record

select emp_id, salary_date, salary,
lag(salary) over(partition by emp_id order by salary_date) as previous_salary,
case 
when salary > lag(salary) over(partition by emp_id order by salary_date) then "Increased"
when salary < lag(salary) over(partition by emp_id order by salary_date) then "Decreased"
else "No change"
end as salary_trend
from cleaned_salaries;

