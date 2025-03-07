{% macro is_timestamp(column_name) %}
    {{ return(column_name in ['timestamp', 'acct_opn_date']) }}
{% endmacro %}