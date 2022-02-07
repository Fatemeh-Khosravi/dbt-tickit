-- number of unique buyers per day

with unique_buyer_per_day as (

    select
        saletime As day,
        count(distinct buyerid) AS num_unique_buyer
        
    from {{ source('tickit','sales')}}
    group by day
)
select * from unique_buyer_per_day 
order by day