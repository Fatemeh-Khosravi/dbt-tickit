 --total number of sales per venue city.

select
   v.venuecity,
   COUNT(*) as num_sales
from {{ source('tickit','sales')}} s
join {{ source('tickit','event')}} e
  on e.eventid = s.eventid
join {{ source('tickit','venue')}} v
  on v.venueid = e.venueid
group by v.venuecity
order by num_sales desc