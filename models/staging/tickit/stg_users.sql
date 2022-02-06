with users as (

    select
        userid as user_id,
        firstname,
        lastname

    from dbt-507.tickit.users

)
select * from users