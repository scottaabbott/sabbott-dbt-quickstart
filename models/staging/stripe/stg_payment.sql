with
    payments as 
    (
        select  p.id            as payment_id,
                p.orderid       as order_id,
                p.paymentmethod,
                p.status,
                p.amount,
                p.created

        from    {{ source('stripe', 'payment') }} as p

    )

select * from payments