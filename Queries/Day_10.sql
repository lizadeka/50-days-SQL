use 50_days_sql;

-- performance rating of each employer

select e.emp_id,
    e.emp_name, p.rating_2022, p.rating_2023, p.rating_2024
from cleaned_employees e
join cleaned_performance p
on p.emp_id = e.emp_id;

-- employee who do not have any salary records

select
    e.emp_name, s.salary
from cleaned_employees e
left join cleaned_salaries s
on s.emp_id = e.emp_id
where s.emp_id is null;

-- employee who do not have any attendance records

select
    e.emp_name, a.attendance_id, a.status
from cleaned_employees e
left join cleaned_attendance a
on a.emp_id = e.emp_id
where a.emp_id is null;

-- What is the employee name, department, and salary together?

select e.emp_name, d.dept_name, s.salary
from cleaned_employees e
join cleaned_departments d
on e.dept_id = d.dept_id
join cleaned_salaries s
on s.emp_id = e.emp_id;