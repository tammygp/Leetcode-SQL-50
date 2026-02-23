/*
Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.
Initially, all products have price 10.

Write a solution to find the prices of all products on the date 2019-08-16.
*/

with LastDate as (
    select
        product_id,
        max(change_date) as last_date
    from Products
    where change_date <= '2019-08-16'
    group by 1
),
LastPrice as (
    select
        product_id,
        max(new_price) as price
    from Products as p
    where (p.product_id, p.change_date) in (select * from LastDate )
    group by 1
    order by 1
),
DefaultPrice as (
    select
        distinct product_id,
        10 as price
    from Products
    where (product_id) NOT IN (select product_id from LastDate)
    order by 1
)
select * from LastPrice
union
select * from DefaultPrice
