
with day_date as (

    select
        dateid,
        caldate,
        day,
        holiday

    from {{ source('tickit','date')}}
    
)
select * from day_date