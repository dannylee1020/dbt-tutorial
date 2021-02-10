{%- set order_status = ['placed','shipped','returned','completed','return_pending'] -%}

with orders as(
    select
        *
    from {{ ref('stg_orders') }}
)
    select
        order_date,
        {% for status in order_status -%}
        sum(case when status = '{{ status }}' then 1 else 0 end) as {{ status }}_total {{ ',' if not loop.last }}
        {% endfor -%}
        
    from orders
    group by 1