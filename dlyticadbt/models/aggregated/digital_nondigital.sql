with digital_flag as (
    select
        foracid,
        count(*) as digital_count
    from
        {{source('banking_data', 'transaction')}}
        where digital_flag = '{{var('digital_flag')}}'
        group by foracid
),
 total_flag as (
    select
        foracid,
        count(*) as total_count
    from
        {{source('banking_data', 'transaction')}}
        group by foracid
)
select t.foracid as account_id, round((d.digital_count*100.0/t.total_count),2) as percentage
from total_flag as t 
join digital_flag as d 
on t.foracid = d.foracid
