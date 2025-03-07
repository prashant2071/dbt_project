-- Use a Jinja for loop to create a table that contains all transactions, grouped by account 
-- and p tran type (C or D), and calculate the total count and amount. 
-- • Use list where we can later add another transaction type
{% set transaction_type = ['C','D']%}
with total_count_sum_amount as (
    select foracid,
        p_tran_type,
        count(*) as total_count,
        sum(transaction_amount) as total_amount
    from {{source('banking_data', 'transaction')}}
    group by foracid, p_tran_type
)

select foracid  as account_i,
    {% for item in transaction_type%}
        sum(case when p_tran_type = '{{item}}' then total_count else 0 end) as {{item | lower}}_count,
        sum(case when p_tran_type = '{{item}}' then total_amount else 0 end) as {{item | lower}}_amount
        {% if not loop.last %},{% endif %}
    {% endfor %}
from 
    total_count_sum_amount
group by 
    foracid