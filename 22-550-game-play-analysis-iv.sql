/*
Table: Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key (combination of columns with unique values) of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.
*/

with FirstLogin as (
    select
        player_id,
        min(event_date) as first_date
    from Activity
    group by 1
),
SecondLogin as(
    select
        a.player_id
    from Activity as a
    join FirstLogin as fl
    on a.player_id = fl.player_id
    and a.event_date = date_add(fl.first_date, interval 1 day)
)
select
    round(
        count(distinct sl.player_id) / count(distinct fl.player_id)
    ,2) as fraction
from FirstLogin as fl
left join SecondLogin as sl
on fl.player_id = sl.player_id
