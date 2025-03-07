{% macro usd_conversion(column_name)%}
    round(cast({{column_name}} as decimal)/{{var('exchange_rate',1.2)}},2)
{%- endmacro %}
    