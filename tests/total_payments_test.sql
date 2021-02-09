select
    order_id,
    sum(amount) as sum_amount
from {{ ref('stg_payments') }}
group by 1
having not (sum_amount >= 0)