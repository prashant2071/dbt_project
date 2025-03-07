with timestamp_transaction as (
    select
        *,
                    {% if is_timestamp('timestamp') %}
            {{cast_to_timestamp('timestamp') }} as transaction_date
        {% else %}
            timestamp as transaction_date
        {% endif %}
    from {{ source('banking_data', 'transaction') }}
)

select
    transaction_id,
    transaction_date,
    transaction_key,
    foracid,
    transaction_amount,
    amount_left,
    p_tran_type,
    digital_flag,
    transaction_channel_type
from timestamp_transaction