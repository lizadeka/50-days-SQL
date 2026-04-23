use 50_days_sql;

-- Comparison of current and next salary

select emp_id, salary, salary_date,
       lead(salary) over(partition by emp_id order by salary_date) as next_salary
from cleaned_salaries
;

-- Growth analysis : Compare current salary with next salary to determine if there is growth or decline

select emp_id, salary, salary_date,
       lead(salary) over(partition by emp_id order by salary_date) as next_salary,
       case
       when lead(salary) over(partition by emp_id order by salary_date) > salary then 'Growth'
       when lead(salary) over(partition by emp_id order by salary_date) < salary then 'Decline'
       else 'No Change'
       end as growth_analysis
from cleaned_salaries;

-- Trend prediction : Comparing today's attendance with next day's attendance to predict if the trend is improving or declining

select emp_id, attendance_date, status,
lead(status) over(partition by emp_id order by attendance_date) as next_attendance_status
from cleaned_attendance
order by emp_id, attendance_date;