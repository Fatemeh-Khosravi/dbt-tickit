--all the users who have bought a ticket to a musical and also like sports.

select 
	
	 distinct(s.buyerid),
	 u.firstname,
	 u.lastname
from {{ source('tickit','event')}} e
join {{ source('tickit','sales')}} s
     on e.eventid=s.eventid
join {{ source('tickit','users')}} u
     on s.buyerid=u.userid
join {{ source('tickit','category')}} c
     on e.catid=c.catid
       and c.catname = 'Musicals'

where likesports=1 
order by lastname