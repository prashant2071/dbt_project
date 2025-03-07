select foracid,
    sum(transaction_amount) as total_transaction_amount,
    avg(amount_left) as avg_amount_left
from {{source('banking_data', 'transaction')}} 
group by foracid