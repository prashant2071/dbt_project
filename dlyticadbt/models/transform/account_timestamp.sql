
with timestamp_account as (
    select
        *,
        {% if is_timestamp('acct_opn_date') %}
            {{cast_to_timestamp('acct_opn_date') }} as account_open_date
        {% else %}
            account_open_date as account_open_date
        {% endif %}
    from {{ source('banking_data', 'account') }}
)
select
    acid,
    foracid,
    cif_id,
    account_open_date,
    account_status,
    lien_amt,
    product_schm_code,
    schm_type,
    sanct_lim,
    acct_crncy_code,
    del_flg,
    acct_cls_flg,
    drwng_power,
    interest_rate,
    accrued_interest,
    limit_b2kid,
    clr_bal_amt
from timestamp_account