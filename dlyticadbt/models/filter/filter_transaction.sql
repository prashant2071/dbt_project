with filtered_transactions as (
    select     transaction_id,
    timestamp,
    transaction_key,
    foracid,
    transaction_amount,
    amount_left,
    p_tran_type,
    digital_flag,
        case
            when transaction_channel_type in ('BY_DIGITAL','BY_CARD','BY_BRANCH') then transaction_channel_type
            else 'UNKNOWN'
        end as transaction_channel_type
    from {{ source('banking_data', 'transaction') }}
    where transaction_amount > 0

)

select
    transaction_id,
    timestamp,
    transaction_key,
    foracid,
    transaction_amount,
    amount_left,
    p_tran_type,
    digital_flag,
    transaction_channel_type
    from filtered_transactions