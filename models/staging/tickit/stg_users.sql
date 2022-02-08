with users as (

    select
        userid as user_id,
        firstname,
        lastname
        

    from {{ source('tickit','users')}}
)
select * from users