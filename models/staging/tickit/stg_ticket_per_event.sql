-- numbers of tickets which are available per each events.

with num_tickets_available_per_event as (

    select
		   sum(l.numtickets) as available_tickets,
           e.eventname,
           sum(s.qtysold) as sold,
           e.eventid
      from {{ source('tickit','listing')}} l
      join {{ source('tickit','event')}} e
            on e.eventid = l.eventid
      join {{ source('tickit','sales')}} s
            on s.eventid = l.eventid
      group by e.eventid,
              e.eventname
)
select * from num_tickets_available_per_event