-- How much each venue city earns.
select
  v.venuecity ,
  v.venuestate,
  sum(pricepaid) as amount_sales
from {{ source('tickit','sales')}} s
join {{ source('tickit','event')}} e
  on s.eventid = e.eventid
join {{ source('tickit','venue')}} v
  on v.venueid = e.venueid
group by v.venuecity,v.venuestate
order by amount_sales DESC

