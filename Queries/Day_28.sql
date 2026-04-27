use 50_days_sql;

-- Top 2 highest paid employees in each department

select * from(
select e.dept_id, e.emp_id, s.salary,
dense_rank() over(partition by e.dept_id order by s.salary desc) as salary_rank
from cleaned_employees e
join cleaned_salaries s on s.emp_id = e.emp_id) as ranked_salaries
where salary_rank <= 2;

-- Calculate salary gap (diff between current salary and previous salary)

select emp_id, salary,
lag(salary) over(partition by emp_id order by salary_date) as previous_salary,
salary - lag(salary) over(partition by emp_id order by salary_date) as salary_gap
from cleaned_salaries;

-- Calculate performance gap(change in performance between years)

select emp_id, rating_2022, rating_2023, rating_2024,
rating_2023 - rating_2022 as gap_2022_2023,
rating_2024 - rating_2023 as gap_2023_2024
from cleaned_performance;

-- Filter only top performers based on salary

select * from(
select e.dept_id, e.emp_id, s.salary,
dense_rank() over(partition by e.dept_id order by s.salary desc) as salary_rank
from cleaned_employees e
join cleaned_salaries s on s.emp_id = e.emp_id) as ranked_salaries
where salary_rank = 1;