-- day-over-day change in sales.

with sales_per_day as (

   select * from {{ ref('stg_sales_per_day')}}

),

curr_day_and_prev_day_sales AS (
  
  select
       day,
       num_sales AS curr_day_sales,
       lag(num_sales, 1) over (order by day) as prev_day_sales
  from sales_per_day
),


final as (

      select
          day,
          curr_day_sales,
          prev_day_sales,
          1.0 * (curr_day_sales - prev_day_sales) / prev_day_sales AS pct_change
      from curr_day_and_prev_day_sales
      order by day DESC


)
select * from final
