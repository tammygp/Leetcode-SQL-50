/*
Table: Employees

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| reports_to  | int      |
| age         | int      |
+-------------+----------+
employee_id is the column with unique values for this table.
This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null). 
 

For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

Return the result table ordered by employee_id.
*/

with Managers as (
    select 
        reports_to,
        sum(age) as sum_ages,
        count(distinct employee_id) as emp_count
    from Employees
    group by 1
)
select
    m.reports_to as employee_id,
    name,
    emp_count as reports_count,
    round((sum_ages / emp_count),0) as average_age
from Employees as e
inner join Managers as m
 on e.employee_id = m.reports_to
order by 1
