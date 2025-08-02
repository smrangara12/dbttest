{{ config(materialized='incremental') }}

select
    {{ generate_hub_key('loan_id') }} as loan_hk,
    loan_id,
    current_timestamp as load_date,
    '{{ invocation_id }}' as record_source
from {{ ref('stg_corebank__loans') }}
