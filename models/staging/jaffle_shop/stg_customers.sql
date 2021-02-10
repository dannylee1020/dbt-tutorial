# getting customer data 

select
    id as customer_id,
    first_name,
    last_name
-- from `dbt-sandbox-303803.dbt_tutorial.jaffle_shop_customers`
from {{ source('bigquery_jaffle_shop', 'jaffle_shop_customers') }}
