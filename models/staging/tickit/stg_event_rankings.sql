-- rankings of events by sales per each city.

with event_rankings as (
  
  select
    v.venuecity,
    e.eventid,
    e.eventname,
    sum(pricepaid) as total_paid,
    row_number() over (partition by v.venuecity order by sum(pricepaid) desc) as rnk
  from {{ source('tickit','event')}} e
  join  {{ source('tickit','sales')}} s
     on s.eventid = e.eventid
  join  {{ source('tickit','venue')}} v
     on v.venueid = e.venueid
  group by
    v.venuecity,
    e.eventid,
    e.eventname
)
select * from event_rankings