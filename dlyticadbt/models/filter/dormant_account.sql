with account_last_transaction as (

    select foracid,max(timestamp::timestamp) as last_transaction
    from 
        {{source('banking_data','transaction')}}
    group by foracid
)
select foracid from account_last_transaction
where last_transaction <CURRENT_DATE - interval '{{var('dormant_time')}} month'