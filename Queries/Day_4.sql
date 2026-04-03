use 50_days_sql;

-- Remove duplicate records from employees / salaries / performance

-- employees table


with cte as (
    select *, row_number() over (partition by emp_id, emp_name, city
    order by emp_id) as rn
    from cleaned_employees)

delete from cleaned_employees
where emp_id in (select emp_id from cte where rn>1);

-- all data got erased from cleaned_employees table, so we need to restore it from employees table

insert into cleaned_employees
select * from employees;


-- salaries table

with cte as (
    select *, row_number() over (partition by salary_id, emp_id
    order by salary_id) as rn
    from cleaned_salaries)

delete from cleaned_salaries
where salary_id in (select salary_id from cte where rn>1);


-- performance table

with cte as (
    select *, row_number() over (partition by emp_id, rating_2022, rating_2023, rating_2024
    order by emp_id) as rn
    from cleaned_performance)

delete from cleaned_performance
where emp_id in
(select emp_id from cte where rn>1);

-- Identify text inconsistencies

-- city
select distinct city 
from cleaned_employees;

select dept_name
from cleaned_departments;

update cleaned_employees
set city = concat(upper(left(trim(city),1)),
lower(substring(trim(city),2)));


update cleaned_employees
set city = case
when city in ('Delhi NCR', 'Dlhi', 'New delhi') then 'Delhi'
when city in ('Hydbd') then 'Hyderabad'
when city in ('Bangalore') then 'Bengaluru'
else city end;

