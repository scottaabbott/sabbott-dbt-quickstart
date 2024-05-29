{{
    config
    (
        materialized="view"
    )
}}

with
    orders as
    (
        select * from {{ ref("stg_orders") }}
    ),

    payments as 
    (
        select * from {{ ref("stg_payment") }}
    ),

    fct_orders as
    (
        select      o.order_id,
                    p.payment_id,
                    p.amount
        from        orders as o 

        left join   payments as p 
        on          o.order_id = p.order_id
    )

select * from fct_orders