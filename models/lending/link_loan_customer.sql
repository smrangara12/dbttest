{{ config(materialized='incremental') }}

select
    {{ dbt_utils.generate_surrogate_key(['loan_id', 'customer_id']) }} as loan_customer_link_hk,
    {{ dbt_utils.generate_surrogate_key(['loan_id']) }} as loan_hk,
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_hk,
    current_timestamp as load_date,
    'loan_source' as record_source
from {{ ref('stg_corebank_loans') }}
