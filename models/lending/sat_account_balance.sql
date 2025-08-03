{{ config(materialized='incremental') }}

select
    {{ dbt_utils.generate_surrogate_key(['account_id']) }} as account_hk,
    {{ dbt_utils.generate_surrogate_key(['account_id', 'balance', 'account_type']) }} as account_hashdiff,
    balance,
    account_type,
    current_timestamp as load_date,
    'deposit_source' as record_source
from {{ ref('stg_corebank_deposits') }}
