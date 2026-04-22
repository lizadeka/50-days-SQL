use 50_days_sql;

-- Data of current salary and previous salaries

select emp_id, salary, salary_date,
       lag(salary) over(partition by emp_id order by salary_date) as previous_salary
from cleaned_salaries
;

-- Difference between current salary and previous salary

select emp_id, salary, salary_date,
       lag(salary) over(partition by emp_id order by salary_date) as previous_salary,
       salary - lag(salary) over(partition by emp_id order by salary_date) as salary_difference
from cleaned_salaries;

-- Attendance trend of each employee(whether attendance is improving or declining)

select emp_id, attendance_date, status,
lag(status) over(partition by emp_id order by attendance_date) as previous_attendance_status,
case
when status = 'Present' and lag(status) over(partition by emp_id order by attendance_date) = 'Absent' then 'Improving'
when status = 'Absent' and lag(status) over(partition by emp_id order by attendance_date) = 'Present' then 'Declining'
else 'No Change'
end as attendance_trend
from cleaned_attendance
order by emp_id, attendance_date;