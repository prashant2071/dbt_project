--  Identify how long has it been since the account has been opened by using Acct_opn_date 
-- columns 
-- • Use variables to filter out account dates which are opened from more than 1 year 
select foracid , EXTRACT(YEAR FROM AGE(CURRENT_DATE,acct_opn_date::timestamp)) as account_age 
from 
    {{source('banking_data','account')}}
where 
    acct_opn_date::timestamp < CURRENT_DATE - interval '{{ var('interval') }} year'
