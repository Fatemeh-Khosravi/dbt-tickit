--buyer pairs who have attended 3 or more events together.

select
  s1.buyerid AS buyer_a,
  s2.buyerid AS buyer_b,
  count(distinct s1.eventid) AS num_events_attended_together
from  {{ source('tickit','sales')}} s1
join  {{ source('tickit','sales')}} s2
  on s2.eventid = s1.eventid
    and s2.buyerid > s1.buyerid
group by
  buyer_a,
  buyer_b
having num_events_attended_together >= 3

