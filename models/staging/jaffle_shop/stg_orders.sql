# getting orders data

select
    id as order_id,
    user_id as customer_id,
    order_date,
    status
-- from `dbt-sandbox-303803.dbt_tutorial.jaffle_shop_orders`
from {{ source('bigquery_jaffle_shop', 'jaffle_shop_orders') }}