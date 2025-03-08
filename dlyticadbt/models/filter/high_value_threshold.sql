
select * timestamp::timestamp as transaction_date 
case when transaction_amount> {{var('high_value_threshold',50000)}} then 'High value' else 'Low value ' end as threshold_value 
from 
{{source('banking_date','transaction')}} 
