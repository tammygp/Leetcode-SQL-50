/*
Table: Triangle

+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
In SQL, (x, y, z) is the primary key column for this table.
Each row of this table contains the lengths of three line segments.
 

Report for every three line segments whether they can form a triangle.
*/

select *,
    (case when x + y > z
            and x + z > y
            and y + z > x then 'Yes' else 'No' end) as triangle
from Triangle
