with sales_per_day as (

    select
        saletime AS day,
        COUNT(*) AS num_sales
        

    from {{ source('tickit','sales')}}
    group by day
)
select * from sales_per_day