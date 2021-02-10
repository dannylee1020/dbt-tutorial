{% snapshot payments_snapshot %}


{{ config(    
    target_database = 'dbt-sandbox-303803',
    target_schema = 'dbt_tutorial',
    unique_key = 'payment_id',

    strategy = 'timestamp',
    updated_at = 'created_at'
)}}

select 
    *
from {{ ref('stg_payments') }}


{% endsnapshot %}