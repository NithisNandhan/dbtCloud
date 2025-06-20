select
    orderid as order_id,
    id as payment_id,
    paymentmethod as payment_method,
    status,
    {{cents_to_dollars('amount')}} as amount,
    created as created_at

from {{ source('stripe', 'payment') }}