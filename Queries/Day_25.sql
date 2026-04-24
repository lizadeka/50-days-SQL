use 50_days_sql;

-- Salary running total (cumulative salary for each employee over time)

select emp_id, salary, salary_date,
sum(salary) over(partition by emp_id order by salary_date) as running_total_salary
from cleaned_salaries;

-- Attendance running count (find total attendance count over time)

select emp_id, attendance_date, status,
count(*) over(partition by emp_id order by attendance_date) as running_attendance_count
from cleaned_attendance
where status = 'Present'
order by emp_id, attendance_date;

-- Department cumulative salary(Total salary accumulated over each department over time)

select d.dept_id, s.salary, s.salary_date,
sum(s.salary) over(partition by d.dept_id order by s.salary_date) as cumulative_department_salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
join cleaned_departments d on e.dept_id = d.dept_id
;

