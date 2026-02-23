/*
Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column starting from 1.
 
Find all numbers that appear at least three times consecutively.
*/

select
    distinct num as ConsecutiveNums
from (
    select
    num,
    lag(num) over (order by id) as prev_num,
    lead(num) over (order by id) as next_num
from Logs ) as l
where num = prev_num and num = next_num
