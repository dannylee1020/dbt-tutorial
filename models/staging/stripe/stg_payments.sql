# getting data from payments

select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    {{ to_dollars('amount') }} as amount,
    created as created_at
from {{ source('stripe', 'payments')}}
-- {{ limit_data_in_dev('CREATED', 'stripe', 'payments') }}