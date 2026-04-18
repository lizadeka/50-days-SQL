use 50_days_sql;

-- Salary category(Low (<30,000), Medium(30,000-60,000), High(>60,000))

select emp_id, salary,
case when salary < 30000 then 'Low'
when salary between 30000 and 60000 then 'Medium'
else 'High' end as salary_category
from cleaned_salaries s
;

-- Performance category(Good (>=4), Average(>=3), Poor)

select emp_id, (rating_2022 + rating_2023 + rating_2024) / 3 as avg_rating,
case when (rating_2022 + rating_2023 + rating_2024) / 3 >= 4 then 'Good'
when (rating_2022 + rating_2023 + rating_2024) / 3 >= 3 then 'Average'
else 'Poor' end as performance_category
from cleaned_performance p
;

-- Attendance status category(Present - active else Inactive)

select emp_id,
case when status = 'Present' then 'Active'
else 'Inactive' end as attendance_status
from cleaned_attendance
group by emp_id, status
;

-- Experience category(Fresher (<2 years), Mid(2-5 years), Experienced(>7 years))

select emp_id, year(hire_date) as hire_year,
case when year(hire_date) > year(curdate()) - 2 then 'Fresher'
when year(hire_date) between year(curdate()) - 5 and year(curdate()) - 2 then 'Mid'
else 'Experienced' end as experience_category  
from cleaned_employees
;