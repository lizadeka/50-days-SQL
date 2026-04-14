## Day 1: Project Setup

### Objective
Set up the SQL project environment and prepare the dataset for analysis.

### Tasks Completed
- Created project folder structure (dataset, SQL_QUERIES, screenshots)
- Set up SQL database (hr_project)
- Created tables for HR dataset
- Imported messy dataset into database

### Tools Used
- MySQL / PostgreSQL
- VS Code
- GitHub

### Outcome
Successfully completed project setup. Ready to start data cleaning and analysis from Day 2.

## Day 2: Data Preparation

### Objective
Prepare the dataset for analysis by identifying data quality issues and setting up cleaned tables for further processing.

### Tasks Completed
- Created separate cleaned tables to avoid modifying the raw dataset
- Identified NULL values across all tables

### Tools Used
MySQL / PostgreSQL
VS Code

### Outcome
Successfully set up cleaned tables and identified data quality issues. The dataset is now ready for detailed cleaning and transformation in the next stage.


## Day 3: Data Cleaning (Handling Missing Values)

### Objective
Clean the dataset by handling missing values across multiple tables.

### Tasks Completed
- Created cleaned versions of tables (employees_clean, departments_clean, performance_clean)
- Converted empty values into NULL for consistency
- Replaced NULL and empty values with appropriate defaults

### Key Learning
- NULL and empty values are different but both need to be handled
- Data should not be cleaned directly in raw tables
- Business rules are important while filling missing values

### Outcome
Dataset is now more structured and ready for further cleaning and analysis.


## Day 4: Data Cleaning (Handling Inconsistent Text)

### Objective
Clean the dataset by fixing inconsistent text values across columns.

### Tasks Completed
- Identified inconsistent text formats (e.g., HR, hr, Hr)
- Standardized text using functions like UPPER(), LOWER(), INITCAP()
- Trimmed extra spaces using TRIM()
- Replaced incorrect spellings and variations
- Ensured uniform naming conventions across tables

### Key Learning
- Text inconsistency affects grouping and analysis
- Same values with different formats behave as different data
- Standardization is critical before applying aggregations

### Outcome
Text data is now consistent, making grouping, filtering, and analysis accurate.


## Day 5: Data Cleaning (Handling Invalid Values)

### Objective
Identify and fix logically incorrect or invalid values in the dataset.

### Tasks Completed
- Detected invalid values (negative salary, invalid age, incorrect ratings)
- Applied business rules to define valid ranges
- Replaced incorrect values using client-provided data
- Used CASE WHEN and JOIN-based updates for corrections
- Ensured no assumption-based fixes were applied

### Key Learning
- Invalid values are not always missing but logically incorrect
- Data should be corrected using trusted sources (client/system)
- Never blindly manipulate values without business context

### Outcome
Dataset now contains only valid and reliable values, improving data accuracy.


## Day 6: Data Cleaning (Outlier Detection & Handling)

### Objective
Identify and handle extreme values (outliers) in the dataset.

### Tasks Completed
- Detected outliers using business thresholds (e.g., salary range)
- Flagged outliers using a new column (is_outlier)
- Differentiated between valid and invalid outliers
- Replaced incorrect outliers using client-provided data
- Preserved valid extreme values (e.g., CEO salary)

### Key Learning
- Not all outliers are errors — some are meaningful
- Outliers should be analyzed, not blindly removed
- Business understanding is essential in decision-making

### Outcome
Outliers are properly identified and handled, ensuring both accuracy and meaningful insights.

## Day 7: Data Cleaning

### Objective: Date format fixing
- Identified inconsistent date formats in multiple columns (salary_date, attendance_date, hire_date)
- Detected invalid values (e.g., wrong month, incomplete year, incorrect patterns)
- Replaced incorrect dates with NULL to avoid misleading data
- Standardized all valid dates into a uniform format (YYYY-MM-DD)
- Ensured consistency across all date-related columns

## Day 8: Data Cleaning
- Identified leading and trailing spaces in emp_name column
- Removed unwanted spaces using TRIM() to ensure consistency
- Checked data types across all tables (employees, departments, salary, performance, attendance)
- Detected incorrect data types affecting joins and analysis
- Converted columns to appropriate data types (INT, VARCHAR, DATE, DECIMAL)
- Ensured uniform structure across all tables for accurate querying****

## Day 9: SQL Tasks
- Showed only employees who belong to a valid department
- Included all employees even if department data is missing
- Identified employees who are not assigned to any department
- Mapped employees with their salary details
- Detected employees whose salary data is missing

## Day 10: SQL Tasks
- Retrieved performance ratings of each employee
- Identified employees who do not have salary records
- Detected employees without attendance data
- Combined employee name, department, and salary in one view

## Day 11: SQL Tasks
- Retrieved employee name, department  and performance rating for each employee
- Retrieved complete profile of each employee
- How many salary records are there for each employee?
- Total salary paid to each employee

## Day 12: SQL Tasks
- Retrieved average salary for each department
- Counted how many days each employee was present
- Which employee belongs to same department?
- Counted which employee has more than 1 salary record

## Day 13: SQL Tasks
- List employees earning more than average salary
- List employees with salary equal to maximum salary
- List employees earning less than average salary
- List employees with minimum salary

## Day 14: SQL Tasks (Department-Level Analysis)
- List employees earning more than the department average salary
- List employees whose salary is equal to the highest salary in their department
- List all employees whose salary is equal to the lowest salary in their department
