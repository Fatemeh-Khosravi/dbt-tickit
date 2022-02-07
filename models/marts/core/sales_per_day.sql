with sales_per_day as (

    select * from {{ ref('stg_sales_per_day')}}

),



daily_sales_avg as (

    select

        avg (num_sales) as daily_sales_avg

    from sales_per_day

),


final as (

    select * from sales_per_day spd
    join daily_sales_avg dsa 
              on spd.num_sales < dsa.daily_sales_avg * 0.25

)

select * from final