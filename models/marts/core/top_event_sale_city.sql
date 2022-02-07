-- top event by sales per city.

with event_rankings as (

   select * from {{ ref('stg_event_rankings')}}

)
select
      venuecity,
      eventid,
      eventname,
      total_paid
from event_rankings
where rnk = 1
order by venuecity