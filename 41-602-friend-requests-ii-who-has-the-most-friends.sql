/*
Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.
*/

with Friends as (
    select requester_id as id
    from RequestAccepted
    UNION ALL
    select accepter_id as id
    from RequestAccepted
)
select
    id,
    count(*) as num
from Friends
group by 1
order by 2 desc
limit 1
