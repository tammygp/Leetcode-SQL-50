/*
Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
In SQL, id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
 

Find the names of the customer that are either:

1) referred by any customer with id != 2.
2) not referred by any customer.
*/

select name
from Customer
where referee_id != (select id from Customer where id = 2)
or referee_id is null
