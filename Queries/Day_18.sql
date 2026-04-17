use 50_days_sql;

-- Employees whose avg performance rating > 4

select e.emp_id, e.emp_name, d.dept_name,
(p.rating_2022 + p.rating_2023 + p.rating_2024) / 3 as avg_rating
from cleaned_employees e
join cleaned_performance p on e.emp_id = p.emp_id
join cleaned_departments d on e.dept_id = d.dept_id
where (p.rating_2022 + p.rating_2023 + p.rating_2024) / 3 > 4;

-- Employees whose attendance is greater than 10 days

select e.emp_id, e.emp_name, d.dept_name,
count(a.attendance_id) as total_attendance
from cleaned_employees e
join cleaned_attendance a on e.emp_id = a.emp_id
join cleaned_departments d on e.dept_id = d.dept_id
where a.status = 'Present'
group by e.emp_id, e.emp_name, d.dept_name
having count(a.attendance_id) > 2;

-- Departements where total salary paid > 2,00,000

select d.dept_id, d.dept_name, sum(s.salary) as total_salary
from cleaned_departments d
join cleaned_employees e on d.dept_id = e.dept_id
join cleaned_salaries s on e.emp_id = s.emp_id
group by d.dept_id, d.dept_name
having sum(s.salary) > 200000;

-- Employee whose total salary > department avg salary

select e.emp_id, e.emp_name, d.dept_name, s.salary
from cleaned_employees e
join cleaned_salaries s on e.emp_id = s.emp_id
join cleaned_departments d on e.dept_id = d.dept_id
where s.salary > (
    select avg(salary)
    from cleaned_employees e2
    join cleaned_salaries s2 on e2.emp_id = s2.emp_id
    where e2.dept_id = e.dept_id
);