with orders as(
        select
            *
        from {{ ref('stg_orders') }}
)
,
temp1 as(
    select
        order_date,
        count(distinct order_id) as daily_order_count
    from orders
    group by 1
)
    select
        *,
        lag(daily_order_count) over(order by order_date) as prev_order_count
    from temp1
    order by order_date