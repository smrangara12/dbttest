{{ config(materialized='view') }}

with sat as (
    select
        loan_hk,
        interest_rate,
        principal_amount,
        disbursement_date,
        maturity_date,
        status
    from {{ ref('sat_loan_terms') }}
),

loan_summary as (
    select
        loan_hk,
        principal_amount,
        interest_rate,
        datediff('day', disbursement_date, maturity_date) as loan_term_days,
        case
            when status = 'Closed' then 'Inactive'
            else 'Active'
        end as active_flag
    from sat
)

select * from loan_summary