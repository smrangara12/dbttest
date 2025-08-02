{{ config(materialized='view') }}

with source as (
<<<<<<< HEAD
    select * from lending_loans
=======
    select * from LENDING_LOANS
>>>>>>> d5351df8a9241cbb3135570ed7c407fce9dd3539
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

