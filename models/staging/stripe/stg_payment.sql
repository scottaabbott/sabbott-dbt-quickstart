with
    payments as 
    (
        select  p.id            as payment_id,
                p.orderid       as order_id,
                p.paymentmethod,
                p.status,
                p.amount,
                p.created

        from    raw.stripe.payment AS p
    )

select * from payments