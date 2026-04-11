use 50_days_sql;

-- What is the average salary for each department?

select d.dept_name, round(avg(s.salary),2) as average_salary
from cleaned_departments d
join cleaned_employees e
on d.dept_id = e.dept_id
join cleaned_salaries s
on s.emp_id = e.emp_id
group by d.dept_name;

-- How many days each employee was present?

select e.emp_id, e.emp_name, count(a.attendance_date) as total_days_present
from cleaned_employees e
left join cleaned_attendance a
on a.emp_id = e.emp_id
where a.status = 'Present'
group by e.emp_id, e.emp_name;

-- which employee belongs to same department?

select dept_id, group_concat(emp_name) as employees_in_dept
from cleaned_employees
group by dept_id
having count(*) > 1;

-- Which employee have mor than 1 salary record?

select e.emp_id, e.emp_name, count(s.salary_id) as total_salary_records
from cleaned_employees e
join cleaned_salaries s
on s.emp_id = e.emp_id
group by e.emp_id, e.emp_name
having count(s.salary_id) > 1;