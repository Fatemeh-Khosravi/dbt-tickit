
SELECT
  v.venuecity ,
  v.venuestate,
  SUM(pricepaid) AS amount_sales
FROM dbt-507.tickit.sales s
JOIN dbt-507.tickit.event e
  ON s.eventid = e.eventid
JOIN dbt-507.tickit.venue v
  ON v.venueid = e.venueid
GROUP BY v.venuecity,v.venuestate
ORDER BY amount_sales DESC

