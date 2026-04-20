use 50_days_sql;

-- Rank of employees based on their salary

select emp_id, salary,
rank() over(order by salary desc) as salary_rank
from cleaned_salaries;

-- Department wise ranking (rank employee inside each department)

select e.emp_id, e.dept_id, s.salary,
dense_rank() over(partition by e.dept_id order by s.salary desc) as dept_salary_rank
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id;

-- top performer (calculate avg rating -> rank)

select emp_id, (rating_2022 + rating_2023 + rating_2024) / 3 as avg_rating,
dense_rank() over(order by (rating_2022 + rating_2023 + rating_2024) / 3 desc) as performance_rank
from cleaned_performance;

-- Salary ranking (Top 3)

select emp_id, salary, salary_rank
from (
    select emp_id, salary, 
           dense_rank() over(order by salary desc) as salary_rank
    from cleaned_salaries
) as ranked_salaries
where salary_rank <= 3;