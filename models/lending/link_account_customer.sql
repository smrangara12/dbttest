{{ config(materialized='incremental') }}

select
    {{ dbt_utils.generate_surrogate_key(['account_id', 'customer_id']) }} as account_customer_link_hk,
    {{ dbt_utils.generate_surrogate_key(['account_id']) }} as account_hk,
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_hk,
    current_timestamp as load_date,
    'deposit_source' as record_source
from STG_COREBANK_DEPOSITS
