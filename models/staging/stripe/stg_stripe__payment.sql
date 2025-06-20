select
    orderid as order_id,
    id as payment_id,
    payment_method,
    status,
    amount/100 as amount,
    created as created_at

from {{ source('stripe', 'payment') }}