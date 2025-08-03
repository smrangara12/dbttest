select
    customer_hk as customer_key,
    customer_id,
    first_name,
    last_name,
    birth_date,
    customer_type
from {{ ref('dim_customer_base') }}
