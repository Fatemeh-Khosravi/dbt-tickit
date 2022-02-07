 --total number of sales per venue city.

SELECT
   v.venuecity,
   COUNT(*) AS num_sales
from {{ source('tickit','sales')}} s
JOIN {{ source('tickit','event')}} e
  ON e.eventid = s.eventid
JOIN {{ source('tickit','venue')}} v
  ON v.venueid = e.venueid
GROUP BY v.venuecity
ORDER BY num_sales DESC