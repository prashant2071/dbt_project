-- Create a new column that labels transactions as 'Credit' if p_tran_type = 'C' and 
-- 'Debit' if p_tran_type = 'D'. Use a Jinja case statement for this and macros
select *, 
    {{tran_type('p_tran_type')}} as transaction_type_description
    from {{source("banking_data","transaction")}}