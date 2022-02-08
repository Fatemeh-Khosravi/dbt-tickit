with orders as (

    select
        salesid as order_id,
        buyerid as user_id,
        
        

    from {{ source('tickit','sales')}}
)
select * from orders