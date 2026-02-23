/*
Table: Seat
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
The ID sequence always starts from 1 and increments continuously.

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.
*/

select
    id,
    ( case when id % 2 = 0 then lag(student) over (order by id)
     else coalesce( lead(student) over (order by id), student)
     end ) as student
from Seat
order by id
