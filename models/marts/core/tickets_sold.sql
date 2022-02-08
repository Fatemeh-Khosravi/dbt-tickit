-- the percent of listed tickets sold for each event.

with num_tickets_available_per_event as (

   select * from {{ ref('stg_ticket_per_event')}}

)
select 
	   
       eventname,
      
       eventid,
       sold/ available_tickets  as percentage_of_sale
from num_tickets_available_per_event
order by percentage_of_sale desc