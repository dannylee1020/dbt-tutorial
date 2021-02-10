# number of orders per customer on a given day

select
  -- generating primary key column
  {{ dbt_utils.surrogate_key['customer_id', 'order_date']}} as id
  customer_id,
  order_date,
  count(distinct order_id) as order_count 
from {{ ref('stg_orders') }}
group by 1,2,3
    