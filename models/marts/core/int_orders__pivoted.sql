with payments as (
    select * from {{ ref('stg_stripe__payment') }}
),
practice as (
    select
        order_id,
        {%- set paymentmethods= ['credit_card','coupon','bank_transfer','gift_card'] -%}
        {%-for i in paymentmethods-%}
            sum(case when payment_method='{{i}}' then amount else 0 end) as {{i}}_amount
            {%-if not loop.last-%}
                ,
            {%-endif%}
        {%endfor-%}
    from payments
    where status='success'
    group by order_id
)
select * from practice