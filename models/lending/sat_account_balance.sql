{{ config(materialized='incremental') }}

select
    {{ dbt_utils.generate_surrogate_key(['account_id']) }} as account_hk,
    {{ dbt_utils.generate_surrogate_key(['account_id', 'balance', 'deposit_type']) }} as account_hashdiff,
    balance,
    deposit_type,
    current_timestamp as load_date,
    'deposit_source' as record_source
from STG_COREBANK_DEPOSITS
