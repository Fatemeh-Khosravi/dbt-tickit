with orders as (

    select
        salesid as order_id,
        buyerid as user_id,
        

    from dbt-507.tickit.sales

)
select * from orders