select *,
    {{usd_conversion('transaction_amount')}} as transaction_amount_usd
    from {{source("banking_data","transaction")}}