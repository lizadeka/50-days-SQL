use 50_days_sql;

-- fix space issue in emp_name column of cleaned_employees table
update cleaned_employees
set EMP_NAME = trim(emp_name);

-- convert data type of all tables to appropriate data types

-- employee table

-- error handling the age column because it contains some non-numeric values
SELECT *
FROM cleaned_employees
WHERE age = '';
-- updating the age column to NULL where it contains non-numeric values
UPDATE cleaned_employees
SET age = NULL
WHERE age = '';
-- altering the age column to int data type after handling the non-numeric values
alter table cleaned_employees
modify emp_id int,
modify emp_name varchar(100),
modify age int,
modify city varchar(50),
modify dept_id int,
modify hire_date date;

describe cleaned_employees;

-- department table

alter table cleaned_departments
modify dept_id int,
modify dept_name varchar(100);

describe cleaned_departments;

-- attendance table

alter table cleaned_attendance
modify attendance_id int,
modify emp_id int,
modify attendance_date date,
modify status varchar(20);

describe cleaned_attendance;

-- salaries table

alter table cleaned_salaries
modify salary_id int,
modify emp_id int,
modify salary int,
modify salary_date date;

describe cleaned_salaries;

-- performance table

alter table cleaned_performance
modify emp_id int,
modify rating_2022 int,
modify rating_2023 int,
modify rating_2024 int;

describe cleaned_performance;