with filtered_accounts as (
    select *
    from {{ source('banking_data', 'account') }}
    where account_status is not null and del_flg != 'Y'
)

select *
from filtered_accounts