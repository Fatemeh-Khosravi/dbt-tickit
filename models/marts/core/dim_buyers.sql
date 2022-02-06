

with users as (

   select * from {{ ref('stg_users')}}

),

orders as (

   select * from {{ ref('stg_orders') }}
),

users_orders as (

    select
        user_id,
        count(order_id) as number_of_orders

    from orders

    group by 1

),


final as (

    select
        users.user_id,
        users.firstname,
        users.lastname,
        coalesce(users_orders.number_of_orders, 0) as number_of_orders

    from users

    left join users_orders using (user_id)

)

select * from final
order by user_id