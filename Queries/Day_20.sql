use 50_days_sql;

-- Latest Salary of each employee using window function

select * from
(select *,
row_number() over(partition by emp_id order by salary_date desc) as rn
from cleaned_salaries) as sub
where rn = 1;

-- First salary of each employee using window function

select * from
(select *,
row_number() over(partition by emp_id order by salary_date asc) as rn
from cleaned_salaries) as sub
where rn = 1;

-- Ranking per employee(rank salary entries for each employee)

select emp_id, salary,
row_number() over(partition by emp_id order by salary_date desc) as rank_number
from cleaned_salaries;

-- Top 2 salary records per employee

select * from
(select *,
row_number() over(partition by emp_id order by salary_date desc) as rn
from cleaned_salaries) as sub
where rn <= 2;