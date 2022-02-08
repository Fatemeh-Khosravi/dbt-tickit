--tickets which have been sold on each holiday of 2008.

with day_date as (

       select * from {{ ref ('stg_day_date')}}

),

sales as (

    select
        dateid,
        qtysold
        
        
    from {{ source('tickit','sales')}}

),


final as (

    select
        day_date.caldate,
        
        SUM(qtysold) AS total_tickets_sold

    from day_date

    join sales on day_date.dateid=sales.dateid and day_date.holiday=1

    group by caldate
    

)

select * from final

order by total_tickets_sold desc