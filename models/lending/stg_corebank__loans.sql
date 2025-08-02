{{ config(materialized='view') }}

with source as (
    select * from lending_loans
),

renamed as (
    select
        loan_id,
        customer_id,
        loan_type,
        principal_amount,
        interest_rate,
        disbursement_date,
        maturity_date,
        status
    from source
)

select * from renamed

